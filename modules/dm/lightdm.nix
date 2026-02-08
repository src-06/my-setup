{ pkgs, ... }:

let
  Imouto = pkgs.stdenv.mkDerivation {
    name = "Imouto";
    src = ../../customs/cursors/Imouto;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/icons/Imouto
      cp -r . $out/share/icons/Imouto
    '';
  };
  VioletEvergardenBackground = pkgs.stdenv.mkDerivation {
    name = "violet-evergarden-background";
    src = ../../customs/grub-theme/violet-evergarden/background.png;
    dontUnpack = true;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/backgrounds
      cp -r $src $out/share/backgrounds/background.png
    '';
  };
in
{
  environment.variables = {
    XCURSOR_THEME = "Imouto";
    XCURSOR_SIZE = "24";
  };

  services.xserver.displayManager.lightdm = {
    enable = true;

    greeters.slick = {
      enable = true;

      font = {
        name = "Inter Nerd Font 11";
        package = pkgs.inter-nerdfont;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      cursorTheme = {
        name = "Imouto";
        package = Imouto;
      };

      # draw-user-backgrounds = true;
    };

    background = "${VioletEvergardenBackground}/share/backgrounds/background.png";
  };
}
