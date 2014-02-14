{ pkgs, Fastlim }:

let pythonFastlim = pkgs.pythonFull.override { 
      extraLibs = with pkgs.pythonPackages; [ numpy scipy ];
    };
in pkgs.myEnvFun { 
  name = "Fastlim";

  buildInputs = with pkgs; [
    pythonFastlim
    stdenv
    #pythonPackages.numpy
    #pythonPackages.scipy
  ];
  
  extraCmds = with pkgs; ''
    cp -a ${Fastlim}/share/Fastlim/1.0 fastlim-1.0 
    chmod -R u+w fastlim-1.0
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    #declare -f unpackFastlim
  '';
}
