local wezterm = require 'wezterm'

local Self = {}

-- Start maximized
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Load self configurations
function Self.load(config)
  -- [Font]
  config.font = wezterm.font "SF Mono"
  config.font_size = 11

  -- [Color Scheme]
  config.color_scheme = "Kanagawa (Gogh)"

  -- [Tabs]
  config.tab_bar_at_bottom = true

  -- [Appearance]
  config.window_background_opacity = 0.95
end

return Self
