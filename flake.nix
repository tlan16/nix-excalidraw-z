{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-excalidraw-z.url = "github:tlan16/nix-excalidraw-z";
  };

  outputs = { self, nixpkgs, home-manager, nix-excalidraw-z, ... }@inputs:
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."frank.lan" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };  # <-- pass inputs here
      modules = [ ./home.nix ];
    };
  };
}
