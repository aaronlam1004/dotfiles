-- Pull in the wezterm API
local wezterm = require 'wezterm'

local domains = {}

-- Helper to make domain function
local function make_domain_func(exec)
  return function(cmd)
    local args = {}
    for index, arg in ipairs(exec) do
      table.insert(args, arg)
    end
    cmd.args = args
    return cmd
  end
end

-- Read domains
local file, err = io.open(".wez/domains.json", 'r')
if file then
  local content = file:read("*all")
  wezterm.log_info(content)
  file:close()

  local data = wezterm.json_parse(content)
  for index, domain_info in ipairs(data) do
    wezterm.log_info(domain_info.alias)
    wezterm.log_info(domain_info.exec)
    table.insert(domains, wezterm.exec_domain(domain_info.alias, make_domain_func(domain_info.exec), domain_info.alias))
  end
end

return domains
