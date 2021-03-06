{ pkgs, AtomDev, ROOT, YODA }:


let hsenv = with (pkgs // pkgs.haskellPackages); ghcWithPackages 
                    (self : [ cabalInstall ]);

    pythonFullWithYODA = pkgs.pythonFull.override { 
                           extraLibs = [ YODA ]; 
                         };
in  
pkgs.myEnvFun { 
  name = "Atom-dev-haskell";
  buildInputs = with pkgs; [
    hsenv
    pythonFullWithYODA
    AtomDev
    ROOT
    boost
    stdenv
    pythonPackages.recursivePthLoader
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    $(grep export ${hsenv.outPath}/bin/ghc)
    export NIX_STORE=$NIX_STORE
    source ${AtomDev}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${AtomDev}/lib/python2.7/site-packages:${ROOT}/lib:$PYTHONPATH
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    $(grep export ${hsenv.outPath}/bin/ghc)
    export NIX_STORE=$NIX_STORE
    source ${AtomDev}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${AtomDev}/lib/python2.7/site-packages:${ROOT}/lib:$PYTHONPATH
    export LD_LIBRARY_PATH=${AtomDev}/lib:$LD_LIBRARY_PATH
  '';

}

