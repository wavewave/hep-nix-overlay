
# same args as in all-packages.nix
# should this be moved into pkg/top-level/all-packages.nix ?
{ system ? builtins.currentSystem
, stdenvType ? system
, bootStdenv ? null
, noSysDirs ? (system != "x86_64-darwin"
               && system != "x86_64-freebsd" && system != "i686-freebsd"
               && system != "x86_64-kfreebsd-gnu") # false # true
, gccWithCC ? true
, gccWithProfiling ? true
, config ? null
# additional:
# , nixpkgs 
, ...
}:

#import <nixpkgs>;

#with import <nixpkgs> { }; 

let hepNixPackages =  rec { 

    lib = import <nixpkgs/lib>; 
      # import "${nixpkgs}/lib"; 
    defaultScope = pkgs // pkgs.xorg;
    mainConfig = { inherit system stdenvType bootStdenv noSysDirs gccWithCC gccWithProfiling config; };
    pkgs = import <nixpkgs> mainConfig;
    fetchfile = import <nixpkgs/pkgs/build-support/fetchfile> { inherit (pkgs) stdenv; } ;

    haskellPackages = pkgs.haskellPackages_ghc763;
    pythonPackages = pkgs.pythonPackages; 
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
                      #hashable = haskellPackages.hashable_1_2_1_0; 
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

    libyamlcpp025 = callPackage ./packages/legacy/libyaml-cpp/0.2.5.nix { 
                    };

    libyamlcppPIC = callPackage ./packages/deriv/libyamlcppPIC { 
                    };


    cython0192    = callPackage ./packages/future/cython/0.19.2.nix { 
                    };

    Rivet         = callPackage ./packages/Rivet {
                      inherit HepMC FastJet;
                      inherit libyamlcppPIC ; 
                    };
    LHAPDF        = callPackage ./packages/LHAPDF {
                      #inherit HepMC FastJet; 
                    };
    convertStdHep = callPackage ./packages/convertStdHep {
                      inherit HepMC;
                    };
    pyminuit2     = callPackage ./packages/pyminuit2 {
                      inherit pythonPackages;
                      inherit root5;
                    };
    professor     = callPackage ./packages/professor {
                      inherit pythonPackages;
                      inherit pyminuit2;
                    };

    Atom          = callPackage ./packages/Atom {
                      inherit root5 HepMC FastJet cython0192; # Rivet ;
                      inherit (pkgs) gsl pkgconfig; 
                      # doxygen ;
                      # inherit fetchfile;
                      inherit libyamlcppPIC;
                      inherit YODA;

                    };

    ThePEG        = callPackage ./packages/ThePEG { 
                      inherit HepMC LHAPDF Rivet FastJet;
                    };
    HERWIGpp      = callPackage ./packages/HERWIGpp {
                      inherit ThePEG;
                      inherit FastJet;
                    };     
    SHERPA        = callPackage ./packages/SHERPA { 
                    };
    PYTHIA8       = callPackage ./packages/PYTHIA8 { 
                    };


    atomEnv       = callPackage ./packages/Atom/atomenv.nix {
                      inherit pkgs;
                      inherit Atom;
                    };
    googletest    = callPackage ./packages/googletest {

                    };

    YODA          = callPackage ./packages/YODA {
                    };

    Fastlim       = callPackage ./packages/Fastlim { 
                    };
    
    FastlimEnv    = callPackage ./packages/Fastlim/FastlimEnv.nix { 
                      inherit Fastlim;
                    };

    allpkgs = {
     inherit root5 fficxx fficxx-runtime HROOT-generate HROOT-src-tree;
     inherit HROOT-core HROOT-hist;
     inherit HROOT-graf HROOT-io HROOT-math ; 
     inherit LHCOAnalysis-type HEPUtil conduit-util LHEParser LHE-sanitizer;
     inherit webdav-manager devadmin madgraph-auto madgraph-auto-model;
     inherit pipeline-eventgen evchain;
     inherit HepMC FastJet Rivet LHAPDF professor convertStdHep; 
     inherit pyminuit2;
     inherit cython0192;
     inherit libyamlcpp025 Atom;
     inherit HERWIGpp ThePEG;
     inherit SHERPA PYTHIA8;
     inherit atomEnv;
     inherit googletest;
     inherit YODA;
     inherit Fastlim FastlimEnv;
   };
} . allpkgs;

in hepNixPackages




