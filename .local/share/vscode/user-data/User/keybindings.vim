" Setting leader key
let g:mapleader = " "
nnoremap <leader>ev :vsplit $XDG_CONFIG_HOME/nvim/init.vim<cr>
" Sourcing vimrc
nnoremap <leader>rv :source $MYVIMRC<cr> " Uppercasing a whole word inoremap <c-u> <esc>viwUea
" Use ctrl+arrow to resize splits
nnoremap <C-down>  :resize -2<CR>
nnoremap <C-up>    :resize +2<CR>
nnoremap <C-left>  :vertical resize -2<CR>
nnoremap <C-right> :vertical resize +2<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Copy and paste from or to gtk clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
" Enable or disable line wrap
nnoremap <F1> :set wrap!<cr>
" You cant stop me from writing
cnoremap W w !sudo tee %
" Goto last tab
" g:lasttab var is set in autocmd section
nnoremap <silent> <A-Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <A-Tab> :exe "tabn ".g:lasttab<cr>
" Add Line number in start of each block for a visual block.
vnoremap <Leader>as I0.<Space><Esc>gvg<C-a>
" Uppercase a word in insert mode
inoremap <c-u> <Esc>gUiwea
