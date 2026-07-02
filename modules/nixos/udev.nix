{ ... }:
{
  # Create a persistent symlink for the Intel iGPU
  services.udev.extraRules = ''
    KERNEL=="card*", KERNELS=="0000:00:02.0", SUBSYSTEM=="drm", SUBSYSTEMS=="pci", SYMLINK+="dri/intel-igpu"
  '';
}
