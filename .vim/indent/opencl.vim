" Vim indent file
" Language:     OpenCL 
" Maintainer:   Based on Bram Moolenaar's CUDA indent file.
" Last Change:  2010 Jan 2
"
" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

" It's just like C indenting
setlocal cindent

let b:undo_indent = "setl cin<"
