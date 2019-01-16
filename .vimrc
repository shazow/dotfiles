" Vanilla (neo)vim configurations are here.
" Plugin configurations are in .vim/plugins.vim

set nocompatible
set runtimepath+=$DOTFILES_PATH/.vim
set background=dark
colorscheme mylokai
scriptencoding utf-8

" Enable some nvim features.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    if substitute(system("which python | xargs readlink"), "\n", '', 'g') == "python2"
        let g:python2_host_prog=substitute(system("which -a python | head -n2 | tail -n1"), "\n", '', 'g')
    else
        let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
    endif
endif

" Enable plugins
source $DOTFILES_PATH/.vim/plugins.vim

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
set wildignore+=.*,*.o,*.obj,*.pyc

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
nnoremap <leader>so :so $MYVIMRC<return> " Reload source

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

""" Quickfix
nnoremap <M-n> :cnext<CR>
nnoremap <M-p> :cprev<CR>

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
function! MakeUp()
    let makefile = findfile("Makefile", ".;")
    if makefile != ""
        silent exe "NeomakeSh make -C " . fnamemodify(makefile, ':p:h')
    endif
endfunc
autocmd BufWritePost *.scss call MakeUp()


" Open the current pane in a tab and close the pane
function! PaneToTab()
    silent exe "close | tabnew +" . line(".") . " " . expand("%:p")
endfunc

" Ignore Noun-y words when spell checking
function! IgnoreNounSpell()
    syn match myExCapitalWords +\<\w*[A-Z]\S*\>+ contains=@NoSpell
    "syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
    "syn cluster Spell add=CamelCase
endfunc

" Set tab width
function! SetTab(width)
    let &tabstop=a:width
    let &softtabstop=a:width
    let &shiftwidth=a:width
endfunc

" Save/Load macro
" Borrowed from https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)

" Open FILENAME:LINE:COL
" Borrowed from https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:goto_line()
  let tokens = split(expand('%'), ':')
  if len(tokens) <= 1 || !filereadable(tokens[0])
    return
  endif

  let file = tokens[0]
  let rest = map(tokens[1:], 'str2nr(v:val)')
  let line = get(rest, 0, 1)
  let col  = get(rest, 1, 1)
  bd!
  silent execute 'e' file
  execute printf('normal! %dG%d|', line, col)
endfunction
autocmd BufNewFile * nested call s:goto_line()

" Extra:

"" Detect RFC files
autocmd FileType text if expand('%:t') =~? 'rfc\d\+' | set filetype=rfc | endif

"" .ract files for ractive
autocmd BufNewFile,BufRead *.ract set filetype=mustache

"" Move the quickfix window to the very bottom.
autocmd FileType qf wincmd J

" Load gvimrc if it wasn't loaded already.
if has('gui_running') && !exists("g:gvimrc_init")
    source $DOTFILES_PATH/.gvimrc
endif

"" Detect readonly buffers (neovim-only)
hi! ReadOnlyNormal ctermbg=0
if exists('+winhighlight')
  autocmd BufReadPost * if &readonly
        \|  set winhighlight=Normal:ReadOnlyNormal
        \| endif
endif
