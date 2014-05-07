{ pkgs, Atom, root5 }:

pkgs.myEnvFun { 
  name = "Atom-${Atom.version}-min";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    root5
    boost
    stdenv
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${Atom}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export LD_LIBRARY_PATH=${Atom}/lib
  '';
}
