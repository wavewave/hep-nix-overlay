{ pkgs, Atom, root5, HepMC, YODA, FastJet }:
 
pkgs.myEnvFun { 
  name = "Atom-${Atom.version}";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    root5
    boost boost.dev boost.lib
    stdenv
    pythonPackages.ipython
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
  '';
}

    #export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${Atom}/lib:${boost}/lib:${HepMC}/lib:${FastJet}/lib:${YODA}/lib:${root5}/lib:$DYLD_LIBRARY_PATH
    #export LD_LIBRARY_PATH=${Atom}/lib:${boost}/lib:${HepMC}/lib:${FastJet}/lib:${YODA}/lib:${root5}/lib:$LD_LIBRARY_PATH
