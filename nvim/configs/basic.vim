set mouse=
set shortmess+=I

" カーソルキーでbuffer移動
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

set clipboard+=unnamedplus

autocmd BufEnter * silent! lcd %:p:h

" color
 set background=dark
 set diffopt+=vertical

" tab
hi TabLine ctermbg=NONE
hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=NONE
hi TabLineSel cterm=NONE ctermfg=188 ctermbg=999

" indent
augroup INDENT_2
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

let g:indent_blankline_enabled = 0
