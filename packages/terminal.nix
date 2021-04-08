{ config, lib, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      histSize = 99999999;
    };
  };

  environment.pathsToLink = [
    "/share/zsh"
  ];
  environment.systemPackages = with pkgs; [
    alacritty
    bat
    coreutils
    curl
    exa
    fd
    fzf
    powerline-fonts
    ripgrep
    sd
    unzip
    which
    wget
    ytop
    zsh
  ];

  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";
}
