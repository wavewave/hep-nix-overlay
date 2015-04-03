{ pkgs }:

with pkgs; 

stdenv.mkDerivation rec { 
  name = "FeynRules"; 
  version = "2.0";
  src = fetchurl { 
    url = "http://ianwookim.org/public/FeynRules/FeynRules_v2.0.tar.gz";
    sha256 = "1i6swmap7wx0qpxh7m6jcc52py6p3grxm924vv118mz1wz3qdknq";
  };

  unpackPhase = ''
    mkdir -p FeynRules-${version}
    tar zxvf $src -C FeynRules-${version}
  '';
  
  buildPhase = ''
    cd FeynRules-${version}
    cd ..
  '';


  installPhase = ''
    tar cvzf FeynRules-${version}.tar.gz FeynRules-${version}
    mkdir -p $out/share/FeynRules-${version}
    cp -a FeynRules-${version}.tar.gz $out/share/FeynRules-${version}
  '';

  meta = {
  };
}
