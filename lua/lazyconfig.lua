local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({

	-- TODO: Check whatever tf this is
	require("plugins.orgmode"),

	require("plugins.nvim-dap"),
	require("plugins.nvim-dap-ui"),
	require("plugins.nvim-dap-virtual-text"),
	require("plugins.mini"),
	require("plugins.nvim-treesitter"),
	require("plugins.telescope"),
	require("lsp.mason"), -- mason must be loaded before nvim-lspconfig
	require("lsp.nvim-lspconfig"),
	require("plugins.oil"),
	require("plugins.convy"),           -- unit conversions
	require("plugins.blink"),           -- auto completion
	require("plugins.vim-moonfly-colors"), -- current theme
	require("plugins.which-key"),
	require("plugins.guess-indent"),
	require("plugins.nvim-web-devicons"),
	require("plugins.nvim-tree"), -- file explorer
	require("plugins.match-paren"),
	require("plugins.nvim-autopairs"),
	require("plugins.bufferline"), -- the above line that shows open buffers
	require("plugins.statuscol"), -- the vertical status column on the left
	require("plugins.todo-comments"),
	require("plugins.lazy-tree"), -- Tree-like view of all plugins
	require("plugins.cord"),    -- discord presence
	require("plugins.lazy-dev"), -- LuaLS setup stuff

	--require("plugins.aura-theme"), a theme
	--require("plugins.kanagawa"),  a theme
	--	require("plugins.ale"), -- Not needed right now
	--require("plugins.git-signs"), won't bother with it rn
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
