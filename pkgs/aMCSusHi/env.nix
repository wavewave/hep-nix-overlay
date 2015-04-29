{ pkgs, LHAPDF, FeynHiggs }:

with pkgs;

myEnvFun rec { 
  name = "aMCSusHi";
  buildInputs = [ perl perlPackages.TermReadKey
                  gfortran
                  LHAPDF
                  FeynHiggs
                ];
}
  
