{ config, pkgs, ... }:

{
  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";

  programs.fish = {
    enable = true;

    loginShellInit = ''
      set -gx SHELL ${pkgs.fish}/bin/fish
    '';

    interactiveShellInit = ''
      set fish_greeting

      alias ls 'eza -a -l --icons --group-directories-first'
      alias clear "printf '\033[2J\033[3J\033[1;1H'"
      alias grep 'grep --color=auto'
      alias nix-shell='nix-shell --run fish'
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "❯";
        error_symbol = "✗";
      };
    };
  };

  home.packages = with pkgs; [
    starship
  ];
}
