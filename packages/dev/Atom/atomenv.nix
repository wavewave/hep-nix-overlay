{ pkgs, root5 }:
 
pkgs.myEnvFun { 
  name = "atom-dev";
  buildInputs = with pkgs; [
    pythonFull
    root5 
    boost
    stdenv
  ];
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${root5}/bin/thisroot.sh
    #export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${boost}/lib:$DYLD_LIBRARY_PATH

  ''
    else ''
    source ${root5}/bin/thisroot.sh
    export LD_LIBRARY_PATH=
  '';
}

    #source ${AtomDev}/bin/atomenv.sh

    #source ${AtomDev}/bin/atomenv.sh
