local wezterm = require 'wezterm'

local Ui = {}

local BACKGROUND_ACTIVE_COLOR <const> = "#1B3C53"
local BACKGROUND_HOVER_COLOR <const> = "#456882"
local FOREGROUND_ACTIVE_COLOR <const> = "#D2C1B6"
local TRANSPARENT_COLOR <const> = "rgba(0, 0, 0, 0)"

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
  local process_info = processes[process] or processes["cmd"]
  local title = process_info.icon .. " " .. process_info.alias .. "@aaron"
  if process_info.alias == "docker" then
    title = process_info.icon .. " " .. tab.active_pane.title
  end

  title = " " .. title .. " "
  if utf8.len(title) > max_width then
    title = wezterm.truncate_right(title, max_width - 3) .. "..."
  end

  local BASE_TAB <const> = {
    { Background = { Color = TRANSPARENT_COLOR } },
    { Text = title }
  }

  local formatted_tab = BASE_TAB
  if tab.is_active then
    formatted_tab = {
      { Background = { Color = BACKGROUND_ACTIVE_COLOR } },
      { Foreground = { Color = FOREGROUND_ACTIVE_COLOR } },
      { Text =  title },
    }
  elseif hover then
    formatted_tab = {
      { Background = { Color = BACKGROUND_ACTIVE_COLOR } },
      { Foreground = { Color = FOREGROUND_ACTIVE_COLOR } },
      { Text =  title },
    }
  end
  return wezterm.format(formatted_tab)
end

function Ui.load(config)
  config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  }
  config.colors = {
    tab_bar = {
      background = TRANSPARENT_COLOR
    }
  }
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_bar_at_bottom = true
  wezterm.on("format-tab-title", format_tab)
end

return Ui
