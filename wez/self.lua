local wezterm = require 'wezterm'

local Backgrounds = require("wez.backgrounds")

local Self = {}

-- Start maximized
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Load self configurations
function Self.load(config)
  -- [Font]
  config.font = wezterm.font("MesloLGM Nerd Font Mono", { weight = "Regular" })
  config.font_size = 11

  -- [Color Scheme]
  config.color_scheme = "Kanagawa (Gogh)"

  -- [Tabs
  config.tab_bar_at_bottom = true

  -- [Appearance]
  config.window_background_opacity = 1.0
  config.background = Backgrounds.load("wez/.wez/wallpapers/tanjiro-kamado.jpg")
end

return Self
