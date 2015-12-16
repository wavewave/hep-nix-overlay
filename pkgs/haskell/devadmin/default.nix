{ mkDerivation, stdenv, fetchgit, mtl, filepath, fgl, time, filemanip, safe, MissingH
, HStringTemplate, parsec, configurator
, cmdargs, split, strict, text }:

mkDerivation {
  pname = "devadmin";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/devadmin.git"; 
                   rev = "850e0d1cc73bdc7242c100e38495b64ad97384a8";
                   sha256 = "480ec4eb360217b9809cb800e13e3c4093e50a6a3cb351631ac3cb99f279ed2e";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ mtl
                   filepath
                   fgl
                   time
                   filemanip
                   safe
                   MissingH
                   HStringTemplate
                   parsec
                   configurator
                   cmdargs
                   split
                   strict
                   text
                 ];
  doCheck = false;
  jailbreak = true;
  license = stdenv.lib.licenses.bsd3;
}
