{
  pkgs,
  username,
  ...
}:
# virtualisation config
{

  # TODO: Make this toggleable

  # Enabled just in case
  programs.dconf.enable = true;

  # User group config
  users.groups.libvirtd.members = [ "${username}" ];
  users.users.${username}.extraGroups = [ "libvirtd" ];

  # Gonna wanna make this one system-specific, not a big deal for now
  # boot.kernelModules = [ "kvm-intel" ];
  # This might be pre-defined in the generated hardware-config on fresh install, we'll see though.

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
