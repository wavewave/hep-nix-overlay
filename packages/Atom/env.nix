{ pkgs, Atom, root5 }:
 
let version="0.1";
in pkgs.myEnvFun { 
  name = "Atom-${version}";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    root5
    boost
    stdenv
    pythonPackages.ipython
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${Atom}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export LD_LIBRARY_PATH=
  '';
}
