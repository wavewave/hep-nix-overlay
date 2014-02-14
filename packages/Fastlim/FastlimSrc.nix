{ stdenv, fetchurl }:

fetchurl { 
    url = "http://fastlim.web.cern.ch/fastlim/downloads/fastlim-1.0.tar.gz";
    sha256 = "1s3fk38d2yzs7lgapdr2zf631lsj12gl424zbcw2xacmfdzfda14";
}
