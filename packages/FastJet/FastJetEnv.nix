{ pkgs, FastJet }:

pkgs.myEnvFun rec { 
  name = "FastJet-${FastJet.version}";
 
  buildInputs = with pkgs; [
    FastJet
    stdenv
  ];
}
