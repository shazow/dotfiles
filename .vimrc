set nocompatible
set runtimepath=$DOTFILES_PATH/.vim,$VIMRUNTIME

" Enable vundle
filetype on
filetype off
set runtimepath+=$DOTFILES_PATH/.vim/bundle/vundle/
call vundle#rc()
source $DOTFILES_PATH/.vimrc.bundles


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

if has("gui_macvim")
    set macmeta " Necessary for using meta key in mappings on OSX
    let macvim_skip_cmd_opt_movement = 1 " Prevent MacVim from mapping fake HOME/END to M-arrow keys.
endif

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
map <leader>\ :noh<return> " Turn off highlighting

"" Navigation
""   Note: Terminal-based vim parses these key inputs differently than GUI-based
""   vim, so we need two versions of these two-key bindings. :'(
if has("gui_running")
  """ Panes
  nnoremap <M-right> <C-w>l " (alt-right)
  nnoremap <M-left> <C-w>h " (alt-left)
  nnoremap <M-down> <C-w>j " (alt-down)
  nnoremap <M-up> <C-w>k " (alt-up)

  nnoremap <M-,> :split<CR> " Horizontal split (alt-,)
  nnoremap <M-.> :vsplit<CR> " Vertical split (alt-.)
  nnoremap <M-/> :close<CR> " Close split (alt-/)

  nnoremap <M-k> <C-w>t<C-w>K " Convert vertical to horizontal split (alt-<)
  nnoremap <M-l> <C-w>t<C-w>H " Convert horizontal to vertical split (alt->)

  """ Buffers
  nnoremap <M-]> :bnext<CR>
  nnoremap <M-[> :bprev<CR>
  nnoremap <M-\> :bdelete<CR>

  """ Tabs
  nnoremap <M->> :tabnext<CR>
  nnoremap <M-<> :tabprev<CR>
  nnoremap <M-?> :tabclose<CR>
  nnoremap <M-M> :tabnew<CR>

else
  " (These are the same bindings as above, but generated using insert alt-v input.)

  """ Panes
  "nnoremap <Esc>C <C-w>l " (alt-right)
  "nnoremap <Esc>D <C-w>h " (alt-left)
  "nnoremap <Esc>B <C-w>j " (alt-down)
  "nnoremap <Esc>A <C-w>k " (alt-up)

  nnoremap ≤ :split<CR> " Horizontal split (alt-,)
  nnoremap ≥ :vsplit<CR> " Vertical split (alt-.)
  nnoremap ÷ :close<CR> " Close split (alt-/)

  nnoremap ¬ <C-w>t<C-w>K " Convert vertical to horizontal split (alt-l)
  nnoremap ˚ <C-w>t<C-w>H " Convert horizontal to vertical split (alt-k)

  """ Buffers
  nnoremap “ :bnext<CR> " alt-[
  nnoremap ‘ :bprev<CR> " alt-]
  nnoremap « :bdelete<CR> " alt-\

  """ Tabs
  nnoremap ¯ :tabnext<CR> " alt->
  nnoremap ˘ :tabprev<CR> " alt-<
  nnoremap ¿ :tabclose<CR> " alt-?
  nnoremap Â :tabnew<CR> " alt-M
endif


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


" Extra:

"" Fix bug in css syntax highlighting overriding css-color.
"" FIXME: Remove when https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim/issues/4 is fixed
au Filetype css,less source ~/.vim/bundle/vim-css-color/after/syntax/css.vim
