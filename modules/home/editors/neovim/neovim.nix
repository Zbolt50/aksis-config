{
  config,
  pkgs,
  username,
  host,
  ...
}:
let
  hostVars = import ../../../../hosts/${host}/variables.nix;
  inherit (hostVars)
    terminal
    ;
in
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

    extraLuaPackages = ps: [ ps.magick ];
  };
  # Install LSPs systemwide
  home.packages = with pkgs; [
    # Put LSPs, Linters, and other tools here
    # Some of these have issues, so I'll be moving it to a home wide setup later

    # Lua
    lua-language-server
    luarocks
    stylua

    # Nix
    # These don't work EXACTLY right atm, but this will be solved later.
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
    prettierd

    #LaTeX
    latexrun # compiler
    texlab # LSP
    texliveSmall # LaTeX

    # PHP
    phpactor # LSP
    php83Packages.php-cs-fixer

    # Neovim dependencies
    ripgrep
    fzf
    imagemagick

  ];

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink /home/${username}/aksis-config/modules/home/editors/neovim/plugins/nvim;
    recursive = true;
  };

  # Overrides the stupid default wrapper
  xdg.desktopEntries.nvim = {
    name = "Neovim";
    genericName = "Text Editor";
    comment = "Edit files using Neovim";
    exec = "${terminal} -e nvim %F";
    terminal = false;
    type = "Application";
    icon = "nvim";
    mimeType = [
      "text/plain"
      "text/x-markdown"
    ];
    categories = [
      "Utility"
      "TextEditor"
    ];
  };

  # Sets neovim as default man-page reader
  #export MANPAGER='nvim +Man!'
  #export MANWIDTH=999
  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
    MANWIDTH = 999;
  };

}
