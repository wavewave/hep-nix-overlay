{ pkgs, AtomDev, root5, YODA }:


let pythonFullWithYODA = pkgs.pythonFull.override { 
                           extraLibs = [ YODA ]; 
                         };
in  
pkgs.myEnvFun { 
  name = "Atom-dev";
  buildInputs = with pkgs; [
    pythonFullWithYODA
    AtomDev
    root5
    boost
    stdenv
    pythonPackages.ipython
    pythonPackages.recursivePthLoader
    pythonPackages.virtualenv
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${AtomDev}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:$PYTHONPATH
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${AtomDev}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:$PYTHONPATH
    export LD_LIBRARY_PATH=
  '';

  shell= "${pkgs.bashInteractive}/bin/bash --norc $@"  ;
}

