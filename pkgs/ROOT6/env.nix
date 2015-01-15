{ pkgs, ROOT6 }:

let version = ROOT6.version;
in pkgs.myEnvFun rec { 
  name = "ROOT6-${version}";

  buildInputs = with pkgs; [ ROOT6 pythonFull ];
  
  extraCmds = ''
    source ${ROOT6}/bin/thisroot.sh
  '';
}
