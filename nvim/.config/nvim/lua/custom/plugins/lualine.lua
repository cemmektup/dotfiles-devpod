return {
{
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'catppuccin',
        theme = 'vscode',
        component_separators = '|',
        section_separators = '',
      },
    },
  }
}
