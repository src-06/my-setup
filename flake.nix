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
    {
      nixpkgs,
      home-manager,
      noctalia-shell,
      ...
    }:
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
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        modules = [
          ./modules/hardware.nix
          ./modules/system.nix
          ./modules/shell.nix
          ./modules/users.nix
          ./modules/fonts.nix
          ./modules/de/plasma.nix
          ./modules/wm/niri.nix
          ./modules/developments/rdbms.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bak";
              users.leo = {
                imports = [
                  ./home.nix

                  noctalia-shell.homeModules.default
                  ./modules/wm/noctalia.nix

                  ./modules/developments/bun.nix
                  ./modules/developments/cpp.nix
                  ./modules/developments/nodejs.nix
                  ./modules/developments/php.nix
                  ./modules/developments/python.nix
                ];
              };
            };
          }
        ];
      };
    };
}
