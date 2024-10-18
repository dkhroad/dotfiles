return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {},
  config = function(_, opts)
    require("solarized").setup(opts)
    vim.cmd.colorscheme("solarized")
  end,
}
