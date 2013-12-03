
# same args as in all-packages.nix
# should this be moved into pkg/top-level/all-packages.nix ?
{ system ? builtins.currentSystem
, stdenvType ? system
, bootStdenv ? null
, noSysDirs ? true
, gccWithCC ? true
, gccWithProfiling ? true
, config ? null
# additional:
, nixpkgs 
, ...
}:

#with import <nixpkgs> { }; 

let lib = import "${nixpkgs}/lib"; 
    defaultScope = pkgs // pkgs.xorg;
    mainConfig = { inherit system stdenvType bootStdenv noSysDirs gccWithCC gccWithProfiling config; };
    pkgs = import nixpkgs mainConfig;
    haskellPackages = pkgs.haskellPackages_ghc763;
    callPackage = newScope {};
    newScope = extra: lib.callPackageWith (defaultScope // extra); 
    root5 = callPackage ./packages/root5 {
#              zlib = zlib;   
            } ;
    fficxx = callPackage ./packages/fficxx { 
               cabal = haskellPackages.cabal; 
               HStringTemplate = haskellPackages.HStringTemplate;
               either = haskellPackages.either; 
               errors = haskellPackages.errors;
               lens = haskellPackages.lens;
               pureMD5 = haskellPackages.pureMD5;
               split = haskellPackages.split;
             } ;     
    fficxx-runtime = callPackage ./packages/fficxx-runtime { 
                       cabal = haskellPackages.cabal; 
                     } ;     
    HROOT-generate = callPackage ./packages/HROOT-generate {
                       cabal = haskellPackages.cabal; 
                       HStringTemplate = haskellPackages.HStringTemplate;
                       configurator = haskellPackages.configurator;
                       cmdargs = haskellPackages.cmdargs;
                       inherit fficxx;
                     } ;
    HROOT-src-tree = callPackage ./packages/HROOT-src-tree {
                       inherit HROOT-generate;
                     } ;
    HROOT-core = callPackage ./packages/HROOT-core {
                   cabal = haskellPackages.cabal; 
                   inherit root5 fficxx-runtime HROOT-src-tree; 
                 } ;
    HROOT-hist = callPackage ./packages/HROOT-hist {
                   cabal = haskellPackages.cabal; 
                   inherit root5 fficxx-runtime HROOT-src-tree HROOT-core; 
                 };
    HROOT-graf = callPackage ./packages/HROOT-graf {
                   cabal = haskellPackages.cabal;
                   inherit root5 fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist; 
                 } ;
    HROOT-io   = callPackage ./packages/HROOT-io   {
                   cabal = haskellPackages.cabal; 
                   inherit root5 fficxx-runtime HROOT-src-tree HROOT-core;
                 } ;
    HROOT-math = callPackage ./packages/HROOT-math {
                   cabal = haskellPackages.cabal; 
                   inherit root5 fficxx-runtime HROOT-src-tree HROOT-core;
                 } ;


in { inherit root5 fficxx fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist HROOT-graf HROOT-io HROOT-math ; } 




