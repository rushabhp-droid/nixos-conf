{pkgs, ...}:{

  networking.firewall = {
    enable = true;
  };

  security.apparmor = {
    enable = true;
    killUnconfined = false;
  };
}
