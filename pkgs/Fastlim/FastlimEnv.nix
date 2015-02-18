{ pkgs, Fastlim }:

let version = Fastlim.version;
in pkgs.myEnvFun rec { 
  name = "Fastlim-${version}";
 
  buildInputs = with pkgs; [
    pythonFull pythonPackages.numpy pythonPackages.scipy
    stdenv
  ];
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    unpack () { 
      tar xvzf ${Fastlim}/share/Fastlim-${version}/Fastlim-${version}.tar.gz; 
      #chmod -R u+w fastlim-1.0; 
    }
    export -f unpack 
  '';
}
