if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

if !exists('b:genshi_type')
  if expand('%:e') =~ 'htm[l]\?'
    let b:genshi_type = 'html'
  else
    let b:genshi_type = 'xml'
  endif
endif
if 'html' == b:genshi_type
    runtime after/ftplugin/xhtml_snippets.vim
elseif 'xml' == b:genshi_type
    runtime after/ftplugin/xml_snippets.vim
endif

exec "Snippet $ ${".st.et."}".st.et
exec "Snippet nspy xmlns:py=\"http://genshi.edgewall.org/\"".st.et
exec "Snippet nsxi xmlns:xi=\"http://www.w3.org/2001/XInclude\"".st.et
exec "Snippet xinc <xi:include href=\"".st.et."\" />".st.et
" TODO xi:fallback
exec "Snippet attrs py:attrs=\"".st.":D('select(\'@*\')')".et."\"".st.et
exec "Snippet choose py:choose=\"".st.et."\"".st.et
exec "Snippet echoose <py:choose test=\"".st.et."\"><CR>".st.et."<CR></py:choose><CR>".st.et
exec "Snippet content py:content=\"".st.et."\"".st.et
exec "Snippet def py:def=\"".st.et."\"".st.et
exec "Snippet edef <py:def function=\"".st.et."\"><CR>".st.et."<CR></py:def><CR>".st.et
exec "Snippet for py:for=\"".st.et." in ".st.et."\"".st.et
exec "Snippet efor <py:for each=\"".st.et." in ".st.et."\"><CR>".st.et."<CR></py:for><CR>".st.et
exec "Snippet if py:if=\"".st.et."\"".st.et
exec "Snippet eif <py:if test=\"".st.et."\"><CR>".st.et."<CR></py:if><CR>".st.et
exec "Snippet match py:match=\"".st."path".et."\"".st.et
exec "Snippet ematch <py:match path=\"".st."path".et."\"><CR>".st.et."<CR></py:match><CR>".st.et
exec "Snippet otherwise py:otherwise=\"\"".st.et
exec "Snippet eotherwise <py:otherwise><CR>".st.et."<CR></py:otherwise><CR>".st.et
exec "Snippet replace py:replace=\"".st.et."\"".st.et
exec "Snippet strip py:strip=\"".st.et."\"".st.et
exec "Snippet when py:when=\"".st.et."\""
exec "Snippet ewhen <py:when test=\"".st.et."\"><CR>".st.et."<CR></py:when><CR>".st.et
exec "Snippet with py:with=\"".st.et." = ".st.et."\"".st.et
exec "Snippet ewith <py:with vars=\"".st.et." = ".st.et."\"><CR>".st.et."<CR></py:with><CR>".st.et
