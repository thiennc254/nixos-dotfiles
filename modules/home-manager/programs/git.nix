{ ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "thiennc254";
        email = "thiennc254.work@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          lightTheme = false;
          activeBorderColor = [
            "cyan"
            "bold"
          ];
          inactiveBorderColor = [ "white" ];
        };
      };
    };
  };
}
