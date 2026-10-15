local wezterm = require 'wezterm'

-- Imports
local Macros = require("wez.macros")
local Backgrounds = require("wez.backgrounds")

local Commands = {}

function Commands.load()
  wezterm.on("augment-command-palette", function(window, pane)
    return {
      {
        brief = "Macros",
        icon = "cod_debug_continue",
        action = Macros.input_action
      },
      {
        brief = "Backgrounds",
        icon = "md_image",
        action = wezterm.action.InputSelector {
          action = Backgrounds.selection_callback,
          title = "Backgrounds",
          choices = Backgrounds.choices,
          fuzzy = true
        }
      }
    }
  end)
end

return Commands
