require("origami").setup {
  setupFoldKeymaps = false,
}
vim.keymap.set("n", "H",
  function()
    require("origami").h()
  end,
  {
    noremap = true,
    silent = true,
  }
)
vim.keymap.set("n", "L",
  function()
    require("origami").l()
  end,
  {
    noremap = true,
    silent = true,
  }
)
