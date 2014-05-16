{ pkgs, softsusy }:
 
pkgs.myEnvFun { 
  name = "softsusy-${softsusy.version}";
  buildInputs = with pkgs; [ softsusy ];
  
}
