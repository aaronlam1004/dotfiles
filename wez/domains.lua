local wezterm = require 'wezterm'

-- Local --
-- Make domain function to use as execution domain
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


-- Module --
local Domains = {}

-- List of domains
Domains.domains = {}

-- Load domains
function Domains.load(config)
  local file, err = io.open("wez/.wez/domains.json", 'r')
  if file then
    local content = file:read("*all")
    -- wezterm.log_info(content)
    file:close()

    local data = wezterm.json_parse(content)
    for index, domain_info in ipairs(data) do
      table.insert(Domains.domains, wezterm.exec_domain(domain_info.alias, make_domain_func(domain_info.exec), domain_info.alias))
    end
  end
  config.exec_domains = Domains.domains 
end

return Domains
