return {
	"vyfor/cord.nvim",
	---@type CordConfig
	opts = {
		display = {
			theme = "catppuccin",
			flavor = "dark",
			swap_fields = true,
		},
		timestamp = {
			enabled = true,
		},
		idle = {
			enabled = false,
		},
		advanced = {
			workspace = {
				limit_to_cwd = true,
			},
		},
	},
}
