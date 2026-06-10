-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.termguicolors = true
-- Initial background follows the desktop light/dark toggle (~/.cache/theme-mode);
-- the live watcher is started from autocmds.lua. See lua/config/theme.lua.
vim.o.background = require("config.theme").read()
