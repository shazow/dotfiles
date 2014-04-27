colorscheme mylokai

set lines=500
set columns=100
set guifont=:h12
set guifont=Menlo\ Regular:h12

set encoding=utf-8
set guioptions-=T           " hide the toolbar
set guioptions-=r           " hide the scrollbars
set guioptions-=R           " hide the scrollbars with vertical split
set guioptions-=l           " hide the scrollbars
set guioptions-=L           " hide the scrollbars with vertical split

set fuopt+=maxhorz          " Resize to full screen

if has("gui_macvim")
    set macmeta " Necessary for using meta key in mappings on OSX
    let macvim_skip_cmd_opt_movement = 1    " Prevent MacVim from mapping fake HOME/END to M-arrow keys.
    macmenu &Edit.Find.Find\.\.\. key=<nop> " free up Command-F
    map <D-f> :set invfu<CR>                " toggle fullscreen mode
endif

