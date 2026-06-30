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
        "media.av1.enabled" = false;
        "media.mediasource.format-reader.av1" = false;
      };
    };
  };
}
