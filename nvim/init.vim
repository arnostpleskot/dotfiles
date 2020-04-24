" Change node version on startup to support all related node dependencies (eg.
" typescript)
call shellescape("fnm use nvim")
set nocompatible

call plug#begin()
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'vim-airline/vim-airline'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'francoiscabrol/ranger.vim'
  " Dependency for ranger.vim providing :Bclose function
  Plug 'rbgrouleff/bclose.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'majutsushi/tagbar'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdcommenter'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'cohama/lexima.vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'arnostpleskot/vim-smartclose'
  Plug 'ap/vim-css-color'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'easymotion/vim-easymotion'
  Plug 'machakann/vim-sandwich'
call plug#end()

filetype plugin on

" coc config
source $HOME/.config/nvim/coc.vim

"" Map leader to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" leaderf config
source $HOME/.config/nvim/leaderf.vim

" vim-smartclose
nnoremap <silent>q :SmartClose<CR>
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

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

" don't show currently clicked command keys
set noshowcmd

" don't change pwd on file change
set noautochdir

" tagbar
nmap <F8> :TagbarToggle<CR>

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
let g:startify_change_to_dir = 0
silent! nmap <F1> :Startify<CR>

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_use_smartsign_us = 1 " Smartsign (type `3` and match `3`&`#`)
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
nmap <leader><leader> <Plug>(easymotion-overwin-f)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" some conventional key bidings
nnoremap <silent> <leader>- :split<CR>
nnoremap <silent> <leader>\ :vsplit<CR>
nnoremap <silent> <C-S> :wa<CR>

"" VISUAL SETTINGS
syntax on
set ruler
set number relativenumber
set encoding=UTF-8
" increase redrawtime to fix syntax in long and complex files
set redrawtime=10000

" vim-airline

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Don't show current mode in cmd line
set noshowmode

" Don't break long lines
set nowrap

" Yggdroot/indentLine
" Disable indent lines in Startify
let g:indentLine_fileTypeExclude = [ 'startify' ]
autocmd TermEnter * IndentLinesDisable

" Hide ~ on blank lines
set fcs=eob:\ " comment to keep line

" Get rid of | cahracter in vertical split bar (https://stackoverflow.com/questions/9001337/vim-split-bar-styling)
set fillchars+=vert:\ " Keep line

" Set proper background color
set termguicolors

colorscheme dracula

highlight Comment cterm=italic gui=italic

"" MOUSE
set mousemodel=popup
set mouse=a
set autowriteall

set cursorline
hi CursorLine guibg=#363948
hi CursorLineNr guifg=#bd93f9 guibg=#363948

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
