{ pkgs, MadAnalysis5, root5, FastJet, Delphes }: 

let version = MadAnalysis5.version;
in pkgs.myEnvFun rec { 
  name = "MadAnalysis5-${version}";

  buildInputs = with pkgs; [ root5 FastJet Delphes 
                             pythonFull
                             pythonPackages.numpy
                             stdenv pkgs.which 
                             pkgs.zlib
                           ];
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    unpack () { 
      tar xvzf ${MadAnalysis5}/share/MadAnalysis5-${version}/MadAnalysis5-${version}.tar.gz
    }
    export -f unpack 
  '';
}

