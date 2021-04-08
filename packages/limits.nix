{ config, pkgs, ... }:

{
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "999999";
    }
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "999999";
    }
    {
      domain = "root";
      type = "hard";
      item = "nofile";
      value = "999999";
    }
    {
      domain = "root";
      type = "soft";
      item = "nofile";
      value = "999999";
    }
  ];
}
