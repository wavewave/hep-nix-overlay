{ pkgs, root5 }:

let version = "34.12";
in pkgs.myEnvFun rec { 
  name = "root5-${version}";

  buildInputs = with pkgs; [
    pythonFull 
    pkgs.pythonPackages.readline
    root5
    stdenv
  ];
  
  extraCmds = ''
    source ${root5}/bin/thisroot.sh
  '';
}
