{ pkgs } : 

with pkgs; 
rec { 
      Atom          = callPackage ./packages/Atom {
                        inherit root5;
			inherit HepMC FastJet cython0192; # Rivet ;
			inherit (pkgs) gsl pkgconfig; 
			inherit libyamlcppPIC;
			inherit YODA;
		      };

      AtomEnv       = callPackage ./packages/Atom/env.nix {
			inherit pkgs;
			inherit Atom; 
                        inherit root5;
		      };

      FastJet       = callPackage ./packages/FastJet {
		      };
 
      FastJetEnv    = callPackage ./packages/FastJet/FastJetEnv.nix { 
                        inherit FastJet;
                      };

      Fastlim       = callPackage ./packages/Fastlim { 
                    };
    
      FastlimEnv    = callPackage ./packages/Fastlim/FastlimEnv.nix { 
                      inherit Fastlim;
                    };

      HERWIGpp      = callPackage ./packages/HERWIGpp {
			inherit ThePEG;
			inherit FastJet;
		      };     

      HepMC         = callPackage ./packages/HepMC { };

      LHAPDF        = callPackage ./packages/LHAPDF { };
  
      MadGraph5_aMCatNLO = callPackage ./packages/MadGraph5_aMCatNLO { };

      MadGraph5_aMCatNLOEnv = callPackage ./packages/MadGraph5_aMCatNLO/env.nix {  
                                inherit MadGraph5_aMCatNLO FastJet;
                              };

      Rivet         = callPackage ./packages/Rivet {
			inherit HepMC FastJet;
			inherit libyamlcppPIC ; 
		      };

      ThePEG        = callPackage ./packages/ThePEG { 
			inherit HepMC LHAPDF Rivet FastJet libyamlcppPIC;
		      };

      PYTHIA8       = callPackage ./packages/PYTHIA8 { 
		      };

      SHERPA        = callPackage ./packages/SHERPA { 
		      };

      YODA          = callPackage ./packages/YODA {
		      };

      cython0192    = callPackage ./packages/future/cython/0.19.2.nix { 
		      };

      convertStdHep = callPackage ./packages/convertStdHep {
			inherit HepMC;
		      };

      libyamlcpp025 = callPackage ./packages/legacy/libyaml-cpp/0.2.5.nix { 
		      };

      libyamlcppPIC = callPackage ./packages/deriv/libyamlcppPIC { 
		      };

      professor     = callPackage ./packages/professor {
			inherit pythonPackages;
			inherit pyminuit2;
		      };

      pyminuit2     = callPackage ./packages/pyminuit2 {
			inherit pythonPackages;
			inherit root5;
		      };

      root5 = callPackage ./packages/root5 {
                stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                         in if stdenv.isDarwin then clang33Stdenv else stdenv;
               } ;

      root5min = callPackage ./packages/root5/minimal.nix {                       
  #                 stdenv = clangStdenv; 
                    stdenv = let clang33Stdenv = overrideGCC stdenv clang_33;
                             in if stdenv.isDarwin then clang33Stdenv else stdenv;
                 };

      rootEnv = callPackage ./packages/root5/rootEnv.nix {
                  inherit root5;
                };

      softsusy = callPackage ./packages/softsusy/default.nix { };

      # haskell packages

      HEPUtil = callPackage ./packages/HEPUtil { 
		     cabal = haskellPackages.cabal;
		     inherit haskellPackages;
                     inherit LHCOAnalysis-type;
		   } ;

      HROOT-core = callPackage ./packages/HROOT-core {
		     cabal = haskellPackages.cabal; 
		     inherit fficxx-runtime HROOT-src-tree; 
                     root5 = root5min;
		   } ;


      HROOT-generate = callPackage ./packages/HROOT-generate {
			 cabal = haskellPackages.cabal; 
			 HStringTemplate = haskellPackages.HStringTemplate;
			 configurator = haskellPackages.configurator;
			 cmdargs = haskellPackages.cmdargs;
			 inherit fficxx;
		       } ;

      HROOT-hist = callPackage ./packages/HROOT-hist {
		     cabal = haskellPackages.cabal; 
		     inherit fficxx-runtime HROOT-src-tree HROOT-core; 
                     root5 = root5min;
		   };
      HROOT-graf = callPackage ./packages/HROOT-graf {
		     cabal = haskellPackages.cabal;
		     inherit fficxx-runtime HROOT-src-tree HROOT-core HROOT-hist; 
                     root5 = root5min;
		   } ;

      HROOT-io   = callPackage ./packages/HROOT-io   {
		     cabal = haskellPackages.cabal; 
		     inherit fficxx-runtime HROOT-src-tree HROOT-core;
                     root5 = root5min;
		   } ;

      HROOT-math = callPackage ./packages/HROOT-math {
		     cabal = haskellPackages.cabal; 
		     inherit fficxx-runtime HROOT-src-tree HROOT-core;
                     root5 = root5min;
		   } ;

      HROOT-src-tree = callPackage ./packages/HROOT-src-tree {
			 inherit HROOT-generate;
		       } ;

      LHCOAnalysis-type = callPackage ./packages/LHCOAnalysis-type { 
		     cabal = haskellPackages.cabal;
		     inherit haskellPackages; 
		   } ;

      LHE-sanitizer = callPackage ./packages/LHE-sanitizer { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
                       inherit HEPUtil conduit-util LHEParser;
		     } ;

      LHEParser = callPackage ./packages/LHEParser { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
                       inherit HEPUtil conduit-util;
		     } ;

      conduit-util = callPackage ./packages/conduit-util { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
		       inherit HEPUtil;
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

      devadmin = callPackage ./packages/devadmin { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
		     } ;

      evchain = callPackage ./packages/evchain { 
			      cabal = haskellPackages.cabal;
			      inherit haskellPackages;
                              inherit webdav-manager HEPUtil LHEParser;
                              inherit LHE-sanitizer conduit-util;
                              inherit madgraph-auto pipeline-eventgen;
			    } ;

      evchainEnv = callPackage ./packages/evchain/env.nix {
                     inherit evchain MadGraph5_aMCatNLO;
                   };

      madgraph-auto = callPackage ./packages/madgraph-auto { 
			cabal = haskellPackages.cabal;
			inherit haskellPackages;
                        inherit LHE-sanitizer webdav-manager devadmin;
		      } ;

      madgraph-auto-model = callPackage ./packages/madgraph-auto-model { 
			      cabal = haskellPackages.cabal;
			      inherit haskellPackages;
                              inherit madgraph-auto HEPUtil devadmin;
			    } ;

      pipeline-eventgen = callPackage ./packages/pipeline-eventgen { 
			     cabal = haskellPackages.cabal;
			     inherit haskellPackages;
                             inherit webdav-manager HEPUtil LHEParser;
                             inherit madgraph-auto madgraph-auto-model;
			  } ;

      webdav-manager = callPackage ./packages/webdav-manager { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
		     } ;


      # development
      dev = rec { 
              AtomDev        = callPackage ./packages/dev/Atom {
                                 inherit root5 HepMC FastJet cython0192;
			         inherit (pkgs) gsl pkgconfig; 
			         inherit libyamlcppPIC;
		                 inherit  YODA;
                               };
              AtomDevEnv      = callPackage ./packages/dev/Atom/env.nix {
                                  inherit pkgs;
                                  inherit AtomDev;
                                  #root5=root5min; 
                                  inherit root5;
                                  inherit YODA;
                              };
            };


}





