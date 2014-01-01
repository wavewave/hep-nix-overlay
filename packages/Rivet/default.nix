{ stdenv, fetchurl, libtool, m4, automake, autoconf, gsl, boost, HepMC, FastJet, libyamlcppPIC, python, swig}:
 
stdenv.mkDerivation { 
  name = "Rivet"; 
  version = "1.8.1";

  src = fetchurl { 
    url = "http://www.hepforge.org/archive/rivet/Rivet-1.8.1.tar.gz";
    sha256 = "1gn0dlhvxfnv5wm2r5f311j757x4l8lr51jhhpgv74xlks020vwc";
  };
  patches = [ ./yamlcpp.patch ];

  buildInputs = [ libtool m4 automake autoconf gsl boost HepMC FastJet 
                  libyamlcppPIC python swig];
  
  preConfigure = ''
#OS=`uname`
#if [ $OS = "Darwin" ]; then
#  glibtoolize --copy
#  OSname=`uname -s`
#else
#  libtoolize --copy
#  OSname=`uname -o`
#fi
#aclocal
#m4dir=`aclocal --print-ac-dir`
#if [ -f $m4dir/libtool.m4 ]; then
#   cat $m4dir/libtool.m4 >> aclocal.m4
#fi
#autoheader
#automake --add-missing --copy
#autoconf
autoreconf
'';



  configureFlags = "CFLAGS=-fPIC CXXFLAGS=-fPIC --with-hepmc=${HepMC} --with-fastjet=${FastJet} --with-yaml_cpp=${libyamlcppPIC} ";

  meta = { 
    priority  = "10";
  };
}
