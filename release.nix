{ nixpkgs }: # , hepNixOverlay }: 

let pkgs = import nixpkgs { system = "x86_64-linux"; };
    #heppkgs = import hepNixOverlay ; 
    systems = [ "x86_64-linux" ]; 
    jobs = { hello = pkgs.hello; }; 
in jobs 