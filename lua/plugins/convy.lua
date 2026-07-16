return {
	"necrom4/convy.nvim",
	cmd = { "Convy", "ConvySeparator" },
	opts = {
		-- default configuration
		notifications = true,
		separator = " ",
		window = {
			blend = 25,
			border = "rounded",
		},
	},
	keys = {
		{
			"<leader>cc",
			":Convy<CR>",
			desc = "Convert (interactive selection)",
			mode = { "n", "v" },
		},
		{
			"<leader>cd",
			":Convy hex dec<CR>",
			desc = "Convert from hex to decimal",
			mode = { "n", "v" },
			silent = true,
		},
	},
}
