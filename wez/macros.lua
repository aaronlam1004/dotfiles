local wezterm = require 'wezterm'

-- Module --
local Macros = {}

-- Choices for the macros
Macros.choices = {}
Macros.macros = {}

-- Trigger macro call
wezterm.on("macro-trigger", function(window, pane, exec)
  pane:send_text(exec .. "\r\n")
end)

-- Custom action callback for macros
Macros.selection_callback = wezterm.action_callback(function(window, pane, id, label)
  local exec = Macros.macros[label].exec
  local args = Macros.macros[label].args
  if args and #args > 0 then
    window:perform_action (
      wezterm.action.PromptInputLine {
        description = exec .. " (" .. table.concat(args, ",") .. ")",
        action = wezterm.action_callback(function(inner_window, inner_pane, line)
          local words = {}
          for word in string.gmatch(line, "([^,]+)") do
            table.insert(words, word)
          end 

          if #args == #words then
            for index = 1, #words do
              exec = string.gsub(exec, args[index], words[index]) 
            end
          end
          wezterm.emit("macro-trigger", window, pane, exec)
        end)
    }, pane) 
  else
    wezterm.emit("macro-trigger", window, pane, exec)
  end
end)

-- Load macros from file
function Macros.load()
  local file, err = io.open(".wez/macros.json", 'r')
  if file then
    local content = file:read("*all")
    -- wezterm.log_info(content)
    file:close()

    local data = wezterm.json_parse(content)
    for index, macro_info in ipairs(data) do
      local choice = {
        label = macro_info.alias,
      }
      table.insert(Macros.choices, choice)

      local macro = {
        exec = macro_info.exec,
        args = macro_info.args
      }
      Macros.macros[macro_info.alias] = macro
    end
  end
end

Macros.load()
Macros.input_action = wezterm.action.InputSelector {
  action = Macros.selection_callback,
  title = "Macros",
  choices = Macros.choices,
  fuzzy = true
}

return Macros
