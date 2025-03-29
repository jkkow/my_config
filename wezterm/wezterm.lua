local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.default_prog = {"pwsh"}
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", scale = 1.03 , weight = "Bold"},
  { family = "D2CodingLigature Nerd Font", scale = 1.0, weight = "Bold"},
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.initial_cols = 120
config.initial_rows = 30
config.default_cursor_style = "BlinkingBar"
config.enable_tab_bar = false
config.background = {
  {
    source = {
    Color = "#1A0947",
    },
    width = '100%',
    height = '100%',
    opacity = 0.95,
  },
}

-- Dim inactive pane
config.inactive_pane_hsb = {
  saturation = 0.35,
  brightness = 0.5
}

-- keys
config.leader = { key = ";", mods = "CTRL", timeout_millisecond = 1000}
config.keys = {
  -- Pane keybinding
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitVertical { domain = CurrentPaneDomain}
  },
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = act.SplitHorizontal{ domain = CurrentPaneDomain}
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left")
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right")
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down")
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up")
  },
  {
    key = "x",
    mods = "LEADER",
    action = act.CloseCurrentPane { confirm = true}
  },

}

return config
