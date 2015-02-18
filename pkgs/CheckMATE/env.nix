{ pkgs, CheckMATE, python, pythonPackages }:

let version = CheckMATE.version;
in pkgs.myEnvFun rec {
  name = "CheckMATE-${version}";

  buildInputs = [ python ] ++ (with pythonPackages; [ numpy ]);

  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=${CheckMATE}/lib
    unpack () {
      tar xvzf ${CheckMATE}/share/CheckMATE-${version}/CheckMATE-${version}.tar.gz
    }
    export -f unpack
  '';
}
