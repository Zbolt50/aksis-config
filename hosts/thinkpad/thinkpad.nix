{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    upower
    # Packages specifically for the thinkpad
  ];
  services.upower = {
    enable = true;
  };
  # Might make a laptop general config to source from
  # Check this later?

  #services.power-profiles-daemon.enable = true;

  # Services for the built-in fingerprint reader
  # This seems to be impossible rn with nix, at least what I tried. so we'll figure it out later
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  # Other driver in case this doesn't work
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      TPACPI_ENABLE = 1;
      TPSMAPI_ENABLE = 1;

      # Optional helps save long term battery health

      # Internal Battery
      START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      # External Battery
      START_CHARGE_THRESH_BAT1 = 80;
      STOP_CHARGE_THRESH_BAT1 = 95;
    };
  };
}
