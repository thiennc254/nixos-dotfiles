{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_mocha";
      format = "$os$username$hostname$directory$git_branch$git_status$c$cpp$golang$nodejs$python$docker_context$cmd_duration$time$line_break$character";

      fill = {
        symbol = " ";
      };

      character = {
        success_symbol = "[](fg:blue)";
        error_symbol = "[](bold fg:red)";
        vimcmd_symbol = "[](bold fg:green)";
        vimcmd_replace_symbol = "[](bold fg:green)";
        vimcmd_replace_one_symbol = "[](bold fg:purple)";
        vimcmd_visual_symbol = "[](bold fg:yellow)";
      };

      cmd_duration = {
        min_time = 500;
        format = " [takes $duration](bold fg:yellow)";
      };

      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = "󰍛 ";
        style = "fg:overlay";
      };

      battery = {
        disabled = false;
        format = " [$symbol$percentage]($style)";
        full_symbol = "󱊢 ";
        discharging_symbol = "󱊢 ";
        charging_symbol = "󰂄 ";
        unknown_symbol = "󰁽 ";
        empty_symbol = "󰂎 ";
        display = [
          {
            threshold = 100;
            style = "fg:orange";
          }
        ];
      };

      username = {
        show_always = true;
        style_user = "fg:red";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "fg:blue";
        format = "@[$hostname]($style)";
        disabled = false;
        aliases = {
          "arch" = "arch";
        };
      };

      directory = {
        style = "fg:cyan";
        format = " [$path]($style)";
        truncate_to_repo = false;
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = "󰘬 ";
        style = "fg:green";
        format = " [$symbol$branch]($style)";
      };

      git_status = {
        style = "fg:yellow";
        format = "( [\\[$all_status$ahead_behind\\]]($style))";
      };

      golang = {
        symbol = " ";
        style = "fg:cyan";
        format = " [$symbol$version]($style)";
      };
      nodejs = {
        symbol = " ";
        style = "fg:green";
        format = " [$symbol$version]($style)";
      };
      python = {
        symbol = " ";
        style = "fg:cyan";
        format = " [$symbol$version]($style)";
      };
      c = {
        symbol = " ";
        style = "fg:purple";
        format = " [$symbol$version]($style)";
      };
      cpp = {
        symbol = " ";
        style = "fg:purple";
        format = " [$symbol$version]($style)";
      };
      docker_context = {
        symbol = " ";
        style = "fg:blue";
        format = " [$symbol$context]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:fg";
        format = " [$time]($style)";
      };

      line_break = {
        disabled = false;
      };

      # Modules disabled
      os = {
        disabled = true;
      };
      rust = {
        disabled = true;
      };
      scala = {
        disabled = true;
      };
      elixir = {
        disabled = true;
      };
      elm = {
        disabled = true;
      };
      gradle = {
        disabled = true;
      };
      haskell = {
        disabled = true;
      };
      java = {
        disabled = true;
      };
      julia = {
        disabled = true;
      };
      nim = {
        disabled = true;
      };

      palettes.catppuccin_mocha = {
        bg = "#1e1e2e";
        fg = "#cdd6f4";
        base = "#11111b";
        surface = "#313244";
        overlay = "#585b70";
        red = "#f38ba8";
        orange = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        blue = "#89b4fa";
        purple = "#cba6f7";
        cyan = "#89dceb";
        magenta = "#f5c2e7";
      };

      palettes.tokyonight_night = {
        bg = "#1a1b26";
        fg = "#c0caf5";
        base = "#16161e";
        surface = "#2f3549";
        overlay = "#444b6a";
        red = "#f7768e";
        orange = "#ff9e64";
        yellow = "#e0af68";
        green = "#9ece6a";
        blue = "#7aa2f7";
        purple = "#bb9af7";
        cyan = "#7dcfff";
        magenta = "#bb9af7";
      };
    };
  };
}
