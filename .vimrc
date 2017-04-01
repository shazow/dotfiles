set nocompatible
set runtimepath+=$DOTFILES_PATH/.vim
set background=dark
colorscheme mylokai

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" Enable some nvim features.
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1  " Broken, pending: https://github.com/neovim/neovim/issues/2953
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


" Enable plugins
filetype off
set shell=/bin/bash
source $DOTFILES_PATH/.vim/plugins.vim

" Syntax and encoding
syntax on " Syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype
scriptencoding utf-8

" Keep all temporary and backup files in ~/.vim
set viminfo='10,\"100,:20,%,n~/.vim/viminfo
set backup
set backupdir=~/.vim/backup " Backup
set directory=~/.vim/tmp " Swap
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo " Undo
    set undolevels=100 " Maximum number of changes that can be undone
    set undoreload=1000 " Maximum number lines to save for undo on a buffer reload
endif

" General settings
"set t_Co=256 " Enable 256 colors for terminals
set mouse=nicr " Enable mouse in terminals
set encoding=utf-8
set termencoding=utf-8
set tabstop=4 " Tab
set shiftwidth=4 " Indent
set softtabstop=4 " Backspace
set expandtab " Convert tabs to spaces

set ruler " Position at the bottom of the screen
set shortmess=atI " Avoid 'press a key' prompt

set history=1000
set hidden " Allow buffer switching without saving
set number
set nowrap
set nostartofline " Maintain cursor column position across rows

" Search
set hlsearch
set incsearch
set ignorecase

" Tags
set tags=./tags,tags;$HOME

" Autocomplete
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc

" Highlight content beyond col79
if exists('+colorcolumn')
    set colorcolumn=80
endif

" Split, place cursor in newly-split pane
set splitbelow
set splitright

" General mappings
nnoremap <leader>\ :noh<return> " Turn off highlighting
nnoremap <silent><leader>w :call search('\u', 'W')<CR> " Jump TitleCase words

vmap > >gv " Retain visual select when indenting
vmap < <gv " Retain visual select when indenting

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]' " Reselect paste.

command! W write " Write on :W, too.
command! E edit " Edit on :E, too.

"" Navigation
""" Panes
nnoremap <M-right> <C-w>l " (alt-right)
nnoremap <M-left> <C-w>h " (alt-left)
nnoremap <M-down> <C-w>j " (alt-down)
nnoremap <M-up> <C-w>k " (alt-up)

if has("nvim")
    tnoremap <M-right> <C-w>l " (alt-right)
    tnoremap <M-left> <C-w>h " (alt-left)
    tnoremap <M-down> <C-w>j " (alt-down)
    tnoremap <M-up> <C-w>k " (alt-up)
endif

nnoremap <M-l> :topleft split<CR> " Horizontal split (alt-l)
nnoremap <M-k> :topleft vsplit<CR> " Vertical split (alt-k)
nnoremap <M-;> :close<CR> " Close split (alt-/)

nnoremap <M-h> <C-w>t<C-w>K " Convert vertical to horizontal split (alt-h)
nnoremap <M-j> <C-w>t<C-w>H " Convert horizontal to vertical split (alt-j)

nnoremap <M->> <C-w>> " Resize width
nnoremap <M-<> <C-w>< " Resize width
nnoremap <M-_> <C-w>- " Resize height
nnoremap <M-+> <C-w>+ " Resize height

""" Buffers
nnoremap <M-.> :bnext<CR>
nnoremap <M-,> :bprev<CR>
nnoremap <M-/> :bdelete<CR>

""" Tabs
nnoremap <M-]> :tabnext<CR>
nnoremap <M-[> :tabprev<CR>
nnoremap <M-}> :tabmove +1<CR>
nnoremap <M-{> :tabmove -1<CR>
nnoremap <M-w> :tabclose<CR>
nnoremap <M-t> :tabnew %<CR>
nnoremap <M-T> :call PaneToTab()<CR>


" Keep vim's directory context same as the current buffer
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Reveal rogue spaces
set list listchars=tab:>\ ,trail:.,extends:$,nbsp:_
set fillchars=fold:-


" Evaporate rogue spaces
function! StripWhitespace()
    exec ':%s/\s*$//g'
endfunction
noremap <leader><space> :call StripWhitespace()<CR>


" Find the nearest Makefile and run it
func! MakeUp()
    let makefile = findfile("Makefile", ".;")
    if makefile != ""
        silent exe "NeomakeSh make -C " . fnamemodify(makefile, ':p:h')
    endif
endfunc
autocmd BufWritePost *.scss call MakeUp()


" Open the current pane in a tab and close the pane
func! PaneToTab()
    silent exe "close | tabnew +" . line(".") . " " . expand("%:p")
endfunc

" Ignore Noun-y words when spell checking
func! IgnoreNounSpell()
    syn match myExCapitalWords +\<\w*[A-Z]\S*\>+ contains=@NoSpell
    "syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
    "syn cluster Spell add=CamelCase
endfunc

" Set tab width
func! SetTab(width)
    let &tabstop=a:width
    let &softtabstop=a:width
    let &shiftwidth=a:width
endfunc


" Extra:

"" Fix bug in css syntax highlighting overriding css-color.
"" FIXME: Remove when https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim/issues/4 is fixed
au Filetype css,less source ~/.vim/bundle/vim-css-color/after/syntax/css.vim

"" Detect RFC files
au FileType text if expand('%:t') =~? 'rfc\d\+' | set filetype=rfc | endif

"" Move the quickfix window to the very bottom.
autocmd FileType qf wincmd J

" Load gvimrc if it wasn't loaded already.
if has('gui_running') && !exists("g:gvimrc_init")
    source $DOTFILES_PATH/.gvimrc
endif
