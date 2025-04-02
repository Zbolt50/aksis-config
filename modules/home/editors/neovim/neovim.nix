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

    extraPackages = with pkgs; [
      # Put LSPs, Linters, and other tools here

      # Lua
      lua-language-server
      luarocks
      stylua
      # Nix
      # These don't work right atm, but this will be solved later.
      #nil
      nixfmt-rfc-style
      # Neovim dependencies
      ripgrep
      fzf
    ];
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink /home/${username}/aksis-config/modules/home/editors/neovim/plugins/nvim;
    recursive = true;
  };
}
