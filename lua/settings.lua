local opt = vim.opt
local g = vim.g
local api = vim.api

opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.expandtab = true          -- Use spaces instead of tabs
opt.laststatus = 0            -- Dont show status bar since we have a lualine
opt.showmode = false          -- Dont show mode since we have a lualine
opt.number = true             -- Print line number
opt.pumblend = 10             -- Popup blend
opt.pumheight = 10            -- Maximum number of entries in a popup
opt.shiftround = true         -- Round indent
opt.shiftwidth = 2            -- Size of an indent
opt.tabstop = 2               -- Number of spaces tabs count for
opt.undofile = true
opt.undolevels = 10000
opt.termguicolors = true  -- True color support, used by lualine, nvim-tree, telescope, and many plugins
opt.smartindent = true    -- Insert indents automatically
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.completeopt = "menu,menuone,noselect,preview"
opt.cursorline = true     -- Enable highlighting of the current line
opt.ignorecase = true     -- Ignore case
opt.list = true           -- Show some invisible characters (tabs...
opt.relativenumber = true -- Relative line numbers
opt.wrap = false          -- Disable line wrap
opt.signcolumn = "yes"
opt.guicursor = "a:block"
opt.mouse = ""
opt.directory = '/tmp'

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "

-- Key mappings
api.nvim_set_keymap('n', '<leader>bd', ':%bd<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>s', ':Prettier | :w<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.format()<CR> | :w<CR>',
  { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>yy', ':%y<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'o', 'o<Esc>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'O', 'O<Esc>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'Y', 'Y$', { noremap = true, silent = true })
api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Markdown Preview
api.nvim_set_keymap('n', 'mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- lazygit
api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
