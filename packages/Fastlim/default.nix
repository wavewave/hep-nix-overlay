{ stdenv, fetchurl, python }:

stdenv.mkDerivation { 
  name = "Fastlim"; 
  version = "0.1";

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
    mkdir -p $out/share/Fastlim 
    cp -a $sourceRoot $out/share/Fastlim/1.0
 
  '';

  meta = { 

  };

}
