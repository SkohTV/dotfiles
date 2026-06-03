local main_mod = "SUPER"
local primary = "eDP-1"
local secondary = "DP-2"


-- Main monitor
hl.monitor({
  output = primary,
  mode = "highres",
  position = "0x0",
  scale = 1.33333,
})

-- HDMI cable
hl.monitor({
  output = secondary,
  mode = "preferred",
  position = "20000x20000",
  scale = 1,
}) -- TODO: add mirror ?


hl.env("HYPRCURSOR_THEME", "catppuccin-frappe-red")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- TODO
hl.on("hyprland.start", function ()
  hl.exec_cmd("zellij delete-all-sessions --force -y")

  hl.exec_cmd("alacritty -e $SHELL -c '$HOME/dev/scripts/zellij-init.sh home; exec $SHELL'", { workspace = 1 })
  hl.exec_cmd("obsidian", { workspace = 4})
  hl.exec_cmd("alacritty -e $SHELL -c '$HOME/dev/scripts/zellij-init.sh nvim; exec $SHELL'", { workspace = 5 })
  hl.exec_cmd("alacritty -e $SHELL -c '$HOME/dev/scripts/zellij-init.sh main; exec $SHELL'", { workspace = 6 })
  hl.exec_cmd("brave", { workspace = 8 })
  hl.exec_cmd("discord", { workspace = 10 })
end)

hl.on("hyprland.shutdown", function ()
  hl.exec_cmd("$HOME/dev/scripts/zellij-init.sh detach")
end)

-- Opacity
hl.window_rule({ match = { class = "Alacritty" }, opacity = 0.9 })
hl.window_rule({ match = { class = "obsidian" }, opacity = 0.9 })
hl.window_rule({ match = { class = "discord" }, opacity = 0.9 })
hl.window_rule({ match = { class = "Element" }, opacity = 0.9 })
hl.window_rule({ match = { initial_title = "Discord Popout" }, opacity = 1 })

-- Workspace bind
hl.window_rule({ match = { class = "obsidian" }, workspace = 4 })
hl.window_rule({ match = { class = "brave-browser" }, workspace = 7 })
hl.window_rule({ match = { class = "discord" }, workspace = 10 })

-- Arbitrary
hl.window_rule({ match = { class = "float" }, float = true }) -- for custom windows I create
hl.window_rule({ match = { class = "python3" }, float = true })
hl.window_rule({ match = { class = "Matplotlib" }, float = true })
hl.window_rule({ match = { class = "imv" }, float = true })
hl.window_rule({ match = { class = "qalculate-gtk" }, float = true })
hl.window_rule({ match = { class = "DesktopEditors" }, float = false })

-- File explorer
hl.window_rule({ match = { title = "Open Docment" }, float = true })
hl.window_rule({ match = { title = "Open Files" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, size = { 1200, 700 } })

-- Picture in picture
hl.window_rule({ match = { title = "Picture in picture" }, float = true })
hl.window_rule({ match = { title = "Picture in picture" }, pin = true })


-- Input
hl.config({
  input = {
    kb_layout = "custom-qwerty",
    follow_mouse = 0,
    sensitivity = 0,

    touchpad = {
      natural_scroll = true
    },
  }
})


-- General
hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959ff)"
    },
    layout = "dwindle"
  }
})

-- Decoration
hl.config({
  decoration = {
    rounding = 0,

    blur = {
      enabled = true,
      size = 8,
      passes = 1,
      new_optimizations = true
    },

    shadow = {
      enabled = false
    }
  }
})


-- Animations
hl.config({
  animations = {
    enabled = false
  }
})

-- Gestures
hl.config({
  gestures = {
    workspace_swipe_touch = false
  }
})

-- Misc
hl.config({
  misc = {
    force_default_wallpaper = 0,
    focus_on_activate = false,
    mouse_move_focuses_monitor = false,
    disable_splash_rendering = true,
    allow_session_lock_restore = true
  }
})

-- XWayland
hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

hl.config({
  ecosystem = {
    no_update_news = true,
    no_donation_nag = true
  }
})


hl.bind(main_mod .. " + F", hl.dsp.window.float({ action = "on" }))
hl.bind(main_mod .. " + T", hl.dsp.window.float({ action = "off" }))
hl.bind(main_mod .. " + P", hl.dsp.window.pin({ action = "toggle" }))
hl.bind(main_mod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(main_mod .. " + SHIFT + M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "l"}))
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "r"}))
hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "u"}))
hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "d"}))
hl.bind(main_mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l"}))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r"}))
hl.bind(main_mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u"}))
hl.bind(main_mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d"}))

hl.bind(main_mod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd("tofi-drun"))
hl.bind(main_mod .. " + X", hl.dsp.exec_cmd("$HOME/dev/scripts/wlogout.sh"))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd("$HOME/dev/scripts/screenshot.sh"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- TODO: test it
hl.bind(main_mod .. " + TAB", hl.dsp.focus({ monitor = -1 }))
hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.focus({ monitor = -1 }))
hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.workspace.swap_monitors({ monitor1 = primary, monitor2 = secondary }))
