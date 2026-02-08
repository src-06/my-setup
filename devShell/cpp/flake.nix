{
  description = "C/C++ Development Environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell.${system} = pkgs.mkShell {
        name = "C/C++";
        packages = with pkgs; [
          clang
          clang-tools
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
