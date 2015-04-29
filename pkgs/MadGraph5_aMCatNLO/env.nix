{ pkgs, MadGraph5_aMCatNLO, pythia-pgs }: 

let version = MadGraph5_aMCatNLO.version;
    pythonMG5aMC = pkgs.pythonFull; 
in pkgs.myEnvFun rec { 
  name = "MadGraph5_aMCatNLO-${version}";

  buildInputs = with pkgs; [
    pythonMG5aMC
    pkgs.gfortran
    pkgs.ghostscript
    stdenv
  ];
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    export PYTHIA_PGS_PATH=${pythia-pgs}
    export MADGRAPH5PATH=${MadGraph5_aMCatNLO}
    unpack () { 
      tar xvzf ${MadGraph5_aMCatNLO}/share/MadGraph5_aMCatNLO-${version}/MadGraph5_aMCatNLO-${version}.tar.gz
    }
    export -f unpack 
  '';
}

