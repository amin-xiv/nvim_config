return {

	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason must be loaded before its dependents so we need to set it up here.
		--
		-- `opts = {}` is the same as calling `require('mason').setup({})`
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
	--  This function gets run when an LSP attaches to a particular buffer.
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
								callback = function(event)
								local map = function(keys, func, desc, mode)
								mode = mode or "n"
								vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
								end

								-- Rename the variable under your cursor.
								map("gn", vim.lsp.buf.rename, "[R]e[n]ame")

								-- Execute a code action, usually your cursor needs to be on top of an error
								map("ga", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

								map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

								map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

								map("g/", require("telescope.builtin").lsp_references, "Goto References")

								map("gyt", require("telescope.builtin").lsp_document_symbols, "List Document symbols")

								local client = vim.lsp.get_client_by_id(event.data.client_id)
								if client and client:supports_method("textDocument/documentHighlight", event.buf) then
									local highlight_augroup =
									vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
									vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
										buffer = event.buf,
										group = highlight_augroup,
										callback = vim.lsp.buf.document_highlight,
									})

									vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
										buffer = event.buf,
										group = highlight_augroup,
										callback = vim.lsp.buf.clear_references,
									})

									vim.api.nvim_create_autocmd("LspDetach", {
										group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
																callback = function(event2)
																vim.lsp.buf.clear_references()
																vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
																end,
									})
									end

									-- The following code creates a keymap to toggle inlay hints in your
									-- code, if the language server you are using supports them
									if client and client:supports_method("textDocument/inlayHint", event.buf) then
										map("<leader>th", function()
										vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
										end, "[T]oggle Inlay [H]ints")
										end
										end,
	})

	local capabilities = require("blink.cmp").get_lsp_capabilities()

	local servers = {
		--[[lua_ls = {
		settings = {
		Lua = {
		workspace = {
		library = vim.api.nvim_get_runtime_file("", true), -- Keeps Neovim runtime files
		checkThirdParty = false, -- Often reduces noise
	},
	-- telemetry = { enable = false },
	},
	},
	}--]]
	clangd = {
		cmd = { "clangd", "--clang-tidy" },
	},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	--
	-- Some languages (like typescript) have entire language plugins that can be useful:
	--    https://github.com/pmizio/typescript-tools.nvim
	--
	-- But for many setups, the LSP (`ts_ls`) will work just fine
	-- ts_ls = {},
	}

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"lua-language-server", -- Lua Language server
		"stylua", -- Used to format Lua code
	})

	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	for name, server in pairs(servers) do
		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
		vim.lsp.config(name, server)
		vim.lsp.enable(name)
		end

		-- Special Lua Config, as recommended by neovim help docs
		vim.lsp.config("lua_ls", {
			on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
					return
					end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					})
					end,
					settings = {
						Lua = {},
					},
		})
		vim.lsp.enable("lua_ls")
		end,
}
