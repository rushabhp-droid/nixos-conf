let
  # Recursively find all .nix files in a directory, excluding default.nix.
  # Returns an attribute set where values are the paths to the modules.
  scanPaths = path:
    let
      getPaths = dir:
        builtins.concatMap
          (name:
            let
              p = dir + "/${name}";
              type = (builtins.readDir dir).${name};
            in
            if type == "directory" then
              getPaths p
            else if type == "regular" && name != "default.nix" && builtins.match ".*\\.nix$" name != null then
              [ p ]
            else
              [ ]
          )
          (builtins.attrNames (builtins.readDir dir));
      paths = getPaths path;
    in
    builtins.listToAttrs (map (p: { name = toString p; value = p; }) paths);
in
{
  inherit scanPaths;
}
