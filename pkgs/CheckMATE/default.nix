{ pkgs, fetchurl, root5 }:
 

pkgs.stdenv.mkDerivation rec { 
  name = "CheckMATE-${version}"; 
  version = "1.1.10";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/checkmate/CheckMATE-1.1.10.tar.gz";
    sha256 = "0yw0y03bdvw33xx3nkkdy2fn3y6sv0lazbq8swy1c3cpd0y0x3lx";
  };
  buildInputs = [ root5 pythonCheckMATE pkgs.which pkgs.tcl ];
  enableParallelBuilding = true; 

  pythonCheckMATE = pkgs.pythonFull.override { 
                      extraLibs = with pkgs.pythonPackages; [ numpy ];
                    };

  installPhase = ''        
    cd ..
    tar cvzf CheckMATE-${version}.tar.gz $sourceRoot
    mkdir -p $out/share/CheckMATE-${version}
    cp CheckMATE-${version}.tar.gz $out/share/CheckMATE-${version}
    mkdir -p $out/lib
    cp $sourceRoot/tools/delphes/Delphes-3.0.10X/libDelphes.so $out/lib
  ''; 
}
