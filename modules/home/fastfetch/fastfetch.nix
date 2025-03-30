{ pkgs, inputs, ... }:
# Completely uneccessary, but add icons based on program selection?
{
    programs.fastfetch = {
        enable = true;
	settings = {
	  display = {
	  	color = {
			keys = "35";
			output = "95";
		 };
		  separator = "-> ";
		};
		logo = {
			source = ./siva_new.txt;
		};

		modules = [
		  "break"
		  {
			type = "os";
			key = "OS ";
			keyColor = "red";
            outputColor = "white";
		  }
		  {
			type = "kernel";
			key = " ├ 󰌽 ";
			keyColor = "red";
            outputColor = "white";
		  }
	      {
       	    type = "packages";
            key = " ├ 󰏗 ";
            keyColor = "red";
            outputColor = "white";
          }
          {
            type = "shell";
            key = " └  ";
            keyColor = "red";
            outputColor = "white";
          }
	  "break"
	  {
            type = "wm";
            key = "WM ";
            keyColor = "white";
            outputColor = "red";
	  }
	  {
            type= "cursor";
			key = " ├ 󰆿 "; 
			keyColor = "white";
            outputColor = "red";
		  }
		  {
			type = "wmtheme";
			key = " ├  ";
			keyColor = "white";
            		outputColor = "red";
		  }
		  {
			type = "icons";
			key = " ├ 󰀻 ";
			keyColor = "white";
            		outputColor = "red";
		  }
		  {
			type = "terminal";	
			key = " ├  ";	
			keyColor = "white";	
            		outputColor = "red";
		  }
		  {
			type = "terminalfont";	
			key = " └  ";	
			keyColor = "white";	
            outputColor = "red";
		  }
		  "break"
		  {
			type = "host";
			format = "{5} {1} Type {2}";
			key = "Hardware "; 
			keyColor = "green";
            outputColor = "white";
		  }
		  {
		  	type = "cpu";
			key = " ├  ";
			keyColor = "green";
            outputColor = "white";
		  }
		  {
		  	type = "gpu";
			key = " ├ 󰢮 ";
			keyColor = "green";
            outputColor = "white";
		  }
		  {
		  	type = "memory";
			key = " ├  ";
			keyColor = "green";
            outputColor = "white";
		  }
		  {
		  	type = "disk";
			key = " ├  ";
			keyColor = "green";
            outputColor = "white";
		  }
		  {
			type = "battery";
			key = " ├  ";
			keyColor = "green";
            outputColor = "white";
		  }
		  {
		  	type = "monitor";
			key = " └ 󰍹 ";
			keyColor = "green";
            outputColor = "white";
		  }
          "break"
          {
            type = "colors";
          }
		];
	};
    };
}
