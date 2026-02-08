{
  description = "MariaDB Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell.${system} = pkgs.mkShell {
        name = "MariaDB";
        packages = with pkgs; [
          (writeShellApplication {
            name = "db";
            text = builtins.readFile ./scripts/db.sh;
          })
          mariadb
        ];
        shellHook = ''
          if command -v fish >/dev/null 2>&1; then
            exec fish
          elif command -v zsh >/dev/null 2>&1; then
            exec zsh
          fi
        '';
      };
    };
}
