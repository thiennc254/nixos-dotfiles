-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local helper = hypr.helpers

-- =========================================================================
-- 1. HARDCODED SYSTEM FIXES
-- =========================================================================

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

-- =========================================================================
-- 2. WINDOW RULES AUTOMATION ENGINE (CONSUMES DATA FROM UTILS/APPS.LUA)
-- =========================================================================
if hypr.apps and hypr.apps.rules then
	for _, rule in ipairs(hypr.apps.rules) do
		local match, effects = rule[1], rule[2]
		helper.window(match, effects)
	end
end

-- =========================================================================
-- 3. LAYER RULES AUTOMATION ENGINE (CONSUMES DATA FROM UTILS/APPS.LUA)
-- =========================================================================
if hypr.apps and hypr.apps.layer_rules then
	for _, layer_data in ipairs(hypr.apps.layer_rules) do
		local spec = {
			match = {},
		}

		for key, value in pairs(layer_data) do
			if key == "namespace" then
				spec.match.namespace = value
			else
				spec[key] = value
			end
		end

		hl.layer_rule(spec)
	end
end
