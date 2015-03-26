{ pkgs, Atom, ROOT, HepMC, YODA, FastJet }:

pkgs.myEnvFun { 
  name = "Atom-${Atom.version}-min";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    ROOT
    boost boost.dev boost.lib
    stdenv
  ] ++ (if stdenv.isDarwin then [darwin.sw_vers] else []);
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${Atom}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
    export DYLD_LIBRARY_PATH=${Atom}/lib:${HepMC}/lib:$DYLD_LIBRARY_PATH
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${Atom}/lib/python2.7/site-packages:${ROOT}/lib:$PYTHONPATH
  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
  '';
}


#    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${Atom}/lib:${boost.lib}/lib:${HepMC}/lib:${FastJet}/lib:${YODA}/lib:${ROOT}/lib:$DYLD_LIBRARY_PATH
#    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:$PYTHONPATH 

#    export LD_LIBRARY_PATH=${Atom}/lib:${boost.lib}/lib:${HepMC}/lib:${FastJet}/lib:${YODA}/lib:${ROOT}/lib:$LD_LIBRARY_PATH
#    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:$PYTHONPATH
