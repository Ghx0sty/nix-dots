# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
  [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "virtio_scsi" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "cryptd" "btrfs" ];
  boot.initrd.luks.devices."CRYPT".device = "/dev/disk/by-label/CRYPT";
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/EFI";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/HOME";
      fsType = "btrfs";
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-label/VAR";
      fsType = "ext4";
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-label/TMP";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/SWAP"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;
  hardware.enableAllFirmware = true;  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
