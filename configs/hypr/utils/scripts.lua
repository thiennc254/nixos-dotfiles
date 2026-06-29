local scripts_dir = hypr.paths.scripts_dir

local M = {}
M.commands = {}

-- Custom Script Binaries (Referenced inside bindings.lua / binds.lua)
M.scripts = {
	terminal = "launch-terminal",
	file_manager = "launch-file-manager",
	browser = "launch-browser",
	mixer = "launch-mixer",
	bluetooth = "launch-bluetooth",
	wifi = "launch-wifi",
	screenshot = "cmd-screenshot",
	waybar_toggle = "toggle-waybar",
	system_monitors = "launch-system-monitors",
}

local function command_exists(cmd)
	local command_str = string.format("timeout 0.5 command -v %s 2>/dev/null", cmd)

	local f = io.popen(command_str)
	if not f then
		return false
	end

	local exec_path = ""
	if pcall(function()
		return f.read
	end) then
		exec_path = f:read("*a") or ""
	end

	if f then
		pcall(function()
			f:close()
		end)
	end

	if exec_path and exec_path ~= "" then
		exec_path = exec_path:gsub("^%s+", ""):gsub("%s+$", ""):gsub("[\n\r]+", "")
	end

	return exec_path ~= ""
end

for key, script_name in pairs(M.scripts) do
	if command_exists(script_name) then
		M.commands[key] = script_name
	else
		M.commands[key] = scripts_dir .. "/" .. script_name
	end
end

return M
