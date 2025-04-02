{ pkgs, ... }:
# Tmux Config
{
  programs.tmux = {
    enable = true;
    # Nix tmux settings
    prefix = "C-a";
    # Enable vim mode
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      prefix-highlight
    ];
    extraConfig = ''
      		# Window binds
      		bind v split-window -h		
      		bind h split-window -v
      		unbind %
      		unbind '"'
              set -g default-terminal screen-256color		
      		# Source Plugins
      		source-file ~/.config/tmux/plugins/vim-tmux-navigator.conf
      		# Fix prefix-highlight
      		source-file ~/.config/tmux/plugins/prefix-highlight.conf
      		source-file ~/.config/tmux/statusline.conf
      	'';
  };

  # Seperate config for each plugin
  home.file = {
    ".config/tmux/plugins/vim-tmux-navigator.conf".text = ''
      	# Navigation 
      	set -g mode-keys vi
      	set -g mouse on
      	# Smart pane switching with awareness of Vim splits.
      	# See: https://github.com/christoomey/vim-tmux-navigator
      	is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          	| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      	bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      	bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      	bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      	bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      	tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      	if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          	"bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      	if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          	"bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
      	
      	bind-key -T copy-mode-vi 'C-h' select-pane -L
      	bind-key -T copy-mode-vi 'C-j' select-pane -D
      	bind-key -T copy-mode-vi 'C-k' select-pane -U
      	bind-key -T copy-mode-vi 'C-l' select-pane -R
      	bind-key -T copy-mode-vi 'C-\' select-pane -l
      	
      	
      	###########
      	# Smart pane resizing with awareness of Vim splits.
      	# See: https://github.com/RyanMillerC/better-vim-tmux-resizer
      	is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          	| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      	
      	# Edit values if you use custom resize_count variables
      	bind-key -n M-h if-shell "$is_vim" "send-keys M-h"  "resize-pane -L 10"
      	bind-key -n M-j if-shell "$is_vim" "send-keys M-j"  "resize-pane -D 5"
      	bind-key -n M-k if-shell "$is_vim" "send-keys M-k"  "resize-pane -U 5"
      	bind-key -n M-l if-shell "$is_vim" "send-keys M-l"  "resize-pane -R 10"

      	bind-key -T copy-mode-vi M-h resize-pane -L 10
      	bind-key -T copy-mode-vi M-j resize-pane -D 5
      	bind-key -T copy-mode-vi M-k resize-pane -U 5
      	bind-key -T copy-mode-vi M-l resize-pane -R 10		
      	'';

    ".config/tmux/plugins/prefix-highlight.conf".text = ''
      		set -g @prefix_highlight_fg '#ffffff'
      		set -g @prefix_highlight_bg '#800000'
      	'';

    ".config/tmux/statusline.conf".text = ''
      	set -g status-justify "left"
      	set -g status "on"
      	set -g status-left-style "none"
      	set -g message-command-style "fg=#ffffff,bg=#8b0000"
      	set -g status-right-style "none"
      	set -g pane-active-border-style "fg=#d62929"
      	set -g status-style "none,bg=#3a3a3a"
      	set -g message-style "fg=#ffffff,bg=#8b0000"
      	set -g pane-border-style "fg=#8b0000"
      	set -g status-right-length "100"
      	set -g status-left-length "100"
      	setw -g window-status-activity-style "none"
      	setw -g window-status-separator ""
      	setw -g window-status-style "none,fg=#c6c6c6,bg=#3a3a3a"

      	set -g status-left "#[fg=#bcbcbc,bg=#d62929] #S #[fg=#d62929,bg=#3a3a3a,nobold,nounderscore,noitalics]"
      	set -g status-right "#[fg=#8b0000,bg=#3a3a3a,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#8b0000] #{prefix_highlight}#[fg=#ffffff,bg=#8b0000] %Y-%m-%d  %H:%M #[fg=#d62929,bg=#8b0000,nobold,nounderscore,noitalics]#[fg=#bcbcbc,bg=#d62929] #h "
      #set -g status-right "#[fg=#9b0000,bg=#3a3a3a,nobold,nounderscore,noitalics]    #{prefix_highlight} %Y-%m-%d  %H:%M #[fg=#d62929,bg=#8b0000,nobold,nounderscore,noitalics]#[fg=#bcbcbc,bg=#d62929] #h "
      setw -g window-status-format "#[fg=#c6c6c6,bg=#3a3a3a] #I #[fg=#c6c6c6,bg=#3a3a3a] #W "
      setw -g window-status-current-format "#[fg=#3a3a3a,bg=#8b0000,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#8b0000] #I #[fg=#ffffff,bg=#8b0000] #W #[fg=#8b0000,bg=#3a3a3a,nobold,nounderscore,noitalics]"
      	'';
  };
}
