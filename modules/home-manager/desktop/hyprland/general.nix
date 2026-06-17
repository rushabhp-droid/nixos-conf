_:

{
  monitor = [
    {
      _args = [
        {
          output = "eDP-1";
          mode = "1920x1080@144";
          position = "0x0";
          scale = 1;
        }
      ];
    }
  ];

  gesture = [
    {
      _args = [
        {
          fingers = 3;
          direction = "swipe";
          action = "move";
        }
      ];
    }
    {
      _args = [
        {
          fingers = 3;
          direction = "pinch";
          action = "fullscreen";
        }
      ];
    }
    {
      _args = [
        {
          fingers = 4;
          direction = "horizontal";
          action = "workspace";
        }
      ];
    }
  ];

  config = {
    _args = [
      {
        gestures = {
          workspace_swipe_distance = 700;
          workspace_swipe_cancel_ratio = 0.2;
          workspace_swipe_min_speed_to_force = 5;
          workspace_swipe_direction_lock = true;
          workspace_swipe_direction_lock_threshold = 10;
          workspace_swipe_create_new = true;
        };
        general = {
          gaps_in = 4;
          gaps_out = 5;
          gaps_workspaces = 50;
          border_size = 2;
          resize_on_border = true;
          no_focus_fallback = true;
          allow_tearing = true;
          snap = {
            enabled = true;
            window_gap = 4;
            monitor_gap = 5;
            respect_gaps = true;
          };
          col = {
            active_border = "rgba(44464f77)";
            inactive_border = "rgba(1a1b2033)";
          };
        };
        decoration = {
          rounding_power = 2.5;
          rounding = 18;
          blur = {
            enabled = true;
            xray = true;
            special = false;
            new_optimizations = true;
            size = 10;
            passes = 3;
            brightness = 1;
            noise = 0.05;
            contrast = 0.89;
            vibrancy = 0.5;
            vibrancy_darkness = 0.5;
            popups = false;
            popups_ignorealpha = 0.6;
            input_methods = true;
            input_methods_ignorealpha = 0.8;
          };
          shadow = {
            enabled = true;
            range = 20;
            offset = [
              0
              2
            ];
            render_power = 10;
            color = "rgba(00000020)";
          };
          dim_inactive = true;
          dim_strength = 0.05;
          dim_special = 0.2;
        };
        misc = {
          vrr = 1;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
          background_color = "rgba(121318FF)";
        };
        input = {
          touchpad = {
            natural_scroll = true;
            tap_to_click = true;
          };
        };
        animations = {
          enabled = true;
        };
      }
    ];
  };
}
