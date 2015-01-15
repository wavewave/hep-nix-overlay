{ stdenv, fetchurl, cmake, boost }:
 
stdenv.mkDerivation { 
  name = "libyaml-cpp-0.2.5"; 

  src = fetchurl { 
    url = "http://yaml-cpp.googlecode.com/files/yaml-cpp-0.2.5.tar.gz";
    sha256 = "1vyd25180xbam4na7zxg6sdpw3akf6k2jgr7j35sc2l1amlba01j";
  };
  buildInputs = [ cmake boost ];

  meta = {
    homepage = http://code.google.com/p/yaml-cpp/;
    description = "A YAML parser and emitter for C++";
    license = "MIT";
  };

}
