source $stdenv/setup || exit 1 

PATH=${buildDepends}/bin:$PATH

echo $PATH

tar xvf $src || exit -1

workspace="$NIX_BUILD_TOP" substituteAll HROOT.conf HROOTout.conf  || exit -1

HROOT-generate --config=HROOTout.conf || exit -1

tar cvzf HROOT-src-tree.tar.gz HROOT || exit -1

cp HROOT-src-tree.tar.gz $out || exit -1 



