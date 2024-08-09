require("neotest").setup {
  adapters = {
    require "neotest-phpunit" {
      filter_dirs = { "vendor" },
      phpunit_cmd = function()
        return "vendor/bin/phpunit"
      end,
    },
  },
}
