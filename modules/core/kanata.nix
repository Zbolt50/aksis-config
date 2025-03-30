{ pkgs, ... }:
{
    # Enable kanata for home-row-mods. 
    # Gonna make this a toggleable module later. 
    services.kanata = {
        enable = true;
        keyboards = {
            internalKeyboard = {
                # Specify kanata for specific boards
                # Good for QMK boards with this enabled
                devices = [
                    "/dev/input/by-path/platform-i8042-serio-0-event-kbd" 
                ];
                extraDefCfg = "process-unmapped-keys yes";
                config = ''
                    (defsrc
                        caps a s d f j k l ;
                    ) 
                    (defvar
                        tap-time 150
                        hold-time 200
                    )

                    (defalias
                        escctrl (tap hold 100 100 esc lctl)
                        a (multi f24 (tap-hold $tap-time $hold-time a lsft))
                        s (multi f24 (tap-hold $tap-time $hold-time s lctl))
                        d (multi f24 (tap-hold $tap-time $hold-time d lalt))
                        f (multi f24 (tap-hold $tap-time $hold-time f lmet))
                        j (multi f24 (tap-hold $tap-time $hold-time j rmet))
                        k (multi f24 (tap-hold $tap-time $hold-time k ralt))
                        l (multi f24 (tap-hold $tap-time $hold-time l rctl))
                        ; (multi f24 (tap-hold $tap-time $hold-time ; rsft))
                    )
                    (deflayer base
                        @esctrl @a @s @d @f @j @k @l @;
                    )
                '';
            };
        };
    };
}
