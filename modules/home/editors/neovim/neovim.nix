{
  config,
  pkgs,
  username,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = false;
    vimdiffAlias = true;

    plugins = with pkgs; [
      # This handles the nvim-treesitter compile errors
      vimPlugins.nvim-treesitter.withAllGrammars
    ];

    # TODO: Move this to home.packages later so the $PATH is correct
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      # Put LSPs, Linters, and other tools here

      # Lua
      lua-language-server
      luarocks
      stylua

      # Nix
      # These don't work right atm, but this will be solved later.
      nil
      nixfmt-rfc-style

      # C/C++
      clang-tools
      cmake-language-server

      # Python
      pyright
      pylint
      isort
      black

      # Markdown
      marksman

      # JS/TS ( Gross )
      typescript-language-server
      eslint_d

      # Node JS
      nodejs_23
      # Find a nix way to install certain language servers

      # CSS
      csslint
      nodePackages.prettier

      #LaTeX
      latexrun # compiler
      texlab # LSP
      texliveBasic # LaTeX

      # PHP
      phpactor # LSP
      php84 # php

      # Neovim dependencies
      ripgrep
      fzf
      imagemagick

    ];
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink /home/${username}/aksis-config/modules/home/editors/neovim/plugins/nvim;
    recursive = true;
  };
}
