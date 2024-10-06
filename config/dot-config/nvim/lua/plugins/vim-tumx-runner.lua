return {
  "christoomey/vim-tmux-runner",
  lazy = false,
  config = function()
    -- VTR configuration
    vim.g.VtrCommand = "snowsql -c logitech"

    -- Key mappings
    vim.keymap.set('n', '<leader>sr', ':VtrSendLinesToRunner<CR>', { desc = "Send lines to runner" })
    vim.keymap.set('v', '<leader>sr', ':VtrSendLinesToRunner<CR>', { desc = "Send selected lines to runner" })
    vim.keymap.set('n', '<leader>or', ':VtrOpenRunner<CR>', { desc = "Open runner" })
    vim.keymap.set('n', '<leader>kr', ':VtrKillRunner<CR>', { desc = "Kill runner" })
    vim.keymap.set('n', '<leader>fr', ':VtrFocusRunner<CR>', { desc = "Focus runner" })
    vim.keymap.set('n', '<leader>dr', ':VtrDetachRunner<CR>', { desc = "Detach runner" })
    vim.keymap.set('n', '<leader>ar', ':VtrReattachRunner<CR>', { desc = "Reattach runner" })
    vim.keymap.set('n', '<leader>cr', ':VtrClearRunner<CR>', { desc = "Clear runner" })
    vim.keymap.set('n', '<leader>fc', ':VtrFlushCommand<CR>', { desc = "Flush command" })
    
    -- New keymap to open runner
    vim.keymap.set('n', '<leader>ro', ':VtrOpenRunner<CR>', { desc = "Open runner" })
  end,
}
