{...}: {
  # ==========================================
  # 1. KITTY CONFIGURATION
  # ==========================================
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    themeFile = "Catppuccin-Mocha";
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 13.0;
    };

    settings = {
      clipboard_control = "write-clipboard read-clipboard write-primary read-primary";

      # --- Cursor ---
      cursor_shape = "block";
      cursor_beam_thickness = "1.5";
      shell_integration = "no-cursor";

      # --- Windows ---
      window_padding_width = 8;
      window_padding_height = 0;
      hide_window_decorations = "yes";
      show_window_resize_notification = "no";
      confirm_os_window_close = 0;

      # --- Remote & Performance ---
      single_instance = "yes";
      allow_remote_control = "yes";

      # --- Aesthetics ---
      background_opacity = "0.6";
      enable_background_blur = "yes";
      dynamic_background_opacity = "yes";
      enable_audio_bell = "no";

      # --- GPU & Wayland ---
      sync_to_monitor = "yes";
      wayland_enable_frame_callback = "yes";
      use_gpu = "yes";
      repaint_delay = 8;
      input_delay = 1;

      # --- Cursor Trail ---
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 1;

      # --- Tab bar ---
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };

    keybindings = {
      "ctrl+insert" = "copy_to_clipboard";
      "shift+insert" = "paste_from_clipboard";
    };
  };

  # ==========================================
  # 2. GHOSTTY CONFIGURATION
  # ==========================================
  programs.ghostty = {
    enable = true;

    settings = {
      # --- Theme & Font ---
      theme = "Catppuccin Mocha";
      font-family = "CaskaydiaCove Nerd Font Mono";
      font-size = 13.0;

      # --- Clipboard ---
      clipboard-read = "allow";
      clipboard-write = "allow";

      # --- Cursor ---
      cursor-style = "block";
      shell-integration-features = "no-cursor";

      # --- Windows & Aesthetics ---
      window-padding-x = 8;
      window-padding-y = 0;
      window-decoration = false;
      confirm-close-surface = false;
      background-opacity = 0.6;
      background-blur = true;
    };
  };
}
