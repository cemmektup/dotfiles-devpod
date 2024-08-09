local M = {}

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"

---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

---Get the full path to `$VIM_RUNTIME_DIR`
---@return string
function _G.get_runtime_dir()
  local lvim_runtime_dir = os.getenv "VIM_RUNTIME_DIR"
  if not lvim_runtime_dir then
    -- when nvim is used directly
    return vim.fn.stdpath "data"
  end
  return lvim_runtime_dir
end

---Get the full path to `$VIM_CONFIG_DIR`
---@return string
function _G.get_config_dir()
  local lvim_config_dir = os.getenv "VIM_CONFIG_DIR"
  if not lvim_config_dir then
    return vim.fn.stdpath "config"
  end
  return lvim_config_dir
end

---Get the full path to `$VIM_CACHE_DIR`
---@return string
function _G.get_cache_dir()
  local lvim_cache_dir = os.getenv "VIM_CACHE_DIR"
  if not lvim_cache_dir then
    return vim.fn.stdpath "cache"
  end
  return lvim_cache_dir
end

---Initialize the `&runtimepath` variables and prepare for startup
---@return table
function M:init(base_dir)
  self.runtime_dir = get_runtime_dir()
  self.config_dir = get_config_dir()
  self.cache_dir = get_cache_dir()
  self.pack_dir = join_paths(self.runtime_dir, "site", "pack")
  self.packer_install_dir = join_paths(self.runtime_dir, "site", "pack", "packer", "start", "packer.nvim")
  self.packer_cache_path = join_paths(self.config_dir, "plugin", "packer_compiled.lua")

  ---Get the full path to LunarVim's base directory
  ---@return string
  function _G.get_vim_base_dir()
    return base_dir
  end

  vim.fn.mkdir(get_cache_dir(), "p")

  return self
end

return M

