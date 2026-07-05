{ config, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        bufferline = "multiple";
        line-number = "relative";
        auto-format = true;
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };
  };
}
