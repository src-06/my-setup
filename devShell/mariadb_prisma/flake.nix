{
  description = "MariaDB Prisma Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell.${system} = pkgs.mkShell {
        name = "MariaDB Prisma";
        packages = with pkgs; [
          (writeShellApplication {
            name = "db";
            text = builtins.readFile ./scripts/db.sh;
          })
          mariadb
          openssl
          prisma-engines_7
        ];
        shellHook = ''
          export OPENSSL_DIR=${pkgs.openssl.dev}
          export OPENSSL_LIB_DIR=${pkgs.openssl.out}/lib

          if command -v fish >/dev/null 2>&1; then
            exec fish
          elif command -v zsh >/dev/null 2>&1; then
            exec zsh
          fi
        '';
      };
    };
}
