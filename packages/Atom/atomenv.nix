{ pkgs, Atom, root5 }:
 
pkgs.myEnvFun { 
  name = "atom";
  buildInputs = with pkgs; [
    pythonFull
    Atom
    root5
    boost
    stdenv
  ] ++ (if (stdenv.isDarwin) then [] else [pythonPackages.ipython]); 
  
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
