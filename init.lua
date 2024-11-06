vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " Syntax Highlighting dan Parsing
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'windwp/nvim-ts-autotag'
  Plug 'mustache/vim-mustache-handlebars'
  
  " Autocomplete & LSP
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'    
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer' 
  Plug 'hrsh7th/cmp-path'  
  Plug 'hrsh7th/vim-vsnip'
  Plug 'saadparwaiz1/cmp_luasnip' 
  Plug 'L3MON4D3/LuaSnip' 
  Plug 'onsails/lspkind.nvim'
  
  " Code Formatting dan Linting
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'
  
  " Navigasi dan Pencarian
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
  
  " Manajemen Buffer & Tab
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'nvim-tree/nvim-tree.lua'
  "Plug 'mhinz/vim-startify'
  
  " Git Integration
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  
  " Productivity Enhancements
  Plug 'wakatime/vim-wakatime'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'numToStr/Comment.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
  
  " UI & Tampilan
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'valloric/vim-indent-guides'
  Plug 'goolord/alpha-nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  
  " Bracket & Delimiter Management
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'tpope/vim-surround'
  Plug 'raimondi/delimitmate'

  call plug#end()
]])

-- Load individual plugin configurations
require('plugins.bufferline')
require('plugins.comment')
require('plugins.harpoon')
require('plugins.indent-blankline')
require('plugins.lspconfig')
require('plugins.lualine')
require('plugins.null-ls')
require('plugins.nvim-alpha')
require('plugins.nvim-cmp')
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.nvim-ts-autotag")
require("plugins.override")
require("plugins.prettier")
require("plugins.telescope")
require("plugins.todo-comments")

-- General Settings
vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cursorline = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.clipboard = "unnamed"
vim.g.mapleader = " "

-- Set colorscheme
vim.cmd("colorscheme tokyonight-moon")

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>bd', ':%bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Prettier<CR> | :w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yy', ':%y<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'O', 'O<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', 'Y$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yy', ':%y', { noremap = true, silent = true })

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
vim.api.nvim_set_keymap('n', '<S-r>', ':bdelete<CR>', { noremap = true, silent = true })

-- lspconfig
vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
