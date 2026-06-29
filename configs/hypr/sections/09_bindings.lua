-- =========================================================================
-- KEYBINDINGS EXECUTIVE ENGINE (UPDATED FOR OFFICIAL v0.55 SIGNATURE)
-- =========================================================================

-- 1. Execute static keybindings from centralized repository
if hypr.binds and hypr.binds.keybinds then
	for _, b in ipairs(hypr.binds.keybinds) do
		-- API Signature: hl.bind(keys, dispatcher, options)
		-- Format keys precisely using " + " delimiter according to official wiki
		local key_combo = (b[1] ~= "") and (b[1] .. " + " .. b[2]) or b[2]
		hl.bind(key_combo, b[3], b[4])
	end
end

-- 2. Generate dynamic Workspace loops (1 to 10)
local mod = hypr.shared.mainMod
for i = 1, 10 do
	local key = i % 10 -- Maps index 10 to physical key 0
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to Workspace " .. i })
	hl.bind(
		mod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move Window to Workspace " .. i }
	)
end

-- 3. Advanced Scratchpad (Special workspace management)
hl.bind(
	mod .. " + S",
	hl.dsp.workspace.toggle_special("magic"),
	{ description = "Toggle Special Workspace (Scratchpad)" }
)
hl.bind(
	mod .. " + SHIFT + S",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "Move Window to Special Workspace" }
)

-- 4. Advanced Tab Cycle (Multi-dispatch callback handler via Lambda)
hl.bind(mod .. " + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "Cycle and Focus Next Window (Alt-Tab style)" })

-- 5. Submap Definition: Window Resize Mode (Vim-keys)
hl.bind("ALT + R", hl.dsp.submap("resize"), { description = "Enter Window Resize Submap Mode (h/j/k/l)" })
hl.define_submap("resize", function()
	hl.bind(
		"l",
		hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
		{ repeating = true, description = "Expand Width (Right)" }
	)
	hl.bind(
		"h",
		hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
		{ repeating = true, description = "Shrink Width (Left)" }
	)
	hl.bind(
		"k",
		hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
		{ repeating = true, description = "Expand Height (Up)" }
	)
	hl.bind(
		"j",
		hl.dsp.window.resize({ x = 10, y = -10, relative = true }),
		{ repeating = true, description = "Shrink Height (Down)" }
	)
	hl.bind("escape", hl.dsp.submap("reset"), { description = "Exit Resize Submap Mode" })
end)
