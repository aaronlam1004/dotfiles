local wezterm = require 'wezterm'

-- Imports
local Macros = require("wez.macros")

local Commands = {}

wezterm.on("augment-command-palette", function(window, pane)
  return {
    {
      brief = "Macros",
      icon = "cod_debug_continue",
      action = Macros.input_action
    }
  }
end)

return Commands
