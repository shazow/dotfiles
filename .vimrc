map <C-Insert> <Esc>:tabnew<CR>

set et
set wrap!
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
"set smartindent    " EVIL. Breaks filetype indenting. Don't enable.
"set autoindent     " EVIL. Breaks filetype indenting. Don't enable
set sw=4
"set expandtab
set shiftwidth=4
set softtabstop=4
set expandtab
"set smarttab
set autochdir
set hlsearch        " Highlight searc
set cmdheight=2     " Annoying 'hit enter' message when using PIDA, get rid of it
nmap <F2> :wall<NL> " Save all on F2
im :<CR> :<CR><TAB>
map <F1> <esc>
imap <F1> <esc>

" Enable line numbers
set number

set viminfo='100,f1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype customizations
filetype indent on
filetype on
syntax enable


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

set showcmd


"Keep all temporary and backup files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc
