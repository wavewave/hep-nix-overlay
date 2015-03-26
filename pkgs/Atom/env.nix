{ pkgs, Atom, ROOT, HepMC, YODA, FastJet }:
 
pkgs.myEnvFun { 
  name = "Atom-${Atom.version}";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    ROOT
    boost boost.dev boost.lib
    stdenv
    pythonPackages.ipython
  ] ++ (if stdenv.isDarwin then [darwin.sw_vers] else []);
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${Atom}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
    export DYLD_LIBRARY_PATH=${Atom}/lib:${HepMC}/lib:$DYLD_LIBRARY_PATH

  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
  '';
}


