local actions = require("telescope.actions")
local api = vim.api

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

-- telescope
api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
