{ pkgs, evchain, MadGraph5_aMCatNLO }:

let version = evchain.version;
    madversion = MadGraph5_aMCatNLO.version;
    pythonMG5aMC = pkgs.pythonFull.override { };
    hsEnvEvchain = with (pkgs // pkgs.haskellPackages); ghcWithPackages (self : [ evchain ]);
in pkgs.myEnvFun { 
  name = "evchain-${version}";
  buildInputs = with pkgs; [ hsEnvEvchain pythonMG5aMC stdenv ];
  extraCmds = ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    unpack () { 
      tar xvzf ${MadGraph5_aMCatNLO}/share/MadGraph5_aMCatNLO-${madversion}/MadGraph5_aMCatNLO-${madversion}.tar.gz; 
      #chmod -R u+w fastlim-1.0; 
    }
    export -f unpack 
    export NIX_STORE=$NIX_STORE
  '';
}

