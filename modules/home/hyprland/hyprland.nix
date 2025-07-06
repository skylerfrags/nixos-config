{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = [
        "DP-4, 2560x1440@240, 0x0, 1"
        "DP-5, 2560x1440@120, 2560x0, 1"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";
      "$browser" = "brave";
      "$mainMod" = "SUPER";

      exec-once = [
        "waybar"
        "swww-deamon"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      decoration = {
        rounding = 0;
        rounding_power = 2;
        active_opacity = 1;
        inactive_opacity = 1;

        shadow = {
            enabled = true;
            range = 4;
            rendering_power = 3;
        };

        blur = {
            enabled = false;
            size = 4;
            passes = 2;
            ignore_opacity = false;
            new_optimizations = true;
            xray = true;
            vibrancy = "0.1696";
        };

      };

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, B, exec, $browser"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, exec, $fileManager"
        "$mainMod, C, togglefloating,"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, O, pseudo,"
        "$mainMod, I, togglesplit,"
        "$mainMod, P, exec, hyprshot -m reigon --clipboard-only"

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        " , XF86AudioNext, exec, playerctl next"
        " , XF86AudioPause, exec, playerctl play-pause"
        " , XF86AudioPlay, exec, playerctl play-pause"
        " , XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "float, class:class:^(org.pulseaudio.pavucontrol)$"
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      workspace = [
        "1, monitor:DP-4"
        "2, monitor:DP-4"
        "3, monitor:DP-4"
        "4, monitor:DP-5"
        "5, monitor:DP-5"
        "6, monitor:DP-5"
      ];

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
        middle_click_paste = false;
      };

      input = {
        kb_layout = "gb";
        kb_options = "fkeys:basic_13-24";
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = 1;
      };

      animations = {
        enabled = "yes, please :)";

        bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
        ];

        animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easyOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
    };
  };
}