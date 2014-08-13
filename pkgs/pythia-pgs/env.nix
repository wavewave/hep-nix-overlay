{ pkgs, pythia-pgs }:

let version = pythia-pgs.version;
in pkgs.myEnvFun rec { 
  name = "pythia-pgs-${version}";
 
  buildInputs = with pkgs; [pythia-pgs];

  extraCmds = with pkgs; ''
    export PATH=${pythia-pgs}/share/pythia-pgs/src:${pythia-pgs}/share/pythia-pgs/libraries/PGS4/examples:$PATH
  ''; 
  
}
