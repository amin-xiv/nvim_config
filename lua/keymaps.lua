vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>i", "<cmd>term<CR>")
vim.keymap.set("n", "<leader>o", "<C-o>")
vim.keymap.set("n", "m", "O<esc>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR><CR>") -- extra <CR> due to its need in format-on-save
vim.keymap.set("n", ",", "o<esc>")
vim.keymap.set("n", "<leader>p", "diwi")
vim.keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete previous word" })

vim.keymap.set("n", "<leader>nk", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>m", "<cmd>NvimTreeFocus<CR>")

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F9>", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F12>", "<cmd>DapTerminate<CR>")

vim.keymap.set("n", "<leader>]", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>u", "<cmd>bdelete<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Diagnostic related keymaps
vim.keymap.set("n", "<space>;", "<cmd>:lua vim.diagnostic.open_float()<Cr>")
vim.keymap.set("n", "<space>'", "<cmd>:lua vim.diagnostic.goto_next()<Cr>")
vim.keymap.set("n", "<space>t", "<cmd>:lua vim.diagnostic.goto_prev()<Cr>")

vim.keymap.set("n", "]uh", function()
	require("todo-comments").jump_next({keywords = { "ERROR", "WARNING", "TODO", "BUG" }})
end, { desc = "Next error/warning/todo todo comment" })
