return {

	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason must be loaded first
		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.lsp.config("clangd", {
			cmd = {
				"clangd",
				"--clang-tidy",
				"--background-index",
				"--header-insertion=iwyu",
				"-j=5",
			},
		})
		vim.lsp.enable("clangd")

		vim.lsp.enable("lua_ls")
	end,
}
