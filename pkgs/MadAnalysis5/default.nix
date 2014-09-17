{ stdenv, pkgs, fetchurl }:
 

pkgs.stdenv.mkDerivation rec { 
  name = "MadAnalysis5-${version}"; 
  version = "1.1.11";
  src = fetchurl { 
    url = "https://launchpad.net/madanalysis5/trunk/v1.1.11/+download/MadAnalysis5_v1.1.11.tar.gz";
    sha256 = "0qqxlndpams2cxq0qsgwaz9jchwim994ppmw9z77fllgnp0p5cd2";
  };

  preConfigure = '' 
    substituteInPlace bin/ma5 --replace /usr/bin/env ${pkgs.coreutils}/bin/env
    substituteInPlace madanalysis/system/config_checker.py --replace /usr /var/empty
    substituteInPlace madanalysis/build/setup_writer --replace /bin/sh ${pkgs.bash}/bin/bash
    substituteInPlace madanalysis/IOinterface/job_writer.py --replace /bin/sh ${pkgs.bash}/bin/bash
  ''; 

  installPhase = ''        
    cd ..
    tar cvzf MadAnalysis5-${version}.tar.gz $sourceRoot
    mkdir -p $out/share/MadAnalysis5-${version}
    cp MadAnalysis5-${version}.tar.gz $out/share/MadAnalysis5-${version}
  ''; 
}
