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
				"--query-driver=/usr/bin/g++",
				"-j=7",
			},
		})
		vim.lsp.enable("clangd")

		vim.lsp.enable("lua_ls")

		vim.lsp.enable("neocmake")

		vim.lsp.enable("zls")

		vim.lsp.enable("yamlls")
	end,
}
