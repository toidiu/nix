{
  diagnostic = {
    refreshOnInsertMode = true;
    virtualText = true;
    virtualTextCurrentLineOnly = false;
  };

  signature = {
    enable = true;
  };

  suggest = {
    timeout = 500;
  };

  codeLens = {
    enable = true;
  };

  languageserver = {
    clangd = {
      command = "clangd";
      rootPatterns = [ "CMakeLists.txt" ];
      filetypes = [ "c" "cc" "cpp" "c++" ];
    };
    nix = {
      command = "rnix-lsp";
      rootPatterns = [ "configuration.nix" ];
      filetypes = [ "nix" ];
    };
  };

  rust-analyzer = {
    serverPath = "/run/current-system/sw/bin/rust-analyzer";
    checkOnSave = {
      overrideCommand = [
        "cargo"
        "+nightly"
        "clippy"
        "--workspace"
        "--message-format=json"
        "--all-targets"
      ];
    };
    inlayHints = {
      chainingHints = true;
      parameterHints = true;
      typeHints = true;
    };
    cargo = {
      loadOutDirsFromCheck = true;
    };
    procMacro = {
      enable = true;
    };
  };
}
