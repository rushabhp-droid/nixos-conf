_: {
  programs.obsidian = {
    enable = true;
    vaults."Documents/Notes".enable = true;
    defaultSettings = {
      app = {
        defaultViewMode = "preview";
        readableLineLength = true;
        showLineNumber = true;
        attachmentFolderPath = "./assets";
      };
    };
  };
}
