" don't show the help in normal mode
"let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
"let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "", 'right': "" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"let g:Lf_ShortcutF = "<leader>ff"
"noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"" search visually selected text literally
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>

"" should use `Leaderf gtags --update` first
"let g:Lf_GtagsAutoGenerate = 0
"let g:Lf_Gtagslabel = 'native-pygments'
"noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>U

" color settings
let g:Lf_PopupPalette = {
    \  'dark': {
    \      'Lf_hl_popup_inputText': {
    \                'gui': 'bold',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#6272a4',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_window': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': 'NONE',
    \                'guibg': '#282a36',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_blank': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': 'NONE',
    \                'guibg': '#21222c',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_prompt': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#282a36',
    \                'guibg': '#6272a4',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_spin': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#282a36',
    \                'guibg': '#6272a4',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_normalMode': {
    \                'gui': 'bold',
    \                'font': 'NONE',
    \                'guifg': '#282a36',
    \                'guibg': '#bd93f9',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_inputMode': {
    \                'gui': 'bold',
    \                'font': 'NONE',
    \                'guifg': '#282a36',
    \                'guibg': '#50fa7b',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_category': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#6272a4',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_nameOnlyMode': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#44475a',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_fullPathMode': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#44475a',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_fuzzyMode': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#44475a',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_regexMode': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#44475a',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_cwd': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#21222c',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_lineInfo': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#282a36',
    \                'guibg': '#bd93f9',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_popup_total': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f8f8f2',
    \                'guibg': '#6272a4',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \      },
    \      'Lf_hl_match': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': '#f1fa8c',
    \                'guibg': '#44475a',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \              },
    \      'Lf_hl_cursorline': {
    \                'gui': 'NONE',
    \                'font': 'NONE',
    \                'guifg': 'NONE',
    \                'guibg': '#44475a',
    \                'cterm': 'NONE',
    \                'ctermfg': 'NONE',
    \                'ctermbg': '236'
    \              },
    \      },
    \  }
