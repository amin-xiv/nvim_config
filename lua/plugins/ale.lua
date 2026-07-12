return {
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g

			g.ale_linters = {
				lua = { "lua_language_server" },
				c = { "" },
				cpp = { "" },
				yaml = { "yamllint" },
			}
			g.ale_linters_explicit = 1
		end,
	}
