_:

{
  curve = [
    {
      _args = [
        "expressiveFastSpatial"
        {
          type = "bezier";
          points = [
            [
              0.42
              1.67
            ]
            [
              0.21
              0.90
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "expressiveSlowSpatial"
        {
          type = "bezier";
          points = [
            [
              0.39
              1.29
            ]
            [
              0.35
              0.98
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "expressiveDefaultSpatial"
        {
          type = "bezier";
          points = [
            [
              0.38
              1.21
            ]
            [
              0.22
              1.00
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "emphasizedDecel"
        {
          type = "bezier";
          points = [
            [
              0.05
              0.7
            ]
            [
              0.1
              1
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "emphasizedAccel"
        {
          type = "bezier";
          points = [
            [
              0.3
              0
            ]
            [
              0.8
              0.15
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "standardDecel"
        {
          type = "bezier";
          points = [
            [
              0
              0
            ]
            [
              0
              1
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "menu_decel"
        {
          type = "bezier";
          points = [
            [
              0.1
              1
            ]
            [
              0
              1
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "menu_accel"
        {
          type = "bezier";
          points = [
            [
              0.52
              0.03
            ]
            [
              0.72
              0.08
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "stall"
        {
          type = "bezier";
          points = [
            [
              1
              (-0.1)
            ]
            [
              0.7
              0.85
            ]
          ];
        }
      ];
    }
  ];

  animation = [
    {
      _args = [
        {
          leaf = "windowsIn";
          enabled = true;
          speed = 3;
          bezier = "emphasizedDecel";
          style = "popin 80%";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "fadeIn";
          enabled = true;
          speed = 3;
          bezier = "emphasizedDecel";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "windowsOut";
          enabled = true;
          speed = 2;
          bezier = "emphasizedDecel";
          style = "popin 90%";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "fadeOut";
          enabled = true;
          speed = 2;
          bezier = "emphasizedDecel";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "windowsMove";
          enabled = true;
          speed = 3;
          bezier = "emphasizedDecel";
          style = "slide";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "border";
          enabled = true;
          speed = 10;
          bezier = "emphasizedDecel";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "layersIn";
          enabled = true;
          speed = 2.7;
          bezier = "emphasizedDecel";
          style = "popin 93%";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "layersOut";
          enabled = true;
          speed = 2.4;
          bezier = "menu_accel";
          style = "popin 94%";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "fadeLayersIn";
          enabled = true;
          speed = 0.5;
          bezier = "menu_decel";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "fadeLayersOut";
          enabled = true;
          speed = 2.7;
          bezier = "stall";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "workspaces";
          enabled = true;
          speed = 7;
          bezier = "menu_decel";
          style = "slide";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "specialWorkspaceIn";
          enabled = true;
          speed = 2.8;
          bezier = "emphasizedDecel";
          style = "slidevert";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "specialWorkspaceOut";
          enabled = true;
          speed = 1.2;
          bezier = "emphasizedAccel";
          style = "slidevert";
        }
      ];
    }
    {
      _args = [
        {
          leaf = "zoomFactor";
          enabled = true;
          speed = 3;
          bezier = "standardDecel";
        }
      ];
    }
  ];
}
