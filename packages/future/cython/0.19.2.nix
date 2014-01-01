{ stdenv, fetchurl, python, pkgconfig }:

stdenv.mkDerivation {
  name = "cython-0.19.2";

  src = fetchurl {
    url = "https://pypi.python.org/packages/source/C/Cython/Cython-0.19.2.tar.gz";
    sha256 = "0j1c8gvac4sqg5rggklajcv5iz3ijzzdw6rcrp5sj8qfsh5mpdf5";
  };

  buildPhase = "python setup.py build --build-base $out";

  installPhase = "python setup.py install --prefix=$out";

  buildInputs = [ python pkgconfig ];

  meta = {
    description = "An interpreter to help writing C extensions for Python";
    platforms = stdenv.lib.platforms.all;
  };
}
