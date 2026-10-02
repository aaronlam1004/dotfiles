local wezterm = require 'wezterm'

-- Local --

-- Module --
local Macros = {}

-- Choices for the macros
Macros.choices = {}

-- Custom action callback for macros
Macros.selection_callback = wezterm.action_callback(function(window, pane, id, label)
  pane:send_text(id .. "\r\n")
end)

function Macros.load_macros()
  local file, err = io.open(".wez/macros.json", 'r')
  if file then
    local content = file:read("*all")
    wezterm.log_info(content)
    file:close()

    local data = wezterm.json_parse(content)
    for index, macro_info in ipairs(data) do
      local choice = {
        label = macro_info.alias,
        id = macro_info.exec
      }
      table.insert(Macros.choices, choice)
    end
  end

end

return Macros
