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

" UI & Tampilan
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'valloric/vim-indent-guides'
Plug 'goolord/alpha-nvim'

" Bracket & Delimiter Management
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'

call plug#end()

" require lua script
lua require('nvimtree')
lua require('override')
"lua require('coc')
lua require('lua_line')
lua require('buffer_line')
lua require('indentblankline')
lua require('nvim_treesitter')
lua require('nvim_telescope')
lua require('nvim_cmp')
lua require('nvim_lspconfig') 
lua require("nvim_comment")
lua require("todo_comment")
lua require("nvim_alpha")
lua require("ts_autotag")
lua require("null_ls")
lua require("nvim_prettier")
lua require("nvim_harpoon")

"airline
"let g:airline_theme='base16_snazzy' INDENTLINE
"let g:indentLine_char = '┊'
"set list lcs=tab:\┊\ 

" vim
let mapleader = " " " map leader to space

syntax on
set number
set relativenumber
set tabstop=2
set shiftwidth=2
"set autoindent
set cursorline
set smartindent
set expandtab
"set background=dark
"set cursorcolumn
"set foldmethod=manual
set clipboard=unnamed
colorscheme tokyonight-moon

"vim
nnoremap <leader>bd :%bd<CR>

" delete all buffers
nnoremap <leader>q :q<CR>

" fold
"set foldmethod=indent
"set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufReadPost,FileReadPost * normal zR
nnoremap <leader>f za

function! MyCustomFoldText()
  let l:line = getline(v:foldstart)
  let l:fold_size = v:foldend - v:foldstart + 1
  let l:emoji = "🚀"

  return l:line . " " . l:emoji . ' ~ ' . l:fold_size . ' lines folded '
endfunction
"set foldtext=MyCustomFoldText()

"prettier
"let g:prettier#config#tab_width = 2
nnoremap <leader>s :Prettier<CR> \| :w<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Yank from cursor to the end of line.
nnoremap Y y$

" Yank all line
nnoremap <leader>yy :%y<CR>

nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <S-k> :bfirst<CR>
nnoremap <S-j> :blast<CR>
nnoremap <S-r> :bdelete<CR>

" markdown preview
nnoremap mp :MarkdownPreview<CR>

" nvimtree
nnoremap <leader>e :NvimTreeFocus<CR>
nnoremap <leader>er :NvimTreeRefresh<CR>
nnoremap <leader>ee :NvimTreeToggle<CR>
nnoremap <leader>ef :NvimTreeFindFile<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" tmux navigator
"let g:tmux_navigator_no_mappings = 1
"noremap <silent> <C-j> :TmuxNavigateDown<CR>
"noremap <silent> <C-k> :TmuxNavigateUp<CR>
"noremap <silent> <C-h> :TmuxNavigateLeft<CR>
"noremap <silent> <C-l> :TmuxNavigateRight<CR>
