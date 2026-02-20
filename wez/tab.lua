-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Processes
local processes = {
  ["cmd"] = "cmd",
  ["powershell"] = "cmd",
  ["nvim"] = "nvim",
  ["docker"] = "docker"
}

-- Icons
local icons = {
  ["terminal"] = wezterm.nerdfonts.dev_terminal,
  ["nvim"] = wezterm.nerdfonts.dev_vim,
  ["docker"] = wezterm.nerdfonts.linux_docker
}

-- Get process name from full process name
local function get_process(tab)
  local process = tab.active_pane.foreground_process_name:match("([^/\\]+)%.exe$") or
                  tab.active_pane.foreground_process_name:match("([^/\\]+)$")
  process = processes[process] or processes["cmd"]
  return process
end

-- Get icon from process
local function get_process_icon(process)
  local icon = icons[process] or icons["terminal"]
  return icon
end

-- Format tab in terminal
local function format_tab(tab, tabs, pane, config, hover, max_width)
  local process = get_process(tab)
  local icon = get_process_icon(process)
  return wezterm.format({
    { Text = icon .. " " .. process .. "@aaron" },
    -- { Text = process },
    -- { Text = "@aaron" },
  })
end

return format_tab
