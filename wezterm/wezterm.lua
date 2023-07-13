local wezterm = require("wezterm")
local wa = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- colorschemes
-- config.color_scheme = "Ashes (base16)"
-- config.color_scheme = "Ayu Light (Gogh)"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "DoomOne"
-- config.color_scheme = 'Dracula (Official)'
-- config.color_scheme = "Everblush"
-- config.color_scheme = 'GitHub Dark'
-- config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.color_scheme = "Gruvbox Light"
-- config.color_scheme = "Everblush"
-- config.color_scheme = "Everforest Dark (Gogh)"
-- config.color_scheme = "Horizon Dark (base16)"
-- config.color_scheme = "Horizon Dark (Gogh)"
-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = "nightfox"
config.color_scheme = "OceanicNext (base16)"
-- config.color_scheme = "Rosé Pine (Gogh)"

-- appearance
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "RESIZE"
config.underline_thickness = 1
config.underline_position = -4
-- config.window_background_opacity = 0.5
-- config.macos_window_background_blur = 20
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}

-- font
-- config.font = wezterm.font("Iosevka", { stretch = "SemiExpanded" })
-- config.font = wezterm.font("Iosevka")
config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("VictorMono Nerd Font")
-- config.font = wezterm.font("Monoid Nerd Font")
config.font_size = 12.0

-- preferences
config.automatically_reload_config = true
config.adjust_window_size_when_changing_font_size = false

-- tuning
config.animation_fps = 30
config.max_fps = 30

-- keys
config.disable_default_key_bindings = true
config.enable_kitty_keyboard = true

config.keys = {
	-- keys using ctrl+shift
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wa.ActivateCommandPalette,
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wa.ShowDebugOverlay,
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wa.SpawnTab("DefaultDomain"),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wa.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wa.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wa.ReloadConfiguration,
	},
	{
		key = "x",
		mods = "CTRL|SHIFT",
		action = wa.ActivateCopyMode,
	},
	{
		key = "Space",
		mods = "CTRL|SHIFT",
		action = wa.QuickSelect,
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wa.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wa.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},

	-- keys using super
	{
		key = "c",
		mods = "SUPER",
		action = wa.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "SUPER",
		action = wa.PasteFrom("Clipboard"),
	},
	{
		key = "m",
		mods = "SUPER",
		action = wa.TogglePaneZoomState,
	},
	{
		key = "n",
		mods = "SUPER",
		action = wa.SpawnWindow,
	},
	{
		key = "-",
		mods = "SUPER",
		action = wa.DecreaseFontSize,
	},
	{
		key = "=",
		mods = "SUPER",
		action = wa.IncreaseFontSize,
	},
	{
		key = "0",
		mods = "SUPER",
		action = wa.ResetFontSize,
	},
	{
		key = "t",
		mods = "SUPER",
		action = wa.SpawnTab("CurrentPaneDomain"),
	},

	-- keys using alt
	{
		key = "u",
		mods = "ALT",
		action = wa.ActivatePaneDirection("Up"),
	},
	{
		key = "e",
		mods = "ALT",
		action = wa.ActivatePaneDirection("Down"),
	},
	{
		key = "i",
		mods = "ALT",
		action = wa.ActivatePaneDirection("Right"),
	},
	{
		key = "n",
		mods = "ALT",
		action = wa.ActivatePaneDirection("Left"),
	},
}

return config
