{ stdenv, fetchurl, python }:

stdenv.mkDerivation rec { 
  name = "Fastlim-${version}"; 
  version = "1.0";

  src = fetchurl { 
    url = "http://fastlim.web.cern.ch/fastlim/downloads/fastlim-1.0.tar.gz";
    sha256 = "1s3fk38d2yzs7lgapdr2zf631lsj12gl424zbcw2xacmfdzfda14";
  };
  enableParallelBuilding = true; 

  buildPhase = '' 
    for i in *.py; do 
      substituteInPlace $i --replace "/usr/bin/env python" "${python}/bin/python"
    done
    pushd interpolation
    for i in *.py; do 
      substituteInPlace $i --replace "/usr/bin/env python" "${python}/bin/python"
    done 
    popd    
  '';

  installPhase = ''
    cd ..
    tar cvzf Fastlim-${version}.tar.gz $sourceRoot
    mkdir -p $out/share/Fastlim-${version}
    cp Fastlim-${version}.tar.gz $out/share/Fastlim-${version}
  '';

  meta = { 

  };

}
