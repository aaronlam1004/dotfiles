local wezterm = require 'wezterm'

-- Imports
require("wez.commands")
require("wez.ui")
local Self = require("wez.self")
local Keys = require("wez.keys")
local Domains = require("wez.domains")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Self
Self.load(config)

-- Key Bindings
Keys.load(config)

-- Domains
Domains.load(config)
config.exec_domains = Domains.domains 

-- Return the configuration to WezTerm
return config
