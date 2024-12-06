local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
			},
		},
		mappings = {
			i = {
				["<S-q>"] = actions.close,
				['<S-d>'] = actions.delete_buffer,
			},
			n = {
				["<S-q>"] = actions.close,
				['<S-d>'] = actions.delete_buffer,
			}
		}
	},
	pickers = {
		find_files = {
			theme = "dropdown"
		},
		live_grep = {
			theme = "dropdown"
		},
		buffers = {
			theme = "dropdown"
		}
	}
})
