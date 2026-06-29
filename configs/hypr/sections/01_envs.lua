-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- and Hyprland v0.55 Ecosystem configurations

-- =========================================================================
-- 1. CENTRAL ENVIRONMENT VARIABLES MANAGEMENT (WAYLAND NATIVE ENFORCEMENT)
-- =========================================================================
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

-- =========================================================================
-- 2. ECOSYSTEM & XWAYLAND COMPATIBILITY LAYER CONFIGURATIONS
-- =========================================================================
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	ecosystem = {
		no_update_news = true,
	},
})
