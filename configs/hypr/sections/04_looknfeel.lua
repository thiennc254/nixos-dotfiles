-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
-- and layout documentations: Dwindle, Master, Scrolling

-- =========================================================================
-- 1. MAIN SYSTEM CONFIGURATION GRAPH (MONOLITHIC INJECTION)
-- =========================================================================
local helpers = hypr.helpers
local noctalia = require("noctalia")

-- noctalia.apply_theme()

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 8,
		border_size = 2,

		col = {
			-- active_border = helpers.alpha_rgba(noctalia.colors.primary, "cc"),
			active_border = "rgba(ccccccaa)",
			inactive_border = helpers.alpha_rgba(noctalia.colors.surface, "ff"),
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
			xray = false,
			ignore_opacity = true,
			new_optimizations = true,
			brightness = 1.0,
			contrast = 1.0,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},
})

-- =========================================================================
-- 2. ANIMATION TIMING CURVES & SPRINGS (BEZIER / SPRING DEFINITIONS)
-- =========================================================================
-- Standard Bezier Curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })

-- Physical Spring Models
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- =========================================================================
-- 3. ANIMATION LEAF SUBSCRIPTIONS (RENDER ENGINE ROUTING)
-- =========================================================================
hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 4, bezier = "easeOutQuint" })

hl.animation({ leaf = "windows", enabled = true, speed = 5, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.5, spring = "easy", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "popin 85%" })

hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })

hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "almostLinear" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 4.5, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 4, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4, bezier = "almostLinear", style = "fade" })

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6, bezier = "quick" })
