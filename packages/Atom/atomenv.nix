{ pkgs, Atom }:
 
pkgs.myEnvFun { 
  name = "atom";
  buildInputs = with pkgs; [
    pythonFull 
    Atom
    boost
    stdenv
  ];
  extraCmds = with pkgs; ''
    source ${Atom}/bin/atomenv.sh
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${Atom}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  '';
}
