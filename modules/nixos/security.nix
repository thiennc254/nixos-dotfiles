{ ... }:

{
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    doas.enable = true;
    pam.services.sddm.enableGnomeKeyring = true;
    pam.services.login.enableGnomeKeyring = true;
    sudo.extraConfig = ''
      Defaults pwfeedback
    '';
  };

  services.gnome.gnome-keyring.enable = true;
}
