{
  pkgs,
  inputs,
  firefox-addons,
  ...
}:
{
  programs.firefox = {
    enable = true;
    policies = {
      BlockAboutConfig = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
    };
    profiles.default = {
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Nix Resources";
            toolbar = true;
            bookmarks = [
              {
                name = "Nixpkgs Search";
                tags = [ "nix" ];
                url = "https://search.nixos.org/packages";
              }
              {
                name = "Home-Manager Config Options";
                tags = [ "nix" ];
                url = "https://nix-community.github.io/home-manager/options.xhtml";
              }
            ];
          }
        ];
      };
    };
  };
}
