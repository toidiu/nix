{ config, lib, pkgs, ... }:
let
  chime = pkgs.makeDesktopItem {
    name = "chime";
    desktopName = "Chime";
    type = "Link";
    exec = "firefox";
    extraEntries = ''
      URL = "https://app.chime.aws"
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    discord
    slack
    #chime
  ];
}
