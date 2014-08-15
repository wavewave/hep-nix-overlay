{ stdenv, fetchurl, coreutils, perl, python, pythia-pgs, PYTHIA8 }:
 
stdenv.mkDerivation rec { 
  name = "MadGraph5_aMCatNLO"; 
  version = "2.1.2";
  src = fetchurl { 
    url = "http://ianwookim.org/public/MG5_aMC/MG5_aMC_v2.1.2.tar.gz";
    #url = "https://launchpad.net/mg5amcnlo/2.0/2.1.0/+download/MG5_aMC_v2.1.2.tar.gz";
    sha256 = "0agmbm8mnn2n35pkv8fa7h9wy2jxs12hzcfpklpxdhksm155cli9";
  };
  buildInputs = [ ];

  patches = [ ./configuration_fix.patch ];
  
  pythiapgs="${pythia-pgs}/share/pythia-pgs";
  pythia8="${PYTHIA8}"; # PYTHIA8-src-unpacked
  
  configurePhase = ''
    substituteInPlace input/mg5_configuration.txt --subst-var pythiapgs
    substituteInPlace input/mg5_configuration.txt --subst-var pythia8
  '';

  buildPhase = ''
    find . -type f -name \* | xargs sed -i "s,/usr/bin/env,${coreutils}/bin/env,"
    find . -type f -name \* | xargs sed -i "s,/usr/bin/env,${coreutils}/bin/env,"
    find . -type f -name \* | xargs sed -i "s,/usr/bin/perl,${perl}/bin/perl,"
    find . -type f -name \* | xargs sed -i "s,/usr/bin/python,${perl}/bin/python,"

  ''; 

  installPhase = ''
    cd ..
    tar cvzf MadGraph5_aMCatNLO-${version}.tar.gz $sourceRoot
    mkdir -p $out/share/MadGraph5_aMCatNLO-${version}
    cp MadGraph5_aMCatNLO-${version}.tar.gz $out/share/MadGraph5_aMCatNLO-${version}
  '';

  meta = {
  };
}
