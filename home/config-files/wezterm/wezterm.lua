local config = {}

function getHostname()
	local handle = io.popen("hostname -s")
	local result = handle:read("*a")
	handle:close()
	return string.gsub(result, "\n$", "")
end

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font 'Hack Nerd Font Mono'
if getHostname() == "luna" then
	config.font_size = 15
else
	config.font_size = 11
end
config.window_background_opacity = .8
--config.window_background_image = "/home/xqtc/dotfiles_new/walls/walls/SMT 40.png"


--config.window_background_image_hsb = {
--  -- Darken the background image by reducing it to 1/3rd
--  brightness = 0.1,
--
--  -- You can adjust the hue by scaling its value.
--  -- a multiplier of 1.0 leaves the value unchanged.
--  hue = .8,
--
--  -- You can adjust the saturation also.
--  saturation = 1,
--}
local arrowkeys = {
	[1] = { "LeftArrow", "left" },
	[2] = "RightArrow",
	[3] = "UpArrow",
	[4] = "DownArrow",
}
config.keys = {
	{
		key = 't',
		mods = 'CTRL',
		action = wezterm.action.SpawnTab 'DefaultDomain',
	},
	{
		key = "LeftArrow",
		mods = 'CTRL | SHIFT',
		action = wezterm.action.SplitPane {
			direction = 'Left',
		},
	},
	{
		key = "RightArrow",
		mods = 'CTRL | SHIFT',
		action = wezterm.action.SplitPane {
			direction = 'Right',
		},
	},
	{
		key = "UpArrow",
		mods = 'CTRL | SHIFT',
		action = wezterm.action.SplitPane {
			direction = 'Up',
		},
	},
	{
		key = "DownArrow",
		mods = 'CTRL | SHIFT',
		action = wezterm.action.SplitPane {
			direction = 'Down',
		},
	},
}

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'CTRL',
		action = wezterm.action.ActivateTab(i - 1),
	})
end


for i in pairs(arrowkeys) do
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'CTRL',
		action = wezterm.action.ActivateTab(i - 1),
	})
end

config.hide_tab_bar_if_only_one_tab = true
config.text_background_opacity = .4
config.enable_scroll_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_mouse_cursor_when_typing = false
config.enable_wayland = true
config.front_end = "OpenGL"
config.warn_about_missing_glyphs = false
return config
