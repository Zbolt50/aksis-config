{ config, pkgs, lib, ... }:

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
        };
    };
}
