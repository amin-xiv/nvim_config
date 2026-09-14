return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.api.nvim_create_user_command("DapLoadConfig", function()
			vim.g.load_dap_cfg = true
			vim.cmd("Lazy reload nvim-dap")
		end, {})

		local dap_file = vim.g.load_dap_cfg and vim.fs.find({ ".dap" }, { type = "file", limit = math.huge }) or 0
		local args = nil
		local program = nil

		local count = 1
		if vim.g.load_dap_cfg then
			if #dap_file > 0 then
				for line in io.lines(".dap") do
					if count == 1 then
						program = line
						count = count + 1
					elseif count == 2 then
						args = line
						count = count + 1
					else
						break
					end
				end
			end
		end

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = not (program and args) and function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end or program,
				args = not (program and args) and function()
					local args_str = vim.fn.input("Arguments: ")
					return vim.split(args_str, "%s+") -- split on whitespace
				end or args, -- provide arguments if needed
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path. to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}

		dap.configurations.cpp = dap.configurations.c
	end,
}
