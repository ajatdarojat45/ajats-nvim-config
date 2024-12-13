local api = vim.api

require("bufferline").setup {
  options = {
    mode = "buffers",
    indicator = {
      icon = '▎',
      style = 'underline',
    },
    close_icon = '✗',
    buffer_close_icon = '✗',
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end

  },
  highlights = {
    buffer_selected = {
      fg = '#73aaf9',
    },
  }
}


-- bufferline
api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-k>', ':bfirst<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-j>', ':blast<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<S-r>', ':bdelete<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-r>', ':lua vim.api.nvim_buf_delete(0, {})<CR>', { noremap = true, silent = true })
