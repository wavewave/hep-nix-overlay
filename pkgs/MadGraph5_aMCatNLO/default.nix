{ stdenv, fetchurl, coreutils, perl, python, pythia-pgs, PYTHIA8 }:
 
stdenv.mkDerivation rec { 
  name = "MadGraph5_aMCatNLO"; 
  version = "2.2.3";
  src = fetchurl { 
    url = "http://ianwookim.org/public/MG5_aMC/MG5_aMC_v2.2.3.tar.gz";
    sha256 = "16aw4r0b511np8nbhgcygjkrc7fgn5cybvkh4yrj4fr1s115ki1x";
  };
  buildInputs = [ ];

  patches = [ ./configuration_fix.patch ];
  
  pythiapgs="${pythia-pgs}/share/pythia-pgs";
  pythia8="${PYTHIA8}"; 
  
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
