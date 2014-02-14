{ pkgs, FastlimSrc }:
 
pkgs.myEnvFun { 
  name = "Fastlim";
  buildInputs = with pkgs; [
    pythonFull 
    stdenv
    pythonPackages.numpy
    pythonPackages.scipy
  ];
  
  extraCmds = with pkgs; ''
    tar xvzf ${FastlimSrc} ;     
    export PYTHONPATH=
    #declare -f unpackFastlim
  '';
}
