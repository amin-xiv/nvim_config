return {
	"monkoose/matchparen.nvim",
	init = function()
		vim.g.loaded_matchparen = 1 -- disables Vim's built‑in matchparen
	end,
	config = function()
		local matchparen = require("matchparen")
		matchparen.setup({
			-- Set to `false` to disable at matchpren at startup
			-- Enable matchparen manually with `:MatchParenEnable`
			enabled = true,
			-- Highlight group of the matched brackets
			-- Change it to any other or adjust colors of "MathParen" highlight group
			-- in your colorscheme to your liking
			hl_group = "Visual",
		})
	end,
}
