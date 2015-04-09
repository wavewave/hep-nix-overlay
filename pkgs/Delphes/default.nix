{ pkgs, root5 }:

with pkgs;

pkgs.stdenv.mkDerivation rec {
  name = "Delphes-${version}";
  version = "3.2.0";
  src = fetchurl {
    url = "http://cp3.irmp.ucl.ac.be/downloads/Delphes-3.2.0.tar.gz";
    sha256 = "1r6d1jl7mggzm5sbj4n5545vjj2xlanlq0cvbx1200bm5j2v041m";
  };
  phases = [ "unpackPhase" "buildPhase" "installPhase" ];
  buildInputs = [ root5 which ];
  enableParallelBuilding = true;

  buildPhase = ''
    export ROOTSYS=${root5}
    make
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp  DelphesHepMC DelphesLHEF DelphesSTDHEP Example1 hepmc2pileup lhco2root libDelphes.so pileup2root root2lhco root2pileup stdhep2pileup $out/bin
    cp -a cards doc examples python modules readers display classes $out/
  '';
}
