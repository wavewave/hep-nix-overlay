{ nixpkgs_afs, hepNixOverlay }: 

let pkgs_afs = import nixpkgs_afs { system = "x86_64-linux"; };
   
    heppkgs_afs = import hepNixOverlay { pkgs = pkgs_afs; };
   
    jobs = { afs = heppkgs_afs; }; 
in jobs
