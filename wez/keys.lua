local wezterm = require 'wezterm'

-- Imports
local Macros = require("wez.macros")

local Keys = {}

function Keys.load(config)
  config.keys = {
    {
      key = 'M',
      mods = 'CTRL',
      action = Macros.input_action
    }
  }
end

return Keys
