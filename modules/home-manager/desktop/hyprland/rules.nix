_:

{
  window_rule = [
    {
      _args = [
        {
          match = {
            pin = 1;
          };
          border_color = "rgba(afc6ffAA) rgba(afc6ff77)";
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = ".*";
          };
          no_blur = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^([Aa]lacritty)$";
          };
          no_blur = false;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "^(Open File|Select a File|Open Folder|Save As|Library|File Upload)(.*)$";
          };
          center = true;
          float = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "^(Choose wallpaper)(.*)$";
          };
          center = true;
          float = true;
          size = [
            "(monitor_w*0.60)"
            "(monitor_h*0.65)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "^(.*)(wants to save|wants to open)$";
          };
          center = true;
          float = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^(blueberry\\.py|guifetch)$";
          };
          float = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^(org\\.pulseaudio\\.)?(pavucontrol)$";
          };
          float = true;
          center = true;
          size = [
            "(monitor_w*0.45)"
            "(monitor_h*0.45)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^(nm-connection-editor)$";
          };
          float = true;
          center = true;
          size = [
            "(monitor_w*0.45)"
            "(monitor_h*0.45)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "(.*plasmawindowed.*|kcm_.*|.*bluedevilwizard)";
          };
          float = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "(.*Welcome|^(illogical-impulse Settings)$|.*Shell conflicts.*)";
          };
          float = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "org\\.freedesktop\\.impl\\.portal\\.desktop\\.kde";
          };
          float = true;
          size = [
            "(monitor_w*0.60)"
            "(monitor_h*0.65)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^(Zotero)$";
          };
          float = true;
          size = [
            "(monitor_w*0.45)"
            "(monitor_h*0.45)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^(plasma-changeicons)$";
          };
          float = true;
          no_initial_focus = true;
          move = [
            999999
            999999
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "^(Copying — Dolphin)$";
          };
          move = [
            40
            80
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^dev\\.warp\\.Warp$";
          };
          tile = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$";
          };
          float = true;
          keep_aspect_ratio = true;
          pin = true;
          move = [
            "(monitor_w*0.73)"
            "(monitor_h*0.72)"
          ];
          size = [
            "(monitor_w*0.25)"
            "(monitor_h*0.25)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = ".*is sharing (a window|your screen).*";
          };
          float = true;
          pin = true;
          move = [
            "(monitor_w*.5-window_w*.5)"
            "(monitor_h-window_h-12)"
          ];
        }
      ];
    }
    {
      _args = [
        {
          match = {
            title = "(.*\\.exe|.*minecraft.*)";
          };
          immediate = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            class = "^(steam_app).*";
          };
          immediate = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            float = 0;
          };
          no_shadow = true;
        }
      ];
    }
  ];

  workspace_rule = [
    {
      _args = [
        {
          workspace = "special:special";
          gaps_out = 30;
        }
      ];
    }
  ];

  layer_rule = [
    {
      _args = [
        {
          match = {
            namespace = ".*";
          };
          xray = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            namespace = "(walker|selection|overview|anyrun|osk|hyprpicker|noanim)";
          };
          no_anim = true;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            namespace = "gtk-layer-shell";
          };
          blur = true;
          ignore_alpha = 0;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            namespace = "launcher";
          };
          blur = true;
          ignore_alpha = 0.5;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            namespace = "notifications";
          };
          blur = true;
          ignore_alpha = 0.69;
        }
      ];
    }
    {
      _args = [
        {
          match = {
            namespace = "logout_dialog";
          };
          blur = true;
        }
      ];
    }
  ];
}
