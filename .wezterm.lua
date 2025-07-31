-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()


-- For example, changing the initial geometry for new windows:
config.initial_cols = 400
config.initial_rows = 200

-- maximize the window on startup
wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

-- changing the font size and color scheme.
config.font_size = 13
config.color_scheme = 'Afterglow' --Afterglow
config.font =wezterm.font({ family = 'Hack Nerd Font Mono', weight = 'Bold' })
-- config.freetype_load_target = 'Normal'
-- config.freetype_render_target = 'HorizontalLcd'

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'
-- Sets the font for the window frame (tab bar)
config.window_frame = {
  -- Berkeley Mono for me again, though an idea could be to try a
  -- serif font here instead of monospace for a nicer look?
  font = wezterm.font({ family = 'Hack Nerd Font Mono', weight = 'Bold' }),
  font_size = 11,
}

-- which gpu accelerator to use
front_end = "WebGpu"

-- random settings
config.use_dead_keys = false
config.scrollback_lines = 10000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true


-- Finally, return the configuration to wezterm:
return config
