{ pkgs, ... }:
{
    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["boggle"];

    virtualization.libvirtd.enable = true;
    virtualization.spiceUSBRedirection.enable = true;
}
