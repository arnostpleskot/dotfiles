set nocompatible

let g:python3_host_prog = '~/.asdf/shims/python3'
let g:python_host_prog  = '~/.asdf/shims/python2'


call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocUpdate'}
  Plug 'mhinz/vim-startify'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'ryanoasis/vim-devicons'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-abolish'
  Plug 'alvan/vim-closetag'
  Plug 'mbbill/undotree'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-vinegar'
  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'tami5/sql.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " DAP - debug adapter protocol
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  " Dadbod - db integration
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

let g:coc_global_extensions = [
      \ "coc-css",
      \ "coc-elixir",
      \ "coc-emmet",
      \ "coc-eslint",
      \ "coc-git",
      \ "coc-highlight",
      \ "coc-json",
      \ "coc-lists",
      \ "coc-pairs",
      \ "coc-prettier",
      \ "coc-sql",
      \ "coc-styled-components",
      \ "coc-syntax",
      \ "coc-tag",
      \ "coc-tsserver",
      \ "coc-word",
      \ "coc-yaml",
      \ "coc-yank",
      \ "coc-db",
      \ ]

filetype plugin on


"" Map leader to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" coc config
source $HOME/.config/nvim/coc.vim

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Dadbod command
xnoremap <expr> <Plug>(DBExe)     db#op_exec()
nnoremap <expr> <Plug>(DBExe)     db#op_exec()
nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'

xmap <leader>db  <Plug>(DBExe)
nmap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nmap <leader>dbb <Plug>(DBExeLine)

" vim-smartclose
nnoremap <silent><C-q> :q<CR>
let g:smartclose_set_default_mapping = 0

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set smarttab

set smartindent

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

" don't show currently clicked command keys
" set noshowcmd

" don't change pwd on file change
set noautochdir

" command mode behavior
set wildmenu

" search
set nohlsearch
set incsearch

" search case
set ignorecase
set smartcase

set noerrorbells

" undo
set undodir=~/.vim/undodir
set undofile

" scroll offset
set scrolloff=8

" visual settings
syntax on
set ruler
set number relativenumber
set encoding=UTF-8
set colorcolumn=0
" increase redrawtime to fix syntax in long and complex files
set redrawtime=10000

set hidden


" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <C-p> "+gP<CR>
noremap XX "+x<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Switching vertical layout to _h_orizontal
noremap <leader>h <C-w>K
" Switching horizontal layout to _v_ertical
noremap <leader>v <C-w>H

" Startify
source $HOME/.config/nvim/startify.vim
autocmd BufEnter startify set noruler

" Markdown
" disable concealing
let g:vim_markdown_conceal = 0

" some conventional key bidings
nnoremap <silent> <leader>- :split<CR>
nnoremap <silent> <leader>\ :vsplit<CR>
nnoremap <silent> <C-S> :wa<CR>

" Move cursor on start/end of line
noremap <A-h> g^
noremap <A-l> g$

" undotree
nnoremap <F5> :UndotreeToggle<CR>

source $HOME/.config/nvim/colemak.vim

" vim-lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" update lightline after coc status change
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Don't show current mode in cmd line
set noshowmode

" Don't break long lines
set nowrap

" Yggdroot/indentLine
" Disable indent lines in Startify
let g:indentLine_fileTypeExclude = [ 'startify' ]
let g:indentLine_char = '▏'
autocmd TermEnter * IndentLinesDisable

" Hide ~ on blank lines
set fcs=eob:\ " comment to keep line

" Get rid of | cahracter in vertical split bar (https://stackoverflow.com/questions/9001337/vim-split-bar-styling)
set fillchars+=vert:\ " Keep line

" Set truecolor colors
set termguicolors

" Color scheme
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_vert_split="bg2"
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" Custom git gutter colors
highlight clear SignColumn
highlight GitGutterAdd guifg=#427b58
highlight GitGutterChange guifg=#d79921
highlight GitGutterDelete guifg=#9d0006
" set signcolumn=number

" Mouse
set mousemodel=popup
set mouse=a
set autowriteall

set cursorline

" vim-test
let g:test#javascript#mocha#file_pattern = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Set proper filetype for gql command
au BufNewFile,BufRead *.gql,*.graphql,*.graphqls setf graphql

lua << EOF
  require'nvim-web-devicons'
  require("telescope").load_extension("frecency")
  require('telescope').load_extension('coc')

  require('telescope')

  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "bash",
      "css",
      "fish",
      "graphql",
      "html",
      "javascript",
      "jsdoc", 
      "json", 
      "lua",
      "tsx", 
      "typescript",
      "prisma",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true, -- false will disable the whole extension
    },
  }

  vim.opt.list = true
  vim.opt.listchars:append("space:⋅")
  vim.opt.listchars:append("eol:↴")

  require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
  }
EOF
