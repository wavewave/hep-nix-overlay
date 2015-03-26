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
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${Atom}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
  ''
    else ''
    source ${Atom}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
  '';
}


