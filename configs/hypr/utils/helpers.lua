local M = {}

---@param match string|table
---@param effects table
M.window = function(match, effects)
	local spec = {
		match = {},
	}

	if type(match) == "string" then
		spec.match.class = match
	else
		for key, value in pairs(match) do
			spec.match[key] = value
		end
	end

	if effects then
		for key, value in pairs(effects) do
			spec[key] = value
		end
	end

	hl.window_rule(spec)
end

M.alpha_rgba = function(rgb_str, alpha)
	-- Tìm chuỗi hex bên trong dấu ngoặc của rgb(...)
	local hex = rgb_str:match("rgb%((%x+)%)")
	if hex then
		-- Trả về đúng cấu trúc bạn vừa test thành công: rgba(HEX + ALPHA)
		return "rgba(" .. hex .. alpha .. ")"
	end
	return rgb_str
end

return M
