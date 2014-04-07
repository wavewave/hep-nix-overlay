{ pkgs, AtomDev, root5 }:
 
pkgs.myEnvFun { 
  name = "Atom-dev";
  buildInputs = with pkgs; [
    pythonFull
    AtomDev
    root5
    boost
    stdenv
    pythonPackages.ipython
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${AtomDev}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${AtomDev}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export LD_LIBRARY_PATH=
  '';
}

