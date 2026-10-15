local wezterm = require 'wezterm'

-- Imports
local Self = require("wez.self")
local Keys = require("wez.keys")
local Domains = require("wez.domains")
local Backgrounds = require("wez.backgrounds")
local Commands = require("wez.commands")
local Ui = require("wez.ui")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Self
Self.load(config)

-- Domains
Domains.load(config)
config.exec_domains = Domains.domains

-- Backgrounds
local wallpapers = wezterm.glob("wez/.wez/wallpapers/*")
Backgrounds.list(wallpapers)

-- Key Bindings
Keys.load(config)

-- Commands
Commands.load()

-- UI
Ui.load(config)

-- Return the configuration to WezTerm
return config
