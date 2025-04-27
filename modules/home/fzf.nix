{ ... }:
# FZF config
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--height 40%"
      "--border=rounded"
      "--pointer=\"◆\""
    ];
    colors = {
      fg = "-1";
      "fg+" = "#d0d0d0";
      bg = "-1";
      "bg+" = "#262626";
      hl = "#9c1a21";
      "hl+" = "#ff0000";
      border = "#ce2029";
      pointer = "#ce2029";
      spinner = "#c62828";
      prompt = "#ce2029";
      info = "#d32f2f";
      marker = "#a11b23";
      header = "#a24857";
      query = "#e4d3d3";
      label = "#a11b23";
    };
  };
}
