return {
	"HiPhish/rainbow-delimiters.nvim",

	config = function()
		local rainbow_highlight = {
			"RainbowRed",
			"RainbowOrange",
			"RainbowYellow",
			"RainbowGreen",
			"RainbowCyan",
			"RainbowPurple",
			"RainbowPink",
		}

		local ibl_hooks = require("ibl.hooks")
		-- Re-register colours on every colorscheme change so they survive :colorscheme reloads
		ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF5555" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FFB86C" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F1FA8C" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#50FA7B" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#8BE9FD" })
			vim.api.nvim_set_hl(0, "RainbowPurple", { fg = "#BD93F9" })
			vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#FF79C6" })
			vim.api.nvim_set_hl(0, "IblIndent", { nocombine = true, fg = "NONE", bg = "NONE" })
		end)

		-- rainbow-delimiters uses the same highlight table for brackets
		vim.g.rainbow_delimiters = { highlight = rainbow_highlight }

		require("ibl").setup({
			indent = { highlight = "IblIndent", char = "│" },
			scope = { highlight = rainbow_highlight },
		})

		ibl_hooks.register(ibl_hooks.type.SCOPE_HIGHLIGHT, ibl_hooks.builtin.scope_highlight_from_extmark)
	end,
}
