_: {
  services.cardwire = {
    enable = true;
    settings = {
      auto_apply_gpu_state = true;
      experimental_nvidia_block = true;
      battery_auto_switch = true;
      battery_auto_switch_mode = "integrated";
    };
  };
}
