" Change node version on startup to support all related node dependencies (eg.
" typescript)
call shellescape("fnm use nvim")
set nocompatible

" Disable typescript from vim-polyglot to prevent `E700: Unknown function: GetJavascriptIndent` error
let g:polyglot_disabled = ['typescript']

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
  Plug 'dense-analysis/ale'
  Plug 'scrooloose/nerdcommenter'
  Plug 'moll/vim-bbye'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-surround'
  Plug 'cohama/lexima.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'frazrepo/vim-rainbow'
  Plug 'arnostpleskot/vim-smartclose'
  Plug 'ap/vim-css-color'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
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

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

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

"" VISUAL SETTINGS
syntax on
set ruler
set number relativenumber
set encoding=UTF-8

nnoremap <leader>- :split<CR>
nnoremap <leader>\ :vsplit<CR>

" vim-airline

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 1
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

" Get rid of | cahracter in vertical split bar (https://stackoverflow.com/questions/9001337/vim-split-bar-styling)
set fillchars+=vert:\ " Keep line

" Yggdroot/indentLine
" Disable indent lines in Startify
let g:indentLine_fileTypeExclude = [ 'startify' ]

" Hide ~ on blank lines
set fcs=eob:\ " comment to keep line

" Set proper background color
set termguicolors

colorscheme dracula

"" MOUSE
set mousemodel=popup
set mouse=a
set autowriteall


"" ALE
let g:ale_linters = {
\  'javascript': ['eslint', 'fecs', 'jscs', 'jshint', 'standard', 'xo'],
\  'reason': ['reason-language-server']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'jsx': ['prettier', 'eslint'],
\   'reason': ['refmt'],
\   'typescriptreact': ['prettier', 'eslint'],
\}

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

let g:ale_reason_ls_executable = '/usr/local/bin/reason-language-server'

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1


let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '%severity%: [%linter%] %s'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '➤'
let g:ale_sign_info = '🛈'

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
