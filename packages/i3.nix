{ config, lib, pkgs, ... }:
let configFile = pkgs.writeText "i3-config" (builtins.readFile ./i3.conf);

in
{
  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = configFile;
      extraSessionCommands = ''
        eval $(gnome-keyring-daemon --daemonize)
        export SSH_AUTH_SOCK
      '';
    };
  };
}
