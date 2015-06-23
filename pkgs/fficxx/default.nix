{ mkDerivation, stdenv, fetchgit, HStringTemplate, either, errors, lens, pureMD5, split, data-default }:
let srctree = fetchgit { url = "https://github.com/wavewave/fficxx.git"; 
                         rev = "f760b67c5550b1466ee7e9259965a93d4eb82404";
                         sha256 = "5e62066c5691611ac19341087bb3f367a950d113f4c2444b332e66ebeeb559cf";
                       };  
in mkDerivation {
  pname = "fficxx";
  version = "0.2.999";
  src = srctree + "/fficxx";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HStringTemplate
                   data-default
                   either
                   errors
                   lens
                   pureMD5
                   split
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.bsd3;
}
