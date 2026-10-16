local wezterm = require 'wezterm'

local Ui = {}

local BACKGROUND_ACTIVE_COLOR <const> = "rgba(56, 150, 70, 1)"
local BACKGROUND_HOVER_COLOR <const> = "rgba(56, 150, 70, 0.5)"
local FOREGROUND_ACTIVE_COLOR <const> = "#FFFFFF"
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

  local BASE_TAB <const> = {
    { Background = { Color = TRANSPARENT_COLOR } },
    { Text = title }
  }

  local formatted_tab = {}
  if tab.is_active or hover then
    local background_color = BACKGROUND_ACTIVE_COLOR
    if hover then
      background_color = BACKGROUND_HOVER_COLOR
    end

    local FORMATTED_TAB_START <const> = {
      { Background = { Color = TRANSPARENT_COLOR } },
      { Foreground = { Color = background_color } },
      { Text = wezterm.nerdfonts.ple_pixelated_squares_big_mirrored },
    }

    local FORMATTED_TAB_TITLE <const> = {
      { Background = { Color = background_color } },
      { Foreground = { Color = FOREGROUND_ACTIVE_COLOR } },
      { Text =  title },
    }

    local FORMATTED_TAB_END <const> = {
      { Background = { Color = TRANSPARENT_COLOR } },
      { Foreground = { Color = background_color } },
      { Text = wezterm.nerdfonts.ple_pixelated_squares_big }
    }

    if tab.tab_index > 0 then
      table.move(FORMATTED_TAB_START, 1, #FORMATTED_TAB_START, #formatted_tab + 1, formatted_tab)
    end
    table.move(FORMATTED_TAB_TITLE, 1, #FORMATTED_TAB_TITLE, #formatted_tab + 1, formatted_tab)
    if tab.tab_index < #tabs - 1 then
      table.move(FORMATTED_TAB_END, 1, #FORMATTED_TAB_END, #formatted_tab + 1, formatted_tab)
    end
  else
    formatted_tab = BASE_TAB
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
