-- Follow the desktop light/dark toggle (~/.config/i3/bin/theme-switch).
-- That script writes "light" or "dark" to ~/.cache/theme-mode. We read it on
-- startup to pick the initial background, and watch the file so running nvim
-- instances flip live when the theme is toggled.
local M = {}

local uv = vim.uv or vim.loop
local cache = vim.env.XDG_CACHE_HOME or (vim.env.HOME .. "/.cache")
M.state = cache .. "/theme-mode"

-- Read the current mode; default to dark if the file is missing or garbage.
function M.read()
  local f = io.open(M.state, "r")
  if not f then
    return "dark"
  end
  local mode = (f:read("l") or ""):gsub("%s+", "")
  f:close()
  if mode ~= "light" and mode ~= "dark" then
    mode = "dark"
  end
  return mode
end

-- Apply the mode: flip background and re-source the active colorscheme so it
-- repaints for the new background (gruvbox has full light + dark variants).
function M.apply()
  local mode = M.read()
  vim.o.background = mode
  local scheme = vim.g.colors_name or "gruvbox"
  pcall(vim.cmd.colorscheme, scheme)
end

-- Watch the state file. theme-switch truncates it in place (echo > file), so a
-- plain fs_event on the file fires reliably; we re-arm defensively in case a
-- platform drops the watch after a write.
function M.watch()
  if uv.fs_stat(M.state) == nil then
    return
  end
  local handle = uv.new_fs_event()
  if not handle then
    return
  end
  local function arm()
    handle:start(
      M.state,
      {},
      vim.schedule_wrap(function()
        M.apply()
        pcall(function()
          handle:stop()
        end)
        arm()
      end)
    )
  end
  arm()
end

return M
