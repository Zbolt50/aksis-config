{ pkgs, username, ... }:
# Virtualization
# Make your linux run linux with linux!
{
    dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
        };
    };
    #users.users.${username}.extraGroups = [ "libvirtd" ];
}
