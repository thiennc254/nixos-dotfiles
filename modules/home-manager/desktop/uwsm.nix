{ config, ... }:

{
  home.sessionVariables = {
    TERMINAL = "xdg-terminal-exec";
    EDITOR = "nvim";

    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland";

    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";

    _JAVA_AWT_WM_NONREPARENTING = "1";

    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    FCITX_ADDON_DIRS = "/run/current-system/sw/lib/fcitx5";
  };

  xdg.configFile."uwsm/env" = {
    source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
  };
}
