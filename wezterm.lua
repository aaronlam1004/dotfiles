-- Imports
local domains = require("wez.domains")
local commands = require("wez.commands")
local format_tab = require("wez.tab")

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

-- [Tabs]
config.tab_bar_at_bottom = true

-- Tab Bar Styling
wezterm.on("format-tab-title", format_tab)

-- Appearance (Windows)
config.window_background_opacity = 0.90

-- Domains
config.exec_domains = domains

-- Commands
local act = wezterm.action
wezterm.on("augment-command-palette", function(window, pane)
  return commands
end)

-- Return the configuration to WezTerm
return config
