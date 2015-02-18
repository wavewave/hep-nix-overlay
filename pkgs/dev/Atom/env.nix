{ pkgs
, AtomDev
, root5
, YODA 
, libyamlcppPIC
}:

pkgs.myEnvFun { 
  name = "Atom-dev";
  buildInputs = with pkgs; [
    pythonFull
    ncurses
    YODA
    libyamlcppPIC
    AtomDev
    root5
    boost
    #stdenv
    pythonPackages.recursivePthLoader
    cmake
    eigen
    pkgconfig
    gfortran
    binutils
  ]; 
  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${AtomDev}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${AtomDev}/lib/python2.7/site-packages:${root5}/lib:$PYTHONPATH
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${AtomDev}/bin/atomenv.sh
    source ${root5}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${AtomDev}/lib/python2.7/site-packages:${root5}/lib:$PYTHONPATH
    export LD_LIBRARY_PATH=${AtomDev}/lib:$LD_LIBRARY_PATH
  '';

}


# ${pythonFull.modules.curses}/lib/python2.7/site-packages: