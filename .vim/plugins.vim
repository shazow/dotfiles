" Bundles:
call plug#begin('~/.vim/bundle')

"" Early dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

"" Other
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake' " Replaces syntastic
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim' " Zen mode
Plug 'junegunn/limelight.vim' " Highlight active paragraph
Plug 'tpope/vim-fugitive' " For gitv
Plug 'gregsexton/gitv' " gitk for vim
Plug 'mhinz/vim-signify', { 'on': 'SignifyToggle' }
Plug 'jeetsukumaran/vim-indentwise' " Indent-based jumps
Plug 'itchyny/lightline.vim'
Plug 'arecarn/crunch.vim' " Calculator
Plug 'arecarn/selection.vim' " Crunch dep
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-sleuth' " Auto-detect buffer settings
Plug 'tpope/vim-eunuch' " :Rename :Mkdir etc
Plug 'tpope/vim-repeat' " Repeat plugin calls
Plug 'Shougo/vinarise.vim' " Hex editor
Plug 'Shougo/denite.nvim' " Unite replacement
Plug 'MattesGroeger/vim-bookmarks' " Annotations
"Plug 'airblade/vim-gitgutter' " Git staging state gutter
Plug 'jamessan/vim-gnupg' " Inline editing of gpg-encrypted files

"" Language support
if has("nvim")
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  Plug 'junegunn/fzf.vim' " Needed for some LanguageClient features :/
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Replaces neocomplcache
else
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi', { 'for': ['python', 'python3']  }  " Python static analysis engine, vendors jedi
Plug 'Shougo/neosnippet'
Plug 'Shougo/echodoc.vim'
Plug 'janko-m/vim-test'
Plug 'leshill/vim-json'
Plug 'posva/vim-vue', { 'for': 'vue' }
"Plug 'godlygeek/tabular' " Table formatting for markdown
"Plug 'plasticboy/vim-markdown'
"Plug 'gabrielelana/vim-markdown'  " Each markdown plugin has pros/cons :/
Plug 'SidOfc/mkdx', { 'for': 'markdown' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
if executable('go')
    Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
    Plug 'rhysd/vim-go-impl', { 'for': 'go' }
    Plug 'sebdah/vim-delve', { 'for': 'go' }
endif
if executable('cargo')
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    if executable('racer')
      Plug 'racer-rust/vim-racer', { 'for': 'rust' }
    endif
endif
if executable('tsc')
  if has("nvim")
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " TypeScrpit IDE
  else
    Plug 'Quramy/tsuquyomi', { 'for': 'typescript' } " Typescript IDE
  endif
endif
Plug 'ivalkeen/vim-simpledb', { 'for': 'sql' }

"" Syntax highlighting
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }  " Breaks in markdown?
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' } " Typescript syntax
Plug 'othree/html5.vim'
Plug 'sophacles/vim-bundle-mako', { 'for': 'mako' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'honza/dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' } " optional syntax highlighting for RFC files
Plug 'cespare/vim-toml'
Plug 'tomlion/vim-solidity', { 'for': 'solidity' } " Solidity
Plug 'mustache/vim-mustache-handlebars'
Plug 'lnl7/vim-nix', { 'for': 'nix'} " Nix nix nix nix

"" Colorschemes
Plug 'jacoborus/tender.vim'

" Done adding plugins
call plug#end()


"" Crunch (math)
vnoremap <leader>C :Crunch!<CR>

" Matchit
autocmd FileType mako let b:match_words = '<\(\w\w*\):</\1,{:}'

" Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Tab-complete, without completing on an empty line.
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

function! s:tab_complete()
    " Are we already completing?
    if pumvisible()
        return "\<C-n>"
    endif

    " Is it a snippet?
    if neosnippet#expandable_or_jumpable()
        return "\<Plug>(neosnippet_expand_or_jump)"
    endif

    " Are we on an empty line?
    let col = col('.') - 1
    if !col || getline('.')[col - 1] =~ '\s'
        return "\<TAB>"
    endif

    " Let deoplete do its thing.
    return deoplete#mappings#manual_complete()
endfunction

imap <expr><silent><tab> <SID>tab_complete()

" deoplete {
    " Debug:
    "call deoplete#enable_logging('DEBUG', $HOME.'/deoplete.log')
    "call deoplete#custom#set('jedi', 'debug_enabled', 1)

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_completion_start_length = 5
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#disable_auto_complete = 1


    " deoplete-go
    set completeopt+=noinsert
    set completeopt+=noselect
    "set completeopt+=preview

    " doplete + vim-jedi for Python
    " TODO: Port to deoplete-jedi
    "let g:jedi#completions_enabled = 0
    "let g:jedi#auto_vim_configuration = 0
    "let g:jedi#smart_auto_mappings = 0
    "let g:jedi#show_call_signatures = 0

    "au FileType python nmap gd :call jedi#goto_definitions()<CR>
    "au FileType python nmap ga :call jedi#goto_assignments()<CR>
    let g:jedi#goto_assignments_command = 'ga'
    let g:jedi#goto_definitions_command = 'gd'
    let g:jedi#rename_command = '<leader>r'
    let g:jedi#usages_command = '<leader>u'

    let g:deoplete#sources#jedi#show_docstring = 1

    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.rust = '[(\.)(::)]'
