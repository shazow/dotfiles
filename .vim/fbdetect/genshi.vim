au BufNewFile,BufRead * call s:FTgenshi()

fun! s:FTgenshi()
  let n = 1
  if expand('%:e') =~ 'htm[l]\?'
    let b:genshi_type = 'html'
  else
    let b:genshi_type = 'xml'
  endif
  while n < 10 && n < line("$")
    if getline(n) =~ '\<DTD\s\+XHTML\s'
      let b:genshi_type = 'html'
    endif
    if getline(n) =~ 'xmlns:py="http://genshi.edgewall.org/"'
      set filetype=genshi
      return
    endif
    let n = n + 1
  endwhile
  unlet b:genshi_type
endfun
