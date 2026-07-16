return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.default,
				themable = true,
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = nil,
				left_mouse_command = nil,
				middle_mouse_command = "bdelete %d",
				indicator = {
					icon = "▎",
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "● ",
				close_icon = " ",
				left_trunc_marker = " ",
				right_trunc_marker = " ",

				--[[ Not needed right now	
					name_formatter = function(buf)
						-- buf contains:
						-- name                | str        | the basename of the active file
						-- path                | str        | the full path of the active file
						-- bufnr               | int        | the number of the active buffer
						-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
						-- tabnr (tabs only)   | int        | the "handle" of the tab
					end,
					]]

				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 18,
				diagnostics = "nvim_lsp", -- Set to "nvim_lsp" if you want to see errors
				diagnostics_update_in_insert = false,
				diagnostics_update_on_event = true,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return "(" .. count .. ")"
				end,
				custom_filter = function(buf_number, buf_numbers)
					-- filter out filetypes you don't want to see
					if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
						return true
					end
					-- filter out by buffer name
					if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
						return true
					end
					-- filter out based on arbitrary rules
					if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
						return true
					end
					-- filter out by it's index number in list (don't show first buffer)
					if buf_numbers[1] ~= buf_number then
						return true
					end
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				color_icons = true,
				get_element_icon = function(element)
					local icon, hl =
						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
				end,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				duplicates_across_groups = true,
				persist_buffer_sort = true,
				move_wraps_at_ends = false,
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				auto_toggle_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current",
			},
		})
	end,
}
