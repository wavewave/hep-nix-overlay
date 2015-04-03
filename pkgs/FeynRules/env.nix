{ pkgs, FeynRules }:

let version = FeynRules.version;
in pkgs.myEnvFun rec { 
  name = "FeynRules-${version}";

  buildInputs = with pkgs; [
  ];
  
  extraCmds = with pkgs; ''
    unpack () { 
      dir=\$(pwd)
      str=' \$Path = AppendTo[ \$Path, "'\$dir'/FeynRules-${version}"]; \$FeynRulesPath = SetDirectory[ "'\$dir'/FeynRules-${version}" ];'
      echo \$str > init.m
      tar xvzf ${FeynRules}/share/FeynRules-${version}/FeynRules-${version}.tar.gz
    }
    export -f unpack 
  '';
}




