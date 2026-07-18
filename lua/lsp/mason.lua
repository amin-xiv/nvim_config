return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
	},
	opts = {
		ensure_installed = {
			"clangd",
			"lua_ls",
			"stylua",
			"pyright",
			"neocmake",
		},
	},
}
