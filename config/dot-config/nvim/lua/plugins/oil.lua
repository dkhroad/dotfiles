return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional: Load the plugin immediately if you have "vim.g.loaded_netrw = 1" in your config
    -- lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
