{
  config,
  pkgs,
  lib,
  ...
}:
{

  home.packages = with pkgs; [
    zsh-powerlevel10k
    eza
  ];

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "eza"
        "sudo"
      ];
      theme="robbyrussell";
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [
      "rm *"
      "pkill *"
      "cp *"
      "ls *"
    ];
  };
}
