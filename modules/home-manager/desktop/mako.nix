{ ... }: {
  services.mako = {
    enable = true;
    settings = {
      font = "CaskaydiaCove Nerd Font Mono 10";
      width = 500;
      height = 300;
      margin = "10";
      padding = "15";
      border-size = 2;
      border-radius = 8;
      anchor = "top-right";
      default-timeout = 5000;
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
    };

    extraConfig = ''
      [urgency=low]
      border-color=#313244
      default-timeout=3000

      [urgency=critical]
      border-color=#f38ba8
      text-color=#f38ba8
      default-timeout=0
    '';
  };
}
