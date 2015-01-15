{ stdenv, fetchurl, pkgs }:

with pkgs; 

stdenv.mkDerivation rec { 
  name = "cernlib-${version}"; 
  version = "2006";
  src = fetchurl { 
    url = "http://cernlib.web.cern.ch/cernlib/download/2006_source/tar/2006_src.tar.gz"; 
    sha256 = "0awla1rl96z82br7slcmg8ks1d2a7slk6dj79ywb871j2ksi3fky";
  };

  sourceRoot = "2006";
  buildInputs = [ gfortran xlibs.imake xlibs.makedepend gnumake ];

  patches = [ ./replaceGMake.patch ./gfortranoption.patch ] ; 

  buildPhase = ''
    #mkdir lib
    cd src
    export CVSCOSRC=$NIX_BUILD_TOP/${sourceRoot}/src
    $CVSCOSRC/config/imake_boot
    (make tree || exit 0) 
    pushd packlib/kuip/programs/kuipc
    make 
    #make install.bin
    popd
    make
    cd packlib
    make
    #make install.bin
    cd ../pawlib
    make
    #make install.bin
    cd ../graflib
    make
    #make install.bin
    cd ../script
    make
    #make install.bin
  '';

  #installPhase = ''
  #  cd .. 
  #  mkdir -p $out/share
  #  cp -a pythia-pgs $out/share/pythia-pgs
  #'';

  meta = {
  };
}
