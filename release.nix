{ nixpkgs, hepNixOverlay }: 

let pkgs_linux64 = import nixpkgs { system = "x86_64-linux"; };
    pkgs_darwin64 = import nixpkgs { system = "x86_64-darwin"; };

    heppkgs_linux64 = import hepNixOverlay { inherit pkgs_linux64; };
    heppkgs_darwin64 = import hepNixOverlay { inherit pkgs_darwin64; }; 
    #systems = [ "x86_64-linux" ]; 
    jobs = heppkgs_darwin64; #{ HepMC = heppkgs.HepMC; }; 
in jobs
