{ pkgs, pipeline-eventgen }:

let version = pipeline-eventgen.version;
    hsenv = with (pkgs // pkgs.haskellPackages); ghcWithPackages (self : [ pipeline-eventgen ]);
in pkgs.myEnvFun { 
  name = "pipeline-eventgen-${version}";
  buildInputs = with pkgs; [ hsenv stdenv pythonFull ];
  extraCmds = ''
    $(grep export ${hsenv.outPath}/bin/ghc)
    export NIX_STORE=$NIX_STORE
  '';
}

