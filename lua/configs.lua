vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.opt.termguicolors = true

vim.g.moonflyVirtualTextColor = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.number = true

vim.o.mouse = "a"

vim.o.tabstop = 4       -- Width of a tab character (display)
vim.o.shiftwidth = 4    -- Indentation width for autoindent and << / >>
vim.o.softtabstop = 4   -- Number of spaces inserted when pressing Tab
vim.o.expandtab = false -- Convert tabs to spaces (recommended)

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10
vim.o.confirm = true
