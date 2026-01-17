-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- Connect to serial port command
local function connect_to_serial_115200(window, pane, line)
  if line then
    window:mux_window():spawn_tab({
      args = { "tio", line, "-b", "115200" } 
    })
  end
end

-- List of commands
local commands = {
  {
    brief = "Serial: Connect (Baud 115200)",
    icon = "md_serial_port",
    action = act.Multiple {
      act.PromptInputLine {
        description = "Connect to serial port",
        action = wezterm.action_callback(connect_to_serial_115200)
      }
    }
  }
}

return commands
