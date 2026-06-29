-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
-- and https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

-- =========================================================================
-- 1. MAIN INPUT DEVICES & GESTURES ARCHITECTURE (MONOLITHIC CONFIG)
-- =========================================================================
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
