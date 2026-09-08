return {
	"rmagatti/auto-session",
	lazy = false,

	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		git_use_branch_name = true, -- Include git branch name in session name, can also be a function that takes an optional path and returns the name of the branch
		git_auto_restore_on_branch_change = true, -- Should we auto-restore the session when the git branch changes. Requires git_use_branch_name
		args_allow_files_auto_save = true, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not re-enable auto-restore and can be true or a function that returns true when saving is allowed. See documentation for more detail
		log_level = "info", -- Sets the log level of the plugin (debug, info, warn, error).
		root_dir = vim.fn.stdpath("data") .. "/home/amin_xiv/nvim-sessions", -- Root dir where sessions will be stored
		show_auto_restore_notif = true, -- Whether to show a notification when auto-restoring
		continue_restore_on_error = true, -- Keep loading the session even if there's an error

		session_lens = {
			picker = "telescope", -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also set one manually. Falls back to vim.ui.select

			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "n", "<C-d>" }, -- mode and key for deleting a session from the picker
				alternate_session = { "i", "<C-n>" }, -- mode and key for swapping to alternate session from the picker
				copy_session = { "i", "<C-y>" }, -- mode and key for copying a session from the picker
			},

			session_control = {
				control_dir = vim.fn.stdpath("data") .. "/home/amin_xiv/auto_session", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
				control_filename = "session_control.json", -- File name of the session control file
			},
		},
	},
}
