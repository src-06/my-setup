{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;

    packages = with pkgs; [
      corefonts
      inter-nerdfont
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
    ];
  };
}
