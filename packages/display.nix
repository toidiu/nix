{ config, lib, pkgs, ... }:
{
  environment.profileRelativeEnvVars.XCURSOR_PATH = [ "/share/icons" ];

  environment.systemPackages = with pkgs; [
    adapta-gtk-theme
    autorandr
    dmenu
    gnome_themes_standard
    gtk-engine-murrine
    playerctl
    xlibs.xmodmap
    xorg.xbacklight
  ];

  services.xserver = {
    enable = true;
    autorun = true;
    displayManager.lightdm.enable = true;
  };

  services.autorandr = {
    enable = true;
  };

  services.gnome3.gnome-keyring.enable = true;
}
