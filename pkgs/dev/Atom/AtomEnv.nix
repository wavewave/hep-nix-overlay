{ pkgs, FastJet, root5min, HepMC, libyamlcppPIC, cython0192, YODA, AtomDev }: 

#AtomDev 

let pythonFullWithCython = pkgs.pythonFull.override { 
                             extraLibs = [ cython0192 ]; 
                           };   
in 
pkgs.myEnvFun { 
  name = "Atom-dev";
  buildInputs = with pkgs; [ 
    cmake root5min HepMC gsl FastJet pkgconfig libyamlcppPIC 
    pythonFullWithCython boost YODA gtest
    stdenv
    pythonPackages.virtualenv
    AtomDev
    #pythonPackages.ipython
  ]; 
  
  extraCmds = ''
    export envgsl=${pkgs.gsl}
    export envFastJet=${FastJet}
    export envROOT5=${root5min} 
    export envBoost=${pkgs.boost}
    export envHepMC=${HepMC}
    export envYamlCPP=${libyamlcppPIC}
    export envYODA=${YODA}
    export envgtest=${pkgs.gtest}
    export envcython=${cython0192}
    export NIX_DONT_SET_RPATH="1"
  ''; 
  #extraCmds = with pkgs; if(stdenv.isDarwin) then ''
  #  source ${AtomDev}/bin/atomenv.sh
  #  source ${root5}/bin/thisroot.sh
  #  export DYLD_LIBRARY_PATH=${stdenv.gcc.gcc}/lib:${AtomDev}/lib:${boost}/lib:$DYLD_LIBRARY_PATH
  #''
  #  else ''
  #  source ${AtomDev}/bin/atomenv.sh
  #  source ${root5}/bin/thisroot.sh
  #  export LD_LIBRARY_PATH=
  #'';
}



