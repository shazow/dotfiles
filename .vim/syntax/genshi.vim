" Vim syntax file
" Language:     Genshi
" Maintainer:   Matt Good <matt@matt-good.net>
" Last Change:  Sun Jan  1, 2006
" Filenames:    *.html,*.htm,*.xml
"
" This syntax file covers the Genshi XML template language.
" Based on Karl Guertin's Kid syntax file

if !exists('b:genshi_type')
  if expand('%:e') =~ 'htm[l]\?'
    let b:genshi_type = 'html'
  else
    let b:genshi_type = 'xml'
  endif
endif
if 'html' == b:genshi_type
    doau Syntax xhtml
elseif 'xml' == b:genshi_type
    doau Syntax xml
endif

unlet b:current_syntax
let python_highlight_builtins = 1
syn include @pythonCode syntax/python.vim
syn case match

syn keyword genshiFunctions XML ET defined value_of contained

syn clear pythonString
syn region pythonString start=+[uU]\='+ end=+'+ skip=+\\\\\|\\'+
    \ contains=pythonEscape matchgroup=Normal
syn region pythonString start=+[uU]\="""+ end=+"""+
    \ contains=pythonEscape matchgroup=Normal
syn region pythonString start=+[uU]\='''+ end=+'''+
    \ contains=pythonEscape matchgroup=Normal

" The python string highlighting just doesn't work when the python is in an
" attr, hence this method.
syn region npythonString start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+
    \ contains=pythonEscape matchgroup=Normal
hi def link   npythonString    String


syn match genshiAttr containedin=htmlTag,xmlTag contained
    \ nextgroup=genshiPythonAttr
    \ +[^<]\<py:\(attrs\|choose\|content\|def\|for\|if\|match\|otherwise\|replace\|strip\|when\|with\)\>+hs=s+1

syn region genshiTag start=+<py:+he=e-3 end=+>+
    \ contains=genshiTagName,genshiTagAttr,genshiPythonAttr
syn region genshiEndTag start=+</py:+he=e-3 end=+>+
    \ contains=genshiTagName
syn match genshiTagName contained
    \ '\<py:\(choose\|def\|for\|if\|match\|otherwise\|when\|with\)\>'
syn keyword genshiTagAttr contained each function path test vars

syn match genshiDelims '\${' contained
syn match genshiDelims '}' contained
syn match genshiDelims '<?python' contained
syn match genshiDelims '?>' contained

syn match genshiXmlError "&\%(\S\+;\)\@!\|<\%(?\)\@!\|?\@<!>" contained

syn region genshiPython start="<?python" end="?>"
    \ contains=genshiFunctions,@pythonCode,genshiDelims,npythonString,
    \          genshiXmlError
    \ transparent keepend
syn region genshiPython start="\${" end="}"
    \ contains=genshiFunctions,@pythonCode,genshiDelims,npythonString,
    \          genshiXmlError
    \ transparent keepend
    \ containedin=htmlString,xmlString,htmlHead,javaScript,
    \             htmlBold,htmlBoldUnderline,htmlBoldItalic,
    \             htmlUnderline,htmlUnderlineItalic,htmlItalic,
    \             htmlBoldUnderlineItalic,htmlH1,htmlH2,htmlH3,
    \             htmlH4,htmlH5,htmlTitle,htmlLink

syn region genshiPythonAttr start=+\%(=\)"+ end=+"+
    \ contains=genshiFunctions,genshiPython,genshiDelims
    \ transparent keepend contained
syn region genshiPython start=+"+hs=s+1, end=+"+he=e-1
    \ contains=genshiFunctions,@pythonCode,genshiXmlError
    \ transparent contained

hi link   genshiAttr       PreProc
hi link   genshiTagAttr    PreProc
hi link   genshiTag        Function
hi link   genshiEndTag     Identifier
hi link   genshiTagName    PreProc
hi link   genshiDelims     Delimiter
hi link   genshiXmlError   Error
hi link   genshiFunctions  Keyword

let b:current_syntax = "genshi"
