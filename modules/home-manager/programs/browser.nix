{...}: {
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
    };

    profiles.azty = {
      id = 0;
      name = "azty";
      isDefault = true;

      settings = {
        "media.ffmpeg.vaapi.enabled" = true;
        "gfx.webrender.all" = true;
      };
    };
  };
}
