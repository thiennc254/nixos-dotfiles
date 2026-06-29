local M = {}

local mod = hypr.shared.mainMod
local ipc = "noctalia msg"

-- =========================================================================
-- CENTRAL KEYBOARD BINDINGS REPOSITORY (Data-Driven Table)
-- =========================================================================
M.keybinds = {
	-- { modifiers, key, dispatcher_action, api_options }

	-- ---------------------------------------------------------------------
	-- A. CORE SYSTEM COMMANDS
	-- ---------------------------------------------------------------------
	{ mod, "Return", hl.dsp.exec_cmd("launch-terminal"), { description = "Terminal" } },
	{ mod, "W", hl.dsp.window.close(), { description = "Close Window" } },
	{
		mod .. " + ALT + SHIFT",
		"M",
		hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
		{ description = "Exit Hyprland" },
	},

	-- ---------------------------------------------------------------------
	-- B. WINDOW & LAYOUT MANAGEMENT
	-- ---------------------------------------------------------------------
	{ mod, "O", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Floating Window" } },
	{ mod, "F", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle Full Screen" } },
	{ mod, "P", hl.dsp.window.pseudo(), { description = "Toggle Pseudo Layout" } },
	{ mod .. " + ALT", "J", hl.dsp.layout("togglesplit"), { description = "Toggle Split Direction" } },

	-- ---------------------------------------------------------------------
	-- C. QUICK LAUNCHERS (SCRIPTS & UTILITIES)
	-- ---------------------------------------------------------------------
	{ mod .. " + CTRL", "E", hl.dsp.exec_cmd("launch-file-manager"), { description = "Open File Manager" } },
	{ mod, "B", hl.dsp.exec_cmd("launch-browser"), { description = "Open Web Browser" } },
	{ mod .. " + CTRL", "C", hl.dsp.exec_cmd("launch-system-monitors"), { description = "Open System Monitors" } },
	-- { mod .. " + CTRL", "SPACE", hl.dsp.exec_cmd("toggle-waybar"), { description = "Toggle Waybar" } },
	-- { mod .. " + CTRL", "A", hl.dsp.exec_cmd("launch-mixer"), { description = "Open Audio Mixer" } },
	-- { mod .. " + CTRL", "B", hl.dsp.exec_cmd("launch-bluetooth"), { description = "Open Bluetooth Settings" } },
	-- { mod .. " + CTRL", "W", hl.dsp.exec_cmd("launch-wifi"), { description = "Open Wifi Settings" } },

	-- Noctalia binds
	{ mod, "SPACE", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"), { description = "Toggle App Launcher" } },
	{ mod .. " + CTRL", "V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"), { description = "Toggle Clipboard" } },
	{
		mod .. " + CTRL",
		"W",
		hl.dsp.exec_cmd(ipc .. " panel-toggle control-center network"),
		{ description = "Wifi" },
	},
	{
		mod .. " + CTRL",
		"A",
		hl.dsp.exec_cmd(ipc .. " panel-toggle control-center audio"),
		{ description = "Wifi" },
	},
	{
		mod .. " + CTRL",
		"B",
		hl.dsp.exec_cmd(ipc .. " panel-toggle control-center bluetooth"),
		{ description = "Wifi" },
	},

	-- ---------------------------------------------------------------------
	-- D. VIM-STYLE NAVIGATION (FOCUS / SWAP / MOVE)
	-- ---------------------------------------------------------------------
	-- Focus Window
	{ mod, "H", hl.dsp.focus({ direction = "left" }), { description = "Move Focus Left" } },
	{ mod, "L", hl.dsp.focus({ direction = "right" }), { description = "Move Focus Right" } },
	{ mod, "K", hl.dsp.focus({ direction = "up" }), { description = "Move Focus Up" } },
	{ mod, "J", hl.dsp.focus({ direction = "down" }), { description = "Move Focus Down" } },

	-- Swap Window
	{ mod .. " + SHIFT", "H", hl.dsp.window.swap({ direction = "left" }), { description = "Swap Window Left" } },
	{ mod .. " + SHIFT", "L", hl.dsp.window.swap({ direction = "right" }), { description = "Swap Window Right" } },
	{ mod .. " + SHIFT", "K", hl.dsp.window.swap({ direction = "up" }), { description = "Swap Window Up" } },
	{ mod .. " + SHIFT", "J", hl.dsp.window.swap({ direction = "down" }), { description = "Swap Window Down" } },

	-- Move Window Location
	{ mod .. " + CTRL", "H", hl.dsp.window.move({ direction = "left" }), { description = "Move Window Left" } },
	{ mod .. " + CTRL", "L", hl.dsp.window.move({ direction = "right" }), { description = "Move Window Right" } },
	{ mod .. " + CTRL", "K", hl.dsp.window.move({ direction = "up" }), { description = "Move Window Up" } },
	{ mod .. " + CTRL", "J", hl.dsp.window.move({ direction = "down" }), { description = "Move Window Down" } },

	-- ---------------------------------------------------------------------
	-- E. MULTIMEDIA & HARDWARE CONTROL (LAPTOP KEYS)
	-- ---------------------------------------------------------------------
	-- Audio Control (wpctl)
	{
		"",
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
		{ locked = true, repeating = true, description = "Increase Volume" },
	},
	{
		"",
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		{ locked = true, repeating = true, description = "Decrease Volume" },
	},
	{
		"",
		"XF86AudioMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
		{ locked = true, repeating = true, description = "Toggle Audio Mute" },
	},
	{
		"",
		"XF86AudioMicMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
		{ locked = true, repeating = true, description = "Toggle Microphone Mute" },
	},

	-- Backlight Control
	{
		"",
		"XF86MonBrightnessUp",
		hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
		{ locked = true, repeating = true, description = "Increase Brightness" },
	},
	{
		"",
		"XF86MonBrightnessDown",
		hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
		{ locked = true, repeating = true, description = "Decrease Brightness" },
	},

	-- Media Player Control (playerctl)
	{ "", "XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next Track" } },
	{ "", "XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause Media" } },
	{
		"",
		"XF86AudioPlay",
		hl.dsp.exec_cmd("playerctl play-pause"),
		{ locked = true, description = "Play/Pause Media" },
	},
	{ "", "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous Track" } },

	-- ---------------------------------------------------------------------
	-- F. SYSTEM CAPTURE
	-- ---------------------------------------------------------------------
	{ "", "PRINT", hl.dsp.exec_cmd("cmd-screenshot"), { description = "Take Screenshot" } },
	{ mod, "PRINT", hl.dsp.exec_cmd("pkill hyprcursor || hyprpicker -a"), { description = "Open Color Picker" } },

	-- ---------------------------------------------------------------------
	-- G. MOUSE ACTIONS
	-- ---------------------------------------------------------------------
	{ mod, "mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Drag Window" } },
	{ mod, "mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize Window" } },
	{ mod, "mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Switch to Next Workspace" } },
	{ mod, "mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Switch to Previous Workspace" } },
}

return M
