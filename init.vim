call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'valloric/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'raimondi/delimitmate'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --omit=dev' }
Plug 'dense-analysis/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'numToStr/Comment.nvim'

"Plug 'connorholyday/vim-snazzy'
"Plug 'fladson/vim-kitty'
"Plug 'vim-airline/vim-airline'
"Plug 'yggdroot/indentline'
"Plug 'gmoe/vim-espresso'
"Plug 'sainnhe/everforest'
"Plug 'joshdick/onedark.vim'
"Plug 'dracula/vim'
"Plug 'wfxr/minimap.vim'
call plug#end()

" require lua script
lua require('nvimtree')
lua require('override')
lua require('coc')
lua require('lua_line')
lua require('buffer_line')
lua require('indentblankline')
lua require('nvim_treesitter')
lua require('nvim_telescope')
lua require('nvim_comment')
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

set foldtext=MyCustomFoldText()

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

" ale
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'html': ['prettier'],
\  'css': ['prettier'],
\  'scss': ['prettier'],
\  'json': ['prettier'],
\  'yaml': ['prettier'],
\  'markdown': ['prettier'],
\  'vue': ['prettier'],
\  'svelte': ['prettier'],
\  'javascript.jsx': ['prettier'],
\  'typescript.tsx': ['prettier'],
\  'javascriptreact': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'php': ['prettier'],
\}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" tmux navigator
let g:tmux_navigator_no_mappings = 1
noremap <silent> <C-j> :TmuxNavigateDown<CR>
noremap <silent> <C-k> :TmuxNavigateUp<CR>
noremap <silent> <C-h> :TmuxNavigateLeft<CR>
noremap <silent> <C-l> :TmuxNavigateRight<CR>
