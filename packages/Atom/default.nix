{ stdenv, fetchgit, cmake, Rivet }:
 
stdenv.mkDerivation { 
  name = "Atom"; 
  version = "0.1";
  src = fetchgit { 
    url = "git@github.com:hep-soft/Atom.git";
    rev = "41476f96e02502fe82dc43c996c877d7c8455f76";
    sha256 = "c5ea38ed2823cb2389dd752b53662300883e191d5e9bef1f0bb0da104b8ae3ad";
  };
  buildInputs = [ cmake Rivet ];
  # patches = [ ];
  # configureFlags = "";
}
