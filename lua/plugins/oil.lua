return {
	"stevearc/oil.nvim",
	dependencies = "nvim-mini/mini.nvim",
	opts = {
		skip_confirm_for_simple_edits = true,
		watch_for_changes = false,

		view_options = {
			show_hidden = true,
		},

		float = {
			max_width = 0.6,
			max_height = 0.7,
		},
	},
}
