"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""VIM PLUG"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('/home/kawsar/.local/share/nvim/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo /home/kawsar/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('/home/kawsar/.local/share/nvim/autoload/plugged')
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'tpope/vim-commentary'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""GENERAL KEYBINDINGS"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""AUTOCOMMANDS"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html class adding
" autocmd FileType html nnoremap  <leader>c viw<esc>a<space>class=""<esc>i
" autocmd FileType html inoremap  <leader>c <esc>viw<esc>a<space>class=""<esc>i
" autocmd FileType html nnoremap  <leader>a t>la
" autocmd FileType html inoremap  <leader>a <esc>t>la
" Need this line for moving between last used tabs
autocmd TabLeave * let g:lasttab = tabpagenr()
autocmd BufNewFile,BufRead *.rasi set ft=css
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""GENERAL OPTIONS""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indention Options
set smartindent     " New lines inherit the indentation of previous lines.
set shiftround      " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4    " When shifting, indent using four spaces.
set smarttab        " Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4       " Indent using four spaces.
set expandtab       " Convert tabs to spaces
" Search Options
set ignorecase      " Ignore case when searching.
set smartcase       " Automatically switch search to case-sensitive when search query contains an uppercase letter.
set nohlsearch      " turning off highlighting search
" Performance Options
set complete-=i      " Limit the files searched for auto-completes.
set lazyredraw      " Don’t update screen during macro and script execution.
" Text Rendering Options
set display+=lastline " Always try to show a paragraph’s last line.
set encoding=utf-8    " Use an encoding that supports unicode.
set scrolloff=1        " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5    " The number of screen columns to keep to the left and right of the cursor.
syntax enable          " Enable syntax highlighting.
" User Interface Options
set title         " Change the window title
set laststatus=2    " Always display the status bar.
set ruler            " Always show cursor position.
set wildmenu        " Display command line’s tab complete options as a menu.
set tabpagemax=50    " Maximum number of tab pages that can be opened from the command line.
set nocursorline    " Highlight the line currently under cursor.
set number relativenumber  " Show line number on the current line and relative numbers on all other lines.
set noerrorbells    " Disable beep on errors.
set visualbell      " Flash the screen instead of beeping on errors.
set mouse=a          " Enable mouse for scrolling and resizing.
colorscheme industry     " ColorScheme 
" Code Folding Options
set foldmethod=indent  " Fold based on indention levels.
set foldnestmax=3     " Only fold up to three nested levels.
set nofoldenable      " Disable folding by default.
" Miscellaneous Options
set autoread               " Automatically re-read files if unmodified inside Vim.
set backspace=indent,eol,start  " Allow backspacing over indention, line breaks and insertion start.
set backupdir=~/.cache/nvim      " Directory to store backup files.
set confirm                " Display a confirmation dialog when closing an unsaved file.
set dir=~/.cache/nvim      " Directory to store swap files.
set formatoptions+=j      " Delete comment characters when joining lines.
set history=1000          " Increase the undo limit.
set nomodeline            " Ignore file’s mode lines; use vimrc configurations instead.
set nrformats-=octal      " Interpret octal as decimal when incrementing numbers.
set shell=/usr/bin/zsh
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk " Ignore files matching these patterns when opening files based on a glob pattern.
set nocompatible
set whichwrap+=<,>,[,],h,l      " Helps to go to next or previous line.
set nowrap             " Disable wrpping
set pumheight=10                " Max no of lines in autocompletion menu.
set splitbelow                  " New horizontal split will be below.
set splitright                  " New vertical split will be right.
set showtabline=1               " Always show the tab status line.
set noshowmode                  " Lightline does this
set timeoutlen=500               " Shortcut threshold time.
set formatoptions -=cro         " To disable comment inheritance.
au! BufWritePost $MYVIMRC source %  " Autosource vimrc when vimrc is saved.
" Coc recommended.
set hidden                " TextEdit might fail if hidden is not set.
set nobackup              " Some servers have issues with backup files, see #649.
set nowritebackup         " Some servers have issues with backup files, see #649.
set updatetime=300        " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c          " Don't pass messages to |ins-completion-menu|.
filetype plugin on
hi Normal guibg=NONE ctermbg=NONE    " Enabling transparency
set path=.,**
set path=.,**
colorscheme elflord
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""PLUG CONFIGUARATION""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Needed for colorizer
set termguicolors
luafile ~/.config/nvim/colorizer.lua
