-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Autofocus features (Not mouse autofocus or sloppy mode) Like:
-- *)automatically focus preused client when moving between tags.
require("awful.autofocus")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
require("beautiful").init(require("theme/theme"))

-- GLOBAL variables. Variables are sourced from main/user-variables.lua file.
local _G = {}
_G.variables = require("main.user-variables")
terminal = _G.variables.terminal
editor = _G.variables.editor
editor_cmd = _G.variables.editor_cmd
modkey = _G.variables.modkey
layouts = _G.variables.layouts
-- }}}


require("wibar")

require("bindings.global")
require("bindings.client")

require("main.error-handling")
require("main.rules")
require("main.signals")
