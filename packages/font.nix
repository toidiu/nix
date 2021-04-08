{ config, lib, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      source-code-pro
      source-sans-pro
      source-serif-pro
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };
}
