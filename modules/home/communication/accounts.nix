{ ... }:
# Email/Other accounts Nix can handle
{
  programs.msmtp.enable = true;
  programs.mbsync.enable = true;

  accounts.email = {
    accounts.personal = {
      address = "zekeboggs10@gmail.com";
      # Encrypted mail key path goes here
      flavor = "gmail.com";
      primary = true;
      realName = "Zeke Boggs";
      userName = "zekeboggs10@gmail.com";
      passwordCommand = "gpg --quiet --decrypt ~/.gmailpass.gpg";
      maildir.path = "~/.mail/personal";

      mbsync = {
        enable = true;
        create = "maildir";
        extraConfig.local = {
          Path = "~/.mail/personal/";
          Inbox = "~/.mail/personal/INBOX";
        };
      };
      msmtp.enable = true;
      neomutt = {
        enable = true;
      };
    };
  };
}
