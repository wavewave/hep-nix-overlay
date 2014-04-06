{ pkgs, root5 }:

let version = "34.12";
    pythonWithReadline = pkgs.pythonFull.override { 
                           extraLibs = [ pkgs.pythonPackages.readline ]; 
                         }; 

in pkgs.myEnvFun rec { 
  name = "root5-${version}";

  buildInputs = with pkgs; [
    # pythonFull 
    pythonWithReadline
    root5
    stdenv
  ];
  
  extraCmds = ''
    source ${root5}/bin/thisroot.sh
  '';
}
