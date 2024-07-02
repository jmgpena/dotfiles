local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "Tokyo Night"
config.default_prog = {"powershell"}
config.font = wezterm.font("Cascadia Mono NF")
config.font_size = 11.0
config.keys = {
  {
    key = 'P',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  }
}

return config
