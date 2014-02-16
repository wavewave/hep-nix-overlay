{ nixpkgs, hepNixOverlay }: 

let pkgs = import nixpkgs { system = "x86_64-linux"; };
    heppkgs = import hepNixOverlay { inherit pkgs }; 
    systems = [ "x86_64-linux" ]; 
    jobs = { hello = heppkgs.HepMC; }; 
in jobs
