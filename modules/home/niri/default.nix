{ pkgs, ... }:
{
  
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    xwayland-satellite
  ];

  programs.niri.config = builtins.readFile ./config.kdl;

  services.swww.enable = true;

  programs.fuzzel.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        height = 40;
        spacing = 2;
        exclusive = true;
        gtk-layer-shell = true;
        passthrough = false;
        fixed-center = true;
        modules-left = ["niri/workspaces"];
        modules-center = ["niri/window"];
        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "clock"
          "clock#simpleclock"
          "tray"   
        ];
        "niri/workspaces" = {
          on-click = "activate";
          format = "{index}";
          all-outputs = false;
        };
        "niri/window" = {
          format = "{title}";
        };
        "tray" = {
          show-passive-items = true;
          spacing = 10;
        };
        "clock#simpleclock" = {
          tooltip = false;
          format = " {:%H:%M}";
        };
        "clock" = {
          format = " {:L%a %d %b}";
          calendar = {
            format = {
              days = "<span weight='normal'>{}</span>";
              months = "<span color='#cdd6f4'><b>{}</b></span>";
              today = "<span color='#f38ba8' weight='700'><u>{}</u></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              weeks = "<span color='#a6e3a1'><b>W{}</b></span>";
            };
            mode = "month";
            mode-mon-col = 1;
            on-scroll = 1;
          };
          tooltip-format = "<span color='#cdd6f4' font='Lexend 16'><tt><small>{calendar}</small></tt></span>";
        };
        "cpu" = {
          format = " {usage}%";
          tooltip = true;
          interval = 1;
        };
        "memory" = {
          format = " {used:0.1f}Gi";
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "  muted";
          format-icons = {
            headphone = "";
            default = [" " " " " "];
          };
          on-click = "pavucontrol";
        };
        "custom/sep" = {
          format = "|";
          tooltip = false;
        };
        "custom/power" = {
          tooltip = false;
          on-click = "wlogout -p layer-shell &";
          format = "⏻";
        };
        "custom/notification" = {
          escape = true;
          exec = "swaync-client -swb";
          exec-if = "which swaync-client";
          format = "{icon}";
          "format-icons" = {
            none = "󰅺";
            notification = "󰡟";
          };
          on-click = "sleep 0.1 && swaync-client -t -sw";
          return-type = "json";
          tooltip = false;
        };
      };
    };
  };

}