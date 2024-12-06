-- General Settings
vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
--vim.o.cursorline = true
vim.opt.guicursor = ""
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.clipboard = "unnamed"
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.swapfile = true
vim.opt.directory = '/tmp'

-- Set colorscheme
vim.cmd("colorscheme tokyonight-moon")

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>bd', ':%bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>s', ':Prettier | :w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.format()<CR> | :w<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yy', ':%y<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'O', 'O<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', 'Y$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Markdown Preview
vim.api.nvim_set_keymap('n', 'mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>er', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ee', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })

-- bufferline
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-k>', ':bfirst<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-j>', ':blast<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<S-r>', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-r>', ':lua vim.api.nvim_buf_delete(0, {})<CR>', { noremap = true, silent = true })

-- lspconfig
--vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, { silent = true, noremap = true })

-- lazygit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
