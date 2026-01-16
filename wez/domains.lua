-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Helper method to get label from domain name
local function get_label(domain_name)
  return domain_name
end

-- Example execution command
local function cmd_exec(cmd)
  local args = {}
  cmd.args = args
  return cmd
end

-- Add custom domains here
local domains = {
  -- wezterm.exec_domain("cmd-exec", cmd_exec, get_label)
}

return domains
