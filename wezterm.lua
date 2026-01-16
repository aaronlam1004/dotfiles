-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- [Geometry]
config.initial_cols = 120
config.initial_rows = 28

-- [Font]
config.font_size = 10

-- [Color Scheme]

-- [Shell]

-- [Tabs]
config.tab_bar_at_bottom = true

-- [Tab Bar]
-- Icons
local SOlID_LEFT_ARROW = wezterm.nerdfonts.pl_right_divider
local SOlID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_divider
local process_icons = {
  ['bash'] = wezterm.nerdfonts.dev_terminal
}

-- Tab Bar Styling
wezterm.on("format-tab-title", function(tab, tabs, pane, config, hover, max_width)
  return wezterm.format({
    { Text = wezterm.nerdfonts.dev_terminal },
    { Text = "  aaron@AL" }
  })
end)

-- Appearance (Windows)
config.window_background_opacity = 0.85
config.win32_system_backdrop = 'Acrylic'

-- Domains
local domains = require("wez.domains")
config.exec_domains = domains

-- Return the configuration to WezTerm
return config
