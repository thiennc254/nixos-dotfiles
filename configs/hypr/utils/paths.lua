local M = {}

-- =========================================================================
-- CENTRAL PATH RESOURCE REPOSITORY (Data-Driven Paths)
-- =========================================================================
-- Core System Base Directories
M.home = os.getenv("HOME")
M.config_dir = M.home .. "/.config/hypr"
M.dotfiles_dir = M.home .. "/dotfiles"
M.scripts_dir = M.home .. "/.local/bin"

-- Sub-configuration Directories
M.apps_dir = M.config_dir .. "/apps"
M.utils_dir = M.config_dir .. "/utils"
M.sections_dir = M.config_dir .. "/sections"

-- Asset & Multimedia Paths
M.wallpaper = M.dotfiles_dir .. "/background/azty.png"

return M
