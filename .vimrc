set nocompatible
set runtimepath=$DOTFILES_PATH/.vim,$VIMRUNTIME

" Enable vundle
filetype on
filetype off
set runtimepath+=$DOTFILES_PATH/.vim/bundle/vundle/
call vundle#rc()

" Bundles:
"" Core
Bundle 'gmarik/vundle'

"" Early dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

"" Other
Bundle 'Shougo/neocomplcache'
Bundle 'alfredodeza/pytest.vim'
Bundle 'edsono/vim-matchit'
"Bundle 'ervandew/supertab'
Bundle 'fs111/pydoc.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'gmarik/vundle'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kevinw/pyflakes-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'leshill/vim-json'
Bundle 'mbbill/undotree'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'shazow/html5.vim'
Bundle 'skammer/vim-css-color'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/closetag.vim'
Bundle 'vim-scripts/pep8'

" Syntax and encoding
syntax on " Syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype
scriptencoding utf-8

" Keep all temporary and backup files in ~/.vim
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='10,\"100,:20,%,n~/.vim/viminfo
if has('persistent_undo')
    set undofile
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
set spell " Spell checking on
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

" Autocomplete
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc

" Highlight content beyond col79

if exists('+colorcolumn')
    set colorcolumn=80
endif

" General mappings
map <leader>\ :noh<return> " Turn off highlighting

" Fix home and end keybindings for screen, particularly on mac
map [F $
imap [F $
map [H g0
imap [H g0

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
  nnoremap <M-/> :close<CR> : Close split (alt-/)

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
  nnoremap [1;3C <C-w>l " (alt-right)
  nnoremap [1;3D <C-w>h " (alt-left)
  nnoremap [1;3B <C-w>j " (alt-down)
  nnoremap [1;3A <C-w>k " (alt-up)

  nnoremap , :split<CR> " Horizontal split (alt-,)
  nnoremap . :vsplit<CR> " Vertical split (alt-.)
  nnoremap / :close<CR> : Close split (alt-/)

  nnoremap k <C-w>t<C-w>K " Convert vertical to horizontal split (alt-<)
  nnoremap l <C-w>t<C-w>H " Convert horizontal to vertical split (alt->)

  """ Buffers
  nnoremap ] :bnext<CR>
  nnoremap [ :bprev<CR>
  nnoremap \ :bdelete<CR>

  """ Tabs
  nnoremap > :tabnext<CR>
  nnoremap < :tabprev<CR>
  nnoremap ? :tabclose<CR>
  nnoremap M :tabnew<CR>
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

"" Pep8
let g:pep8_map='<leader>8'

"" SuperTab
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

"" AutoCloseTag
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim

" Matchit
autocmd FileType mako let b:match_words = '<\(\w\w*\):</\1,{:}'

" OmniComplete {
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
    endif

    hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

    " Some convenient mappings
    inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " Automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menu,preview,longest
" }

" ctrlp {
    let g:ctrlp_working_path_mode = 2
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }

    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f'
    \ }
"}

" neocomplcache {
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_force_overwrite_completefunc = 1

    " SuperTab like snippets behavior.
    imap <silent><expr><TAB> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<TAB>")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

    " Plugin key-mappings.

    " These two lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, add
    " let g:spf13_no_neosnippet_expand = 1
    " in your .vimrc.bundles.local file

    if !exists('g:spf13_no_neosnippet_expand')
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
    endif

    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    inoremap <expr><CR> neocomplcache#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    " Use honza's snippets.
    let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1        

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
" }

" UndoTree {
    nnoremap <Leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
" }


" Extra:

"" Fix bug in css syntax highlighting overriding css-color.
"" FIXME: Remove when https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim/issues/4 is fixed
au Filetype css source $DOTFILES_PATH/.vim/bundle/css-color/after/syntax/css.vim
