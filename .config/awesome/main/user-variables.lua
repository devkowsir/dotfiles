local awful = require("awful")
local vars = {
  terminal = "alacritty",
  editor = "nvim",
  modkey = "Mod4",
  layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
    awful.layout.suit.centermaster,
    awful.layout.suit.floating
  }
}
vars.editor_cmd = vars.terminal .. " -e " .. vars.editor
-- In Desktop Environment, windows can be tiled by dragging them 
-- to the edge. This is called snapping.
-- Disable Screen Snapping
awful.mouse.snap.edge_enabled = false

return vars
