{ pkgs, LanHEP }:

let version = LanHEP.version;
in pkgs.myEnvFun rec {
  name = "LanHEP-${version}";

  buildInputs = with pkgs; [ ];

  extraCmds = with pkgs; ''
    unpack () {
      tar xzf ${LanHEP}/share/${name}/${name}.tar.gz
    }
    export -f unpack
  '';
}
