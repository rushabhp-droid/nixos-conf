{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight
  ];
}
