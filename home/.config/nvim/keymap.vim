"" Open guide
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide "<Space>"<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual "<Space>"<CR>

"" Dictonary
" define prefix dictionary
let g:lmap =  {
  \' ': ['wa', 'write everything'],
  \}


" F - file
let g:lmap.F = { 'name' : 'File menu' }

  nmap <silent> <leader>Fd :e ~/.config/nvim/init.vim<cr>
  let g:lmap.F.d = ['e ~/.config/nvim/init.vim', 'init.vim edit']

  nmap <silent> <leader>Fk :e ~/.config/nvim/leader-guide.vim<cr>
  let g:lmap.F.k = ['e ~/.config/nvim/keymap.vim', 'keymap edit']

  nmap <silent> <leader>Fs :source ~/.config/nvim/init.vim<cr>
  let g:lmap.F.s = ['source ~/.config/nvim/init.vim', 'source file']

  nmap <silent> <leader>Fw :w<cr>
  let g:lmap.F.w = ['w', 'write file']

  nmap <silent> <leader>FW :wa<cr>
  let g:lmap.F.W = ['wa', 'Write all files']

  nmap <silent> <leader>Fq :qa<cr>
  let g:lmap.F.q = ['q', 'quit nvim']

  nmap <silent> <leader>FQ :qa!<cr>
  let g:lmap.F.Q = ['qa!', 'force Quit nvim']

" o - open
let g:lmap.o = { 'name' : 'open stuff' }

  nmap <silent> <leader>oo  :copen<cr>
  let g:lmap.o.o = ['copen', 'open quickfix']

  nmap <silent> <leader>ol  :lopen<cr>
  let g:lmap.o.l = ['lopen', 'open locationlist']

" f - find
let g:lmap.f = { 'name': 'find' }

  nmap <silent> <leader>fa  :Ag<CR>
  let g:lmap.f.a = ['Ag', 'Ag']

  nmap <silent> <leader>ff  :FZF -m<CR>
  let g:lmap.f.f = ['FZF -m', 'file']

  nmap <silent> <leader>fb  :Buffers<CR>
  let g:lmap.f.b = ['Buffers', 'buffer']

  nmap <silent> <leader>fc :noh<CR>
  let g:lmap.f.c = ['noh', 'clean search highlight']

" w
let g:lmap.w = { 'name': 'window' }

  nmap <silent> <leader>wh :split<CR>
  let g:lmap.w.h = ['split', 'horizontal split']

  nmap <silent> <leader>wv :vsplit<CR>
  let g:lmap.w.v = ['vsplit', 'vertical split']


" g - git
let g:lmap.g = { 'name': 'git' }
let g:lmap.g.p = { 'name': 'push / pull' }

  nmap <silent> <leader>ga :Gwrite<CR>
  let g:lmap.g.a = ['Gwrite', 'git add']

  nmap <silent> <leader>ga :Gcommit<CR>
  let g:lmap.g.c = ['Gcommit', 'git commit']

  nmap <silent> <leader>gps :Gpush<CR>
  let g:lmap.g.p.s = ['Gpush', 'git push']

  nmap <silent> <leader>gpl :Gpull<CR>
  let g:lmap.g.p.l = ['Gpull', 'git pull']

  nmap <silent> <leader>gs :Gstatus<CR>
  let g:lmap.g.s = ['Gstatus', 'git status']

  nmap <silent> <leader>gb :Gblame<CR>
  let g:lmap.g.b = ['Gblame', 'git blame']

  nmap <silent> <leader>gd :Gvdiff<CR>
  let g:lmap.g.d = ['Gvdiff', 'diff']

  nmap <silent> <leader>gr :Gremove<CR>
  let g:lmap.g.r = ['Gremove', 'git rm']

  nmap <silent> <leader>go :Gbrowse<CR>
  let g:lmap.g.o = ['Gbrowse', 'open line on GitHub']


" b - buffer
let g:lmap.b = { 'name': 'buffer' }

  nmap <silent> <leader>bq :bp<CR>
  let g:lmap.b.q = ['bp', 'previous']

  nmap <silent> <leader>bw :bn<CR>
  let g:lmap.b.w = ['bn', 'next']

  nmap <silent> <leader>bc :bd<CR>
  let g:lmap.b.c = ['bd', 'close']

  "nmap <silent> <leader>ba :w|%bd|e#<CR>
  "let g:lmap.b.a = ["w|%bd|e#", 'close all']


" S - session
let g:lmap.S = { 'name': 'Session' }

  nmap <silent> <leader>So :OpenSession<Space>
  let g:lmap.S.o = ['OpenSession', 'open']

  nmap <silent> <leader>Ss :SaveSession<Space>
  let g:lmap.S.s = ['SaveSession', 'save']

  nmap <silent> <leader>Sd :DeleteSession<CR>
  let g:lmap.S.d = ['DeleteSession', 'delete']

  nmap <silent> <leader>Sc :CloseSession<CR>
  let g:lmap.S.c = ['CloseSession', 'close']

" c - comments
let g:lmap.c = { 
      \ 'name': 'comments',
      \ }
