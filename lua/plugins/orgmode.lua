return {
	"nvim-orgmode/orgmode",
	config = function()
		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/orgmode/**/*",
			org_default_notes_file = "~/orgmode/quick_notes.org",
		})

		vim.opt.conceallevel = 2
		vim.opt.concealcursor = "nc"

		vim.lsp.enable("org")
	end,
}
