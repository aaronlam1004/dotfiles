local wezterm = require 'wezterm'

-- Imports
local Macros = require("wez.macros")
local Backgrounds = require("wez.backgrounds")

local Keys = {}

function Keys.load(config)
  config.keys = {
    {
      key = 'M',
      mods = 'CTRL',
      action = Macros.input_action
    },
    {
      key = 'B',
      mods = 'CTRL',
      action = wezterm.action.InputSelector {
        action = Backgrounds.selection_callback,
        title = "Backgrounds",
        choices = Backgrounds.choices,
        fuzzy = true
      }
    }
  }
end

return Keys
