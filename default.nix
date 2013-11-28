
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
, nixpkgs ? /afs/cern.ch/user/i/ikim/repo/ext/nixpkgs
, ...
}:

let lib = import /afs/cern.ch/user/i/ikim/repo/ext/nixpkgs/lib;
    defaultScope = pkgs // pkgs.xorg;
    mainConfig = { inherit system stdenvType bootStdenv noSysDirs gccWithCC gccWithProfiling config; };
    pkgs = import nixpkgs mainConfig;
    haskellPackages = pkgs.haskellPackages_ghc763;
    callPackage = newScope {};
    newScope = extra: lib.callPackageWith (defaultScope // extra); 
    # haskellPackages : lib.callPackageWith (defaultScope // haskellPackages ); 
    # cabal = haskellPackages.cabal; 
    root5 = callPackage ./packages/root5 { } ;
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

in [ root5 fficxx fficxx-runtime ]    




