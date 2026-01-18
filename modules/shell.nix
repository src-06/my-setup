{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fish
    starship
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      alias ls 'eza -a -l --icons --group-directories-first'
      alias clear "printf '\033[2J\033[3J\033[1;1H'"
      alias grep 'grep --color=auto'

      alias u='sudo nix flake update --flake'
      alias s='sudo nixos-rebuild switch --impure --flake'
      alias b='sudo nixos-rebuild boot --impure --flake'
      alias t='sudo nixos-rebuild test --impure --flake'
      alias g='sudo nix-collect-garbage -d'
    '';
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = ''
        [╭──────────▶](blue bold) $directory$nix_shell
        [│](blue bold) $os$username$cmd_duration$git_branch$git_commit$git_state$git_metrics$git_status$c$cpp$php$nodejs$bun$package
        [╰╴$character](blue bold)'';

      username = {
        show_always = true;
        format = "[$user ]($style)";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[✘](bold red)";
      };

      os.disabled = false;

      cmd_duration = {
        min_time = 0;
        format = "[ $duration](bold) ";
      };
    };

    presets = [
      "nerd-font-symbols"
    ];
  };
}
