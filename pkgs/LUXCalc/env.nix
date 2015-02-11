{ pkgs, LUXCalc }:

let version = LUXCalc.version;
in pkgs.myEnvFun rec {
  name = "LUXCalc-${version}";

  buildInputs = with pkgs; [ ];

  extraCmds = with pkgs; ''
    unpack () {
      tar xzf ${LUXCalc}/share/${name}/${name}.tar.gz
    }
    export -f unpack
  '';
}
