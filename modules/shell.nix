{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fish
    starship
  ];

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
      alias u='sudo nix flake update --flake'
      alias s='sudo nixos-rebuild switch --impure --flake'
      alias b='sudo nixos-rebuild boot --impure --flake'
      alias t='sudo nixos-rebuild test --impure --flake'
      alias c='sudo nix-collect-garbage -d'
      alias d='nix-collect-garbage -d'
    '';
  };

  # 
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      # format = ''
      #   $username $localip $shlvl $singularity $kubernetes $directory $vcsh $fossil_branch $fossil_metrics $git_branch $git_commit $git_state $git_metrics $git_status $hg_branch $hg_state $pijul_channel $docker_context $package $c $cmake $cobol $daml $dart $deno $dotnet $elixir $elm $erlang $fennel $fortran $gleam $golang $guix_shell $haskell $haxe $helm $java $julia $kotlin $gradle $lua $nim $nodejs $ocaml $opa $perl $php $pulumi $purescript $python $quarto $raku $rlang $red $ruby $rust $scala $solidity $swift $terraform $typst $vlang $vagrant $zig $buf $nix_shell $conda $meson $spack $memory_usage $aws $gcloud $openstack $azure $nats $direnv $env_var $mise $crystal $custom $sudo $cmd_duration $line_break $jobs $battery $time $status $os $container $netns $shell
      #          $character
      # '';

      username = {
        show_always = true;
        format = "[$user ]($style)";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[✘](bold red)";
      };

      os.disabled = false;
    };

    presets = [
      "nerd-font-symbols"
    ];
  };
}
