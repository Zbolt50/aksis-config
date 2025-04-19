{
  lib,
  config,
  ...
}:
{
  # Enable kanata for home-row-mods.
  options = {
    home-row-mods.enable = lib.mkEnableOption "Enable home-row-mods on all keyboards";
  };
  config = lib.mkIf config.home-row-mods.enable {
    boot.kernelModules = [ "uinput" ];
    hardware.uinput.enable = true;
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
    systemd.services.kanata-internalKeyboard.serviceConfig = {
      SupplementaryGroups = [
        "input"
        "uinput"
      ];
    };
    services.kanata = {
      enable = true;
      keyboards = {
        internalKeyboard = {
          # Specify kanata for specific boards
          # Good for not redoing HRM on QMK boards with this enabled
          devices = [
            # Use `ls /dev/input/by-path/` to find your keyboard devices.
            # Or use /dev/input/by-id/
            "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
            "/dev/input/by-path/pci-0000:00:14.0-usb-0:3:1.0-event-kbd"
            "/dev/input/by-id/usb-_Akko_2.4G_Wireless_Keyboard-event-kbd"
            "/dev/input/by-id/usb-ROYUAN_Akko_Multi-modes_Keyboard-B-event-kbd"
            # Look for another device if this doesnt work
          ];
          extraDefCfg = ''
            process-unmapped-keys yes
          '';
          config = ''
            (defsrc
                caps a s d f j k l ;
            ) 
            (defvar
                tap-time 250
                hold-time 250
            )

            (defalias
                escctrl (tap-hold 100 100 esc lctl)
                a (multi (tap-hold $tap-time $hold-time a lsft))
                s (multi (tap-hold $tap-time $hold-time s lctl))
                d (multi (tap-hold $tap-time $hold-time d lalt))
                f (multi (tap-hold $tap-time $hold-time f lmet))
                j (multi (tap-hold $tap-time $hold-time j rmet))
                k (multi (tap-hold $tap-time $hold-time k ralt))
                l (multi (tap-hold $tap-time $hold-time l rctl))
                ; (multi (tap-hold $tap-time $hold-time ; rsft))
            )
            (deflayer base
                @escctrl @a @s @d @f @j @k @l @;
            )
          '';
        };
      };
    };
  };
}
