-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- =========================================================================
-- LINEAR WORKSPACE ROUTING SYSTEM
-- =========================================================================
local shared = hypr.shared

if shared and shared.workspaces then
	for _, ws in ipairs(shared.workspaces) do
		hl.workspace_rule({
			workspace = ws[1],
			monitor = ws[2],
			default = ws[3],
			persistent = ws[4],
		})
	end
end
