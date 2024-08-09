local M = {}

local function get_folder_path(folder)
  local cwd = nil
  if require("user.helpers").string_starts(folder, "/") then
    cwd = folder
  else
    local application = require("user.helpers").get_application_name()
    cwd = "./" .. application .. "/" .. folder .. "/"
  end

  if not require("user.helpers").directory_exists(cwd) then
    return
  end
  return cwd
end

function M.define_symfony_find_file_keymap(mode, key, promt_title, folder, opts)
  local cwd = get_folder_path(folder)

  if not cwd then
    return
  end
  local command = "<cmd>lua require('telescope.builtin').find_files({ prompt_title='"
    .. promt_title
    .. "', cwd='"
    .. cwd
    .. "'})<CR>"
  vim.api.nvim_set_keymap(mode, key, command, opts)
end

function M.define_symfony_grep_keymap(mode, key, promt_title, folder, opts)
  local cwd = get_folder_path(folder)

  if not cwd then
    return
  end
  vim.keymap.set(mode, key, function()
    print("Searching in " .. cwd)
    require("telescope").extensions.live_grep_args.live_grep_args { prompt_title = promt_title, search_dirs = { cwd } }
  end, opts)
end

return M
