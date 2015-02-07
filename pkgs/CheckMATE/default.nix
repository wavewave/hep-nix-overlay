{ pkgs, fetchurl, root5 }:

pkgs.stdenv.mkDerivation rec {
  name = "CheckMATE-${version}";
  version = "1.1.16";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/checkmate/CheckMATE-1.1.16.tar.gz";
    sha256 = "1hd205h7k5ri2svbm3n2v8xi1fzjg294ilpkj4i6s517nrf9fa8n";
  };
  buildInputs = [ root5 ] ++ (with pkgs; [ which tcl python pythonPackages.numpy]);
  enableParallelBuilding = true;

  installPhase = ''
    cd ..
    tar cvzf CheckMATE-${version}.tar.gz $sourceRoot
    mkdir -p $out/share/CheckMATE-${version}
    cp CheckMATE-${version}.tar.gz $out/share/CheckMATE-${version}
    mkdir -p $out/lib
    cp $sourceRoot/tools/delphes/Delphes-3.0.10X/libDelphes.so $out/lib
  '';
}
