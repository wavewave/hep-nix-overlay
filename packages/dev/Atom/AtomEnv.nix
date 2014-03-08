{ pkgs, root5 }:
 
pkgs.myEnvFun { 
  name = "Atom-dev";
  buildInputs = with pkgs; [
    pythonFull
    root5
    boost
    stdenv
    pythonPackages.ipython
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${root5}/bin/thisroot.sh

  ''
    else ''
    source ${root5}/bin/thisroot.sh
    export LD_LIBRARY_PATH=
  '';
}


    #export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH

    #source ${AtomDev}/bin/atomenv.sh
