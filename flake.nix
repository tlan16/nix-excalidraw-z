{
  description = "Nix package for ExcalidrawZ — Excalidraw app for macOS, powered by SwiftUI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.callPackage ./package.nix {};

    apps.${system}.default = {
      type = "app";
      program = "${self.packages.${system}.default}/Applications/ExcalidrawZ.app/Contents/MacOS/ExcalidrawZ";
    };
  };
}
