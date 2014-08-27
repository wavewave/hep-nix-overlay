{ pkgs } :

with pkgs;
rec {
      Atom          = callPackage ./pkgs/Atom {
                        inherit root5;
                        inherit HepMC FastJet cython0192;
                        inherit (pkgs) gsl pkgconfig;
                        inherit libyamlcppPIC;
                        inherit YODA;
                      };

      AtomEnv       = callPackage ./pkgs/Atom/env.nix {
                        inherit pkgs;
                        inherit Atom;
                        inherit root5;
                        inherit HepMC YODA FastJet;
                      };

      AtomEnvMin    = callPackage ./pkgs/Atom/envMin.nix {
                        inherit pkgs;
                        inherit Atom;
                        inherit root5;
                        inherit HepMC YODA FastJet;
              };


      FastJet       = callPackage ./pkgs/FastJet {
                      };

      FastJetEnv    = callPackage ./pkgs/FastJet/FastJetEnv.nix {
                        inherit FastJet;
                      };

      Fastlim       = callPackage ./pkgs/Fastlim {
                    };

      FastlimEnv    = callPackage ./pkgs/Fastlim/FastlimEnv.nix {
                      inherit Fastlim;
                    };

      HERWIGpp      = callPackage ./pkgs/HERWIGpp {
                        stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                                 in if stdenv.isDarwin then clang33Stdenv else stdenv;
                        inherit ThePEG;
                        inherit FastJet;
                      };

      HERWIGppEnv   = callPackage ./pkgs/HERWIGpp/env.nix {
                        inherit HERWIGpp;
                      };

      HepMC         = callPackage ./pkgs/HepMC { };

      LHAPDF        = callPackage ./pkgs/LHAPDF { };

      MadGraph5_aMCatNLO = callPackage ./pkgs/MadGraph5_aMCatNLO {
                             inherit pythia-pgs PYTHIA8 ; # PYTHIA8-src-unpacked;
                           };

      MadGraph5_aMCatNLOEnv = callPackage ./pkgs/MadGraph5_aMCatNLO/env.nix {
                                inherit MadGraph5_aMCatNLO ; # PYTHIA8-src;
                              };

      Rivet         = callPackage ./pkgs/Rivet {
                        inherit HepMC FastJet;
                        inherit libyamlcppPIC ;
                      };

      PYTHIA8-src   = callPackage ./pkgs/PYTHIA8/src.nix { };

      #PYTHIA8-src-unpacked = callPackage ./pkgs/PYTHIA8/src-unpacked.nix {
      #                         inherit PYTHIA8-src;
      #                       };


      PYTHIA8       = callPackage ./pkgs/PYTHIA8 {
                        inherit PYTHIA8-src HepMC;
                      };

      SHERPA        = callPackage ./pkgs/SHERPA { };

      ThePEG        = callPackage ./pkgs/ThePEG {
                        stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                                 in if stdenv.isDarwin then clang33Stdenv else stdenv;
                        inherit HepMC LHAPDF FastJet libyamlcppPIC;
                      };

      YODA          = callPackage ./pkgs/YODA { };

      cython0192    = callPackage ./pkgs/future/cython/0.19.2.nix {
                      };

      convertStdHep = callPackage ./pkgs/convertStdHep {
                        inherit HepMC;
                      };

      libyamlcpp025 = callPackage ./pkgs/legacy/libyaml-cpp/0.2.5.nix {
                      };

      libyamlcppPIC = callPackage ./pkgs/deriv/libyamlcppPIC {
                      };

      professor     = callPackage ./pkgs/professor {
                        inherit pythonPackages;
                        inherit pyminuit2;
                      };

      pyminuit2     = callPackage ./pkgs/pyminuit2 {
                        inherit pythonPackages;
                        inherit root5;
                      };

      pythia-pgs    = callPackage ./pkgs/pythia-pgs {
                      };

      pythia-pgsEnv = callPackage ./pkgs/pythia-pgs/env.nix {
                         inherit pythia-pgs;
                      };

      root5 = callPackage ./pkgs/root5 {
                #stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                #         in if stdenv.isDarwin then clang33Stdenv else stdenv;
               } ;

      root5min = callPackage ./pkgs/root5/minimal.nix {
  #                 stdenv = clangStdenv;
 #                   stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
 #                            in if stdenv.isDarwin then clang33Stdenv else stdenv;
                 };

      rootEnv = callPackage ./pkgs/root5/rootEnv.nix {
                  inherit root5;
                };

      SPheno      = callPackage ./pkgs/SPheno/default.nix { };

      softsusy    = callPackage ./pkgs/softsusy/default.nix { };

      softsusyEnv = callPackage ./pkgs/softsusy/env.nix {
                      inherit softsusy;
                    };

      # haskell packages

      HEPUtil = callPackage ./pkgs/HEPUtil {
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit LHCOAnalysis-type;
                   } ;

      HROOT    = callPackage ./pkgs/HROOT {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist HROOT-graf HROOT-math HROOT-io HROOT-tree;
                     inherit root5;
                   } ;


      HROOT-core = callPackage ./pkgs/HROOT-core {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree;
                     inherit root5;
                   } ;

      HROOT-generate = callPackage ./pkgs/HROOT-generate {
                         cabal = haskellPackages.cabal;
                         HStringTemplate = haskellPackages.HStringTemplate;
                         configurator = haskellPackages.configurator;
                         cmdargs = haskellPackages.cmdargs;
                         inherit fficxx;
                       } ;

      HROOT-hist = callPackage ./pkgs/HROOT-hist {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree HROOT-core;
                     inherit root5;
                   };
      HROOT-graf = callPackage ./pkgs/HROOT-graf {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist;
                     inherit root5;
                   } ;

      HROOT-io   = callPackage ./pkgs/HROOT-io   {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree HROOT-core;
                     inherit root5;
                   } ;

      HROOT-math = callPackage ./pkgs/HROOT-math {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree HROOT-core;
                     inherit root5;
                   } ;

      HROOT-tree = callPackage ./pkgs/HROOT-tree {
                     cabal = haskellPackages.cabal;
                     inherit fficxx-runtime HROOT-src-tree HROOT-core;
                     inherit root5;
                   } ;


      HROOT-src-tree = callPackage ./pkgs/HROOT-src-tree {
                         inherit HROOT-generate;
                       } ;

      LHCOAnalysis = callPackage ./pkgs/LHCOAnalysis {
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                     inherit LHCOAnalysis-type;
                   } ;


      LHCOAnalysis-type = callPackage ./pkgs/LHCOAnalysis-type {
                     cabal = haskellPackages.cabal;
                     inherit haskellPackages;
                   } ;

      LHE-sanitizer = callPackage ./pkgs/LHE-sanitizer {
                       cabal = haskellPackages.cabal;
                       inherit haskellPackages;
                       inherit HEPUtil conduit-util LHEParser;
                     } ;

      LHEParser = callPackage ./pkgs/LHEParser {
                       cabal = haskellPackages.cabal;
                       inherit haskellPackages;
                       inherit HEPUtil conduit-util;
                     } ;

      conduit-util = callPackage ./pkgs/conduit-util {
                       cabal = haskellPackages.cabal;
                       inherit haskellPackages;
                       inherit HEPUtil;
                     } ;

      fficxx = callPackage ./pkgs/fficxx {
                 cabal = haskellPackages.cabal;
                 HStringTemplate = haskellPackages.HStringTemplate;
                 either = haskellPackages.either;
                 errors = haskellPackages.errors;
                 lens = haskellPackages.lens;
                 pureMD5 = haskellPackages.pureMD5;
                 split = haskellPackages.split;
               } ;

      fficxx-runtime = callPackage ./pkgs/fficxx-runtime {
                         cabal = haskellPackages.cabal;
                       } ;

      devadmin = callPackage ./pkgs/devadmin {
                       cabal = haskellPackages.cabal;
                       inherit haskellPackages;
                     } ;

      evchain = callPackage ./pkgs/evchain {
                              cabal = haskellPackages.cabal;
                              inherit haskellPackages;
                              inherit webdav-manager HEPUtil LHEParser;
                              inherit LHE-sanitizer conduit-util;
                              inherit madgraph-auto pipeline-eventgen;
                            } ;

      evchainEnv = callPackage ./pkgs/evchain/env.nix {
                     inherit evchain MadGraph5_aMCatNLO;
                   };

      jobqueue-client = callPackage ./pkgs/jobqueue-client {
                          cabal = haskellPackages.cabal;
                          inherit haskellPackages;
                          inherit jobqueue-server-src;
                          inherit jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager;
                        };

      jobqueue-clientEnv = callPackage ./pkgs/jobqueue-client/env.nix {
                             inherit jobqueue-client pythia-pgs MadGraph5_aMCatNLO;
                           };


      jobqueue-common = callPackage ./pkgs/jobqueue-common {
                          cabal = haskellPackages.cabal;
                          inherit haskellPackages;
                          inherit jobqueue-server-src;
                          inherit madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager;
                        };

      jobqueue-server = callPackage ./pkgs/jobqueue-server {
                          cabal = haskellPackages.cabal;
                          inherit haskellPackages;
                          inherit jobqueue-server-src;
                          inherit jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager;
                        };

      jobqueue-server-src = callPackage ./pkgs/jobqueue-server/src.nix { };


      madgraph-auto = callPackage ./pkgs/madgraph-auto {
                        cabal = haskellPackages.cabal;
                        inherit haskellPackages;
                        inherit LHE-sanitizer webdav-manager devadmin;
                      } ;

      madgraph-auto-model = callPackage ./pkgs/madgraph-auto-model {
                              cabal = haskellPackages.cabal;
                              inherit haskellPackages;
                              inherit madgraph-auto HEPUtil devadmin;
                            } ;

      pipeline-eventgen = callPackage ./pkgs/pipeline-eventgen {
                             cabal = haskellPackages.cabal;
                             inherit haskellPackages;
                             inherit webdav-manager HEPUtil LHEParser;
                             inherit madgraph-auto madgraph-auto-model;
                          } ;

      pipeline-eventgenEnv = callPackage ./pkgs/pipeline-eventgen/env.nix {
                               inherit pipeline-eventgen;
                             } ;

      webdav-manager = callPackage ./pkgs/webdav-manager {
                       cabal = haskellPackages.cabal;
                       inherit haskellPackages;
                     } ;

      #tools
      hep-nix-overlay-tools = callPackage ./pkgs/tools/hep-nix-overlay-tools {
                              };

      #hep-nix-overlay-toolsEnv = callPackage ./pkgs/tools/hep-nix-overlay-tools/env.nix {
      #                             inherit hep-nix-overlay-tools;
      #                           };


      # development
      dev = rec {
              AtomDev         = callPackage ./pkgs/dev/Atom {
                                  inherit root5 HepMC FastJet cython0192;
                                  inherit (pkgs) gsl pkgconfig;
                                  inherit libyamlcppPIC;
                                  inherit  YODA;
                                };
              AtomDevEnv      = callPackage ./pkgs/dev/Atom/env.nix {
                                  inherit pkgs;
                                  inherit AtomDev;
                                  #root5=root5min;
                                  inherit root5;
                                  inherit YODA;
                                };
              root5minDev     = callPackage ./pkgs/dev/root5/minimal.nix {
                                   #stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                                   #in if stdenv.isDarwin then clang33Stdenv else stdenv;
                                };
            };
}
