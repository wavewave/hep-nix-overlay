{ pkgs, evchain }:

let version = "0.999";
    hsEnvEvchain = with (pkgs // pkgs.haskellPackages); ghcWithPackages (self : [ evchain ]);
in pkgs.myEnvFun { 
  name = "evchain-${version}";
  buildInputs = with pkgs; [ hsEnvEvchain ];
  extraCmds = ''
    export NIX_STORE=$NIX_STORE
  '';
}

