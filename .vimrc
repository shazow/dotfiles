"Keep all temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

map <C-Insert> <Esc>:tabnew<CR>

"set autoindent     " EVIL. Breaks filetype indenting. Don't enable
"set smartindent    " EVIL. Breaks filetype indenting. Don't enable.

set autochdir
set autoindent
set backspace=start,indent,eol
set cmdheight=2     " Annoying 'hit enter' message when using PIDA, get rid of it
set expandtab
set hidden
set history=1000
set ignorecase
set incsearch
set noinsertmode
set nostartofline
set number
set hlsearch
set shiftwidth=4
set softtabstop=4
set showcmd
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest
set wrap!
set viminfo='100,f1

nmap <F2> :wall<NL> " Save all on F2
im :<CR> :<CR><TAB>
map <F1> <esc>
imap <F1> <esc>

noremap Y y$

" Buffer navigation
map <Leader>, <C-^>
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" Alternatives for Esc to exit insert mode.
imap jj <ESC>

" Filetype customizations
syntax on
filetype on
filetype plugin on
filetype indent on


set list listchars=tab:>\ ,trail:.,extends:$,nbsp:_
set fillchars=fold:-
set dictionary=/usr/share/dict/words

au BufNewFile,BufRead *.mak set ft=mako
au BufNewFile,BufRead *.mako set ft=mako

au FileType html,css,mako,js setlocal expandtab tabstop=4
au FileType python setlocal expandtab shiftwidth=4 tabstop=4

au Filetype html,xml,xsl,mako source ~/.vim/plugin/closetag.vim

augroup mkd
  autocmd BufRead *.txt  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" Markdown
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END


function! StripWhitespace ()
    exec ':%s/\s*$//g'
endfunction
noremap <leader>t :call StripWhitespace ()<CR>


"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc
