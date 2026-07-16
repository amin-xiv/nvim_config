return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local filetypes = {
			"bash",
			"c",
			"cpp",
			"zig",
			"rust",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"yaml",
		}

		require("nvim-treesitter").install(filetypes)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
