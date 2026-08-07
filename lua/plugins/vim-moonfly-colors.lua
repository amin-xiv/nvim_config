return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("moonfly")
		vim.api.nvim_set_hl(0, "@comment", {
			bold = true,
			italic = true,
		})
		vim.g.moonflyNormalPmenu = true
		vim.o.pumborder = "single"
	end,
}
