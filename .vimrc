set runtimepath=$DOTFILES_PATH/.vim,$VIMRUNTIME

" Keep all temporary and backup files in ~/.vim
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

" General settings
set encoding=utf-8
set termencoding=utf-8
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
endif

" General mappings
map <leader>\ :noh<return> " Turn off highlighting

"" Navigation
""   Note: Terminal-based vim parses these key inputs differently than GUI-based
""   vim, so we need two versions of these two-key bindings. :'(
if has("gui_running")
  """ Panes
  map <M-right> <C-w>l " (alt-right)
  map <M-left> <C-w>h " (alt-left)
  map <M-down> <C-w>j " (alt-down)
  map <M-up> <C-w>k " (alt-up)

  map <M-,> :split<CR> " Horizontal split (alt-,)
  map <M-.> :vsplit<CR> " Vertical split (alt-.)
  map <M-/> :close<CR> : Close split (alt-/)

  map <M-k> <C-w>t<C-w>K " Convert vertical to horizontal split (alt-<)
  map <M-l> <C-w>t<C-w>H " Convert horizontal to vertical split (alt->)

  """ Buffers
  map <M-]> :bnext<CR>
  map <M-[> :bprev<CR>
  map <M-\> :bdelete<CR>

  """ Tabs
  map <M->> :tabnext<CR>
  map <M-<> :tabprev<CR>
  map <M-?> :tabclose<CR>
  map <M-M> :tabnew<CR>

else
  " (These are the same bindings as above, but generated using insert alt-v input.)

  """ Panes
  map [1;3C <C-w>l " (alt-right)
  map [1;3D <C-w>h " (alt-left)
  map [1;3B <C-w>j " (alt-down)
  map [1;3A <C-w>k " (alt-up)

  map , :split<CR> " Horizontal split (alt-,)
  map . :vsplit<CR> " Vertical split (alt-.)
  map / :close<CR> : Close split (alt-/)

  map k <C-w>t<C-w>K " Convert vertical to horizontal split (alt-<)
  map l <C-w>t<C-w>H " Convert horizontal to vertical split (alt->)

  """ Buffers
  map ] :bnext<CR>
  map [ :bprev<CR>
  map \ :bdelete<CR>

  """ Tabs
  map > :tabnext<CR>
  map < :tabprev<CR>
  map ? :tabclose<CR>
  map M :tabnew<CR>
endif

" Pathogen Bundles
filetype off
call pathogen#infect()

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

"" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

"" Pep8
let g:pep8_map='<leader>8'

"" SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Matchit
autocmd FileType mako let b:match_words = '<\(\w\w*\):</\1,{:}'


" Extra:

"" Fix bug in css syntax highlighting overriding css-color.
"" FIXME: Remove when https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim/issues/4 is fixed
au Filetype css source $DOTFILES_PATH/.vim/bundle/css-color/after/syntax/css.vim
