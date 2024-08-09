return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "onsails/lspkind-nvim" },
    { "saadparwaiz1/cmp_luasnip",    dependencies = { "L3MON4D3/LuaSnip" } },
    { "tamago324/cmp-zsh" },
    { "rafamadriz/friendly-snippets" },
}

--         'hrsh7th/cmp-cmdline',
--         'hrsh7th/cmp-nvim-lsp-document-symbol'
