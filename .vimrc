set runtimepath=$DOTFILES_PATH/.vim,$VIMRUNTIME

" Keep all temporary and backup files in ~/.vim
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

" General settings
set tabstop=4 " Tab
set shiftwidth=4 " Indent
set softtabstop=4 " Backspace
set expandtab " Convert tabs to spaces

set ruler " Position at the bottom of the screen
set shortmess=atI " Avoid 'press a key' prompt

set history=1000
set number
set nowrap
set nostartofline " Maintain cursor column position across rows

" Search
set hlsearch
set incsearch
set ignorecase

" Autocomplete
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc

" Highlight content beyond col79

if exists('+colorcolumn')
    set colorcolumn=80
else
    match ColorColumn /\%80v.\+/
endif

" General mappings
map <leader>\ :noh<return> " Turn off highlighting

"" Navigation
""" Panes
map <C-right> <C-w>l
map <C-left> <C-w>h
map <C-down> <C-w>j
map <C-up> <C-w>k

map <C-delete> :close<CR>
map <C-insert> :split<CR>
map <C-home> :vsplit<CR>

""" Buffers
map <C-]> :bnext<CR>
map <C-[> :bprev<CR>
map <C-backspace> :bdelete<CR>

" Pathogen Bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on " Syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype

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
function! StripWhitespace ()
    exec ':%s/\s*$//g'
endfunction
noremap <leader><space> :call StripWhitespace ()<CR>



" Bundles:

"" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

"" Pep8
let g:pep8_map='<leader>8'

"" SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Matchit
autocmd FileType mako let b:match_words = '<\(\w\w*\):</\1,{:}'