" }

" neosnippet {
    imap <C-k> <Right><Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Right><Plug>(neosnippet_expand_or_jump)

    " Use honza's snippets.
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Disable runtime snippets
    let g:neosnippet#disable_runtime_snippets = { "_": 1, }

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
" }

" Denite {
  if executable('rg')
    call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  elseif executable('pt')
    call denite#custom#var('file_rec', 'command', ['pt', '--follow', '--nocolor', '--nogroup', (has('win32') ? '-g:' : '-g='), ''])
    call denite#custom#var('grep', 'command', ['pt'])
    call denite#custom#var('grep', 'default_opts', ['--nogroup', '--nocolor', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])  " Closer to the ancestor-first behaviour
  call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

  call denite#custom#map('insert', '<down>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<up>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#option('default', 'highlight_mode', 'WarningMsg') " Color for selected line
  call denite#custom#option('default', 'highlight_mode_insert', 'WarningMsg') " Color for selected line

  nnoremap <C-s> :<C-u>DeniteProjectDir grep<CR>
  " Use file_rec/git when in a git repo
  nnoremap <silent> <C-p> :<C-u>DeniteProjectDir `isdirectory('.git') != '' ? 'file_rec/git' : 'file_rec'`<CR>
" }

" UndoTree {
    nnoremap <Leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
" }

" Tagbar {
    nmap <leader>ta :TagbarToggle<CR>

    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
" }


" vim-python
let g:python_highlight_all = 1

" vim-vue
let g:vue_disable_pre_processors = 1

" vim-go
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>ru <Plug>(go-run)
au FileType go nmap <leader>re <Plug>(go-rename)
au FileType go nmap <leader>te <plug>(go-test)
au FileType go nmap <leader>tf <plug>(go-test-func)
au FileType go nmap <leader>in <Plug>(go-info)
au FileType go nmap <leader>ii <Plug>(go-implements)
au FileType go nmap gd <Plug>(go-def-vertical)
au FileType go nmap gD <Plug>(go-def)

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_test_timeout = "3s"
let g:go_auto_type_info = 1
let g:go_def_mode = 'gopls'
"let g:go_info_mode='guru' " Instead of gocode

" rust
let g:rustfmt_autosave = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ["rls"],
    \ }


"" Go Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" rust vim-racer
au FileType rust nmap gd <Plug>(rust-def-vertical)
au FileType rust nmap gD <Plug>(rust-def)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
autocmd! BufWritePost *.rs NeomakeProject cargo

" mkdx
let g:mkdx#settings = {
  \ 'highlight': { 'enable': 1 },
  \ 'enter': { 'shift': 1 },
  \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1,
  \          'details': { 'nesting_level': 0 } },
  \ 'fold': { 'enable': 1 }
  \ }

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:markdown_enable_folding = 0 " Really slow for tables, https://github.com/gabrielelana/vim-markdown/issues/58
let g:markdown_enable_insert_mode_mappings = 0 " avoid overriding our <tab> binding
au BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufReadPost *.md :call IgnoreNounSpell()
"au FileType markdown nmap <leader>t :Toc<CR>
" Add list support for vim-markdown
"au FileType markdown setlocal formatoptions=tron textwidth=80 linebreak

" goyo (zenroom)
let g:goyo_width=82
nnoremap <Leader>z :Goyo<CR>

" limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_default_coefficient = 0.7

" neomake
autocmd! BufWritePost *.py Neomake

" lightline
set laststatus=2
set noshowmode " Hide INSERT etc

" signify (disable by default)
"let g:signify_disable_by_default = 1

"" Borrowed from fatih/dotfiles
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'filename' ],
      \             [ 'job'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename'] ],
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'job': 'LightLineJob',
      \   'filetype': 'LightLineFiletype',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineJob()
  return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
    let out = ''
    if mode() == 't'
        return out
    endif

    " fugitive-aware repo path
    let rootpath = ''
    if exists("*fugitive#head")
        let branch = fugitive#head()
        if strlen(branch)
            let rootpath = fugitive#repo().tree()
            let out .= '[' . branch . '] ' . fnamemodify(rootpath, ':t')
        endif
    endif

    let fname = expand('%:t')
    if fname == '' || fname =~ 'ControlP\|NERD_tree'
        " Nothing
    elseif strlen(rootpath) > 0
        " /usr/src/myrepo - /usr/src/myrepo/subdir/foo = subdir/foo
        let out .= '/' . strpart(expand('%:p'), len(rootpath) + 1)
    else
        " ~/myrepo/subdir/foo
        let out = expand('%:p:~')
    endif
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ out .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '🔒 ' : ''
endfunction
