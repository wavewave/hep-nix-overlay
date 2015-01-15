{ nixpkgs_linux64, nixpkgs_darwin64, hepNixOverlay }: 

let pkgs_linux64 = import nixpkgs_linux64 { system = "x86_64-linux"; };
    pkgs_darwin64 = import nixpkgs_darwin64 { system = "x86_64-darwin"; config.allowUnfree = true; };

    heppkgs_linux64 = import hepNixOverlay { pkgs = pkgs_linux64; };
    heppkgs_darwin64 = import hepNixOverlay { pkgs = pkgs_darwin64; }; 
    jobs = { linux64 = heppkgs_linux64; darwin64 = heppkgs_darwin64 ; }; 
in jobs
