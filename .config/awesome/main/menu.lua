-- Main library
local awful = require("awful")
local beautiful = require("beautiful")

-- Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
  -- { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}
local power = {
  { "suspend", function () awful.spawn("systemctl suspend") end },
  { "logout", function () awful.spawn.with_shell("pkill -KILL -u $USER") end },
  { "lock", function () awful.spawn("i3lock-fancy -f Liberation-Mono-Bold") end },
  { "hibernate", function () awful.spawn("systemctl hibernate") end },
  { "suspend then hibernate", function () awful.spawn("systemctl hibrid-sleep") end },
  { "reboot", function () awful.spawn("systemctl reboot") end },
  { "shutdown", function () awful.spawn("systemctl poweroff") end }
}

local mymainmenu = awful.menu({ 
  items = { 
    { "awesome", myawesomemenu, beautiful.awesome_icon }, 
    { "power", power } 
  } 
})

return mymainmenu
