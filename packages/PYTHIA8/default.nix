{ stdenv, fetchurl }:
 
stdenv.mkDerivation rec { 
  name = "PYTHIA8-${version}"; 
  version = "180";
  src = fetchurl { 
    url = "http://home.thep.lu.se/~torbjorn/pythia8/pythia8180.tgz";
    sha256 = "1w1x0g14h8pj03gzkbfa6yi6cl3mavgbnv9s6dg07265pppycg3w";
  };
  buildInputs = [ ];
  #configureFlags = "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";
}
