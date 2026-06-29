-- Refer to https://wiki.hypr.land/Configuring/Advanced-and-Cool/Systemd-and-UWSM/

-- =========================================================================
-- SYSTEM STARTUP INITIALIZATION (AUTOSTART ON WORKSPACE LAUNCH)
-- =========================================================================
hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm-app -- fcitx5 -d")
	-- hl.exec_cmd("uwsm-app -- waybar")
	-- hl.exec_cmd("uwsm-app -- mako")
	-- hl.exec_cmd("uwsm-app -- noctalia-shell")
	-- hl.exec_cmd("uwsm-app -- awww-daemon")
end)
