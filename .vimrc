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

if has("gui_macvim")
    set macmeta " Necessary for using meta key in mappings on OSX
    let macvim_skip_cmd_opt_movement = 1 " Prevent MacVim from mapping fake HOME/END to M-arrow keys.
endif

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

"" Spare the pinky-finger
noremap ; :
noremap , ;

"" Navigation
""" Panes
map <M-right> <C-w>l
map <M-left> <C-w>h
map <M-down> <C-w>j
map <M-up> <C-w>k

map <M-,> :split<CR> " Horizontal split
map <M-.> :vsplit<CR> " Vertical split
map <M-/> :close<CR> 

map <M-<> <C-w>t<C-w>K " Convert vertical to horizontal split
map <M->> <C-w>t<C-w>H " Convert horizontal to vertical split

""" Buffers
map <M-]> :bnext<CR>
map <M-[> :bprev<CR>
map <M-backspace> :bdelete<CR>

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

" vim-indent-guides
let g:indent_guides_auto_colors = 0
