{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.follows = "nixos-cosmic/nixpkgs-stable";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nixos-cosmic,
    }:
              let cosmic-cache = import ./nix/nixos-cosmic-cache.nix;
              in
    ### packages pack to install as profiles on any nix machine
    (flake-utils.lib.eachDefaultSystem (
      system:
      import ./nix/outputs.nix {
        pkgs = nixpkgs.legacyPackages.${system};
        inherit system;
      }
    ))
    ### nixos configurations for all my nixos machines
    // {
      nixosConfigurations = (
        builtins.mapAttrs (
          host: system:
          nixpkgs.lib.nixosSystem {
            inherit system;
            pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
            modules = [
	          (import ./nix/nixos-cosmic-cache.nix)
              nixos-cosmic.nixosModules.default
              ./nix/machines/${host}/configuration.nix
            ];
          }
        ) (import ./nix/machines.nix)
      );
    };
}
