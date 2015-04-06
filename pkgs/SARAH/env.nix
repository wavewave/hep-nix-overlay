{ pkgs, SARAH }:

let version = SARAH.version;
in pkgs.myEnvFun rec {
  name = "SARAH-${version}";

  buildInputs = with pkgs; [ ];

  extraCmds = with pkgs; ''
    unpack () {
      dir=\$(pwd)
      str='\$Path = AppendTo[ \$Path, "'\$dir'"];'
      echo \$str > init.m
      tar xvzf ${SARAH}/share/SARAH-${version}/SARAH-${version}.tar.gz
    }
    export -f unpack
  '';
}
