{ pkgs, MadGraph5_aMCatNLO, FastJet }:

let version = MadGraph5_aMCatNLO.version;
    pythonMG5aMC = pkgs.pythonFull.override { 
      #extraLibs = with pkgs.pythonPackages; [ numpy scipy ];
    };
in pkgs.myEnvFun rec { 
  name = "MadGraph5_aMCatNLO-${version}";
 
  buildInputs = with pkgs; [
    pythonMG5aMC
    pkgs.gfortran
    stdenv
  ];
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    unpack () { 
      tar xvzf ${MadGraph5_aMCatNLO}/share/MadGraph5_aMCatNLO-${version}/MadGraph5_aMCatNLO-${version}.tar.gz; 
      #chmod -R u+w fastlim-1.0; 
    }
    export -f unpack 
  '';
}
