{
  pkgs,
  host,
  ...
}:
let
  hostVars = import ../../../hosts/${host}/variables.nix;
  inherit (hostVars) terminal;
in
{
  # bash but awesome
  home.packages = with pkgs; [ thefuck ];

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtraFirst = "source ~/.p10k.zsh";
    #histSize = 10000;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "zsh-interactive-cd"
        "git"
        "git-auto-fetch"
        "thefuck"
      ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -a";
      ff = "fastfetch";
      nixdev = "nix develop -c $SHELL";
      # Aliases to save typing commands over and over after the first successful
      # host build
      update-build = "sudo nixos-rebuild build --flake .#${host}";
      update-boot = "sudo nixos-rebuild boot --flake .#${host}";
      update-switch = "sudo nixos-rebuild switch --flake .#${host}";
      update-test = "sudo nixos-rebuild test --flake .#${host}";
      # Git
      lg = "lazygit";
      gs = "git status";

    };
  };
}
