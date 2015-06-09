{ cabal, fetchgit, HStringTemplate, either, errors, lens, pureMD5, split, dataDefault }:
let srctree = fetchgit { url = "https://github.com/wavewave/fficxx.git"; 
                         rev = "f760b67c5550b1466ee7e9259965a93d4eb82404";
                         sha256 = "5e62066c5691611ac19341087bb3f367a950d113f4c2444b332e66ebeeb559cf";
                       };  
in cabal.mkDerivation (self: {
  pname = "fficxx";
  version = "0.2.999";
  src = srctree + "/fficxx";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HStringTemplate
                   dataDefault
                   either
                   errors
                   lens
                   pureMD5
                   split
                
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/fficxx";
    description = "automatic C++ binding generation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
