{ pkgs, ... }:

{
  users.users."src-06" = {
    isNormalUser = true;
    home = "/home/src-06";
    description = "Gotthard Leo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  users.users.root = {
    shell = pkgs.fish;
  };
}
