{ pkgs, jobqueue-client, pythia-pgs, MadGraph5_aMCatNLO }:

let version = jobqueue-client.version;
    mad5ver = MadGraph5_aMCatNLO.version;
in pkgs.myEnvFun rec { 
  name = "jobqueue-client-${version}";
 
  buildInputs = with pkgs; [
    pythonFull
    pkgs.gfortran
    pkgs.ghostscript
    jobqueue-client
    stdenv

  ];

  #  substituteAll
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=

    unpack () { 
      tar xvzf ${MadGraph5_aMCatNLO}/share/MadGraph5_aMCatNLO-${mad5ver}/MadGraph5_aMCatNLO-${mad5ver}.tar.gz
      mkdir mc
      mkdir sandbox
      makeenv="export MG5_PATH='\$PWD/MG5_aMC_v2_1_2'; export MG5_SANDBOXPATH='\$PWD/sandbox'; export MG5_MCPATH='\$PWD/mc'"
      eval "\$makeenv"

      cp "${jobqueue-client}/share/${stdenv.system}-${pkgs.haskellPackages.ghc.ghc.name}/${jobqueue-client.pname}-${jobqueue-client.version}/template/config.txt.sample" config.txt

      chmod u+w config.txt

      eval 'sed -i -e s#@MG5_MCPATH@#"\$(echo \$MG5_MCPATH)"#g config.txt'
      eval 'sed -i -e s#@MG5_SANDBOXPATH@#"\$(echo \$MG5_SANDBOXPATH)"#g config.txt'
      eval 'sed -i -e s#@MG5_PATH@#"\$(echo \$MG5_PATH)"#g config.txt'


    }
    export -f unpack 
  '';
}

# ${pkgs.substituteAll}/bin/