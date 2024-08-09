require("luasnip.session.snippet_collection").clear_snippets "lua"
local ls = require "luasnip"

-- local snippet = ls.s
-- local snippet_from_nodes = ls.sn

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
-- local d = ls.dynamic_node
-- local c = ls.choice_node
-- -- local f = ls.function_node
-- local fmt = require("luasnip.extras.fmt").fmt
--
local newline = function(text)
  return t { "", text }
end
--
-- local require_var = function(args, _)
--   local text = args[1][1] or ""
--   local split = vim.split(text, ".", { plain = true })
--
--   local options = {}
--   for len = 0, #split - 1 do
--     table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), "_")))
--   end
--
--   return snippet_from_nodes(nil, {
--     c(1, options),
--   })
-- end
--
ls.add_snippets("lua", {
  s("ignore", t "--stylua: ignore"),
  s("lf", {
    t "local ",
    i(1),
    t " = function(",
    i(2),
    t ")",
    newline "  ",
    i(0),
    newline "end",
  }),
  -- s("f", fmt("function({})\n  {}\nend", { i(1), i(0) })),
  -- s("req", fmt([[local {} = require("{}")]], { d(2, require_var, { 1 }), i(1) })),
  -- s("treq", fmt([[local {} = require("telescope.{}")]], { d(2, require_var, { 1 }), i(1) })),
})
