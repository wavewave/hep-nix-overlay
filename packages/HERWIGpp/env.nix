{ pkgs, HERWIGpp }:

pkgs.myEnvFun { 
  name = "Herwig++-${HERWIGpp.version}";
  buildInputs = with pkgs; [
    HERWIGpp
  ]; 
}
