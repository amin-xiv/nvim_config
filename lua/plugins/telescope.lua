return {
	"nvim-telescope/telescope.nvim",
	version = "0.2.1",
	dependencies = { "nvim-lua/plenary.nvim" },
	module = "telescope",

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fgf", builtin.git_files, { desc = "Fuzzy search for files tracked by Git" })
		vim.keymap.set(
			"n",
			"<leader>fr",
			builtin.live_grep,
			{ desc = "Search for a string and get results live as you type, respects .gitignore" }
		)
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search for files (respecting .gitignore)" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Lists open buffers in current neovim instance" })
		vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>")
		vim.keymap.set(
			"v",
			"<leader>fz",
			builtin.grep_string,
			{ desc = "Grep selected string in the entire working directory" }
		)
		vim.keymap.set(
			"n",
			"<leader>fz",
			builtin.grep_string,
			{ desc = "Grep selected string in the entire working directory" }
		)

		vim.keymap.set("n", "<leader>fpf", builtin.git_files, { desc = "Fuzzy search for files tracked by Git" })
		vim.keymap.set("n", "<leader>fpc", builtin.git_commits, { desc = "List git commits with diff preview" })
		vim.keymap.set("n", "<leader>fpb", builtin.git_branches, { desc = "Show git branches" })
	end,
}
