{ ... }: {
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

  programs = {
    zoxide.enable = true;
    starship.enable = true;

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
      defaultOptions = [
        "--height 65%"
        "--layout=reverse"
        "--border=sharp"
        "--prompt=' '"
        "--pointer=' '"
        "--marker='󰄵 '"
        "--info=inline"
        "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
        "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
        "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
      ];
    };

    fish = {
      enable = true;
      shellInit = ''
        set -g fish_greeting
        set -Ux IS_NIX_MACHINE true
        set -gx EDITOR nvim
        set -gx VISUAL nvim
        set -gx SUDO_EDITOR nvim
        set -gx MISE_QUIET true
        set -gx MISE_DISABLE_TOOLS_HINTS true
        set -gx GPG_TTY (tty)
      '';

      shellAliases = {
        v = "nvim";
        "v." = "nvim .";
        ls = "eza -lh --group-directories-first --icons=auto";
        lsa = "eza -lah --group-directories-first --icons=auto";
        lt = "eza --tree --level=2 --long --icons --git";
        lta = "lt -a";
      };

      shellAbbrs = {
        hyprreload = "hyprctl reload";
        lg = "lazygit";
        g = "git";
        gst = "git status";
        ga = "git add";
        gaa = "git add --all";
        gcm = "git commit -m";
        gp = "git push";
        gpl = "git pull --rebase";
        gco = "git checkout";
        gcb = "git checkout -b";
        tws = "tmux a -t (whoami)";
      };

      interactiveShellInit = ''
        # Init Tools
        if type -q mise; mise activate fish | source; end

        # Auto-attach Tmux
        if not set -q TMUX; and not set -q NO_TMUX; and status is-interactive
            tmux attach -t (whoami) 2>/dev/null; or tmux new -s (whoami)
        end

        # Catppuccin Mocha Palette
        set -g fish_color_normal cdd6f4
        set -g fish_color_command 89b4fa
        set -g fish_color_keyword f38ba8
        set -g fish_color_quote a6e3a1
        set -g fish_color_redirection f5c2e7
        set -g fish_color_end fab387
        set -g fish_color_error f38ba8
        set -g fish_color_param f2cdcd
        set -g fish_color_comment 7f849c
        set -g fish_color_selection 313244
        set -g fish_color_search_match 313244
        set -g fish_color_operator f5c2e7
        set -g fish_color_escape eba0ac
        set -g fish_color_autosuggestion 6c7086
        set -g fish_color_cancel f38ba8
        set -g fish_pager_color_completion cdd6f4
        set -g fish_pager_color_description 6c7086
        set -g fish_pager_color_prefix f5c2e7
        set -g fish_pager_color_progress 313244
        set -g fish_pager_color_selected_background 313244
      '';
    };
  };
}
