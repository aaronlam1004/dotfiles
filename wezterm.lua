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
config.font = wezterm.font "SF Mono"
config.font_size = 11

-- [Color Scheme]
config.color_scheme = "Kanagawa (Gogh)"

-- [Tabs]
config.tab_bar_at_bottom = true

-- Tab Bar Styling
wezterm.on("format-tab-title", format_tab)

-- Appearance (Windows)
config.window_background_opacity = 0.95

-- Domains
config.exec_domains = domains

-- Commands
local act = wezterm.action
wezterm.on("augment-command-palette", function(window, pane)
  return commands
end)

-- Key Bindings
config.keys = {
  {
    key = 'm',
    mods = 'CTRL',
    action = wezterm.action.InputSelector {
      action = wezterm.action_callback(function(window, pane, id, label)
        pane:send_text(id .. "\r\n")
      end),
      title = "Macro",
      choices = {
        {
          label = "ls",
          id = "ls"
        },
        {
          label = "ls -la",
          id = "ls -la"
        }
      }
    }
  }
}

-- Return the configuration to WezTerm
return config
