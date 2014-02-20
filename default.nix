{ pkgs } : 

with pkgs; 
rec { 
      HepMC         = callPackage ./packages/HepMC { };
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

      AtomDev      = callPackage ./packages/dev/Atom {
			inherit root5 HepMC FastJet cython0192; 
			inherit (pkgs) gsl pkgconfig; 
			inherit libyamlcppPIC;
			inherit YODA;
		      };
      atomEnv       = callPackage ./packages/Atom/atomenv.nix {
			inherit pkgs;
			inherit Atom;
		      };

      atomDevEnv    = callPackage ./packages/dev/Atom/atomenv.nix {
			inherit pkgs;
			inherit AtomDev;
		      };


      ThePEG        = callPackage ./packages/ThePEG { 
			inherit HepMC LHAPDF Rivet FastJet libyamlcppPIC;
		      };
      HERWIGpp      = callPackage ./packages/HERWIGpp {
			inherit ThePEG;
			inherit FastJet;
		      };     
      SHERPA        = callPackage ./packages/SHERPA { 
		      };
      PYTHIA8       = callPackage ./packages/PYTHIA8 { 
		      };


      #googletest    = callPackage ./packages/googletest {
      #		      };

      YODA          = callPackage ./packages/YODA {
		      };

      Fastlim       = callPackage ./packages/Fastlim { 
                    };
    
      FastlimEnv    = callPackage ./packages/Fastlim/FastlimEnv.nix { 
                      inherit Fastlim;
                    };


      #haskellPackages = pkgs.haskellPackages_ghc763;
      #pythonPackages = pkgs.pythonPackages; 
      root5 = callPackage ./packages/root5 {} ;
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
                     inherit LHCOAnalysis-type;
		     #inherit hepNixPackages;
		   } ;
      conduit-util = callPackage ./packages/conduit-util { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
		       inherit HEPUtil;
		     } ;
      LHEParser = callPackage ./packages/LHEParser { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
                       inherit HEPUtil conduit-util;
		     } ;
      LHE-sanitizer = callPackage ./packages/LHE-sanitizer { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
                       inherit HEPUtil conduit-util LHEParser;
		     } ;
      webdav-manager = callPackage ./packages/webdav-manager { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
		       #inherit hepNixPackages;
		     } ;
      devadmin = callPackage ./packages/devadmin { 
		       cabal = haskellPackages.cabal;
		       inherit haskellPackages;
		     } ;
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
      evchain = callPackage ./packages/evchain { 
			      cabal = haskellPackages.cabal;
			      inherit haskellPackages;
                              inherit webdav-manager HEPUtil LHEParser;
                              inherit LHE-sanitizer conduit-util;
                              inherit madgraph-auto pipeline-eventgen;
			    } ;


}





