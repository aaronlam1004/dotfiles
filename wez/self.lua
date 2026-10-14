local wezterm = require 'wezterm'

local Self = {}

-- Start maximized
wezterm.on('gui-startup', function(cmd)
  -- local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  -- window:gui_window():maximize()
end)

-- Load self configurations
function Self.load(config)
  -- [Font]
  config.font = wezterm.font "JetBrainsMono Nerd Font"
  config.font_size = 11

  -- [Color Scheme]
  config.color_scheme = "Kanagawa (Gogh)"

  -- [Tabs
  config.tab_bar_at_bottom = true

  -- [Appearance]
  config.window_background_opacity = 1.0
  config.background = {
    {
      source = {
        File = "wez/.wez/wallpapers/satoru-gojo-neon.png"
      },
      hsb = {
        brightness = 0.05
      },
      width = "100%",
      height = "100%",
      repeat_x = "NoRepeat",
      repeat_y = "NoRepeat"
    }
  }
end

return Self
