return {
  {
    "williamboman/mason.nvim",
    config = true,
    opts = {
      ensure_installed = {
        "php-debug-adapter",
      },
    },
  },
}
