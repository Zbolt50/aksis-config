{ pkgs, ... }:
{
  # For when neovim breaks...
  programs.vim = {
    enable = false;
    defaultEditor = false;
    settings = {
      ignorecase = true;
      relativenumber = true;
    };
    plugins = with pkgs; [
      vimPlugins.gruvbox
    ];
    extraConfig = ''
                  set hlsearch
                  set shiftwidth=4
                  set tabstop=4
                  set expandtab
                  set nobackup
                  set scrolloff=10
                  set nowrap
      	          set relativenumber
    '';
  };
}
