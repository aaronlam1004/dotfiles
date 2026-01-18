-- Imports
local domains = require("wez.domains")
local commands = require("wez.commands")

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
config.color_scheme = "Catppuccin Mocha"

-- [Shell]

-- [Tabs]
config.tab_bar_at_bottom = true

-- [Tab Bar]
-- Icons
local TERMINAL = wezterm.nerdfonts.dev_terminal

-- Tab Bar Styling
wezterm.on("format-tab-title", function(tab, tabs, pane, config, hover, max_width)
  return wezterm.format({
    { Text = TERMINAL },
    { Text = "  aaron@AL" },
  })
end)

-- Appearance (Windows)
config.window_background_opacity = 0.85
config.win32_system_backdrop = 'Acrylic'

-- Domains
config.exec_domains = domains

-- Commands
local act = wezterm.action
wezterm.on("augment-command-palette", function(window, pane)
  return commands
end)

-- Return the configuration to WezTerm
return config
