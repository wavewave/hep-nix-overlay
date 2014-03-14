{ stdenv, fetchurl, coreutils, perl, python }:
 
stdenv.mkDerivation rec { 
  name = "MadGraph5_aMCatNLO"; 
  version = "2.1.0";
  src = fetchurl { 
    url = "https://launchpad.net/mg5amcnlo/2.0/2.1.0/+download/MG5_aMC_v2.1.0.tar.gz";
    sha256 = "03agljvpvrb8jxnfj52ykmznv30dvw88afmd2f5g3wq3fnph167x";
  };
  buildInputs = [ ];

  #phases = [ buildPhase distPhase ];
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
