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
noremap <leader>t :call StripWhitespace ()<CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.pat
import sys
import vim
if os.environ['VIRTUAL_ENV']:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

call pathogen#runtime_append_all_bundles()
