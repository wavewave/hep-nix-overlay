{ pkgs, AtomDev, ROOT, HepMC, YODA, FastJet }:

#{ pkgs
#, AtomDev
#, ROOT
#, YODA 
#, libyamlcppPIC
#}:

pkgs.myEnvFun { 
  name = "Atom-dev";
  buildInputs = with pkgs; [
    pythonFull
    AtomDev
    ROOT
    boost boost.dev boost.lib
    YODA
    stdenv
    pythonPackages.numpy
    pythonPackages.matplotlib
#    pythonPackages.recursivePthLoader

#    pythonFull
#    ncurses
#    YODA
#    libyamlcppPIC
#    AtomDev
#    ROOT
#    boost
#    cmake
#    eigen
#    pkgconfig
#    gfortran
#    binutils
  ] ++ (if stdenv.isDarwin then [darwin.sw_vers] else []);

  
  extraCmds = with pkgs; if(stdenv.isDarwin) then ''
    source ${AtomDev}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${AtomDev}/lib/python2.7/site-packages:${ROOT}/lib:$PYTHONPATH
    export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  ''
    else ''
    source ${AtomDev}/bin/atomenv.sh
    source ${ROOT}/bin/thisroot.sh
    export PYTHONPATH=${YODA}/lib/python2.7/site-packages:${AtomDev}/lib/python2.7/site-packages:${ROOT}/lib:$PYTHONPATH
    export LD_LIBRARY_PATH=${AtomDev}/lib:$LD_LIBRARY_PATH
  '';

}


