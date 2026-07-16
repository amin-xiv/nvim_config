vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>o", "<C-o>")
vim.keymap.set("n", "m", "O<esc>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR><CR>") -- extra <CR> due to its need in format-on-save
vim.keymap.set("n", ",", "o<esc>")
vim.keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete previous word" })

-- nvim-tree keymaps
vim.keymap.set("n", "<leader>nk", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>m", "<cmd>NvimTreeFocus<CR>")

-- DAP keymaps
vim.keymap.set("n", "<F5>", "<cmd>DapNew<CR>", { desc = "Launch new debug session" })
vim.keymap.set("n", "<F6>", "<cmd>DapContinue<CR>", { desc = "Launch or continue debug session" })
vim.keymap.set("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<F8>", "<cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<F7>", "<cmd>DapStepOut<CR>", { desc = "Step out" })
vim.keymap.set("n", "<F12>", "<cmd>DapTerminate<CR>", { desc = "Terminate DAP session" })
-- DAP-UI
vim.keymap.set("n", "<F2>", "<cmd>lua require('dapui').toggle()<Cr>", { desc = "Toggle dap-ui" })

-- bufferline.nvim keymaps
vim.keymap.set("n", "<leader>]", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>u", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })

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

-- todo-comments.nvim keymaps
vim.keymap.set("n", "]uh", function()
	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING", "TODO", "BUG" } })
end, { desc = "Next error/warning/todo todo comment" })

-- Oil.nvim keymaps
vim.keymap.set("n", "<leader>vbn", "<cmd>:Oil --float .<Cr>")
