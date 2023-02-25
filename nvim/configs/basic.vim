set mouse=

" カーソルキーでbuffer移動
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

set clipboard+=unnamedplus

autocmd BufEnter * silent! lcd %:p:h

" color
set background=dark
set diffopt+=vertical

hi Pmenu ctermfg=188 ctermbg=236
hi PmenuSel ctermfg=188 ctermbg=24

hi DiffText   cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=LightYellow guibg=NONE
hi DiffChange cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=LightBlue guibg=NONE
hi DiffAdd    cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#383c47
hi DiffDelete cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#333232

" signcolumnの色をNoneに
hi SignColumn ctermbg=None

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

