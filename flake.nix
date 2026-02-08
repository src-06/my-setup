{
  description = "My NixOS flake configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-shell = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        modules = [
          ./modules/hardware.nix
          ./modules/system.nix
          ./modules/shell.nix
          ./modules/users.nix
          ./modules/fonts.nix
          ./modules/virtualization.nix
          ./modules/de/budgie.nix
          ./modules/de/lxqt.nix
          ./modules/dm/lightdm.nix
          ./modules/wm/niri.nix

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bak";
              users."src-06" = {
                imports = [
                  ./home.nix

                  inputs.noctalia-shell.homeModules.default
                  ./modules/qs/noctalia.nix
                ];
              };
            };
          }
        ];
      };
    };
}
