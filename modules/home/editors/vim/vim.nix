{ config, pkgs, ... }:
{
  # For when neovim breaks...
  programs.vim = {
        enable = true;
        defaultEditor = false;
        settings = {
          ignorecase = true; 
          relativenumber = true;
        };
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
