{
  pkgs,
  config,
  username,
  ...
}:
# Email/Other accounts Nix can handle
{
  programs.msmtp.enable = true;
  programs.mbsync.enable = true;

  services = {
    mbsync.enable = true;
    imapnotify.enable = true;
  };

  accounts.email = {
    # hides Maildir in ~/.mail
    maildirBasePath = ".mail";
    accounts.personal = {
      address = "zekeboggs10@gmail.com";
      #flavor = "gmail.com";
      primary = true;
      realName = "Zeke Boggs";
      userName = "zekeboggs10@gmail.com";

      # Encrypted mail key path goes here
      passwordCommand = "gpg --quiet --decrypt ~/.gmailpass.gpg";
      maildir.path = "personal";

      imap = {
        host = "imap.gmail.com";
        port = 993;
      };

      smtp = {
        host = "smtp.gmail.com";
        port = 587;
      };

      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
      };

      folders = {
        inbox = "INBOX"; # <-- Correct
        sent = "[Gmail]/Sent Mail"; # Gmail's real folder name
        trash = "[Gmail]/Trash"; # Gmail's real folder name
        drafts = "[Gmail]/Drafts"; # Optional but good
      };

      neomutt = {
        enable = true;
        extraMailboxes = [
          "[Gmail]/Sent Mail"
          "[Gmail]/Trash"
          "[Gmail]/Drafts"
        ];
        extraConfig = ''
          # vim: filetype=muttrc
          source ~/.config/neomutt/colors
          source ~/.config/neomutt/settings
          source ~/.config/neomutt/bindings
        '';
      };
    };
  };

  home.file.".config/neomutt/colors".source =
    config.lib.file.mkOutOfStoreSymlink "/home/${username}/aksis-config/modules/home/communication/neomutt/colors";
  home.file.".config/neomutt/settings".source =
    config.lib.file.mkOutOfStoreSymlink "/home/${username}/aksis-config/modules/home/communication/neomutt/settings";
  home.file.".config/neomutt/bindings".source =
    config.lib.file.mkOutOfStoreSymlink "/home/${username}/aksis-config/modules/home/communication/neomutt/bindings";
}
