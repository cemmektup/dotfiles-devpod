if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
  return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

vim.snippet.expand = ls.lsp_expand

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.active = function(filter)
  filter = filter or {}
  filter.direction = filter.direction or 1

  if filter.direction == 1 then
    return ls.expand_or_jumpable()
  else
    return ls.jumpable(filter.direction)
  end
end

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.jump = function(direction)
  if direction == 1 then
    if ls.expandable() then
      return ls.expand_or_jump()
    else
      return ls.jumpable(1) and ls.jump(1)
    end
  else
    return ls.jumpable(-1) and ls.jump(-1)
  end
end

vim.snippet.stop = ls.unlink_current

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  override_builtin = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/user/snips/ft/*.lua", true)) do
  loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
end, { silent = true })

-- -- <c-k> is my expansion key
-- -- this will expand the current item or jump to the next item within the snippet.
-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump()
--   end
-- end, { silent = true })
--
-- -- <c-j> is my jump backwards key.
-- -- this always moves to the previous item within the snippet
-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
--   if ls.jumpable(-1) then
--     ls.jump(-1)
--   end
-- end, { silent = true })
--
-- -- <c-l> is selecting within a list of options.
-- -- This is useful for choice nodes (introduced in the forthcoming episode 2)
-- vim.keymap.set("i", "<C-l>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end)
--
-- vim.keymap.set("i", "<C-u>", require "luasnip.extras.select_choice")
--
-- -- shorcut to source my luasnips file again, which will reload my snippets
-- -- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
-- -- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/ck/snips/init.lua<CR>")
