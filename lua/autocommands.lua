vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.diagnostic.config({
			update_in_insert = false,
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },

			virtual_text = true, -- Text shows up at the end of the line
			virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

			jump = { float = true },
		})
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	-- what's executed after the event
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.cc", "*.lua", "*.txt", "zig" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		save_cursor[2] = save_cursor[2] - 1
		vim.lsp.buf.format()
		vim.fn.setpos(".", save_cursor)
	end,
})
