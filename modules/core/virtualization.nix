{ config, pkgs, username, ... }:
# virtualisation config
{

# TODO: Make this into a toggleable module of some kind

    # Enabled just in case
    programs.dconf.enable = true;

    # User group config
    users.groups.libvirtd.members = ["${username}"];
    users.users.${username}.extraGroups = [ "libvirtd" ];

    boot.kernelModules = [ "kvm-intel" ];
    
    virtualisation = {
        libvirtd = { 
            enable = true;
            qemu = {
                swtpm.enable = true;
                ovmf.enable = true;
                ovmf.packages = [ pkgs.OVMFFull.fd ];
            };
        };
        spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;

    environment.systemPackages = with pkgs; [
        virt-manager
        virt-viewer
        spice
        spice-gtk
        spice-protocol
    ];

}
