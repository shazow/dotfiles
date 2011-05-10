set runtimepath=$DOTFILES_PATH/.vim,$VIMRUNTIME

"Keep all temporary and backup files in ~/.vim
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

set expandtab
set history=1000
set number
set nowrap
set nostartofline " Maintain cursor column position across rows

" Search
set hlsearch
set incsearch
set ignorecase

syntax on " Syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype

set foldmethod=indent
set foldlevel=99

if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Alternatives for Esc to exit insert mode.
imap jj <ESC>

" Reveal rogue spaces
set list listchars=tab:>\ ,trail:.,extends:$,nbsp:_
set fillchars=fold:-

" Evaporate rogue spaces
function! StripWhitespace ()
    exec ':%s/\s*$//g'
endfunction
noremap <leader><space> :call StripWhitespace ()<CR>

" Pathogen Bundles
call pathogen#runtime_append_all_bundles()

"" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
