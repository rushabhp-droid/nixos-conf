{ pkgs, lib }:

let
  buildObsidianPlugin = pkgs.callPackage ./buildObsidianPlugin.nix { inherit pkgs lib; };
in {
  dataview = pkgs.callPackage ./dataview.nix { inherit buildObsidianPlugin; };
  templater = pkgs.callPackage ./templater.nix { inherit buildObsidianPlugin; };
  calendar = pkgs.callPackage ./calendar.nix { inherit buildObsidianPlugin; };
  tasks = pkgs.callPackage ./tasks.nix { inherit buildObsidianPlugin; };
  style-settings = pkgs.callPackage ./style-settings.nix { inherit buildObsidianPlugin; };
  ayu-theme = pkgs.callPackage ./ayu-theme.nix { inherit pkgs; };
}
