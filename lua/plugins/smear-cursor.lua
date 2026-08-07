return {
	"sphamba/smear-cursor.nvim",

	opts = {
		scroll_buffer_space = false,
		legacy_computing_symbols_support = true,
		legacy_computing_symbols_support_vertical_bars = true,
		use_diagonal_blocks = true, -- Only effective if `legacy_computing_symbols_support` is `true`

		-- Set to `true` if your cursor is a vertical bar in insert mode.
		vertical_bar_cursor_insert_mode = true,

		-- Set to `true` if your cursor is a horizontal bar in replace mode.
		horizontal_bar_cursor_replace_mode = false,

		-- Set to `true` to prevent the smear from overlapping the target character, hiding it until the animation is over.
		never_draw_over_target = true,

		-- Adjust to have the smear appear above or below other floating windows
		windows_zindex = 300,

		-- List of filetypes where the plugin is disabled.
		filetypes_disabled = {},

		-- Sets animation framerate
		time_interval = 10, -- milliseconds

		-- How fast the smear's head moves towards the target.
		-- 0: no movement, 1: instantaneous
		stiffness = 0.85,

		-- How fast the smear's tail moves towards the target.
		-- 0: no movement, 1: instantaneous
		trailing_stiffness = 0.45,

		-- Initial velocity factor in the direction opposite to the target
		anticipation = 0.2,

		-- Velocity reduction over time. O: no reduction, 1: full reduction
		damping = 0.85,
	},
}
