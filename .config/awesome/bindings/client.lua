local gears = require("gears")
local awful = require("awful")
local mymainmenu = require("main.menu")

clientkeys = gears.table.join(
  -- Swap client
  awful.key({ modkey, "Control" }, "Return", function (c)
    c:swap(awful.client.getmaster())
  end,
  {description = "move to master", group = "client(swap)"}),

  -- focus to client
  awful.key({ modkey,           }, "h", function (c)
    awful.client.focus.global_bydirection( "left")
    c:lower()
  end,
  {description =   "focus to left client", group = "client(focus)"}),
  awful.key({ modkey,           }, "j", function (c)
    awful.client.focus.global_bydirection( "down")
    c:lower()
  end,
  {description = "focus to bottom client", group = "client(focus)"}),
  awful.key({ modkey,           }, "k", function (c)
    awful.client.focus.global_bydirection(   "up")
    c:lower()
  end,
  {description =    "focus to top client", group = "client(focus)"}),
  awful.key({ modkey,           }, "l", function (c)
    awful.client.focus.global_bydirection("right")
    c:lower()
  end,
  {description =  "focus to right client", group = "client(focus)"}),

  -- manage client properties
  awful.key({ modkey, "Shift"   }, "c", function (c) c:kill() end,
  {description = "close", group = "client(manage properties)"}),
  awful.key({ modkey }, "f", function (c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end,
  {description = "toggle fullscreen", group = "client(manage properties)"}),
  awful.key({ modkey, "Control" }, "space", function (c)
    c.floating = not c.floating
    c:raise()
  end,
  {description = "toggle floating", group = "client(manage properties)"}),
  awful.key({ modkey }, "t", function (c)
    c.ontop = not c.ontop
  end,
  {description = "toggle keep on top", group = "client(manage properties)"}),
  awful.key({ modkey }, "n", function (c)
    --The client currently has the input focus, so it cannot be minimized,
    --since minimized clients can't have the focus.
    c.minimized = true
  end ,
  {description = "minimize", group = "client(manage properties)"}),
  awful.key({ modkey }, "m", function (c)
    c.maximized = not c.maximized
    c:raise()
  end ,
  {description = "(un)maximize", group = "client(manage properties)"}),
  awful.key({ modkey, "Control" }, "m", function (c)
    c.maximized_vertical = not c.maximized_vertical
    c:raise()
  end ,
  {description = "(un)maximize vertically", group = "client(manage properties)"}),
  awful.key({ modkey, "Shift"   }, "m", function (c)
    c.maximized_horizontal = not c.maximized_horizontal
    c:raise()
  end ,
  {description = "(un)maximize horizontally", group = "client(manage properties)"}),

  -- move floating clients
  awful.key({ modkey }, "Right", function (c)
    if c.floating then c:relative_move( 10,   0, 0, 0) end
  end,
  {description = "move right", group="client(floating move)"}),
  awful.key({ modkey }, "Left" , function (c)
    if c.floating then c:relative_move(-10,   0, 0, 0) end
  end,
  {description = "move left" , group="client(floating move)"}),
  awful.key({ modkey }, "Up"   , function (c)
    if c.floating then c:relative_move(  0, -10, 0, 0) end
  end,
  {description = "move up"   , group="client(floating move)"}),
  awful.key({ modkey }, "Down" , function (c)
    if c.floating then c:relative_move(  0,  10, 0, 0) end
  end,
  {description = "move down" , group="client(floating move)"}),

  -- Resize clients
  awful.key({ modkey, "Control" }, "l", function (c)
    if c.floating then
      c:relative_move(0, 0,  10, 0)
    else
      awful.tag.incmwfact(   0.025)
    end
  end,
  {description = "increase client size horizontally", group="client(resize)"}),
  awful.key({ modkey, "Control" }, "h", function (c)
    if c.floating then
      c:relative_move(0, 0, -10, 0)
    else
      awful.tag.incmwfact(  -0.025)
    end
  end,
  {description = "decrease client size horizontally", group="client(resize)"}),
  awful.key({ modkey, "Control" }, "k", function (c)
    if c.floating then
      c:relative_move(0, 0, 0,  10)
    else
      awful.client.incwfact( 0.025)
    end
  end,
  {description = "increase client size vertically"  , group="client(resize)"}),
  awful.key({ modkey, "Control" }, "j", function (c)
    if c.floating then
      c:relative_move(0, 0, 0, -10)
    else
      awful.client.incwfact(-0.025)
    end
  end,
  {description = "decrease client size vertically"  , group="client(resize)"})
)

clientbuttons = gears.table.join(
  awful.button({        }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
  end),
  awful.button({ modkey }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(c)
  end)
)

root.buttons(
  gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
  )
)

return clientkeys 
