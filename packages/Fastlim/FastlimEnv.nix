{ pkgs, Fastlim }:

let version = Fastlim.version;
    pythonFastlim = pkgs.pythonFull.override { 
      extraLibs = with pkgs.pythonPackages; [ numpy scipy ];
    };
in pkgs.myEnvFun rec { 
  name = "Fastlim-${version}";
 
  buildInputs = with pkgs; [
    pythonFastlim
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
