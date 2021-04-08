{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    gnupg1compat
    pass
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
