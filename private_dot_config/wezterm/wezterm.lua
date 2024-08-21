local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "Tokyo Night"
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = {"powershell"}
else
  config.default_prog = {"bash"}
end
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
