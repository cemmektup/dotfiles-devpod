local M = {}

M.config = {

  twig = {
    command = { "make", "yarn/'prettier templates/*/**/file_name --write'" },
  },
  php = {
    command = {
      "/tools/php-cs-fixer/vendor/bin/php-cs-fixer",
      "fix /srv/app/*/**/file_name --config=/srv/app/.php-cs-fixer.dist.php",
    },
  },
}

M.format_on_save = function()
  local file_name = vim.fn.expand "%:t"
  local filetype = vim.bo.filetype

  local config = M.config[filetype]
  if config == nil or config.command == nil then
    return
  end

  local commands = {}
  table.insert(commands, "FloatermNew --autoclose=0 --width=0.8 --height=0.8")
  for _, command in ipairs(config.command) do
    local new_command = string.gsub(command, "file_name", file_name)
    table.insert(commands, new_command)
  end
  local command = table.concat(commands, " ")
  vim.cmd(command)
end

vim.api.nvim_create_user_command("FormatFile", M.format_on_save, {})

return M
