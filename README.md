# NixOS Minimal Theme
A minimalistic AF NixOS only setup GRUB Theme.

# Screenshot
TODO

# Install

First, add this repo to your flake's inputs:
```nix 
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-minimal-grub-theme.url = "github:aguirre-matteo/nixos-minimal-grub-theme"; # <---
  };
```

Then, make sure you pass your flake's inputs as special special args in your NixOS config:
```nix
  outputs = { self, nixpkgs, home-manager, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs };
      modules = [
        # ...
      ];
    };
  };
}
```

And finally, set this somewhere in your NixOS config:
```nix
{ inputs, pkgs, ... }:
let
  grub-theme = pkgs.callPackage inputs.nixos-minimal-grub-theme.package { };
in
{
  boot.loader.grub = {
    theme = grub-theme; # <--- This sets the GRUB theme
    splashImage = "${grub-theme}/background.png"; # <--- This ensures that NixOS' default splash does not show when booting
  };
}
```
