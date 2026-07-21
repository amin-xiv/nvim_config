vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gn", vim.lsp.buf.rename, "[R]e[n]ame")

		map("ga", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

		map("g/", require("telescope.builtin").lsp_references, "Goto References")

		map("gyt", require("telescope.builtin").lsp_document_symbols, "List Document symbols")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight", event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
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
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client:supports_method("textDocument/inlayHint", event.buf) then
			local toggle_inlay_hints = function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end
			map("<leader>th", toggle_inlay_hints, "[T]oggle Inlay [H]ints")

			vim.api.nvim_set_hl(0, "LspInlayHint", {
				fg = "#204c48",
				bg = "#080808",
				bold = false,
				italic = true,
				reverse = false,
				standout = false,
				nocombine = true,
				default = true,
				force = true,
				blend = 20,

				underline = false,
				undercurl = false,
				underdouble = false,
				underdotted = false,
				underdashed = false,
				strikethrough = false,
			})
			-- Automatically toggle it on LspAttach
			if not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }) then
				toggle_inlay_hints()
			end
		end
	end,
})
