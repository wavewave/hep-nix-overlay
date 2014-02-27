{ pkgs, root5 }:
 
pkgs.myEnvFun { 
  name = "root5";
  buildInputs = with pkgs; [
    pythonFull 
    root5
    stdenv
  ];
  
  extraCmds = ''
    source ${root5}/bin/thisroot.sh
  '';
}
