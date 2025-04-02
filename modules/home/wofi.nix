{ ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      no_actions = true;
    };

    style = ''
      		* {
      			border: none;
      			box-shadow: none;
      		  }
      		window {
          			font-family: "JetBrains Mono Nerd Font";
      			/*font-family: "MxPlus IBM VGA 9x16";*/
      			background-color: rgba(128,0,0,0.7);
          			border: 2px solid linear-gradient(90deg, #800000, #ce2029);
          			border-radius: 4px;

      	        }
      		#entry {
      			border: 2px solid #800000;
      			color: white;
      			padding: 0.25em;
      		}
      		#entry:selected {
          			border: none;
      			background: linear-gradient(90deg, #800000, #ce2029);
      		}
      		#text:selected {
      			border: none;
      			color: #ffffff;
          
      		}
      		#text:unselected {
      			color: #ffffff;
          		border: none;
      		}
      		#input{
      			background: linear-gradient(90deg, #ce2029, #800000);
      			color: white;
      			padding: 0.25em;
      		}
      		image{
      			margin-left: .25em;
      			margin-right: .25em;
      		}
      		#scroll
      		{
          			border: none;
      		}
      		'';
  };
}
