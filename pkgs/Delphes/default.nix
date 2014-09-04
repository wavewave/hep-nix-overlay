{ pkgs, fetchurl, root5 }:
 
pkgs.stdenv.mkDerivation rec { 
  name = "Delphes-${version}"; 
  version = "3.1.2";
  src = fetchurl { 
    url = "http://cp3.irmp.ucl.ac.be/downloads/Delphes-3.1.2.tar.gz";
    sha256 = "07ga2yvn0h6x1c66yj9v88b0gcfgg5n2rf3dx03kcvb6yx3wrz7d";
  };
  phases = [ "unpackPhase" "buildPhase" "installPhase" ]; 
  buildInputs = [ root5 pkgs.which ];
  buildPhase = ''
    export ROOTSYS=${root5}
    make
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp  DelphesHepMC DelphesLHEF DelphesSTDHEP Example1 hepmc2pileup lhco2root libDelphes.so pileup2root root2lhco root2pileup stdhep2pileup $out/bin
    cp -a doc examples python modules readers display classes $out/
  ''; 
}
