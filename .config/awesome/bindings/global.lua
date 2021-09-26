local gears = require("gears")
local awful = require("awful")
local keygrabber = require("awful.keygrabber")
local hotkeys_popup = require("awful.hotkeys_popup")
local scratch = require("utils.scratch")

local screenshotcmd = " -e 'mv $f ~/Pictures/screenshot/;notify-send \"screenshot captured\"'"

local globalkeys = gears.table.join(
  -- Awesome
  awful.key({ modkey,           }, "F1",           hotkeys_popup.show_help,
  {description="show help", group="awesome"}),
  awful.key({ modkey,           },  "w", function () mymainmenu:show() end,
  {description = "show main menu", group = "awesome"}),
  awful.key({ modkey, "Control" },  "r",                   awesome.restart,
  {description = "reload awesome", group = "awesome"}),
  -- awful.key({ modkey            },  "x", function () awful.prompt.run {
  --     prompt = "Run Lua code: ",
  --     textbox = awful.screen.focused().mypromptbox.widget,
  --     exe_callback = awful.util.eval,
  --     history_path = awful.util.get_cache_dir() .. "/history_eval"
  --   }
  -- end,
  -- {description = "lua execute prompt", group = "awesome"}),

  -- Power
  awful.key({ modkey,           }, "x", function ()
    awful.keygrabber {
      autostart      = true,
      stop_event     = 'press',
      timeout        = 3,
      -- allowed_keys   = {'l', 'p', 'r', 's', 'h', 'c'},
      keybindings = {
        {{}, "l", function()
          awful.spawn.with_shell("dm-tool lock")
          awful.keygrabber.stop()
        end}
      }
    }
  end,
  { description= "Lock screen", group= "power" }),

  -- swap client
  awful.key({ modkey, "Shift"   }, "h", function ()
    awful.client.swap.global_bydirection( "left")
  end,
  {description =   "swap with left client", group = "client(swap)"}),
  awful.key({ modkey,   "Shift" }, "j", function ()
    awful.client.swap.global_bydirection( "down")
  end,
  {description = "swap with bottom client", group = "client(swap)"}),
  awful.key({ modkey,   "Shift" }, "k", function ()
    awful.client.swap.global_bydirection(   "up")
  end,
  {description =    "swap with top client", group = "client(swap)"}),
  awful.key({ modkey,   "Shift" }, "l", function ()
    awful.client.swap.global_bydirection("right")
  end,
  {description =  "swap with right client", group = "client(swap)"}),

  awful.key({ modkey,           }, "u"  , awful.client.urgent.jumpto,
  {description = "focus to urgent client"  , group = "client(focus)"}),
  awful.key({ modkey            }, "Tab", function ()
    awful.client.focus.history.previous()
    if client.focus then client.focus:raise() end
  end,
  {description = "focus to previous client", group = "client(focus)"}),

  -- client management
  awful.key({ modkey, "Control" }, "n", function ()
    local c = awful.client.restore()
    if c then
      c:emit_signal( "request::activate", "key.unminimize", {raise = true})
    end
  end,
  {description = "restore minimized client", group = "client(manage properties)"}),

  -- Tag
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
  {description = "go back", group = "tag"}),

  -- Launcher
  awful.key({ modkey            }, "Return", function () awful.spawn(terminal) end,
  {description =  "open terminal", group = "launcher"}),
  awful.key({ modkey,   "Shift" }, "Return", function ()
    awful.spawn.with_shell('rofi -show drun')
  end,
  {description =     "run prompt", group = "launcher"}),
  awful.key({ modkey, "Shift"   }, "e",function ()awful.spawn(terminal.." -e se")end,
  {description=    "edit configs", group="launcher"}),
  awful.key({ modkey, "Control" }, "e",function ()awful.spawn(terminal.." -e ce")end,
  {description=    "edit configs", group="launcher"}),

  -- Scratchpad
  awful.key({modkey},  "F9", function ()
    scratch.toggle(terminal .. " --class=floatterm", { instance = "floatterm" })
  end,
  {description = "Launch a floatterm", group = "scratchpad"}),
  awful.key({modkey}, "F10", function ()
    scratch.toggle(terminal .. " --class=notepad -e nvim", { instance = "notepad" })
  end,
  {description = "Launch a notepad", group = "scratchpad"}),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "=", function ()
    awful.tag.incnmaster( 1, nil, true)
  end,
  {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "-", function ()
    awful.tag.incnmaster(-1, nil, true)
  end,
  {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control" }, "=", function ()
    awful.tag.incncol( 1, nil, true)
  end,
  {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control" }, "-", function ()
    awful.tag.incncol(-1, nil, true)
  end,
  {description = "decrease the number of columns", group = "layout"}),

  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1) end,
  {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1) end,
  {description = "select previous", group = "layout"}),
  
  -- Screenshot
  awful.key({                   }, "Print", function ()
    awful.spawn.with_shell("scrot -u"..screenshotcmd)
  end,
  {description = "screenshot focused window", group = "screenshot"}),
  awful.key({ modkey,           }, "Print", function ()
    awful.spawn.with_shell("scrot -z"..screenshotcmd)
  end,
  {description = "screenshot full desktop", group = "screenshot"}),
  awful.key({ modkey, "Control" }, "Print", function ()
    awful.spawn.with_shell("scrot -sz"..screenshotcmd)
  end,
  {description = "screenshot selective area", group = "screenshot"})
)


for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local view, toggle, move, toggle_focus
  if i == 1 or i == 9 then
    view = { description = "view tag #", group = "tag" }
    toggle = { description = "toggle tag #", group = "tag" }
    move = { description = "move focused client to tag #", group = "tag" }
    focus = { description = "toggle focused client on tag #", group = "tag" }
  end
  globalkeys = gears.table.join(globalkeys,
  -- View tag only.
  awful.key({ modkey }, "#" .. i + 9,
  function ()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then tag:view_only() end
  end,
  view),
  -- Toggle tag display.
  awful.key({ modkey, "Control" }, "#" .. i + 9,
  function ()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then awful.tag.viewtoggle(tag) end
  end,
  toggle),
  -- Move client to tag.
  awful.key({ modkey, "Shift" }, "#" .. i + 9,
  function ()
    if client.focus then
      local tag = client.focus.screen.tags[i]
      if tag then client.focus:move_to_tag(tag) end
    end
  end,
  move),
  -- Toggle tag on focused client.
  awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
  function ()
    if client.focus then
      local tag = client.focus.screen.tags[i]
      if tag then client.focus:toggle_tag(tag) end
    end
  end,
  focus)
  )
end

-- Set keys
root.keys(globalkeys)
