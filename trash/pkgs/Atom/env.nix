{ pkgs, Atom, ROOT, HepMC, YODA, FastJet }:

pkgs.myEnvFun { 
  name = "Atom-${Atom.version}-min";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    ROOT
    boost boost.dev boost.lib
    YODA
    stdenv
    pythonPackages.numpy
    pythonPackages.matplotlib
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
    export LD_LIBRARY_PATH=${Atom}/lib:${HepMC}/lib:${YODA}/lib:${boost.lib}/lib:$LD_LIBRARY_PATH
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${Atom}/lib/python2.7/site-packages:${ROOT}/lib:$PYTHONPATH
  '';
}


