local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = require("bindings.client"),
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.centered
    }
  },

  -- Floating clients.
  { rule_any = {
    instance = {
     "DTA",
     "copyq",   --[[ Firefox addon DownThemAll.]] 
     "pinentry",  --[[ Includes session name in class.]]
     "pavucontrol",
     "NoiseTorch",
     "lxappearance",
     "catfish",
     "xdman-Main"
   },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin",--[[ kalarm.]]
      "Sxiv",
      --Needs a fixed window size to avoid fingerprinting by screen size for tor.
      "Tor Browser",
      "Wpa_gui",
      "veromix",
      "xtightvncviewer",
      "VirtualBox Manager",
      "Anydesk"
    },
    name = { "Event Tester" --[[ xev]] }, 
    role = {
      "AlarmWindow", --[[ Thunderbird's calendar.]]
      "ConfigManager", --[[ Thunderbird's about:config.]]
      "pop-up", --[[ e.g. Google Chrome's (detached) Developer Tools.]]
    }
    },
    properties = { floating = true, placement = awful.placement.centered }
  },
  {
    rule = { class = "firefox" },
    properties = { tag = "2", maximized = true}
  },
  {
    rule = { instance = "brave-browser" },
    properties = { tag = "2", maximized = true}
  },
  {
    rule = { instance = "gl" ,class = "mpv" },
    properties = { tag = "4", maximized = true }
  },
  {
    rule = { instance = "notepad" },
    properties = { placement = awful.placement.centered, floating = true }
  },
  {
    rule = { instance = "floatterm" },
    properties = { placement = awful.placement.centered, floating = true }
  },
  {
    rule = { instance = "calculator" },
    properties = { placement = awful.placement.centered, floating = true }
  }
}
-- }}}

