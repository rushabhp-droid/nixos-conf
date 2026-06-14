{ config, pkgs, ... }:

{
  # Ensure the Stylix target is active (usually on by default, but safe to declare)
  stylix.targets.dunst.enable = true;

  services.dunst = {
    enable = true;
    
    # You can still define your layout, geometry, and behavior here!
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        frame_width = 2;
        corner_radius = 8;
        
        # ⚠️ IMPORTANT: Do NOT define colors or fonts in this block!
        # If you set `background = "..."` or `font = "..."` here, 
        # Nix will throw a collision error fighting with Stylix.
      };
    };
  };
}
