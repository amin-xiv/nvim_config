return {
	"igorlfs/nvim-dap-view",
	opts = {
		winbar = {
			show = true,
			sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
			default_section = "repl",
			base_sections = {
				-- Labels can be set dynamically with functions
				-- Each function receives the window's width and the current section as arguments
				breakpoints = { label = "Breakpoints", keymap = "B" },
				scopes = { label = "Scopes", keymap = "S" },
				exceptions = { label = "Exceptions", keymap = "E" },
				watches = { label = "Watches", keymap = "W" },
				threads = { label = "Threads", keymap = "T" },
				repl = { label = "REPL", keymap = "R" },
				sessions = { label = "Sessions", keymap = "K" },
				console = { label = "Console", keymap = "C" },
			},
			-- Add your own sections here
			custom_sections = {},
			controls = {
				enabled = false,
				position = "right",
				buttons = {
					"play",
					"step_into",
					"step_over",
					"step_out",
					"step_back",
					"run_last",
					"terminate",
					"disconnect",
				},
				custom_buttons = {},
			},
		},

		-- Auto open when a session is started and auto close when all sessions finish
		-- Alternatively, can be a string:
		-- - "keep_terminal": as above, but keeps the terminal when the session finishes
		-- - "open_term": open the terminal when starting a new session, nothing else
		-- - "open": self explanatory
		auto_toggle = false,
		-- Reopen dapview when switching to a different tab
		-- Can also be a function to dynamically choose when to follow, by returning a boolean
		-- If a function, receives the name of the adapter for the current session as an argument
		follow_tab = false,
	},

	config = function()
		local keymap = vim.keymap
		local dap = require("dap")
		local dapview = require("dap-view")

		-- should be called once at start
		dapview.virtual_text_toggle()

		keymap.set("n", "<F2>", dapview.toggle)
		keymap.set("n", "<F3>", dapview.virtual_text_toggle)

		-- Automatically open and close the UI when debugging starts/stops
		dap.listeners.before.attach.dapui_config = function()
			dapview.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapview.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapview.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapview.close()
		end
	end,
}
