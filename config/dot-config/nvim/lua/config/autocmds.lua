-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Live-follow the desktop light/dark toggle: watch ~/.cache/theme-mode and flip
-- background when it changes. See lua/config/theme.lua.
require("config.theme").watch()

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankToNetcat", { clear = true }),
  callback = function()
    -- Get the yanked text
    local yanked_text = vim.fn.getreg("0")
    -- Create and execute the shell command
    local cmd = string.format("echo '%s' | nc -q1 localhost 2224", yanked_text:gsub("'", "'\\''"))
    vim.fn.system(cmd)
  end,
})
