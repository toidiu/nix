{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    sublime3
    vimHugeX
    wakatime
    xclip
  ];
}
