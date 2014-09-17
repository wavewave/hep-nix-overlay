{ pkgs, CheckMATE }: 

let version = CheckMATE.version;
in pkgs.myEnvFun rec { 
  name = "CheckMATE-${version}";

  buildInputs = with pkgs; [ CheckMATE.pythonCheckMATE ];
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=${CheckMATE}/lib
    unpack () { 
      tar xvzf ${CheckMATE}/share/CheckMATE-${version}/CheckMATE-${version}.tar.gz
    }
    export -f unpack 
  '';
}

