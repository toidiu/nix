{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsaUtils
    pamixer
    paprefs
    pavucontrol
    pulseaudioFull
    qjackctl
    supercollider
  ];

  users.users.toidiu.extraGroups = [ "audio" ];

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
  };
}
