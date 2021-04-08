{
  enable = true;
  settings = {
    live_config_reload = true;

    window = {
      decorations = "none";

      padding = {
        x = 10;
        y = 10;
      };
    };

    font = {
      size = 10.0;
    };

    colors = {
      primary = {
        background = "#272822";
        foreground = "#F8F8F2";
      };

      cursor = { };

      # Normal colors
      normal = {
        black = "#272822";
        red = "#F92672";
        green = "#A6E22E";
        yellow = "#F4BF75";
        blue = "#66D9EF";
        magenta = "#AE81FF";
        cyan = "#A1EFE4";
        white = "#F8F8F2";
      };

      # Bright colors
      bright = {
        black = "#75715E";
        red = "#F92672";
        green = "#A6E22E";
        yellow = "#F4BF75";
        blue = "#66D9EF";
        magenta = "#AE81FF";
        cyan = "#A1EFE4";
        white = "#F9F8F5";
      };

      indexed_colors = [
        {
          index = 16;
          color = "0x0a0d0f";
        }
        {
          index = 17;
          color = "0xebeef8";
        }
        {
          index = 18;
          color = "0x80cbc4";
        }
        {
          index = 19;
          color = "0x666666";
        }
      ];
    };
  };
}
