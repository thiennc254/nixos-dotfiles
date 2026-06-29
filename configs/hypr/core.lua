local M = {}

_G.hypr = {}

setmetatable(_G.hypr, {
	__index = function(table, key)
		local success, module = pcall(require, "utils." .. key)
		if success then
			rawset(table, key, module)
			return module
		end
		return nil
	end,
})

function M.boot()
	local config_dir = hypr.paths.sections_dir
	local handle = io.popen('ls "' .. config_dir .. '" | grep "\\.lua$" | grep -v "init.lua"')
	if handle then
		for file in handle:lines() do
			local module_name = file:sub(1, -5)
			require("sections." .. module_name)
		end
		handle:close()
	end
end

return M
