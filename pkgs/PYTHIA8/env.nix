{ pkgs, PYTHIA8, FastJet, LHAPDF6 }:

let pythia8srcunpacked = import ./src-unpacked.nix { PYTHIA8-src = PYTHIA8.src; stdenv = pkgs.stdenv; };
    version = PYTHIA8.version;
in pkgs.myEnvFun rec {
  name = "PYTHIA8-${version}";
  buildInputs = with pkgs; [ PYTHIA8 FastJet LHAPDF6 ];

  extraCmds = with pkgs; ''
    export PYTHIA8LOCATION=${PYTHIA8}
    export FASTJETLOCATION=${FastJet}
    export LHAPDFLOCATION=${LHAPDF6}/lib
    export LHAPDFLIBNAME="-lLHAPDF"
    export PYTHIA8=${PYTHIA8}
    export PYTHIA8DATA=${PYTHIA8}/xmldoc
    unpack () {
      mkdir pythia8examples
      cp -a ${pythia8srcunpacked}/examples pythia8examples
      cp -a ${pythia8srcunpacked}/rootexamples pythia8examples
      chmod -R u+w pythia8examples
    }
    export -f unpack
  '';
}

#      echo "${pythia8srcunpacked}"
# writeScript
    #export LD_LIBRARY_PATH=${LHAPDF}/lib
    #export DYLD_LIBRARY_PATH=${LHAPDF}/lib
