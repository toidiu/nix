{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  writeFile = path: pkgs.writeText (baseNameOf path) (builtins.readFile path);
  writeScriptFile = path: pkgs.writeScript (baseNameOf path) (builtins.readFile path);
  vimPlugins = pkgs.vimPlugins // pkgs.callPackage ./vim/plugins.nix { };
in
{
  users = {
    mutableUsers = true;
    extraUsers = {
      root = {
        hashedPassword = "...";
      };
      toidiu = {
        isNormalUser = true;
        home = "/home/toidiu";
        description = "Apoorv Kothari";
        extraGroups = [
          "docker"
          "wheel"
        ];
        hashedPassword = "...";
        uid = 1000;
      };
    };
  };

  home-manager.users.toidiu = {
    home.sessionVariables = {
      EDITOR = "nvim";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev.outPath}/lib/pkgconfig";
      FZF_DEFAULT_COMMAND = "rg --files";
      FZF_DEFAULT_OPTS = "-m --height 50% --border";
    };

    home.packages = with pkgs; [
      openssl
      openssl.dev
      openssl.debug
      pkgconfig
    ];

    home.file = {
      "Projects/.gitignore" = {
        text = "";
      };
      ".cargo/config" = {
        text = ''
          #[build]
          #rustc-wrapper = "${pkgs.sccache.outPath + "/bin/sccache"}"
        '';
      };
      ".config/nvim/coc-settings.json" = {
        text = builtins.toJSON (import ./vim/coc.nix);
      };
    };

    programs.alacritty = (import ./alacritty.nix);

    programs.browserpass.enable = true;
    programs.dircolors.enable = true;

    programs.git = {
      enable = true;
      userName = "...";
      userEmail = "...";
      signing = {
        key = "...";
        signByDefault = true;
      };
      ignores = [
        "*.tar.gz"
      ];
      extraConfig = {
        credential = {
          helper = "netrc -v -f $HOME/.local/share/password-store/netrc.gpg";
        };
        diff = {
          tool = "vimdiff";
        };
        difftool.prompt = false;
        merge = {
          tool = "vimdiff";
          conflictstyle = "diff3";
        };
        mergetool.prompt = true;
        "mergetool \"vimdiff\"" = {
          cmd = "${pkgs.neovim.outPath}/bin/nvim -d $LOCAL $REMOTE $MERGED -c 'wincmd w' -c 'wincmd J'";
        };
        push.default = "current";
        pull.rebase = true;
        "filter \"lfs\"" = {
          clean = "git-lfs clean --%f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };
    };

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = true;
      plugins = with vimPlugins; [
        coc-css
        coc-fzf
        coc-git
        coc-highlight
        coc-html
        coc-json
        coc-prettier
        coc-python
        coc-nvim
        coc-yaml
        coc-tsserver
        coc-rust-analyzer
        coc-spell-checker
        float-preview-nvim
        fzf-vim
        rust-vim
        supertab
        vim-airline
        vim-airline-themes
        vim-addon-nix
        vim-better-whitespace
        vim-nix
        vim-rooter
        vim-toml
      ];

      extraConfig = ''
        source ${writeFile ./vim/config.vim}
        source ${writeFile ./vim/colors.vim}
        source ${writeFile ./vim/keymap.vim}
      '';
    };

    programs.password-store = {
      enable = true;
    };

    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          symbol = "𝄞";
          error_symbol = "𝗫";
          use_symbol_for_status = true;
          style_success = "bold green";
          style_failure = "red";
        };
        directory = {
          disabled = true;
        };
        docker_context = {
          disabled = false;
        };
        env_var = {
          variable = "NIX_SHELL_PACKAGES";
          prefix = "❄ ";
          style = "bold blue";
        };
        git_branch = {
          prefix = "";
        };
        git_status = {
          stashed = "";
        };
        nix_shell = {
          disabled = true;
        };
        rust = {
          prefix = "";
        };
      };
    };

    programs.zsh = {
      enable = true;
      shellAliases = {
        nixup = "sudo nixos-rebuild switch --upgrade";
        nixclean = "sudo nix-collect-garbage -d";
        nixp = "nixshell --packages";
        ls = "exa";
        l = "exa -lbF --git";
        ll = "exa -lbGF --git";
        llm = "exa -lbGF --git --sort=modified";
        # tree = "exa --tree";
        "-g ..." = "../..";
        "-g ...." = "../../../";
        zrl = "source ~/.zshrc";
      };
      envExtra = ''
        export PATH="$HOME/.cargo/bin:$PATH"
        export RPROMPT="%F{blue}%~%f%}"
      '';
      initExtra = ''
        ZSH_NIX_SHELL_SHIM="${writeScriptFile ./zsh/nix-shell.shim.zsh}"
        source ${writeFile ./zsh/nix-shell.plugin.zsh}
        source ${writeFile ./zsh/git.plugin.zsh}
        source ${writeFile ./zsh/settings.zsh}
      '';
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/about" = [ "firefox.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      };
    };
  };
}
