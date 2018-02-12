"" Open guide
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide "<Space>"<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual "<Space>"<CR>

"" Dictonary
" define prefix dictionary
let g:lmap =  {}


" f - file
let g:lmap.f = { 'name' : 'file menu' }

  nmap <silent> <leader>fd :e $myvimrc<cr>
  let g:lmap.f.d = ['e $myvimrc', 'open vimrc']

  nmap <silent> <leader>fs :so %<cr>
  let g:lmap.f.s = ['so %', 'source file']


" o - open
let g:lmap.o = { 'name' : 'open stuff' }

  nmap <silent> <leader>oo  :copen<cr>
  let g:lmap.o.o = ['copen', 'open quickfix']

  nmap <silent> <leader>ol  :lopen<cr>
  let g:lmap.o.l = ['lopen', 'open locationlist']

  nmap <silent> <leader>fw :w<cr>
  let g:lmap.f.w = ['w', 'write file']


" s - search
let g:lmap.s = { 'name': 'search' }

  nmap <silent> <leader>sg  :Denite grep -no-empty grep<CR>
  let g:lmap.s.g = ['Denite grep -no-empty grep', 'grep']

  nmap <silent> <leader>sf  :DeniteProjectDir file_rec<CR>
  let g:lmap.s.f = ['DeniteProjectDir', 'file']

  nmap <silent> <leader>sb  :Denite buffer<CR>
  let g:lmap.s.b = ['Denite buffer', 'buffer']

  nmap <silent> <leader>s<Space> :noh<CR>
  let g:lmap.s.c = ['noh', 'clean search highlight']

" w
let g:lmap.w = { 'name': 'window menu' }

  nmap <silent> <leader>wh :split<CR>
  let g:lmap.w.h = ['split', 'horizontal split']

  nmap <silent> <leader>wv :vsplit<CR>
  let g:lmap.w.v = ['vsplit', 'vertical split']


" g - git
let g:lmap.g = { 'name': 'git menu' }
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

" S - session
let g:lmap.S = { 'name': 'Session' }

  nmap <silent> <leader>So :OpenSession<Space>
  let g:lmap.S.o = ['OpenSession', 'open']

  nmap <silent> <leader>Ss :SaveSession<Space>
  let g:lmap.b.w = ['SaveSession', 'save']

  nmap <silent> <leader>Sd :DeleteSession<CR>
  let g:lmap.b.c = ['DeleteSession', 'delete']

  nmap <silent> <leader>Sc :CloseSession<CR>
  let g:lmap.b.c = ['CloseSession', 'close']

" c - comments
let g:lmap.c = { 
      \ 'name': 'comments',
      \ }
