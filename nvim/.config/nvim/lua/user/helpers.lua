local M = {}

function M.string_starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

function M.directory_exists(sPath)
  if type(sPath) ~= "string" then return false end

  local response = os.execute("cd " .. sPath)
  if response == 0 then
    return true
  end
  return false
end

-- check if the file exists and is readable
function M.file_exists(path)
  local file = io.open(path, "rb")
  if file then file:close() end
  return file ~= nil
end

function M.get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

function M.get_project_name()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

function M.get_application_name()
  local projects = {}
  projects["tina"] = "app"
  projects["ovam"] = "app"
  projects["lva"] = "bundle"
  if projects[M.get_project_name()] == nil then
    return "."
  end
  return projects[M.get_project_name()]
end

return M
