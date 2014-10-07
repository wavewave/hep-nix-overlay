{ pkgs, SUSY-HIT }: 

let version = SUSY-HIT.version;
in pkgs.myEnvFun rec { 
  name = "SUSY-HIT-${version}";

  buildInputs = with pkgs; [ ];
  
  extraCmds = with pkgs; ''
    unpack () { 
      tar xvzf ${SUSY-HIT}/share/SUSY-HIT-${version}/susyhit-${version}.tar.gz
    }
    export -f unpack 
  '';
}
