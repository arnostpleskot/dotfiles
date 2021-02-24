" Change node version on startup to support all related node dependencies (eg.
" typescript)
call shellescape("fnm use nvim")
set nocompatible

let g:polyglot_disabled = ['yaml']

call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
  Plug 'junegunn/fzf.vim' 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
  Plug 'pbogut/fzf-mru.vim'
  Plug 'francoiscabrol/ranger.vim'
  " Dependency for ranger.vim providing :Bclose function
  Plug 'rbgrouleff/bclose.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdcommenter'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-abolish'
  Plug 'alvan/vim-closetag'
  Plug 'vim-test/vim-test'
  Plug 'puremourning/vimspector'
  Plug 'mbbill/undotree'
call plug#end()

let g:coc_global_extensions = [
      \ "coc-css",
      \ "coc-elixir",
      \ "coc-emmet",
      \ "coc-eslint",
      \ "coc-fsharp",
      \ "coc-git",
      \ "coc-highlight",
      \ "coc-json",
      \ "coc-lists",
      \ "coc-pairs",
      \ "coc-prettier",
      \ "coc-reason",
      \ "coc-smartf",
      \ "coc-sql",
      \ "coc-styled-components",
      \ "coc-syntax",
      \ "coc-tag",
      \ "coc-tsserver",
      \ "coc-word",
      \ "coc-yaml",
      \ "coc-yank",
      \ ]

filetype plugin on

" coc config
source $HOME/.config/nvim/coc.vim

"" Map leader to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" fzf config
let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
" let $FZF_DEFAULT_OPTS=
let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --smart-case --glob '!.git/*'"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Normal' } }

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, { 'options': ['--prompt', '> ', '--margin=1,1','--layout=reverse', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}', '--color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1', '--color=info:0,pointer:12,marker:4,spinner:11,header:-1']}, <bang>0)
command! -bang -nargs=? -complete=dir FZFMru
        \ call fzf_mru#actions#mru(<q-args>, { 'options': ['--no-height', '--prompt', '> ', '--margin=1,1','--layout=reverse', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}', '--color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1', '--color=info:0,pointer:12,marker:4,spinner:11,header:-1']}, <bang>0)
noremap <leader>f :Files<CR>
noremap <leader>r :Rg 
" MRU
noremap <silent> <C-space> :FZFFreshMru<CR>
" MRU list related to PWD
let g:fzf_mru_relative = 1
" rg for grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" vim-smartclose
nnoremap <silent><C-q> :q<CR>
let g:smartclose_set_default_mapping = 0

" vim-nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nmap <C-_> <Plug>NERDCommenterToggle<CR>
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

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

" Ranger
" disable default mappings
let g:ranger_map_keys = 0
silent! map <F2> :RangerWorkingDirectory<CR>
silent! map <F3> :Ranger<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Switching vertical layout to _h_orizontal
noremap <leader>h <C-w>K
" Switching horizontal layout to _v_ertical
noremap <leader>v <C-w>H

silent! noremap <F12> :syntax sync fromstart<CR>

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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Color scheme
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_vert_split="bg2"
colorscheme gruvbox

" highlight Comment cterm=italic gui=italic

"" MOUSE
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

" DB config

