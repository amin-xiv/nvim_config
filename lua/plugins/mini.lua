return {
	"nvim-mini/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.icons").setup()
		require("mini.diff").setup() -- git diff related stuff
		require("mini.git").setup() -- use `Git [command]` to use git from nvim

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		require("mini.surround").setup({})

		-- Simple and easy statusline.
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font }) -- only true if user has a nerd font

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Move selected line(s) in 4 directions
		require("mini.move").setup()
	end,
}
