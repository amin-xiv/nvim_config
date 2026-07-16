return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
			{ "nvim-dap-ui" },
		},
	},
}
