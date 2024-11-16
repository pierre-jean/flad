{ pkgs, system, ... }:
let
  machines = [
    "slim"
    "metal"
  ];
in
{
  packages.default = pkgs.cowsay;
  packages.cli-base = import ./cli-base.nix { inherit pkgs; };
  packages.desktop-base = import ./desktop-base.nix { inherit pkgs; };
  # nixosConfigurations."${system}" = pkgs.lib.attrsets.attrByPath (machine: { "${machine}" = import ./nixosConfiguration.nix; });
 }
