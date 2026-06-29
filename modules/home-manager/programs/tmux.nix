{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      vim-tmux-navigator
      yank
    ];

    extraConfig = ''
      # --- General settings ---
      set -as terminal-features ",xterm-*:RGB"
      set -as terminal-features ",xterm-kitty:RGB"
      set -g mouse on
      set -g set-clipboard on
      set -g status-interval 2
      set -g escape-time 0
      set -g status-keys vi
      set -g mode-keys vi
      set-option -g base-index 1
      setw -g pane-base-index 1
      set-option -g renumber-windows on
      set -g focus-events on
      set-option -g status-position top

      # --- Prefix ---
      unbind C-b
      set -g prefix C-a
      bind-key C-a send-prefix

      # --- Keybindings ---
      bind r source-file ~/.config/tmux/tmux.conf
      bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
      bind-key -T copy-mode-vi 'y' send-keys -X copy-selection

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5

      bind c new-window -c "#{pane_current_path}"
      bind '\' split-window -h -c "#{pane_current_path}"
      bind '-' split-window -v -c "#{pane_current_path}"

      # --- Popup ---
      bind f if-shell -F '#{==:#{session_name},popup}' \
        { detach-client } \
        { display-popup -d "#{pane_current_path}" -w 80% -h 80% -E "tmux attach-session -t popup || tmux new-session -s popup" }

      # --- Plugin Options ---
      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
      set -g @continuum-boot 'on'

      # --- Catppuccin Theme ---
      set -goq @thm_bg "default"
      set -goq @thm_fg "#CDD6F4"
      set -goq @thm_session "#89B4FA"
      set -goq @thm_selection_fg "#3B4252"
      set -goq @thm_selection_bg "#F5E0DC"
      set -goq @thm_active_window "#A6E3A1"
      set -goq @thm_pane_border "#B4BEFE"
      set -goq @thm_copy_mode "#F9E2AF"
      set -goq @thm_prefix "#F38BA8"
      set -g status-style "bg=#{@thm_bg}"
      set -g status-justify left
      set -g status-left-length 100
      set -g status-right-length 100
      set -g status-left "#[fg=#{@thm_prefix},bold]#{?client_prefix,  #S ,#{?#{==:#{pane_mode},copy-mode},#[fg=#{@thm_copy_mode}]  #S ,#[fg=#{@thm_session}] #S }}#[fg=#{@thm_fg},none]|"
      set -g status-right "#[fg=#{@thm_prefix},bold]󰒋 #H"
      set -g window-status-format "#[fg=#{@thm_fg},bg=default] #I:#W"
      set -g window-status-current-format "#[fg=#{@thm_active_window},bold,bg=default] #I:#W"
      set -g pane-active-border-style "fg=#{@thm_pane_border},bg=default"
      set -g pane-border-style "fg=brightblack,bg=default"
      set -g message-style "bg=default,fg=#{@thm_fg}"
      set -g mode-style "bg=#{@thm_copy_mode},fg=#{@thm_selection_fg}"
    '';
  };
}
