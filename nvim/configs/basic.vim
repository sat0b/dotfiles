set nu

" tab
hi TabLine cterm=NONE ctermfg=999 ctermbg=NONE
hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=NONE
hi TabLineSel cterm=NONE ctermfg=black ctermbg=999

" カーソルキーでbuffer移動
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

set clipboard+=unnamedplus

