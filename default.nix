{ pkgs } :

with pkgs;
rec {
      #Atom              = callPackage ./pkgs/Atom {
      #                      #root5=ROOT6;
      #                      ROOT=ROOT6;
      #                      inherit HepMC FastJet cython0192;
      #                      inherit (pkgs) gsl pkgconfig;
      #                      inherit libyamlcppPIC;
      #                      inherit YODA;
      #                    };

      #AtomEnv           = callPackage ./pkgs/Atom/env.nix {
      #                      inherit pkgs;
      #                      inherit Atom;
      #                      ROOT=ROOT6;
      #                      inherit HepMC YODA FastJet;
      #                    };

      CalcHEP           = callPackage ./pkgs/CalcHEP { };

      CHAPLIN           = callPackage ./pkgs/CHAPLIN { };

      CheckMATE         = callPackage ./pkgs/CheckMATE {
                            inherit root5;
                          };

      CheckMATEEnv      = callPackage ./pkgs/CheckMATE/env.nix {
                            inherit CheckMATE;
                          };

      ColorFull         = callPackage ./pkgs/ColorFull { };

      Delphes           = callPackage ./pkgs/Delphes {
                            inherit root5;
                          };

      ExRootAnalysis    = callPackage ./pkgs/ExRootAnalysis {
                            inherit root5;
                          };

      ExRootAnalysisEnv = callPackage ./pkgs/ExRootAnalysis/env.nix {
                            inherit root5;
                            inherit ExRootAnalysis;
                          };

      FastJet       = callPackage ./pkgs/FastJet { };

      FastJetEnv    = callPackage ./pkgs/FastJet/FastJetEnv.nix {
                        inherit FastJet;
                      };

      Fastlim       = callPackage ./pkgs/Fastlim { };

      FastlimEnv    = callPackage ./pkgs/Fastlim/FastlimEnv.nix {
                        inherit Fastlim;
                      };

      FeynHiggs     = callPackage ./pkgs/FeynHiggs { };

      FeynRules     = callPackage ./pkgs/FeynRules { };

      FeynRulesEnv  = callPackage ./pkgs/FeynRules/env.nix {
                        inherit FeynRules;
                      };

      Geant4        = callPackage ./pkgs/Geant4 { };

      HERWIGpp      = callPackage ./pkgs/HERWIGpp {
                        inherit ThePEG;
                        inherit FastJet;
                      };

      HERWIGppEnv   = callPackage ./pkgs/HERWIGpp/env.nix {
                        inherit HERWIGpp;
                      };

      HepMC         = callPackage ./pkgs/HepMC { };

      LanHEP        = callPackage ./pkgs/LanHEP { };

      LanHEPEnv     = callPackage ./pkgs/LanHEP/env.nix { inherit LanHEP; };

      LHAPDF5       = callPackage ./pkgs/LHAPDF/5.9.1 { };

      LHAPDF        = callPackage ./pkgs/LHAPDF { };

      LHPC          = callPackage ./pkgs/LHPC { };

      LoopTools     = callPackage ./pkgs/LoopTools { };

      LUXCalc       = callPackage ./pkgs/LUXCalc { };

      LUXCalcEnv    = callPackage ./pkgs/LUXCalc/env.nix { inherit LUXCalc; };

      MadAnalysis5  = callPackage ./pkgs/MadAnalysis5 { };

      MadAnalysis5Env  = callPackage ./pkgs/MadAnalysis5/env.nix {
                           inherit MadAnalysis5 root5 FastJet Delphes;
                         };

      MadGraph5_aMCatNLO = callPackage ./pkgs/MadGraph5_aMCatNLO {
                             inherit pythia-pgs PYTHIA8 ; # PYTHIA8-src-unpacked;
                           };

      MadGraph5_aMCatNLOEnv = callPackage ./pkgs/MadGraph5_aMCatNLO/env.nix {
                                inherit pythia-pgs MadGraph5_aMCatNLO ; # PYTHIA8-src;
                              };

      Minuit2       = callPackage ./pkgs/Minuit2 { };

      mt2Cwrapper   = callPackage ./pkgs/mt2_cwrapper {
                        ROOT=ROOT6;
                      };

      Rivet         = callPackage ./pkgs/Rivet {
                        inherit HepMC FastJet YODA;
                        inherit libyamlcppPIC;
                      };

      PYTHIA8-src   = callPackage ./pkgs/PYTHIA8/src.nix { };

      #PYTHIA8-src-unpacked = callPackage ./pkgs/PYTHIA8/src-unpacked.nix {
      #                         inherit PYTHIA8-src;
      #                       };

      PYTHIA8       = callPackage ./pkgs/PYTHIA8 {
                        inherit PYTHIA8-src HepMC LHAPDF;
                      };

      PYTHIA8Env    = callPackage ./pkgs/PYTHIA8/env.nix {
                        inherit PYTHIA8 FastJet LHAPDF;
                      };

      ROOT6         = callPackage ./pkgs/ROOT6 { };

      ROOT6Env      = callPackage ./pkgs/ROOT6/env.nix {
                        inherit ROOT6;
                      };

      SARAH         = callPackage ./pkgs/SARAH { };

      SARAHEnv      = callPackage ./pkgs/SARAH/env.nix {
                        inherit SARAH;
                      };

      SHERPA        = callPackage ./pkgs/SHERPA {
                        inherit HepMC FastJet;
                      };

      SMH           = callPackage ./pkgs/SMH { inherit TSIL; };

      SPheno        = callPackage ./pkgs/SPheno { };

      SUSY-HIT      = callPackage ./pkgs/SUSY-HIT { };

      SUSY-HITEnv   = callPackage ./pkgs/SUSY-HIT/env.nix { inherit SUSY-HIT; };

      THDMC         = callPackage ./pkgs/THDMC { };

      ThePEG        = callPackage ./pkgs/ThePEG {
#                        stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
#                                 in if stdenv.isDarwin then clang33Stdenv else stdenv;
                        inherit HepMC LHAPDF FastJet libyamlcppPIC;
                      };

      TSIL          = callPackage ./pkgs/TSIL { };

      YODA          = callPackage ./pkgs/YODA { };

      # aMCSusHi      = callPackage ./pkgs/aMCSusHi { };

      aMCSusHiEnv   = callPackage ./pkgs/aMCSusHi/env.nix {
                        inherit LHAPDF;
                        inherit FeynHiggs;
                      };

      cernlib       = callPackage ./pkgs/cernlib { };

      convertStdHep = callPackage ./pkgs/convertStdHep {
                        inherit HepMC;
                      };

      cython0192    = callPackage ./pkgs/future/cython/0.19.2.nix {
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
                        inherit Minuit2;
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

      root5min = callPackage ./pkgs/root5/minimal.nix { };

      rootEnv = callPackage ./pkgs/root5/rootEnv.nix {
                  inherit root5;
                };

      softsusy    = callPackage ./pkgs/softsusy/default.nix { };

      softsusyEnv = callPackage ./pkgs/softsusy/env.nix {
                      inherit softsusy;
                    };

      # haskell packages

      #HEPUtil = haskellngPackages.callPackage ./pkgs/HEPUtil {
      #               inherit LHCOAnalysis-type;
      #             } ;

      #HROOT   = haskellngPackages.callPackage ./pkgs/HROOT {
      #               inherit fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist HROOT-graf HROOT-math HROOT-io HROOT-tree;
      #               ROOT=ROOT6;
      #             } ;


      #HROOT-core = haskellngPackages.callPackage ./pkgs/HROOT-core {
      #               inherit fficxx-runtime HROOT-src-tree;
      #               ROOT=ROOT6;
      #             } ;

      #HROOT-generate = haskellngPackages.callPackage ./pkgs/HROOT-generate {
      #                   inherit fficxx;
      #                 } ;

      #HROOT-hist = haskellngPackages.callPackage ./pkgs/HROOT-hist {
      #               inherit fficxx-runtime HROOT-src-tree HROOT-core;
      #               ROOT=ROOT6;
      #             };
      #HROOT-graf = haskellngPackages.callPackage ./pkgs/HROOT-graf {
      #               inherit fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist;
      #               ROOT=ROOT6;
      #             } ;

      #HROOT-io   = haskellngPackages.callPackage ./pkgs/HROOT-io   {
      #               inherit fficxx-runtime HROOT-src-tree HROOT-core;
      #               ROOT=ROOT6;
      #             } ;

      #HROOT-math = haskellngPackages.callPackage ./pkgs/HROOT-math {
      #               inherit fficxx-runtime HROOT-src-tree HROOT-core;
      #               ROOT=ROOT6;
      #             } ;

      #HROOT-tree = haskellngPackages.callPackage ./pkgs/HROOT-tree {
      #               inherit fficxx-runtime HROOT-src-tree HROOT-core;
      #               ROOT=ROOT6;
      #             } ;

      #HROOT-src-tree = callPackage ./pkgs/HROOT-src-tree {
      #                   inherit HROOT-generate;
      #                 } ;

      #LHCOAnalysis = haskellngPackages.callPackage ./pkgs/LHCOAnalysis {
      #                 inherit LHCOAnalysis-type;
      #               } ;


      #LHCOAnalysis-type = haskellngPackages.callPackage ./pkgs/LHCOAnalysis-type { } ;

      #LHE-sanitizer = haskellngPackages.callPackage ./pkgs/LHE-sanitizer {
      #                 inherit HEPUtil conduit-util LHEParser;
      #               } ;

      #LHEParser = haskellngPackages.callPackage ./pkgs/LHEParser {
      #              inherit HEPUtil conduit-util;
      #            } ;

      #conduit-util = haskellngPackages.callPackage ./pkgs/conduit-util { inherit HEPUtil; } ;

      #fficxx = haskellngPackages.callPackage ./pkgs/fficxx { } ;

      #fficxx-runtime = haskellngPackages.callPackage ./pkgs/fficxx-runtime { } ;

      #devadmin = haskellngPackages.callPackage ./pkgs/devadmin { } ;

      #evchain = haskellngPackages.callPackage ./pkgs/evchain {
      #                        inherit webdav-manager HEPUtil LHEParser;
      #                        inherit LHE-sanitizer conduit-util;
      #                        inherit madgraph-auto pipeline-eventgen;
      #                      } ;

      #evchainEnv = callPackage ./pkgs/evchain/env.nix {
      #               inherit evchain MadGraph5_aMCatNLO;
      #             };

      #jobqueue-client = callPackage ./pkgs/jobqueue-client {
      #                    cabal = haskellPackages.cabal;
      #                    inherit haskellPackages;
      #                    inherit jobqueue-server-src;
      #                    inherit jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager;
      #                  };

      #jobqueue-clientEnv = callPackage ./pkgs/jobqueue-client/env.nix {
      #                       inherit jobqueue-client pythia-pgs MadGraph5_aMCatNLO;
      #                     };


      #jobqueue-common = callPackage ./pkgs/jobqueue-common {
      #                    cabal = haskellPackages.cabal;
      #                    inherit haskellPackages;
      #                    inherit jobqueue-server-src;
      #                    inherit madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager;
      #                  };

      #jobqueue-server = callPackage ./pkgs/jobqueue-server {
      #                    cabal = haskellPackages.cabal;
      #                    inherit haskellPackages;
      #                    inherit jobqueue-server-src;
      #                    inherit jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager;
      #                  };

      #jobqueue-server-src = callPackage ./pkgs/jobqueue-server/src.nix { };


      #madgraph-auto = haskellngPackages.callPackage ./pkgs/madgraph-auto {
      #                  inherit LHE-sanitizer webdav-manager devadmin;
      #                } ;

      #madgraph-auto-model = haskellngPackages.callPackage ./pkgs/madgraph-auto-model {
      #                        inherit madgraph-auto HEPUtil devadmin;
      #                      } ;

      #pipeline-eventgen = haskellngPackages.callPackage ./pkgs/pipeline-eventgen {
      #                       inherit webdav-manager HEPUtil LHEParser;
      #                       inherit madgraph-auto madgraph-auto-model;
      #                    } ;

      #pipeline-eventgenEnv = callPackage ./pkgs/pipeline-eventgen/env.nix {
      #                         inherit pipeline-eventgen;
      #                       } ;

      #webdav-manager = haskellngPackages.callPackage ./pkgs/webdav-manager { } ;

      #tools
      #hep-nix-overlay-tools = callPackage ./pkgs/tools/hep-nix-overlay-tools {
      #                        };

      #hep-nix-overlay-toolsEnv = callPackage ./pkgs/tools/hep-nix-overlay-tools/env.nix {
      #                             inherit hep-nix-overlay-tools;
      #                           };


      # development
      dev = rec {
              AtomDev         = callPackage ./pkgs/dev/Atom {
                                  ROOT=ROOT6;
                                  inherit HepMC FastJet cython0192;
                                  inherit (pkgs) gsl pkgconfig;
                                  inherit libyamlcppPIC;
                                  inherit  YODA;
                                };
              AtomDevEnv      = callPackage ./pkgs/dev/Atom/env.nix {
                                  inherit pkgs;
                                  inherit AtomDev;
                                  ROOT=ROOT6;
                                  inherit YODA HepMC FastJet;
                                  inherit libyamlcppPIC;
                                };

              AtomDevEnvHaskell=callPackage ./pkgs/dev/Atom/envHaskell.nix {
                                  inherit pkgs;
                                  inherit AtomDev;
                                  ROOT=ROOT6;
                                  inherit YODA;
                                };



              root5minDev     = callPackage ./pkgs/dev/root5/minimal.nix {
                                   #stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                                   #in if stdenv.isDarwin then clang33Stdenv else stdenv;
                                };
            };
}
