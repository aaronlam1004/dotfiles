-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Helper method to get label from domain name
local function get_label(domain_name)
  return domain_name
end

-- PowerShell Domain
local function powershell_domain(cmd)
  local args = { "powershell" }
  cmd.args = args
  return cmd
end

-- Visual Studio Compiler (x64)
local function vcvars64_domain(cmd)
  local args = { "cmd.exe", "/k", "vcvars64" }
  cmd.args = args
  return cmd
end

-- Add custom domains here
local domains = {
  wezterm.exec_domain("PowerShell", powershell_domain, get_label),
  wezterm.exec_domain("Visual Studio Compiler (x64)", vcvars64_domain, get_label)
}

return domains
