{
  description = "My arch + nix home manager configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (final: prev: {
          mkFishShell = args:
            prev.mkShell (args // {
              buildInputs = (args.buildInputs or []) ++ [ prev.fish ];
              shellHook = (args.shellHook or "") + ''
                exec ${prev.fish}/bin/fish
              '';
            });
        })
      ];
    };
  in {
    homeConfigurations.leo = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
      ];
    };

    devShells.${system} = {
      default = pkgs.mkFishShell {
        name = "Default";
        shellHook = ''
          echo "Default development (nothing add nix pkgs)..."
        '';
      };

      nodejs = pkgs.mkFishShell {
        name = "Node JS";
        buildInputs = with pkgs; [
          nodejs_24
          pnpm
        ];
      };

      bunjs = pkgs.mkFishShell {
        name = "Bun JS";
        buildInputs = with pkgs; [
          bun
        ];
      };

      cpp = pkgs.mkFishShell {
        name = "C/C++";
        buildInputs = with pkgs; [
          gcc
        ];
      };

      python = pkgs.mkFishShell {
        name = "Python";
        buildInputs = with pkgs; [
          python3
        ];
      };

      php = pkgs.mkFishShell {
        name = "PHP";
        buildInputs = with pkgs; [
          php83
          php83Packages.composer
          nodejs-slim
        ];
        shellHook = ''
          export SHELL=/run/current-system/sw/bin/fish
        '';
      };
    };
  };
}
