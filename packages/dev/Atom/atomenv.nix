{ pkgs, AtomDev }:
 
pkgs.myEnvFun { 
  name = "atom-dev";
  buildInputs = with pkgs; [
    pythonFull 
    AtomDev
    boost
    stdenv
  ];
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${AtomDev}/bin/atomenv.sh
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${AtomDev}/bin/atomenv.sh
    export LD_LIBRARY_PATH=
  '';
}
