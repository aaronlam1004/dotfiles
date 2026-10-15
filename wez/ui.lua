local wezterm = require 'wezterm'

local Ui = {}

-- Processes (name, icon)
local processes = {
  ["cmd"]    = { alias = "cmd", icon = wezterm.nerdfonts.dev_terminal },
  ["nvim"]   = { alias = "nvim", icon = wezterm.nerdfonts.dev_vim },
  ["docker"] = { alias = "docker", icon = wezterm.nerdfonts.linux_docker }
}

-- Get process name from full process name
local function get_process(tab)
  local process = tab.active_pane.foreground_process_name:match("([^/\\]+)%.exe$") or
                  tab.active_pane.foreground_process_name:match("([^/\\]+)$")
  return process
end

-- Format tab in terminal
local function format_tab(tab, tabs, pane, config, hover, max_width)
  local process = get_process(tab)
  local process_info = processes[process] or process["cmd"]
  local title = process_info.icon .. " " .. process_info.alias .. "@aaron"
  if process_info.alias == "docker" then
    title = process_info.icon .. " " .. tab.active_pane.title
  end
  return wezterm.format({
    { Text = title },
  })
end

function Ui.load(config)
  config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  }
  config.hide_tab_bar_if_only_one_tab = true
  wezterm.on("format-tab-title", format_tab)
end

return Ui
