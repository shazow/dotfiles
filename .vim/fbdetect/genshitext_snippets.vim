if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet $ ${".st.et."}".st.et
exec "Snippet choose #choose ".st.et."<CR>".st.et."<CR>#end<CR>".st.et
exec "Snippet def #def ".st.et."<CR>".st.et."<CR>#end<CR>".st.et
exec "Snippet for #for ".st.et." in ".st.et."<CR>".st.et."<CR>#end<CR>".st.et
exec "Snippet if #if ".st.et."<CR>".st.et."<CR>#end<CR>".st.et
exec "Snippet otherwise #otherwise<CR>".st.et."<CR>#end<CR>".st.et
exec "Snippet when #when ".st.et."<CR>".st.et."<CR>#end<CR>".st.et
exec "Snippet with #with ".st.et." = ".st.et."<CR>".st.et."<CR>#end<CR>".st.et
