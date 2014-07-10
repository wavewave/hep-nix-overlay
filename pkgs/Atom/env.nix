{ pkgs, Atom, root5, HepMC, YODA }:
 
pkgs.myEnvFun { 
  name = "Atom-${Atom.version}";
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
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${Atom}/lib:${boost}/lib:${HepMC}/lib:${YODA}/lib:${root5}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export LD_LIBRARY_PATH=${Atom}/lib:${boost}/lib:${HepMC}/lib:${YODA}/lib:${root5}/lib:$LD_LIBRARY_PATH
  '';
}
