local M = {}

-- =========================================================================
-- 1. CENTRAL REPOSITORY FOR WINDOW RULES (Data-Driven Table)
-- =========================================================================
M.rules = {
	-- ---------------------------------------------------------------------
	-- A. SYSTEM & STRUCTURAL PRESETS
	-- ---------------------------------------------------------------------
	-- Geometry calculations for generic floating windows
	{
		{ tag = "floating-window" },
		{ float = true, center = true, size = { "monitor_w * 0.8", "monitor_h * 0.8" } },
	},

	-- ---------------------------------------------------------------------
	-- B. TAG ASSIGNMENT (CLASSIFICATION VIA REGEX)
	-- ---------------------------------------------------------------------
	-- Terminal Emulators
	{ "(Alacritty|kitty|com.mitchellh.ghostty|foot)", { tag = "+terminal" } },

	-- Chromium-based Browsers
	{
		"((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)",
		{ tag = "+chromium-based-browser" },
	},

	-- Firefox-based Browsers
	{ "([fF]irefox|zen|librewolf)", { tag = "+firefox-based-browser" } },

	-- Core TUI Apps & System Utilities (Force Floating)
	{
		"(org.arch.bluetui|org.arch.impala|org.arch.yazi|org.arch.wiremix|org.arch.btop|org.arch.terminal|org.arch.bash|org.codeberg.dnkl.foot|org.gnome.NautilusPreviewer|org.gnome.Nautilus|org.gnome.Evince|com.gabm.satty|arch.About|TUI.float|imv|mpv)",
		{ tag = "+floating-window" },
	},

	-- Standard File Dialogs (Force Floating)
	{
		{
			class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus|firefox|chromium|brave-browser)",
			title = "^(Open.*|Save.*|Confirm.*|Select.*|Upload.*|File [U|u]pload.*|Choose.*|All Files.*|.*wants to.*)$",
		},
		{ tag = "+floating-window" },
	},

	-- Privacy & Password Managers
	{ "^(Bitwarden)$", { no_screen_share = true, tag = "+floating-window" } },
	{ "chrome-nngceckbapebfimnlniiahkandclblb-Default", { no_screen_share = true, tag = "+floating-window" } },
	{ { title = "initialTitle:.*Bitwarden.*" }, { tag = "+floating-window" } },

	-- Standalone Apps
	{ "org.gnome.Calculator", { float = true } },
	{ "org.arch.screensaver", { fullscreen = true, float = true, animation = "slide" } },

	-- ---------------------------------------------------------------------
	-- C. BEHAVIOR & STYLE OVERRIDES (DRIVEN BY TAG ENFORCEMENT)
	-- ---------------------------------------------------------------------
	-- UI Presets
	{ { tag = "pop" }, { rounding = 8 } },
	{ { tag = "noidle" }, { idle_inhibit = "always" } },

	-- Terminal Styles
	{ { tag = "terminal" }, { tag = "-default-opacity", opacity = "1 0.9" } },

	-- Browser Styles
	{ { tag = "chromium-based-browser" }, { tag = "-default-opacity", tile = true, opacity = "1.0 0.97" } },
	{ { tag = "firefox-based-browser" }, { tag = "-default-opacity", opacity = "1.0 0.97" } },

	-- Multimedia & Editing Apps (Must remain 100% opaque)
	{
		"^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$",
		{ tag = "-default-opacity", opacity = "1 1" },
	},

	-- ---------------------------------------------------------------------
	-- D. CONTEXT AWARENESS & EXCEPTIONS (PWA / FLOATING / SILENT)
	-- ---------------------------------------------------------------------
	-- Picture-in-Picture Mode
	{ { title = "^Picture-in-Picture$" }, { tag = "+floating-window" } },

	-- PWA Exceptions: Strip browser behaviors from YouTube and Zoom Web Client
	{ "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)", { tag = "-chromium-based-browser" } },
	{ "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)", { tag = "-default-opacity" } },

	-- Active Screen Sharing Status Popups
	{ { title = ".*is sharing.*" }, { workspace = "special silent" } },
}

-- =========================================================================
-- 2. REPOSITORY FOR LAYER RULES (UI Panels, Notifications, Overlays)
-- =========================================================================
M.layer_rules = {
	{
		namespace = "vicinae",
		blur = true,
		ignore_alpha = 0,
	},
	{
		namespace = "arch.image-selector",
		no_anim = true,
	},
	{
		name = "noctalia",
		match = {
			namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
		},
		no_anim = true,
		ignore_alpha = 0.5,
		blur = true,
		blur_popups = true,
	},
}

return M
