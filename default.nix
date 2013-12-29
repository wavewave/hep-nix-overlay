
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

let hepNixPackages =  rec { 

    lib = import "${nixpkgs}/lib"; 
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
    LHCOAnalysis-type = callPackage ./packages/LHCOAnalysis-type { 
                   cabal = haskellPackages.cabal;
                   inherit haskellPackages; 
                 } ;
    HEPUtil = callPackage ./packages/HEPUtil { 
                   cabal = haskellPackages.cabal;
                   inherit haskellPackages;
                   inherit hepNixPackages;
                 } ;
    conduit-util = callPackage ./packages/conduit-util { 
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit hepNixPackages;
                   } ;
    LHEParser = callPackage ./packages/LHEParser { 
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit hepNixPackages;
                   } ;
    LHE-sanitizer = callPackage ./packages/LHE-sanitizer { 
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit hepNixPackages;
                   } ;
    webdav-manager = callPackage ./packages/webdav-manager { 
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit hepNixPackages;
                   } ;
    devadmin = callPackage ./packages/devadmin { 
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit hepNixPackages;
                   } ;
    madgraph-auto = callPackage ./packages/madgraph-auto { 
                      cabal = haskellPackages.cabal;
                      inherit haskellPackages;
                      inherit hepNixPackages;
                      hashable = haskellPackages.hashable_1_2_1_0; 
                    } ;
    madgraph-auto-model = callPackage ./packages/madgraph-auto-model { 
                            cabal = haskellPackages.cabal;
                            inherit haskellPackages;
                            inherit hepNixPackages;
                          } ;
    pipeline-eventgen = callPackage ./packages/pipeline-eventgen { 
                           cabal = haskellPackages.cabal;
                           inherit haskellPackages;
                           inherit hepNixPackages;
                        } ;
    evchain = callPackage ./packages/evchain { 
                            cabal = haskellPackages.cabal;
                            inherit haskellPackages;
                            inherit hepNixPackages;
                          } ;
    HepMC         = callPackage ./packages/HepMC {
                    };
    FastJet       = callPackage ./packages/FastJet {
                    };
    Rivet         = callPackage ./packages/Rivet {
                      inherit HepMC FastJet; 
                    };
    LHAPDF        = callPackage ./packages/LHAPDF {
                      #inherit HepMC FastJet; 
                    };

    # not yet 
    #convertStdHep = callPackage ./packages/convertStdHep {
    #                  inherit HepMC;
    #                };

     
    allpkgs = {
     inherit root5 fficxx fficxx-runtime HROOT-generate HROOT-src-tree;
     inherit HROOT-core HROOT-hist;
     inherit HROOT-graf HROOT-io HROOT-math ; 
     inherit LHCOAnalysis-type HEPUtil conduit-util LHEParser LHE-sanitizer;
     inherit webdav-manager devadmin madgraph-auto madgraph-auto-model;
     inherit pipeline-eventgen evchain;
     inherit HepMC FastJet Rivet LHAPDF; 
     #inherit convertStdHep;

   };
} . allpkgs;

in hepNixPackages




