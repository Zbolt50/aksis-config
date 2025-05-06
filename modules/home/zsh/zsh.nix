{
  pkgs,
  host,
  ...
}:
{
  # bash but awesome
  home.packages = with pkgs; [
    zsh-fzf-tab
  ];

  # Source p10k theme
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
        "fzf"
      ];
    };
    plugins = [
      # Plugins that can't be handled by oh-my-zsh, might just remove oh-my-zsh later
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];
    shellAliases = {
      ls = "ls --color=always";
      ll = "ls -l";
      la = "ls -a";
      ff = "fastfetch";
      nixdev = "nix develop -c $SHELL";
      # Aliases to save typing commands over and over after the first successful
      # host build
      update-build = "cd ~/aksis-config && sudo nixos-rebuild build --flake .#${host} && cd -";
      update-boot = "cd ~/aksis-config && sudo nixos-rebuild boot --flake .#${host} && cd -";
      update-switch = "cd ~/aksis-config && sudo nixos-rebuild switch --flake .#${host} && cd -";
      update-test = "cd ~/aksis-config && sudo nixos-rebuild test --flake .#${host} && cd -";

      # Git
      lg = "lazygit";
      gs = "git status";
      gb = "git blame";
      gp = "git pull";
      gP = "git push";
      gf = "git fetch";
      gM = "git merge";
      gc = "git commit";
      gd = "git diff";

      # Kitty- might add if/else so these dont show up in other terminals
      icat = "kitten icat";

    };
  };
}
