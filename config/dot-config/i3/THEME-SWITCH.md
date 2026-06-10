# Unified light/dark theme switch

One keystroke flips light/dark across the whole desktop. Built for the 6K /
i3 / X11 setup; gruvbox dark `#1d2021` ↔ gruvbox light hard `#f9f5d7`.

## TL;DR

- **Trigger:** `$mod+Shift+t` (i3 binding → `bin/theme-switch toggle`)
- **Brain:** [`bin/theme-switch`](bin/theme-switch) — one numbered step per surface,
  reads top-to-bottom. **If you remember one path, remember this one.**
- **State:** `~/.cache/theme-mode` holds the literal word `light` or `dark`.
  Written last by the script; read/watched by nvim. Runtime state, not in git.
- **Manual use:** `theme-switch [light|dark|toggle]` (default `toggle`).

## What it touches (per-surface)

| Surface | File / target | Mechanism |
|---|---|---|
| GTK + Chrome / Cursor / Slack / Obsidian | `gsettings org.gnome.desktop.interface color-scheme` | freedesktop **portal signal** — Chromium/Electron apps follow it, no per-app file |
| alacritty | `~/.config/alacritty/active.toml` → `themes/themes/{gruvbox_dark,gruvbox_light_hard}.toml` | symlink swap + `touch` the config to force live reload |
| i3 bar/borders | `~/.config/i3/theme.conf` → `theme-{dark,light}.conf` | symlink swap + `i3-msg reload` |
| rofi | `~/.config/rofi/active.rasi` → `rofi-{dark,light}.rasi` | symlink swap (read fresh on next rofi launch) |
| Claude Code TUI | `~/.claude/settings.json` `"theme"` value | `sed` to `{light,dark}-ansi` (ANSI variants draw from the terminal palette) |
| nvim | `lua/config/theme.lua` + `options.lua` + `autocmds.lua` | reads `~/.cache/theme-mode` at startup; libuv watcher flips `background` + repaints gruvbox **live** |
| Tilda | `~/.config/tilda/config_0..3` | `sed` gruvbox colors in, then `kill -9` + relaunch (see Tilda note) |

## Per-surface notes

### nvim (lives in `config/dot-config/nvim/lua/config/`)
- `theme.lua` — `read()` the state file, `apply()` background + re-source colorscheme,
  `watch()` a libuv fs_event on `~/.cache/theme-mode`.
- `options.lua` — initial `vim.o.background` comes from `read()` (not hardcoded).
- `autocmds.lua` — starts `watch()` on `VeryLazy`.
- Already-open nvim windows flip live; no restart needed.
- The **vscode-neovim embed inside Cursor** uses a separate runtime and does *not*
  load this config — Cursor is themed via the portal signal instead.

### Tilda
- Tilda has **no live reload** and **rewrites its config on every exit**, so a running
  instance clobbers the freshly-themed colors when it quits.
- The script therefore `kill -9`s any running Tilda (so it can't write its old config
  back) and relaunches the default instance (`config_0`) themed.
- Cost: whatever is running in the drop-down at toggle time is lost; only the default
  instance is relaunched, not custom-config ones.
- Colors are set with `scheme=0`/`palette_scheme=0` (Custom) + explicit 16-bit
  `back_*`/`text_*`/`palette` values (16-bit = 8-bit × 257), matching the alacritty theme.

### Claude Code
- `~/.claude/settings.json` is a symlink into a **separate repo** (`~/Repos/dot-claude`),
  which shows dirty after every toggle. The script edits the resolved real file.
- Theme is read at startup; apply a change in a running session via `/config` or restart.

## Files & repo layout

```
config/dot-config/i3/
  bin/theme-switch        ← orchestrator
  theme.conf              ← symlink (gitignored), → theme-dark.conf | theme-light.conf
  theme-dark.conf         ← i3 bar/border colors, dark
  theme-light.conf        ← i3 bar/border colors, light
  THEME-SWITCH.md         ← this file
config/dot-config/alacritty/
  active.toml             ← symlink (gitignored)
  themes/themes/gruvbox_{dark,light_hard}.toml   (themes/ is a nested gitignored repo)
config/dot-config/rofi/
  active.rasi             ← symlink (gitignored)
  rofi-{dark,light}.rasi
config/dot-config/nvim/lua/config/{theme,options,autocmds}.lua
local/dot-local/share/applications/*.desktop   ← HiDPI/dark launcher overrides (stow --dotfiles local)
```

**Gitignored runtime symlinks** (see `dotfiles/.gitignore`):
`i3/theme.conf`, `alacritty/active.toml`, `rofi/active.rasi`.

## History / the "why"

Each change has a commit message with reasoning:

```
git log --oneline -- config/dot-config/i3/bin/theme-switch
```

Milestones: `25fdbc5` initial toggle → `c904e38` rofi → `8ae4190`/`2d5aa21` Claude →
`d1165d6`/`d39656d` Tilda → `a9ca57b` nvim.

## Adding a new surface

1. Find the app's theme mechanism (config file, symlink-swappable theme, or it follows
   the portal `color-scheme` for free).
2. Add a numbered step in `bin/theme-switch` under the `case "$mode"` block.
3. Prefer **symlink swap + reload** (like alacritty/rofi/i3). Fall back to `sed` only for
   flat keyfiles. For apps that rewrite config on exit (like Tilda), kill+relaunch.
4. If the app can watch `~/.cache/theme-mode` itself (like nvim), that gives live flips
   without the script needing to know about it.
