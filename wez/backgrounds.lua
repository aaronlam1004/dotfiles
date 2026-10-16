local wezterm = require 'wezterm'

-- Module --
local Backgrounds = {}

-- Choices for the backgrounds
Backgrounds.choices = {}

Backgrounds.selection_callback = wezterm.action_callback(function(window, pane, id, label)
  local overrides = window:get_config_overrides() or {}
  overrides.background = Backgrounds.load(label)
  window:set_config_overrides(overrides)
end)

function Backgrounds.load(wallpaper)
  if wallpaper == "None" then
    return {}
  end
  return {
    {
      source = {
        File = wallpaper
      },
      hsb = {
        brightness = 0.05
      },
      repeat_x = "NoRepeat",
      repeat_y = "NoRepeat"
    }
  }
end

-- List backgrounds from folder 
function Backgrounds.list(wallpapers)
  for index, wallpaper in ipairs(wallpapers) do
    local choice = { label = wallpaper }
    table.insert(Backgrounds.choices, choice)
  end
  table.insert(Backgrounds.choices, { label = "None" })
end
 
return Backgrounds
