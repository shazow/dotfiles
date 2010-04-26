" Vim syntax file
" Language:     PHP 4/5
" Maintainer:   Peter Hodge <toomuchphp-vim@yahoo.com>
" Last Change:  October 27, 2006
"
" URL:      http://www.vim.org/scripts/script.php?script_id=1571
" Version:  0.9.6
"
" ================================================================
"
" Note: If you are having speed issues loading or editting PHP files, try
"       disabling some of the options.  In your .vimrc, try adding:
"         :let php_folding = 0
"         :let php_strict_blocks = 0
"
" ================================================================
"
" Note: If you are using a colour terminal with dark background, you will
"       probably find the 'elflord' colorscheme is well suited to PHP syntax
"       because of the way it highlights the flow-control statements in your
"       code.
"
" ================================================================
"
" OPTIONS:
"
"    Note: Many of these default to 1 (On), so you would need to set
"	       them to 0 to turn them off. E.g., in your .vimrc file:
"            let php_special_variables = 0
"            let php_special_functions = 0
"            let php_alt_comparisons = 0
"            etc.
"          If the variables do not exist, the default value will be used.
"
"    Note: All options can be set globally or on a per-file basis by using
"          global or buffer local variables.  For example, you could turn on SQL
"          highlighting globally in your .vimrc:
"            let g:php_sql_query = 1
"          but then turn it off in only one buffer (one open file):
"            let b:php_sql_query = 0
"
"
"   -- PHP FEATURES --
"
"         let php_sql_query = 1/0  [default 0]
"             ... for SQL syntax highlighting inside strings
"
"         let php_htmlInStrings = 1/0  [default 0]
"             ... for HTML syntax highlighting inside strings
"
"         let php_baselib = 1/0  [default 0]
"             ... for highlighting baselib functions
"
"         let php_special_variables = 1/0  [default 1]
"             ... to highlight superglobals like $_GET, $_SERVER, etc.
"               * always on if using php_oldStyle
"
"         let php_special_functions = 1/0  [default 1]
"             ... to highlight functions with special behaviour
"                 e.g., unset(), extract()
"
"         let php_alt_comparisons = 1/0  [default 1]
"             ... to highlight comparison operators in an alternate colour
"               * always on if using php_oldStyle
"
"         let php_alt_assignByReference = 1/0  [default 1]
"             ... to highlight '=&' in '$foo =& $bar' in an alternate colour.
"                 This also applies to a function which returns by-reference,
"                 as well as a function argument which is by-reference.
"
"         let php_alt_properties = 1/0  [default 0]
"             ... use a different color for '->' based on whether it is used
"                 for property access, method access, or dynamic access (using
"                 '->{...}')
"
"         let php_highlight_quotes = 1/0  [default 0]
"             ... makes quote characters the same colour as the string
"                 contents, like in C syntax.
"
"         let php_show_semicolon = 1/0  [default 1]
"             ... to make the semicolon (;) more visible
"
"         let php_smart_semicolon = 1/0  [default 1]
"             ... semicolon adopts the color of a 'return' or 'break' keyword
"               * requires php_show_semicolon
"
"         let php_alt_blocks = 1/0  [default 1]
"             ... colorize { and } around class/function/try/catch bodies.
"               * requires php_strict_blocks
"
"         let php_alt_arrays = 0/1/2  [default 1]
"             ... to colorize ( and ) around an array body, as well as '=>'
"               * requires php_strict_blocks
"                 Setting this to '2' will highlighting the commas as well.
"                 Commas are not highlighted by default because it's too much
"                 color.
"
"         let php_show_preg = 1/0  [default 1]
"             ... to highlight regular expression patterns inside calls
"                 to preg_match(), preg_replace, etc.
"
"
"   -- FINDING ERRORS --
"
"         let php_parent_error_close = 1/0  [default 1]
"             ... for highlighting parent error ] or ) or }
"               * requires php_strict_blocks
"
"         let php_parent_error_open =
"             ... for skipping a php end tag, if there exists an
"                 open ( or [ without a closing one
"                 Note: this option is now enabled permanently (unless
"                 php_strict_blocks is disabled).
"               * requires php_strict_blocks
"
"         let php_empty_construct_error = 0/1  [default 1]
"             ... highlights ';' as an error if it comes immediately after
"                 an if/else/while/for/foreach/switch statement (the
"                 logical constructs should have a body).
"               * requires php_strict_blocks
"
"         let php_nested_functions = 0/1  [default 0]
"             ... Whether or not to allow contiaining one function inside
"                 another.  This option is mostly for speeding up syntax
"                 highlighting - { } blocks can by inserted much faster while
"                 editting a large class.
"                 Note: this is the only option which might break valid PHP
"                 code, although only if you define one function inside
"                 another, which is useually discouraged.
"               * irrelevent without php_strict_blocks
"
"   -- OTHER OPTIONS --
"
"         let php_strict_blocks = 1/0  [default 1]
"             ... to match together all {} () and [] blocks correctly. This is
"                 required by some of the other options for find errors,
"                 applying correct colors to { } blocks, etc.  However, it may
"                 cause Vim to slow down on large files.
"
"         let php_asp_tags = 1/0  [default 0]
"             ... for highlighting ASP-style short tags
"
"         let php_noShortTags = 1/0  [default 0]
"             ... don't sync <? ?> as php
"
"         let php_oldStyle = 1
"             ... for using old colorstyle
"
"         let php_folding = 1/2/3  [default 0]
"             ... 1: for folding classes and functions
"                 2: for folding all { } regions
"                 3: for folding only functions
"
"         let php_fold_arrays = 0/1  [default 0]
"             ... To fold arrays as well.
"               * requires php_folding
"
"         let php_sync_method = x
"             ... x = -1 to sync by search (default)
"                 x > 0  to sync at least x lines backwards
"                 x = 0  to sync from start
"                 TODO: investigate sync methods, try and find something which
"                       is most effective for PHP
"
"
" ================================================================
"
" TODO LIST:
"
" PRIORITY:
"   - what to do about 'iskeyword' containing '$'?
"   - provide an option to turn off array index colors [0] etc
"     (these array index colors may be deprecated/unnecessary if choosing
"     colors automatically - they were added in because array indexes weren't
"     visible inside a string).
"   - Investigate possibilities for automatic syncing ... Vim regularly
"     gets lost and a sync from start is required.  This is quite annoying.
"   - test syntax against older Vims (6.4, 6.0, 5.7)
"   - allow turning off all semicolon errors
"
" PHP Syntax:
"   - add @Spell and @NoSpell in appropriate places (spell-checking inside
"     comments and strings probably needs to be optional).
"   - option to disable nesting function declarations so that an unclosed
"     function block can end at the next function declaration
"     (This will be much faster when inserting an '{' near the start of a
"     large class, as not so many { } blocks will need to be recalculated)
"   - review support for PHP built-in superglobals:
"     - ensure all PHP 5.2 superglobals are recognized
"     - highlight known array keys for GLOBALS, _SERVER, _ENV, etc?
"   - review support for PHP built-in constants, make sure I've got them all
"   - make support for PHP built-in class methods optional.
"   - review highlight links to ensure maximum readability on GUI
"     and color terminal using colorschemes 'elflord' and 'default'
"   - new group phpReservedFunction, because some parts of
"     phpSpecialFunction can be used as a method name.
"   - what is php_oldStyle? is it still needed?
"   - use 'nextgroup' to highlight errors when a ']' or ')' is followed by
"     a constant/variable or function call.  This will also help find when
"     a closing ')' is missing.
"
" PCRE Syntax:
"   - decide on terminology: 'PCRE' or 'PREG'
"   - Review effects of paired delimiters when combined with other
"     PCRE complex atoms using those symbols
"   - decide on better colors for the
"     (?(?=lookahead/lookbehind)conditional|sub-pattern)
"
"
" Future Plans:
"   - option to choose PHP4 or PHP5 compatibility
"   - some way to detect missing commas in various places
"     (function calls, function proto types, class 'implements')
"   - differentiate between an interface block and a class block
"   - add ability to highlight user-defined functions and keywords
"     using any of the following means:
"       1) a comma-separated string of user functions
"       2) a file containing user functions
"       3) using names from the tags file(s)
"           (this may be better as a separate plugin)
"   - add support for phpDocumentor comment blocks and tags
"   - add support for POSIX Regex patterns
"   - allow easy embedding of the PHP syntax using 'contains=@phpClTop' or
"     'syn region phpRegion ...'
"   - automatically select best colors by examining the colorscheme
"   - check to see if the baselib needs to be highlighted still
"   - Add support 2nd parameter to preg_replace and highlight
"     "\1" and other confusing sequences as errors ("\1" is "\x01")
"   - use nextgroup= to match correct syntax usage
"
" ================================================================
"
" Note:
" - syntax case is 'ignore' unless explicitly set to 'match'
"   for a single item.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'php'
endif

" TODO: what's all this about?
if version < 600
  unlet! php_folding
  if exists("php_sync_method") && !php_sync_method
    let php_sync_method=-1
  endif
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

" accept old options
if !exists("php_sync_method")
  if exists("php_minlines")
    let php_sync_method=php_minlines
  else
    let php_sync_method=-1
  endif
endif

function! s:ChooseValue(name, default)
  if exists('b:' . a:name)
    return b:{a:name}
  elseif exists('g:' . a:name)
    return g:{a:name}
  else
    return a:default
  endif
endfunction

" set up variables based on global or buffer variables which have been set
  " Strict Blocks (s:strict_blocks) {{{1
  let s:strict_blocks = s:ChooseValue('php_strict_blocks', 1)

  " Fold Level (s:folding) {{{1
  let s:folding = s:ChooseValue('php_folding', 0)

  " Fold arrays (s:fold_arrays) {{{1
  let s:fold_arrays = (s:folding && s:ChooseValue('php_fold_arrays', 0))

  " Allow nested functions (s:nested_functions) {{{1
  " TODO: document this feature
  let s:nested_functions = s:ChooseValue('php_nested_functions', 1)

  " Allow ASP-style <% %> tags (s:asp_tags) {{{1
  let s:asp_tags = s:ChooseValue('php_asp_tags', 0)

  " Only allow long tags '<?php' (s:long_tags) {{{1
  let s:long_tags = s:ChooseValue('php_noShortTags', 0)

  " SQL in strings (s:show_sql) {{{1
  let s:show_sql = s:ChooseValue('php_sql_query', 0)

  " HTML in strings (s:show_html_in_strings) {{{1
  let s:show_html_in_strings = s:ChooseValue('php_htmlInStrings', 0)

  " Highlight the PHP baselib (s:show_baselib) {{{1
  let s:show_baselib = s:ChooseValue('php_baselib', 0)

  " Highlight superglobals (s:superglobals) {{{1
  " TODO: this is supposed to be always on if using php_oldStyle
  let s:superglobals = s:ChooseValue('php_special_variables', 1)

  " Highlight special functions (s:special_functions) {{{1
  let s:special_functions = s:ChooseValue('php_special_functions', 1)

  " Highlight quotes around strings (s:show_quotes) {{{1
  let s:show_quotes = s:ChooseValue('php_highlight_quotes', 0)

  " Highlight PCRE patterns (s:show_pcre) {{{1
  let s:show_pcre = s:ChooseValue('php_show_preg', 1)

  " Highlight ';' (s:show_semicolon) {{{1
  let s:show_semicolon = s:ChooseValue('php_show_semicolon', 1)

  " Highlight parent error ) ] or } (s:parent_error_close) {{{1
  let s:parent_error_close = (s:strict_blocks && s:ChooseValue('php_parent_error_close', 1))

  " Highlight invalid ';' after if/while/foreach (s:no_empty_construct) {{{1
  let s:no_empty_construct = (s:strict_blocks && s:ChooseValue('php_empty_construct_error', 1))

  " Alt colors for {} around class/func/try/catch blocks (s:alt_blocks) {{{1
  let s:alt_blocks = (s:strict_blocks && s:ChooseValue('php_alt_blocks', 1))

  " Alt color for by-reference operators (s:alt_refs) {{{1
  let s:alt_refs = s:ChooseValue('php_alt_assignByReference', 1)

  "}}}1
  " Alt color for array syntax (s:alt_arrays) {{{1
  " * requires strict_blocks
  let s:alt_arrays = (s:strict_blocks ? s:ChooseValue('php_alt_arrays', 1) : 0)

  " Alt color for comparisons (s:alt_comparisons) {{{1
  " TODO: this is supposed to be always on if using php_oldStyle
  let s:alt_comparisons = s:ChooseValue('php_alt_comparisons', 1)
  " Alt colors for ';' after return/break (s:smart_semicolon) {{{1
  let s:smart_semicolon = (s:show_semicolon && s:ChooseValue('php_smart_semicolon', 1))

  " Alt colors for '->' (s:alt_properties) {{{1
  let s:alt_properties = s:ChooseValue('php_alt_properties', 0)

  "}}}1

delfunction s:ChooseValue

syn cluster htmlPreproc add=phpRegion,phpRegionAsp,phpRegionSc

" need to source the SQL syntax file in case we encounter
" heredoc containing SQL
if version < 600
  syn include @sqlTop <sfile>:p:h/sql.vim
else
  syn include @sqlTop syntax/sql.vim
endif

syn sync clear
unlet b:current_syntax
syn cluster sqlTop remove=sqlString,sqlComment
if s:show_sql
  syn cluster phpAddStrings contains=@sqlTop
endif

if s:show_html_in_strings
  syn cluster phpAddStrings add=@htmlTop
endif

" NOTE: syntax case should be 'ignore' for all items (in keeping
" with PHP's case insensitive behaviour).  If an item MUST be case
" sensitive, 'syntax case match' should precede that item and
" 'syntax case ignore' must follow IMMEDIATELY after so that there
" can be no confusion over the value of 'syntax case' for most items
" syntax matches and regions may use '\C' to utilize case sensitivity
syn case ignore



" Env Variables
" TODO: check these against the latest PHP manual
syn case match
syn keyword	phpEnvVar	GATEWAY_INTERFACE SERVER_NAME SERVER_SOFTWARE SERVER_PROTOCOL REQUEST_METHOD QUERY_STRING DOCUMENT_ROOT HTTP_ACCEPT HTTP_ACCEPT_CHARSET HTTP_ENCODING HTTP_ACCEPT_LANGUAGE HTTP_CONNECTION HTTP_HOST HTTP_REFERER HTTP_USER_AGENT REMOTE_ADDR REMOTE_PORT SCRIPT_FILENAME SERVER_ADMIN SERVER_PORT SERVER_SIGNATURE PATH_TRANSLATED SCRIPT_NAME REQUEST_URI	contained
syn case ignore

" Internal Variables
" TODO: check these against the latest PHP manual
syn case match
syn keyword	phpIntVar	contained GLOBALS PHP_ERRMSG PHP_SELF HTTP_GET_VARS HTTP_POST_VARS HTTP_COOKIE_VARS HTTP_POST_FILES HTTP_ENV_VARS HTTP_SERVER_VARS HTTP_SESSION_VARS HTTP_RAW_POST_DATA HTTP_STATE_VARS _GET _POST _COOKIE _FILES _SERVER _ENV _SERVER _REQUEST _SESSION
syn keyword	phpIntVar	contained argc argv
syn case ignore

" Constants
" Peter Hodge, June 18, 2006
" - this keyword list is way behind! Unfortunately, all I have
"   access to at the moment is my home installation of 5.1.2, so I will add
"   the ... er ... 626 ... constants harvested from get_defined_constants().
" TODO: check these against the latest PHP manual
syn case match
syn keyword phpCoreConstant contained ASSERT_ACTIVE ASSERT_BAIL ASSERT_CALLBACK ASSERT_QUIET_EVAL ASSERT_WARNING
syn keyword phpCoreConstant contained CAL_DOW_DAYNO CAL_DOW_LONG CAL_DOW_SHORT CAL_EASTER_ALWAYS_GREGORIAN CAL_EASTER_ALWAYS_JULIAN CAL_EASTER_DEFAULT CAL_EASTER_ROMAN CAL_FRENCH CAL_GREGORIAN CAL_JULIAN CAL_NUM_CALS CAL_JEWISH CAL_JEWISH_ADD_ALAFIM CAL_JEWISH_ADD_ALAFIM_GERESH CAL_JEWISH_ADD_GERESHAYIM CAL_MONTH_FRENCH CAL_MONTH_GREGORIAN_LONG CAL_MONTH_GREGORIAN_SHORT CAL_MONTH_JEWISH CAL_MONTH_JULIAN_LONG CAL_MONTH_JULIAN_SHORT
syn keyword phpCoreConstant contained CASE_LOWER CASE_UPPER CHAR_MAX
syn keyword phpCoreConstant contained CLSCTX_ALL CLSCTX_INPROC_HANDLER CLSCTX_INPROC_SERVER CLSCTX_LOCAL_SERVER CLSCTX_REMOTE_SERVER CLSCTX_SERVER
syn keyword phpCoreConstant contained CONNECTION_ABORTED CONNECTION_NORMAL CONNECTION_TIMEOUT
syn keyword phpCoreConstant contained COUNT_NORMAL COUNT_RECURSIVE
syn keyword phpCoreConstant contained CP_ACP CP_MACCP CP_OEMCP CP_SYMBOL CP_THREAD_ACP CP_UTF7 CP_UTF8
syn keyword phpCoreConstant contained CREDITS_ALL CREDITS_DOCS CREDITS_FULLPAGE CREDITS_GENERAL CREDITS_GROUP CREDITS_MODULES CREDITS_QA CREDITS_SAPI
syn keyword phpCoreConstant contained CRYPT_BLOWFISH CRYPT_EXT_DES CRYPT_MD5 CRYPT_SALT_LENGTH CRYPT_STD_DES
syn keyword phpCoreConstant contained DATE_ATOM DATE_COOKIE DATE_ISO8601 DATE_RFC1036 DATE_RFC1123 DATE_RFC2822 DATE_RFC822 DATE_RFC850 DATE_RSS DATE_W3C
syn keyword phpCoreConstant contained DEFAULT_INCLUDE_PATH DIRECTORY_SEPARATOR
syn keyword phpCoreConstant contained DISP_E_BADINDEX DISP_E_DIVBYZERO DISP_E_OVERFLOW
syn keyword phpCoreConstant contained DOMSTRING_SIZE_ERR
syn keyword phpCoreConstant contained DOM_HIERARCHY_REQUEST_ERR DOM_INDEX_SIZE_ERR DOM_INUSE_ATTRIBUTE_ERR DOM_INVALID_ACCESS_ERR DOM_INVALID_CHARACTER_ERR DOM_INVALID_MODIFICATION_ERR
syn keyword phpCoreConstant contained DOM_INVALID_STATE_ERR DOM_NAMESPACE_ERR DOM_NOT_FOUND_ERR DOM_NOT_SUPPORTED_ERR DOM_NO_DATA_ALLOWED_ERR DOM_NO_MODIFICATION_ALLOWED_ERR DOM_PHP_ERR
syn keyword phpCoreConstant contained DOM_SYNTAX_ERR DOM_VALIDATION_ERR DOM_WRONG_DOCUMENT_ERR
syn keyword phpCoreConstant contained ENT_COMPAT ENT_NOQUOTES ENT_QUOTES
syn keyword phpCoreConstant contained EXTR_IF_EXISTS EXTR_OVERWRITE EXTR_PREFIX_ALL EXTR_PREFIX_IF_EXISTS EXTR_PREFIX_INVALID EXTR_PREFIX_SAME EXTR_REFS EXTR_SKIP
syn keyword phpCoreConstant contained E_ERROR E_WARNING E_PARSE E_NOTICE E_STRICT E_CORE_ERROR E_CORE_WARNING E_COMPILE_ERROR E_COMPILE_WARNING E_USER_ERROR E_USER_WARNING E_USER_NOTICE E_ALL
syn keyword phpCoreConstant contained FILE_APPEND FILE_IGNORE_NEW_LINES FILE_NO_DEFAULT_CONTEXT FILE_SKIP_EMPTY_LINES FILE_USE_INCLUDE_PATH
syn keyword phpCoreConstant contained FORCE_DEFLATE FORCE_GZIP
syn keyword phpCoreConstant contained FTP_ASCII FTP_AUTORESUME FTP_AUTOSEEK FTP_BINARY FTP_FAILED FTP_FINISHED FTP_IMAGE FTP_MOREDATA FTP_TEXT FTP_TIMEOUT_SEC
syn keyword phpCoreConstant contained GLOB_BRACE GLOB_ERR GLOB_MARK GLOB_NOCHECK GLOB_NOESCAPE GLOB_NOSORT GLOB_ONLYDIR
syn keyword phpCoreConstant contained HTML_ENTITIES HTML_SPECIALCHARS
syn keyword phpCoreConstant contained ICONV_IMPL ICONV_MIME_DECODE_CONTINUE_ON_ERROR ICONV_MIME_DECODE_STRICT ICONV_VERSION
syn keyword phpCoreConstant contained IMAGETYPE_BMP IMAGETYPE_GIF IMAGETYPE_IFF IMAGETYPE_JB2 IMAGETYPE_JP2 IMAGETYPE_JPC IMAGETYPE_JPEG IMAGETYPE_JPEG2000
syn keyword phpCoreConstant contained IMAGETYPE_JPX IMAGETYPE_PNG IMAGETYPE_PSD IMAGETYPE_SWC IMAGETYPE_SWF IMAGETYPE_TIFF_II IMAGETYPE_TIFF_MM IMAGETYPE_WBMP IMAGETYPE_XBM
syn keyword phpCoreConstant contained INF
syn keyword phpCoreConstant contained INFO_ALL INFO_CONFIGURATION INFO_CREDITS INFO_ENVIRONMENT INFO_GENERAL INFO_LICENSE INFO_MODULES INFO_VARIABLES
syn keyword phpCoreConstant contained INI_ALL INI_PERDIR INI_SYSTEM INI_USER
syn keyword phpCoreConstant contained LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY LC_NUMERIC LC_TIME
syn keyword phpCoreConstant contained LIBXML_COMPACT LIBXML_DOTTED_VERSION LIBXML_DTDATTR LIBXML_DTDLOAD LIBXML_DTDVALID LIBXML_ERR_ERROR LIBXML_ERR_FATAL LIBXML_ERR_NONE
syn keyword phpCoreConstant contained LIBXML_ERR_WARNING LIBXML_NOBLANKS LIBXML_NOCDATA LIBXML_NOEMPTYTAG LIBXML_NOENT LIBXML_NOERROR LIBXML_NONET LIBXML_NOWARNING
syn keyword phpCoreConstant contained LIBXML_NOXMLDECL LIBXML_NSCLEAN LIBXML_VERSION LIBXML_XINCLUDE
syn keyword phpCoreConstant contained LOCK_EX LOCK_NB LOCK_SH LOCK_UN
syn keyword phpCoreConstant contained LOG_ALERT LOG_AUTH LOG_AUTHPRIV LOG_CONS LOG_CRIT LOG_CRON LOG_DAEMON LOG_DEBUG
syn keyword phpCoreConstant contained LOG_EMERG LOG_ERR LOG_INFO LOG_KERN LOG_LPR LOG_MAIL LOG_NDELAY LOG_NEWS
syn keyword phpCoreConstant contained LOG_NOTICE LOG_NOWAIT LOG_ODELAY LOG_PERROR LOG_PID LOG_SYSLOG LOG_USER LOG_UUCP LOG_WARNING
syn keyword phpCoreConstant contained MK_E_UNAVAILABLE
syn keyword phpCoreConstant contained MYSQL_ASSOC MYSQL_BOTH MYSQL_CLIENT_COMPRESS MYSQL_CLIENT_IGNORE_SPACE MYSQL_CLIENT_INTERACTIVE MYSQL_CLIENT_SSL MYSQL_NUM
syn keyword phpCoreConstant contained M_1_PI M_2_PI M_2_SQRTPI M_E M_LN10 M_LN2 M_LOG10E M_LOG2E M_PI M_PI_2 M_PI_4 M_SQRT1_2 M_SQRT2
syn keyword phpCoreConstant contained NAN
syn keyword phpCoreConstant contained NORM_IGNORECASE NORM_IGNOREKANATYPE NORM_IGNORENONSPACE NORM_IGNORESYMBOLS NORM_IGNOREWIDTH
syn keyword phpCoreConstant contained ODBC_BINMODE_CONVERT ODBC_BINMODE_PASSTHRU ODBC_BINMODE_RETURN ODBC_TYPE
syn keyword phpCoreConstant contained PATHINFO_BASENAME PATHINFO_DIRNAME PATHINFO_EXTENSION
syn keyword phpCoreConstant contained PATH_SEPARATOR
syn keyword phpCoreConstant contained PEAR_INSTALL_DIR PEAR_EXTENSION_DIR
syn keyword phpCoreConstant contained PHP_PREFIX PHP_BINDIR PHP_CONFIG_FILE_PATH PHP_CONFIG_FILE_SCAN_DIR PHP_DATADIR PHP_EXTENSION_DIR PHP_LIBDIR PHP_LOCALSTATEDIR PHP_SYSCONFDIR PHP_SHLIB_SUFFIX
syn keyword phpCoreConstant contained PHP_OUTPUT_HANDLER_CONT PHP_OUTPUT_HANDLER_END PHP_OUTPUT_HANDLER_START
syn keyword phpCoreConstant contained PHP_URL_FRAGMENT PHP_URL_HOST PHP_URL_PASS PHP_URL_PATH PHP_URL_PORT PHP_URL_QUERY PHP_URL_SCHEME PHP_URL_USER
syn keyword phpCoreConstant contained PHP_VERSION PHP_OS PHP_SAPI PHP_EOL PHP_INT_MAX PHP_INT_SIZE
syn keyword phpCoreConstant contained PREG_GREP_INVERT PREG_OFFSET_CAPTURE PREG_PATTERN_ORDER PREG_SET_ORDER PREG_SPLIT_DELIM_CAPTURE PREG_SPLIT_NO_EMPTY PREG_SPLIT_OFFSET_CAPTURE
syn keyword phpCoreConstant contained PSFS_ERR_FATAL PSFS_FEED_ME PSFS_FLAG_FLUSH_CLOSE PSFS_FLAG_FLUSH_INC PSFS_FLAG_NORMAL PSFS_PASS_ON
syn keyword phpCoreConstant contained SEEK_CUR SEEK_END SEEK_SET
syn keyword phpCoreConstant contained SORT_ASC SORT_DESC SORT_LOCALE_STRING SORT_NUMERIC SORT_REGULAR SORT_STRING
syn keyword phpCoreConstant contained SQL_BIGINT SQL_BINARY SQL_BIT SQL_CHAR SQL_CONCURRENCY SQL_CONCUR_LOCK SQL_CONCUR_READ_ONLY SQL_CONCUR_ROWVER SQL_CONCUR_VALUES
syn keyword phpCoreConstant contained SQL_CURSOR_DYNAMIC SQL_CURSOR_FORWARD_ONLY SQL_CURSOR_KEYSET_DRIVEN SQL_CURSOR_STATIC SQL_CURSOR_TYPE SQL_CUR_USE_DRIVER SQL_CUR_USE_IF_NEEDED SQL_CUR_USE_ODBC
syn keyword phpCoreConstant contained SQL_DATE SQL_DECIMAL SQL_DOUBLE SQL_FETCH_FIRST SQL_FETCH_NEXT SQL_FLOAT SQL_INTEGER SQL_KEYSET_SIZE
syn keyword phpCoreConstant contained SQL_LONGVARBINARY SQL_LONGVARCHAR SQL_NUMERIC SQL_ODBC_CURSORS SQL_REAL SQL_SMALLINT SQL_TIME SQL_TIMESTAMP SQL_TINYINT SQL_VARBINARY SQL_VARCHAR
syn keyword phpCoreConstant contained STDERR STDIN STDOUT
syn keyword phpCoreConstant contained STREAM_CLIENT_ASYNC_CONNECT STREAM_CLIENT_CONNECT STREAM_CLIENT_PERSISTENT
syn keyword phpCoreConstant contained STREAM_CRYPTO_METHOD_SSLv23_CLIENT STREAM_CRYPTO_METHOD_SSLv23_SERVER STREAM_CRYPTO_METHOD_SSLv2_CLIENT STREAM_CRYPTO_METHOD_SSLv2_SERVER STREAM_CRYPTO_METHOD_SSLv3_CLIENT STREAM_CRYPTO_METHOD_SSLv3_SERVER STREAM_CRYPTO_METHOD_TLS_CLIENT STREAM_CRYPTO_METHOD_TLS_SERVER
syn keyword phpCoreConstant contained STREAM_ENFORCE_SAFE_MODE STREAM_FILTER_ALL STREAM_FILTER_READ STREAM_FILTER_WRITE STREAM_IGNORE_URL
syn keyword phpCoreConstant contained STREAM_IPPROTO_ICMP STREAM_IPPROTO_IP STREAM_IPPROTO_RAW STREAM_IPPROTO_TCP STREAM_IPPROTO_UDP STREAM_MKDIR_RECURSIVE STREAM_MUST_SEEK
syn keyword phpCoreConstant contained STREAM_NOTIFY_AUTH_REQUIRED STREAM_NOTIFY_AUTH_RESULT STREAM_NOTIFY_COMPLETED STREAM_NOTIFY_CONNECT STREAM_NOTIFY_FAILURE STREAM_NOTIFY_FILE_SIZE_IS STREAM_NOTIFY_MIME_TYPE_IS
syn keyword phpCoreConstant contained STREAM_NOTIFY_PROGRESS STREAM_NOTIFY_REDIRECTED STREAM_NOTIFY_RESOLVE STREAM_NOTIFY_SEVERITY_ERR STREAM_NOTIFY_SEVERITY_INFO STREAM_NOTIFY_SEVERITY_WARN
syn keyword phpCoreConstant contained STREAM_OOB STREAM_PEEK STREAM_PF_INET STREAM_PF_INET6 STREAM_PF_UNIX STREAM_REPORT_ERRORS STREAM_SERVER_BIND STREAM_SERVER_LISTEN
syn keyword phpCoreConstant contained STREAM_SOCK_DGRAM STREAM_SOCK_RAW STREAM_SOCK_RDM STREAM_SOCK_SEQPACKET STREAM_SOCK_STREAM STREAM_URL_STAT_LINK STREAM_URL_STAT_QUIET STREAM_USE_PATH
syn keyword phpCoreConstant contained STR_PAD_BOTH STR_PAD_LEFT STR_PAD_RIGHT
syn keyword phpCoreConstant contained SUNFUNCS_RET_DOUBLE SUNFUNCS_RET_STRING SUNFUNCS_RET_TIMESTAMP
syn keyword phpCoreConstant contained T_ABSTRACT T_AND_EQUAL T_ARRAY T_ARRAY_CAST T_AS T_BAD_CHARACTER T_BOOLEAN_AND T_BOOLEAN_OR T_BOOL_CAST T_BREAK T_CASE T_CATCH
syn keyword phpCoreConstant contained T_CHARACTER T_CLASS T_CLASS_C T_CLONE T_CLOSE_TAG T_COMMENT T_CONCAT_EQUAL T_CONST T_CONSTANT_ENCAPSED_STRING T_CONTINUE
syn keyword phpCoreConstant contained T_CURLY_OPEN T_DEC T_DECLARE T_DEFAULT T_DIV_EQUAL T_DNUMBER T_DO T_DOC_COMMENT T_DOLLAR_OPEN_CURLY_BRACES T_DOUBLE_ARROW
syn keyword phpCoreConstant contained T_DOUBLE_CAST T_DOUBLE_COLON T_ECHO T_ELSE T_ELSEIF T_EMPTY T_ENCAPSED_AND_WHITESPACE T_ENDDECLARE T_ENDFOR T_ENDFOREACH
syn keyword phpCoreConstant contained T_ENDIF T_ENDSWITCH T_ENDWHILE T_END_HEREDOC T_EVAL T_EXIT T_EXTENDS T_FILE T_FINAL T_FOR T_FOREACH T_FUNCTION T_FUNC_C
syn keyword phpCoreConstant contained T_GLOBAL T_HALT_COMPILER T_IF T_IMPLEMENTS T_INC T_INCLUDE T_INCLUDE_ONCE T_INLINE_HTML T_INSTANCEOF T_INTERFACE T_INT_CAST
syn keyword phpCoreConstant contained T_ISSET T_IS_EQUAL T_IS_GREATER_OR_EQUAL T_IS_IDENTICAL T_IS_NOT_EQUAL T_IS_NOT_IDENTICAL T_IS_SMALLER_OR_EQUAL T_LINE T_LIST
syn keyword phpCoreConstant contained T_LNUMBER T_LOGICAL_AND T_LOGICAL_OR T_LOGICAL_XOR T_METHOD_C T_MINUS_EQUAL T_MOD_EQUAL T_MUL_EQUAL T_NEW T_NUM_STRING T_OBJECT_CAST
syn keyword phpCoreConstant contained T_OBJECT_OPERATOR T_OPEN_TAG T_OPEN_TAG_WITH_ECHO T_OR_EQUAL T_PAAMAYIM_NEKUDOTAYIM T_PLUS_EQUAL T_PRINT T_PRIVATE T_PROTECTED T_PUBLIC
syn keyword phpCoreConstant contained T_REQUIRE T_REQUIRE_ONCE T_RETURN T_SL T_SL_EQUAL T_SR T_SR_EQUAL T_START_HEREDOC T_STATIC T_STRING T_STRING_CAST T_STRING_VARNAME
syn keyword phpCoreConstant contained T_SWITCH T_THROW T_TRY T_UNSET T_UNSET_CAST T_USE T_VAR T_VARIABLE T_WHILE T_WHITESPACE T_XOR_EQUAL
syn keyword phpCoreConstant contained UPLOAD_ERR_CANT_WRITE UPLOAD_ERR_FORM_SIZE UPLOAD_ERR_INI_SIZE UPLOAD_ERR_NO_FILE UPLOAD_ERR_NO_TMP_DIR UPLOAD_ERR_OK UPLOAD_ERR_PARTIAL
syn keyword phpCoreConstant contained VARCMP_EQ VARCMP_GT VARCMP_LT VARCMP_NULL
syn keyword phpCoreConstant contained VT_ARRAY VT_BOOL VT_BSTR VT_BYREF VT_CY VT_DATE VT_DECIMAL VT_DISPATCH VT_EMPTY VT_ERROR VT_I1 VT_I2 VT_I4 VT_INT VT_NULL VT_R4 VT_R8 VT_UI1 VT_UI2 VT_UI4 VT_UINT VT_UNKNOWN VT_VARIANT
syn keyword phpCoreConstant contained XML_ATTRIBUTE_CDATA XML_ATTRIBUTE_DECL_NODE XML_ATTRIBUTE_ENTITY XML_ATTRIBUTE_ENUMERATION XML_ATTRIBUTE_ID XML_ATTRIBUTE_IDREF
syn keyword phpCoreConstant contained XML_ATTRIBUTE_IDREFS XML_ATTRIBUTE_NMTOKEN XML_ATTRIBUTE_NMTOKENS XML_ATTRIBUTE_NODE XML_ATTRIBUTE_NOTATION XML_CDATA_SECTION_NODE
syn keyword phpCoreConstant contained XML_COMMENT_NODE XML_DOCUMENT_FRAG_NODE XML_DOCUMENT_NODE XML_DOCUMENT_TYPE_NODE XML_DTD_NODE XML_ELEMENT_DECL_NODE XML_ELEMENT_NODE
syn keyword phpCoreConstant contained XML_ENTITY_DECL_NODE XML_ENTITY_NODE XML_ENTITY_REF_NODE XML_ERROR_ASYNC_ENTITY XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF XML_ERROR_BAD_CHAR_REF
syn keyword phpCoreConstant contained XML_ERROR_BINARY_ENTITY_REF XML_ERROR_DUPLICATE_ATTRIBUTE XML_ERROR_EXTERNAL_ENTITY_HANDLING XML_ERROR_INCORRECT_ENCODING XML_ERROR_INVALID_TOKEN
syn keyword phpCoreConstant contained XML_ERROR_JUNK_AFTER_DOC_ELEMENT XML_ERROR_MISPLACED_XML_PI XML_ERROR_NONE XML_ERROR_NO_ELEMENTS XML_ERROR_NO_MEMORY XML_ERROR_PARAM_ENTITY_REF
syn keyword phpCoreConstant contained XML_ERROR_PARTIAL_CHAR XML_ERROR_RECURSIVE_ENTITY_REF XML_ERROR_SYNTAX XML_ERROR_TAG_MISMATCH XML_ERROR_UNCLOSED_CDATA_SECTION
syn keyword phpCoreConstant contained XML_ERROR_UNCLOSED_TOKEN XML_ERROR_UNDEFINED_ENTITY XML_ERROR_UNKNOWN_ENCODING XML_HTML_DOCUMENT_NODE XML_LOCAL_NAMESPACE
syn keyword phpCoreConstant contained XML_NAMESPACE_DECL_NODE XML_NOTATION_NODE XML_OPTION_CASE_FOLDING XML_OPTION_SKIP_TAGSTART XML_OPTION_SKIP_WHITE XML_OPTION_TARGET_ENCODING
syn keyword phpCoreConstant contained XML_PI_NODE XML_SAX_IMPL XML_TEXT_NODE
syn keyword phpCoreConstant contained ZEND_THREAD_SAFE
syn case ignore

" Peter Hodge, June 17 2006
" - changed this from 'phpConstant' to 'phpMagicConstant'
"   to clarify its contents
syn case match
syn keyword	phpMagicConstant contained __LINE__ __FILE__ __FUNCTION__ __METHOD__ __CLASS__
syn case ignore


" Function and Methods ripped from php_manual_de.tar.gz Jan 2003
" TODO: check these against the latest PHP manual
syn keyword	phpFunctions	apache_child_terminate apache_get_modules apache_get_version apache_getenv apache_lookup_uri apache_note apache_request_headers apache_response_headers apache_setenv ascii2ebcdic ebcdic2ascii getallheaders virtual	contained
syn keyword	phpFunctions	array_change_key_case array_chunk array_combine array_count_values array_diff_assoc array_diff_uassoc array_diff array_fill array_filter array_flip array_intersect_assoc array_intersect array_key_exists array_keys array_map array_merge_recursive array_merge array_multisort array_pad array_pop array_push array_rand array_reduce array_reverse array_search array_shift array_slice array_splice array_sum array_udiff_assoc array_udiff_uassoc array_udiff array_unique array_unshift array_values array_walk arsort asort compact count current each end extract in_array key krsort ksort natcasesort natsort next pos prev range reset rsort shuffle sizeof sort uasort uksort usort	contained
syn keyword	phpFunctions	aspell_check aspell_new aspell_suggest	contained
syn keyword	phpFunctions	bcadd bccomp bcdiv bcmod bcmul bcpow bcpowmod bcscale bcsqrt bcsub	contained
syn keyword	phpFunctions	bzclose bzcompress bzdecompress bzerrno bzerror bzerrstr bzflush bzopen bzread bzwrite	contained
syn keyword	phpFunctions	cal_days_in_month cal_from_jd cal_info cal_to_jd easter_date easter_days frenchtojd gregoriantojd jddayofweek jdmonthname jdtofrench jdtogregorian jdtojewish jdtojulian jdtounix jewishtojd juliantojd unixtojd	contained
syn keyword	phpFunctions	ccvs_add ccvs_auth ccvs_command ccvs_count ccvs_delete ccvs_done ccvs_init ccvs_lookup ccvs_new ccvs_report ccvs_return ccvs_reverse ccvs_sale ccvs_status ccvs_textvalue ccvs_void	contained
syn keyword	phpFunctions	call_user_method_array call_user_method class_exists get_class_methods get_class_vars get_class get_declared_classes get_object_vars get_parent_class is_a is_subclass_of method_exists	contained
syn keyword	phpFunctions	com VARIANT com_addref com_get com_invoke com_isenum com_load_typelib com_load com_propget com_propput com_propset com_release com_set	contained
syn keyword	phpFunctions	cpdf_add_annotation cpdf_add_outline cpdf_arc cpdf_begin_text cpdf_circle cpdf_clip cpdf_close cpdf_closepath_fill_stroke cpdf_closepath_stroke cpdf_closepath cpdf_continue_text cpdf_curveto cpdf_end_text cpdf_fill_stroke cpdf_fill cpdf_finalize_page cpdf_finalize cpdf_global_set_document_limits cpdf_import_jpeg cpdf_lineto cpdf_moveto cpdf_newpath cpdf_open cpdf_output_buffer cpdf_page_init cpdf_place_inline_image cpdf_rect cpdf_restore cpdf_rlineto cpdf_rmoveto cpdf_rotate_text cpdf_rotate cpdf_save_to_file cpdf_save cpdf_scale cpdf_set_action_url cpdf_set_char_spacing cpdf_set_creator cpdf_set_current_page cpdf_set_font_directories cpdf_set_font_map_file cpdf_set_font cpdf_set_horiz_scaling cpdf_set_keywords cpdf_set_leading cpdf_set_page_animation cpdf_set_subject cpdf_set_text_matrix cpdf_set_text_pos cpdf_set_text_rendering cpdf_set_text_rise cpdf_set_title cpdf_set_viewer_preferences cpdf_set_word_spacing cpdf_setdash cpdf_setflat cpdf_setgray_fill cpdf_setgray_stroke cpdf_setgray cpdf_setlinecap cpdf_setlinejoin cpdf_setlinewidth cpdf_setmiterlimit cpdf_setrgbcolor_fill cpdf_setrgbcolor_stroke cpdf_setrgbcolor cpdf_show_xy cpdf_show cpdf_stringwidth cpdf_stroke cpdf_text cpdf_translate	contained
syn keyword	phpFunctions	crack_check crack_closedict crack_getlastmessage crack_opendict	contained
syn keyword	phpFunctions	ctype_alnum ctype_alpha ctype_cntrl ctype_digit ctype_graph ctype_lower ctype_print ctype_punct ctype_space ctype_upper ctype_xdigit	contained
syn keyword	phpFunctions	curl_close curl_errno curl_error curl_exec curl_getinfo curl_init curl_multi_add_handle curl_multi_close curl_multi_exec curl_multi_getcontent curl_multi_info_read curl_multi_init curl_multi_remove_handle curl_multi_select curl_setopt curl_version	contained
syn keyword	phpFunctions	cybercash_base64_decode cybercash_base64_encode cybercash_decr cybercash_encr	contained
syn keyword	phpFunctions	cyrus_authenticate cyrus_bind cyrus_close cyrus_connect cyrus_query cyrus_unbind	contained
syn keyword	phpFunctions	checkdate date getdate gettimeofday gmdate gmmktime gmstrftime localtime microtime mktime strftime strtotime time	contained
syn keyword	phpFunctions	dba_close dba_delete dba_exists dba_fetch dba_firstkey dba_handlers dba_insert dba_key_split dba_list dba_nextkey dba_open dba_optimize dba_popen dba_replace dba_sync	contained
syn keyword	phpFunctions	dbase_add_record dbase_close dbase_create dbase_delete_record dbase_get_header_info dbase_get_record_with_names dbase_get_record dbase_numfields dbase_numrecords dbase_open dbase_pack dbase_replace_record	contained
syn keyword	phpFunctions	dblist dbmclose dbmdelete dbmexists dbmfetch dbmfirstkey dbminsert dbmnextkey dbmopen dbmreplace	contained
syn keyword	phpFunctions	dbplus_add dbplus_aql dbplus_chdir dbplus_close dbplus_curr dbplus_errcode dbplus_errno dbplus_find dbplus_first dbplus_flush dbplus_freealllocks dbplus_freelock dbplus_freerlocks dbplus_getlock dbplus_getunique dbplus_info dbplus_last dbplus_lockrel dbplus_next dbplus_open dbplus_prev dbplus_rchperm dbplus_rcreate dbplus_rcrtexact dbplus_rcrtlike dbplus_resolve dbplus_restorepos dbplus_rkeys dbplus_ropen dbplus_rquery dbplus_rrename dbplus_rsecindex dbplus_runlink dbplus_rzap dbplus_savepos dbplus_setindex dbplus_setindexbynumber dbplus_sql dbplus_tcl dbplus_tremove dbplus_undo dbplus_undoprepare dbplus_unlockrel dbplus_unselect dbplus_update dbplus_xlockrel dbplus_xunlockrel	contained
syn keyword	phpFunctions	dbx_close dbx_compare dbx_connect dbx_error dbx_escape_string dbx_fetch_row dbx_query dbx_sort	contained
syn keyword	phpFunctions	dio_close dio_fcntl dio_open dio_read dio_seek dio_stat dio_tcsetattr dio_truncate dio_write	contained
syn keyword	phpFunctions	chdir chroot dir closedir getcwd opendir readdir rewinddir scandir	contained
syn keyword	phpFunctions	domxml_new_doc domxml_open_file domxml_open_mem domxml_version domxml_xmltree domxml_xslt_stylesheet_doc domxml_xslt_stylesheet_file domxml_xslt_stylesheet xpath_eval_expression xpath_eval xpath_new_context xptr_eval xptr_new_context	contained
syn keyword	phpMethods	name specified value create_attribute create_cdata_section create_comment create_element_ns create_element create_entity_reference create_processing_instruction create_text_node doctype document_element dump_file dump_mem get_element_by_id get_elements_by_tagname html_dump_mem xinclude entities internal_subset name notations public_id system_id get_attribute_node get_attribute get_elements_by_tagname has_attribute remove_attribute set_attribute tagname add_namespace append_child append_sibling attributes child_nodes clone_node dump_node first_child get_content has_attributes has_child_nodes insert_before is_blank_node last_child next_sibling node_name node_type node_value owner_document parent_node prefix previous_sibling remove_child replace_child replace_node set_content set_name set_namespace unlink_node data target process result_dump_file result_dump_mem	contained
syn keyword	phpFunctions	dotnet_load	contained
syn keyword	phpFunctions	debug_backtrace debug_print_backtrace error_log error_reporting restore_error_handler set_error_handler trigger_error user_error	contained
syn keyword	phpFunctions	escapeshellarg escapeshellcmd exec passthru proc_close proc_get_status proc_nice proc_open proc_terminate shell_exec system	contained
syn keyword	phpFunctions	fam_cancel_monitor fam_close fam_monitor_collection fam_monitor_directory fam_monitor_file fam_next_event fam_open fam_pending fam_resume_monitor fam_suspend_monitor	contained
syn keyword	phpFunctions	fbsql_affected_rows fbsql_autocommit fbsql_change_user fbsql_close fbsql_commit fbsql_connect fbsql_create_blob fbsql_create_clob fbsql_create_db fbsql_data_seek fbsql_database_password fbsql_database fbsql_db_query fbsql_db_status fbsql_drop_db fbsql_errno fbsql_error fbsql_fetch_array fbsql_fetch_assoc fbsql_fetch_field fbsql_fetch_lengths fbsql_fetch_object fbsql_fetch_row fbsql_field_flags fbsql_field_len fbsql_field_name fbsql_field_seek fbsql_field_table fbsql_field_type fbsql_free_result fbsql_get_autostart_info fbsql_hostname fbsql_insert_id fbsql_list_dbs fbsql_list_fields fbsql_list_tables fbsql_next_result fbsql_num_fields fbsql_num_rows fbsql_password fbsql_pconnect fbsql_query fbsql_read_blob fbsql_read_clob fbsql_result fbsql_rollback fbsql_select_db fbsql_set_lob_mode fbsql_set_transaction fbsql_start_db fbsql_stop_db fbsql_tablename fbsql_username fbsql_warnings	contained
syn keyword	phpFunctions	fdf_add_doc_javascript fdf_add_template fdf_close fdf_create fdf_enum_values fdf_errno fdf_error fdf_get_ap fdf_get_attachment fdf_get_encoding fdf_get_file fdf_get_flags fdf_get_opt fdf_get_status fdf_get_value fdf_get_version fdf_header fdf_next_field_name fdf_open_string fdf_open fdf_remove_item fdf_save_string fdf_save fdf_set_ap fdf_set_encoding fdf_set_file fdf_set_flags fdf_set_javascript_action fdf_set_opt fdf_set_status fdf_set_submit_form_action fdf_set_target_frame fdf_set_value fdf_set_version	contained
syn keyword	phpFunctions	filepro_fieldcount filepro_fieldname filepro_fieldtype filepro_fieldwidth filepro_retrieve filepro_rowcount filepro	contained
syn keyword	phpFunctions	basename chgrp chmod chown clearstatcache copy delete dirname disk_free_space disk_total_space diskfreespace fclose feof fflush fgetc fgetcsv fgets fgetss file_exists file_get_contents file_put_contents file fileatime filectime filegroup fileinode filemtime fileowner fileperms filesize filetype flock fnmatch fopen fpassthru fputs fread fscanf fseek fstat ftell ftruncate fwrite glob is_dir is_executable is_file is_link is_readable is_uploaded_file is_writable is_writeable link linkinfo lstat mkdir move_uploaded_file parse_ini_file pathinfo pclose popen readfile readlink realpath rename rewind rmdir set_file_buffer stat symlink tempnam tmpfile touch umask unlink	contained
syn keyword	phpFunctions	fribidi_log2vis	contained
syn keyword	phpFunctions	ftp_alloc ftp_cdup ftp_chdir ftp_chmod ftp_close ftp_connect ftp_delete ftp_exec ftp_fget ftp_fput ftp_get_option ftp_get ftp_login ftp_mdtm ftp_mkdir ftp_nb_continue ftp_nb_fget ftp_nb_fput ftp_nb_get ftp_nb_put ftp_nlist ftp_pasv ftp_put ftp_pwd ftp_quit ftp_raw ftp_rawlist ftp_rename ftp_rmdir ftp_set_option ftp_site ftp_size ftp_ssl_connect ftp_systype	contained
syn keyword	phpFunctions	call_user_func_array call_user_func create_function func_get_arg func_get_args func_num_args function_exists get_defined_functions register_shutdown_function register_tick_function unregister_tick_function	contained
syn keyword	phpFunctions	bind_textdomain_codeset bindtextdomain dcgettext dcngettext dgettext dngettext gettext ngettext textdomain	contained
syn keyword	phpFunctions	gmp_abs gmp_add gmp_and gmp_clrbit gmp_cmp gmp_com gmp_div_q gmp_div_qr gmp_div_r gmp_div gmp_divexact gmp_fact gmp_gcd gmp_gcdext gmp_hamdist gmp_init gmp_intval gmp_invert gmp_jacobi gmp_legendre gmp_mod gmp_mul gmp_neg gmp_or gmp_perfect_square gmp_popcount gmp_pow gmp_powm gmp_prob_prime gmp_random gmp_scan0 gmp_scan1 gmp_setbit gmp_sign gmp_sqrt gmp_sqrtrem gmp_sqrtrm gmp_strval gmp_sub gmp_xor	contained
syn keyword	phpFunctions	header headers_list headers_sent setcookie	contained
syn keyword	phpFunctions	hw_api_attribute hwapi_hgcsp hw_api_content hw_api_object	contained
syn keyword	phpMethods	key langdepvalue value values checkin checkout children mimetype read content copy dbstat dcstat dstanchors dstofsrcanchors count reason find ftstat hwstat identify info insert insertanchor insertcollection insertdocument link lock move assign attreditable count insert remove title value object objectbyanchor parents description type remove replace setcommitedversion srcanchors srcsofdst unlock user userlist	contained
syn keyword	phpFunctions	hw_Array2Objrec hw_changeobject hw_Children hw_ChildrenObj hw_Close hw_Connect hw_connection_info hw_cp hw_Deleteobject hw_DocByAnchor hw_DocByAnchorObj hw_Document_Attributes hw_Document_BodyTag hw_Document_Content hw_Document_SetContent hw_Document_Size hw_dummy hw_EditText hw_Error hw_ErrorMsg hw_Free_Document hw_GetAnchors hw_GetAnchorsObj hw_GetAndLock hw_GetChildColl hw_GetChildCollObj hw_GetChildDocColl hw_GetChildDocCollObj hw_GetObject hw_GetObjectByQuery hw_GetObjectByQueryColl hw_GetObjectByQueryCollObj hw_GetObjectByQueryObj hw_GetParents hw_GetParentsObj hw_getrellink hw_GetRemote hw_getremotechildren hw_GetSrcByDestObj hw_GetText hw_getusername hw_Identify hw_InCollections hw_Info hw_InsColl hw_InsDoc hw_insertanchors hw_InsertDocument hw_InsertObject hw_mapid hw_Modifyobject hw_mv hw_New_Document hw_objrec2array hw_Output_Document hw_pConnect hw_PipeDocument hw_Root hw_setlinkroot hw_stat hw_Unlock hw_Who	contained
syn keyword	phpFunctions	ibase_add_user ibase_affected_rows ibase_blob_add ibase_blob_cancel ibase_blob_close ibase_blob_create ibase_blob_echo ibase_blob_get ibase_blob_import ibase_blob_info ibase_blob_open ibase_close ibase_commit_ret ibase_commit ibase_connect ibase_delete_user ibase_drop_db ibase_errcode ibase_errmsg ibase_execute ibase_fetch_assoc ibase_fetch_object ibase_fetch_row ibase_field_info ibase_free_event_handler ibase_free_query ibase_free_result ibase_gen_id ibase_modify_user ibase_name_result ibase_num_fields ibase_num_params ibase_param_info ibase_pconnect ibase_prepare ibase_query ibase_rollback_ret ibase_rollback ibase_set_event_handler ibase_timefmt ibase_trans ibase_wait_event	contained
syn keyword	phpFunctions	iconv_get_encoding iconv_mime_decode_headers iconv_mime_decode iconv_mime_encode iconv_set_encoding iconv_strlen iconv_strpos iconv_strrpos iconv_substr iconv ob_iconv_handler	contained
syn keyword	phpFunctions	ifx_affected_rows ifx_blobinfile_mode ifx_byteasvarchar ifx_close ifx_connect ifx_copy_blob ifx_create_blob ifx_create_char ifx_do ifx_error ifx_errormsg ifx_fetch_row ifx_fieldproperties ifx_fieldtypes ifx_free_blob ifx_free_char ifx_free_result ifx_get_blob ifx_get_char ifx_getsqlca ifx_htmltbl_result ifx_nullformat ifx_num_fields ifx_num_rows ifx_pconnect ifx_prepare ifx_query ifx_textasvarchar ifx_update_blob ifx_update_char ifxus_close_slob ifxus_create_slob ifxus_free_slob ifxus_open_slob ifxus_read_slob ifxus_seek_slob ifxus_tell_slob ifxus_write_slob	contained
syn keyword	phpFunctions	exif_imagetype exif_read_data exif_thumbnail gd_info getimagesize image_type_to_mime_type image2wbmp imagealphablending imageantialias imagearc imagechar imagecharup imagecolorallocate imagecolorallocatealpha imagecolorat imagecolorclosest imagecolorclosestalpha imagecolorclosesthwb imagecolordeallocate imagecolorexact imagecolorexactalpha imagecolormatch imagecolorresolve imagecolorresolvealpha imagecolorset imagecolorsforindex imagecolorstotal imagecolortransparent imagecopy imagecopymerge imagecopymergegray imagecopyresampled imagecopyresized imagecreate imagecreatefromgd2 imagecreatefromgd2part imagecreatefromgd imagecreatefromgif imagecreatefromjpeg imagecreatefrompng imagecreatefromstring imagecreatefromwbmp imagecreatefromxbm imagecreatefromxpm imagecreatetruecolor imagedashedline imagedestroy imageellipse imagefill imagefilledarc imagefilledellipse imagefilledpolygon imagefilledrectangle imagefilltoborder imagefontheight imagefontwidth imageftbbox imagefttext imagegammacorrect imagegd2 imagegd imagegif imageinterlace imageistruecolor imagejpeg imageline imageloadfont imagepalettecopy imagepng imagepolygon imagepsbbox imagepscopyfont imagepsencodefont imagepsextendfont imagepsfreefont imagepsloadfont imagepsslantfont imagepstext imagerectangle imagerotate imagesavealpha imagesetbrush imagesetpixel imagesetstyle imagesetthickness imagesettile imagestring imagestringup imagesx imagesy imagetruecolortopalette imagettfbbox imagettftext imagetypes imagewbmp iptcembed iptcparse jpeg2wbmp png2wbmp read_exif_data	contained
syn keyword	phpFunctions	imap_8bit imap_alerts imap_append imap_base64 imap_binary imap_body imap_bodystruct imap_check imap_clearflag_full imap_close imap_createmailbox imap_delete imap_deletemailbox imap_errors imap_expunge imap_fetch_overview imap_fetchbody imap_fetchheader imap_fetchstructure imap_get_quota imap_get_quotaroot imap_getacl imap_getmailboxes imap_getsubscribed imap_header imap_headerinfo imap_headers imap_last_error imap_list imap_listmailbox imap_listscan imap_listsubscribed imap_lsub imap_mail_compose imap_mail_copy imap_mail_move imap_mail imap_mailboxmsginfo imap_mime_header_decode imap_msgno imap_num_msg imap_num_recent imap_open imap_ping imap_qprint imap_renamemailbox imap_reopen imap_rfc822_parse_adrlist imap_rfc822_parse_headers imap_rfc822_write_address imap_scanmailbox imap_search imap_set_quota imap_setacl imap_setflag_full imap_sort imap_status imap_subscribe imap_thread imap_timeout imap_uid imap_undelete imap_unsubscribe imap_utf7_decode imap_utf7_encode imap_utf8	contained
syn keyword	phpFunctions	assert_options assert dl extension_loaded get_cfg_var get_current_user get_defined_constants get_extension_funcs get_include_path get_included_files get_loaded_extensions get_magic_quotes_gpc get_magic_quotes_runtime get_required_files getenv getlastmod getmygid getmyinode getmypid getmyuid getopt getrusage ini_alter ini_get_all ini_get ini_restore ini_set main memory_get_usage php_ini_scanned_files php_logo_guid php_sapi_name php_uname phpcredits phpinfo phpversion putenv restore_include_path set_include_path set_magic_quotes_runtime set_time_limit version_compare zend_logo_guid zend_version	contained
syn keyword	phpFunctions	ingres_autocommit ingres_close ingres_commit ingres_connect ingres_fetch_array ingres_fetch_object ingres_fetch_row ingres_field_length ingres_field_name ingres_field_nullable ingres_field_precision ingres_field_scale ingres_field_type ingres_num_fields ingres_num_rows ingres_pconnect ingres_query ingres_rollback	contained
syn keyword	phpFunctions	ircg_channel_mode ircg_disconnect ircg_fetch_error_msg ircg_get_username ircg_html_encode ircg_ignore_add ircg_ignore_del ircg_is_conn_alive ircg_join ircg_kick ircg_lookup_format_messages ircg_msg ircg_nick ircg_nickname_escape ircg_nickname_unescape ircg_notice ircg_part ircg_pconnect ircg_register_format_messages ircg_set_current ircg_set_file ircg_set_on_die ircg_topic ircg_whois	contained
syn keyword	phpFunctions	java_last_exception_clear java_last_exception_get	contained
syn keyword	phpFunctions	ldap_8859_to_t61 ldap_add ldap_bind ldap_close ldap_compare ldap_connect ldap_count_entries ldap_delete ldap_dn2ufn ldap_err2str ldap_errno ldap_error ldap_explode_dn ldap_first_attribute ldap_first_entry ldap_first_reference ldap_free_result ldap_get_attributes ldap_get_dn ldap_get_entries ldap_get_option ldap_get_values_len ldap_get_values ldap_list ldap_mod_add ldap_mod_del ldap_mod_replace ldap_modify ldap_next_attribute ldap_next_entry ldap_next_reference ldap_parse_reference ldap_parse_result ldap_read ldap_rename ldap_search ldap_set_option ldap_set_rebind_proc ldap_sort ldap_start_tls ldap_t61_to_8859 ldap_unbind	contained
syn keyword	phpFunctions	lzf_compress lzf_decompress lzf_optimized_for	contained
syn keyword	phpFunctions	ezmlm_hash mail	contained
syn keyword	phpFunctions	mailparse_determine_best_xfer_encoding mailparse_msg_create mailparse_msg_extract_part_file mailparse_msg_extract_part mailparse_msg_free mailparse_msg_get_part_data mailparse_msg_get_part mailparse_msg_get_structure mailparse_msg_parse_file mailparse_msg_parse mailparse_rfc822_parse_addresses mailparse_stream_encode mailparse_uudecode_all	contained
syn keyword	phpFunctions	abs acos acosh asin asinh atan2 atan atanh base_convert bindec ceil cos cosh decbin dechex decoct deg2rad exp expm1 floor fmod getrandmax hexdec hypot is_finite is_infinite is_nan lcg_value log10 log1p log max min mt_getrandmax mt_rand mt_srand octdec pi pow rad2deg rand round sin sinh sqrt srand tan tanh	contained
syn keyword	phpFunctions	mb_convert_case mb_convert_encoding mb_convert_kana mb_convert_variables mb_decode_mimeheader mb_decode_numericentity mb_detect_encoding mb_detect_order mb_encode_mimeheader mb_encode_numericentity mb_ereg_match mb_ereg_replace mb_ereg_search_getpos mb_ereg_search_getregs mb_ereg_search_init mb_ereg_search_pos mb_ereg_search_regs mb_ereg_search_setpos mb_ereg_search mb_ereg mb_eregi_replace mb_eregi mb_get_info mb_http_input mb_http_output mb_internal_encoding mb_language mb_output_handler mb_parse_str mb_preferred_mime_name mb_regex_encoding mb_regex_set_options mb_send_mail mb_split mb_strcut mb_strimwidth mb_strlen mb_strpos mb_strrpos mb_strtolower mb_strtoupper mb_strwidth mb_substitute_character mb_substr_count mb_substr	contained
syn keyword	phpFunctions	mcal_append_event mcal_close mcal_create_calendar mcal_date_compare mcal_date_valid mcal_day_of_week mcal_day_of_year mcal_days_in_month mcal_delete_calendar mcal_delete_event mcal_event_add_attribute mcal_event_init mcal_event_set_alarm mcal_event_set_category mcal_event_set_class mcal_event_set_description mcal_event_set_end mcal_event_set_recur_daily mcal_event_set_recur_monthly_mday mcal_event_set_recur_monthly_wday mcal_event_set_recur_none mcal_event_set_recur_weekly mcal_event_set_recur_yearly mcal_event_set_start mcal_event_set_title mcal_expunge mcal_fetch_current_stream_event mcal_fetch_event mcal_is_leap_year mcal_list_alarms mcal_list_events mcal_next_recurrence mcal_open mcal_popen mcal_rename_calendar mcal_reopen mcal_snooze mcal_store_event mcal_time_valid mcal_week_of_year	contained
syn keyword	phpFunctions	mcrypt_cbc mcrypt_cfb mcrypt_create_iv mcrypt_decrypt mcrypt_ecb mcrypt_enc_get_algorithms_name mcrypt_enc_get_block_size mcrypt_enc_get_iv_size mcrypt_enc_get_key_size mcrypt_enc_get_modes_name mcrypt_enc_get_supported_key_sizes mcrypt_enc_is_block_algorithm_mode mcrypt_enc_is_block_algorithm mcrypt_enc_is_block_mode mcrypt_enc_self_test mcrypt_encrypt mcrypt_generic_deinit mcrypt_generic_end mcrypt_generic_init mcrypt_generic mcrypt_get_block_size mcrypt_get_cipher_name mcrypt_get_iv_size mcrypt_get_key_size mcrypt_list_algorithms mcrypt_list_modes mcrypt_module_close mcrypt_module_get_algo_block_size mcrypt_module_get_algo_key_size mcrypt_module_get_supported_key_sizes mcrypt_module_is_block_algorithm_mode mcrypt_module_is_block_algorithm mcrypt_module_is_block_mode mcrypt_module_open mcrypt_module_self_test mcrypt_ofb mdecrypt_generic	contained
syn keyword	phpFunctions	mcve_adduser mcve_adduserarg mcve_bt mcve_checkstatus mcve_chkpwd mcve_chngpwd mcve_completeauthorizations mcve_connect mcve_connectionerror mcve_deleteresponse mcve_deletetrans mcve_deleteusersetup mcve_deluser mcve_destroyconn mcve_destroyengine mcve_disableuser mcve_edituser mcve_enableuser mcve_force mcve_getcell mcve_getcellbynum mcve_getcommadelimited mcve_getheader mcve_getuserarg mcve_getuserparam mcve_gft mcve_gl mcve_gut mcve_initconn mcve_initengine mcve_initusersetup mcve_iscommadelimited mcve_liststats mcve_listusers mcve_maxconntimeout mcve_monitor mcve_numcolumns mcve_numrows mcve_override mcve_parsecommadelimited mcve_ping mcve_preauth mcve_preauthcompletion mcve_qc mcve_responseparam mcve_return mcve_returncode mcve_returnstatus mcve_sale mcve_setblocking mcve_setdropfile mcve_setip mcve_setssl_files mcve_setssl mcve_settimeout mcve_settle mcve_text_avs mcve_text_code mcve_text_cv mcve_transactionauth mcve_transactionavs mcve_transactionbatch mcve_transactioncv mcve_transactionid mcve_transactionitem mcve_transactionssent mcve_transactiontext mcve_transinqueue mcve_transnew mcve_transparam mcve_transsend mcve_ub mcve_uwait mcve_verifyconnection mcve_verifysslcert mcve_void	contained
syn keyword	phpFunctions	mhash_count mhash_get_block_size mhash_get_hash_name mhash_keygen_s2k mhash	contained
syn keyword	phpFunctions	mime_content_type	contained
syn keyword	phpFunctions	ming_setcubicthreshold ming_setscale ming_useswfversion SWFAction SWFBitmap swfbutton_keypress SWFbutton SWFDisplayItem SWFFill SWFFont SWFGradient SWFMorph SWFMovie SWFShape SWFSprite SWFText SWFTextField	contained
syn keyword	phpMethods	getHeight getWidth addAction addShape setAction setdown setHit setOver setUp addColor move moveTo multColor remove Rotate rotateTo scale scaleTo setDepth setName setRatio skewX skewXTo skewY skewYTo moveTo rotateTo scaleTo skewXTo skewYTo getwidth addEntry getshape1 getshape2 add nextframe output remove save setbackground setdimension setframes setrate streammp3 addFill drawCurve drawCurveTo drawLine drawLineTo movePen movePenTo setLeftFill setLine setRightFill add nextframe remove setframes addString getWidth moveTo setColor setFont setHeight setSpacing addstring align setbounds setcolor setFont setHeight setindentation setLeftMargin setLineSpacing setMargins setname setrightMargin	contained
syn keyword	phpFunctions	connection_aborted connection_status connection_timeout constant define defined eval get_browser highlight_file highlight_string ignore_user_abort pack show_source sleep uniqid unpack usleep	contained
syn keyword	phpFunctions	udm_add_search_limit udm_alloc_agent udm_api_version udm_cat_list udm_cat_path udm_check_charset udm_check_stored udm_clear_search_limits udm_close_stored udm_crc32 udm_errno udm_error udm_find udm_free_agent udm_free_ispell_data udm_free_res udm_get_doc_count udm_get_res_field udm_get_res_param udm_load_ispell_data udm_open_stored udm_set_agent_param	contained
syn keyword	phpFunctions	msession_connect msession_count msession_create msession_destroy msession_disconnect msession_find msession_get_array msession_get msession_getdata msession_inc msession_list msession_listvar msession_lock msession_plugin msession_randstr msession_set_array msession_set msession_setdata msession_timeout msession_uniq msession_unlock	contained
syn keyword	phpFunctions	msql_affected_rows msql_close msql_connect msql_create_db msql_createdb msql_data_seek msql_dbname msql_drop_db msql_dropdb msql_error msql_fetch_array msql_fetch_field msql_fetch_object msql_fetch_row msql_field_seek msql_fieldflags msql_fieldlen msql_fieldname msql_fieldtable msql_fieldtype msql_free_result msql_freeresult msql_list_dbs msql_list_fields msql_list_tables msql_listdbs msql_listfields msql_listtables msql_num_fields msql_num_rows msql_numfields msql_numrows msql_pconnect msql_query msql_regcase msql_result msql_select_db msql_selectdb msql_tablename msql	contained
syn keyword	phpFunctions	mssql_bind mssql_close mssql_connect mssql_data_seek mssql_execute mssql_fetch_array mssql_fetch_assoc mssql_fetch_batch mssql_fetch_field mssql_fetch_object mssql_fetch_row mssql_field_length mssql_field_name mssql_field_seek mssql_field_type mssql_free_result mssql_free_statement mssql_get_last_message mssql_guid_string mssql_init mssql_min_error_severity mssql_min_message_severity mssql_next_result mssql_num_fields mssql_num_rows mssql_pconnect mssql_query mssql_result mssql_rows_affected mssql_select_db	contained
syn keyword	phpFunctions	muscat_close muscat_get muscat_give muscat_setup_net muscat_setup	contained
syn keyword	phpFunctions	mysql_affected_rows mysql_change_user mysql_client_encoding mysql_close mysql_connect mysql_create_db mysql_data_seek mysql_db_name mysql_db_query mysql_drop_db mysql_errno mysql_error mysql_escape_string mysql_fetch_array mysql_fetch_assoc mysql_fetch_field mysql_fetch_lengths mysql_fetch_object mysql_fetch_row mysql_field_flags mysql_field_len mysql_field_name mysql_field_seek mysql_field_table mysql_field_type mysql_free_result mysql_get_client_info mysql_get_host_info mysql_get_proto_info mysql_get_server_info mysql_info mysql_insert_id mysql_list_dbs mysql_list_fields mysql_list_processes mysql_list_tables mysql_num_fields mysql_num_rows mysql_pconnect mysql_ping mysql_query mysql_real_escape_string mysql_result mysql_select_db mysql_stat mysql_tablename mysql_thread_id mysql_unbuffered_query	contained
syn keyword	phpFunctions	mysqli_affected_rows mysqli_autocommit mysqli_bind_param mysqli_bind_result mysqli_change_user mysqli_character_set_name mysqli_close mysqli_commit mysqli_connect mysqli_data_seek mysqli_debug mysqli_disable_reads_from_master mysqli_disable_rpl_parse mysqli_dump_debug_info mysqli_enable_reads_from_master mysqli_enable_rpl_parse mysqli_errno mysqli_error mysqli_execute mysqli_fetch_array mysqli_fetch_assoc mysqli_fetch_field_direct mysqli_fetch_field mysqli_fetch_fields mysqli_fetch_lengths mysqli_fetch_object mysqli_fetch_row mysqli_fetch mysqli_field_count mysqli_field_seek mysqli_field_tell mysqli_free_result mysqli_get_client_info mysqli_get_host_info mysqli_get_proto_info mysqli_get_server_info mysqli_get_server_version mysqli_info mysqli_init mysqli_insert_id mysqli_kill mysqli_master_query mysqli_num_fields mysqli_num_rows mysqli_options mysqli_param_count mysqli_ping mysqli_prepare_result mysqli_prepare mysqli_profiler mysqli_query mysqli_read_query_result mysqli_real_connect mysqli_real_escape_string mysqli_real_query mysqli_reload mysqli_rollback mysqli_rpl_parse_enabled mysqli_rpl_probe mysqli_rpl_query_type mysqli_select_db mysqli_send_long_data mysqli_send_query mysqli_slave_query mysqli_ssl_set mysqli_stat mysqli_stmt_affected_rows mysqli_stmt_close mysqli_stmt_errno mysqli_stmt_error mysqli_stmt_store_result mysqli_store_result mysqli_thread_id mysqli_thread_safe mysqli_use_result mysqli_warning_count	contained
syn keyword	phpFunctions	ncurses_addch ncurses_addchnstr ncurses_addchstr ncurses_addnstr ncurses_addstr ncurses_assume_default_colors ncurses_attroff ncurses_attron ncurses_attrset ncurses_baudrate ncurses_beep ncurses_bkgd ncurses_bkgdset ncurses_border ncurses_bottom_panel ncurses_can_change_color ncurses_cbreak ncurses_clear ncurses_clrtobot ncurses_clrtoeol ncurses_color_content ncurses_color_set ncurses_curs_set ncurses_def_prog_mode ncurses_def_shell_mode ncurses_define_key ncurses_del_panel ncurses_delay_output ncurses_delch ncurses_deleteln ncurses_delwin ncurses_doupdate ncurses_echo ncurses_echochar ncurses_end ncurses_erase ncurses_erasechar ncurses_filter ncurses_flash ncurses_flushinp ncurses_getch ncurses_getmaxyx ncurses_getmouse ncurses_getyx ncurses_halfdelay ncurses_has_colors ncurses_has_ic ncurses_has_il ncurses_has_key ncurses_hide_panel ncurses_hline ncurses_inch ncurses_init_color ncurses_init_pair ncurses_init ncurses_insch ncurses_insdelln ncurses_insertln ncurses_insstr ncurses_instr ncurses_isendwin ncurses_keyok ncurses_keypad ncurses_killchar ncurses_longname ncurses_meta ncurses_mouse_trafo ncurses_mouseinterval ncurses_mousemask ncurses_move_panel ncurses_move ncurses_mvaddch ncurses_mvaddchnstr ncurses_mvaddchstr ncurses_mvaddnstr ncurses_mvaddstr ncurses_mvcur ncurses_mvdelch ncurses_mvgetch ncurses_mvhline ncurses_mvinch ncurses_mvvline ncurses_mvwaddstr ncurses_napms ncurses_new_panel ncurses_newpad ncurses_newwin ncurses_nl ncurses_nocbreak ncurses_noecho ncurses_nonl ncurses_noqiflush ncurses_noraw ncurses_pair_content ncurses_panel_above ncurses_panel_below ncurses_panel_window ncurses_pnoutrefresh ncurses_prefresh ncurses_putp ncurses_qiflush ncurses_raw ncurses_refresh ncurses_replace_panel ncurses_reset_prog_mode ncurses_reset_shell_mode ncurses_resetty ncurses_savetty ncurses_scr_dump ncurses_scr_init ncurses_scr_restore ncurses_scr_set ncurses_scrl ncurses_show_panel ncurses_slk_attr ncurses_slk_attroff ncurses_slk_attron ncurses_slk_attrset ncurses_slk_clear ncurses_slk_color ncurses_slk_init ncurses_slk_noutrefresh ncurses_slk_refresh ncurses_slk_restore ncurses_slk_set ncurses_slk_touch ncurses_standend ncurses_standout ncurses_start_color ncurses_termattrs ncurses_termname ncurses_timeout ncurses_top_panel ncurses_typeahead ncurses_ungetch ncurses_ungetmouse ncurses_update_panels ncurses_use_default_colors ncurses_use_env ncurses_use_extended_names ncurses_vidattr ncurses_vline ncurses_waddch ncurses_waddstr ncurses_wattroff ncurses_wattron ncurses_wattrset ncurses_wborder ncurses_wclear ncurses_wcolor_set ncurses_werase ncurses_wgetch ncurses_whline ncurses_wmouse_trafo ncurses_wmove ncurses_wnoutrefresh ncurses_wrefresh ncurses_wstandend ncurses_wstandout ncurses_wvline	contained
syn keyword	phpFunctions	checkdnsrr closelog debugger_off debugger_on define_syslog_variables dns_check_record dns_get_mx dns_get_record fsockopen gethostbyaddr gethostbyname gethostbynamel getmxrr getprotobyname getprotobynumber getservbyname getservbyport ip2long long2ip openlog pfsockopen socket_get_status socket_set_blocking socket_set_timeout syslog	contained
syn keyword	phpFunctions	yp_all yp_cat yp_err_string yp_errno yp_first yp_get_default_domain yp_master yp_match yp_next yp_order	contained
syn keyword	phpFunctions	notes_body notes_copy_db notes_create_db notes_create_note notes_drop_db notes_find_note notes_header_info notes_list_msgs notes_mark_read notes_mark_unread notes_nav_create notes_search notes_unread notes_version	contained
syn keyword	phpFunctions	nsapi_request_headers nsapi_response_headers nsapi_virtual	contained
syn keyword	phpFunctions	aggregate_info aggregate_methods_by_list aggregate_methods_by_regexp aggregate_methods aggregate_properties_by_list aggregate_properties_by_regexp aggregate_properties aggregate aggregation_info deaggregate	contained
syn keyword	phpFunctions	ocibindbyname ocicancel ocicloselob ocicollappend ocicollassign ocicollassignelem ocicollgetelem ocicollmax ocicollsize ocicolltrim ocicolumnisnull ocicolumnname ocicolumnprecision ocicolumnscale ocicolumnsize ocicolumntype ocicolumntyperaw ocicommit ocidefinebyname ocierror ociexecute ocifetch ocifetchinto ocifetchstatement ocifreecollection ocifreecursor ocifreedesc ocifreestatement ociinternaldebug ociloadlob ocilogoff ocilogon ocinewcollection ocinewcursor ocinewdescriptor ocinlogon ocinumcols ociparse ociplogon ociresult ocirollback ocirowcount ocisavelob ocisavelobfile ociserverversion ocisetprefetch ocistatementtype ociwritelobtofile ociwritetemporarylob	contained
syn keyword	phpFunctions	odbc_autocommit odbc_binmode odbc_close_all odbc_close odbc_columnprivileges odbc_columns odbc_commit odbc_connect odbc_cursor odbc_data_source odbc_do odbc_error odbc_errormsg odbc_exec odbc_execute odbc_fetch_array odbc_fetch_into odbc_fetch_object odbc_fetch_row odbc_field_len odbc_field_name odbc_field_num odbc_field_precision odbc_field_scale odbc_field_type odbc_foreignkeys odbc_free_result odbc_gettypeinfo odbc_longreadlen odbc_next_result odbc_num_fields odbc_num_rows odbc_pconnect odbc_prepare odbc_primarykeys odbc_procedurecolumns odbc_procedures odbc_result_all odbc_result odbc_rollback odbc_setoption odbc_specialcolumns odbc_statistics odbc_tableprivileges odbc_tables	contained
syn keyword	phpFunctions	openssl_csr_export_to_file openssl_csr_export openssl_csr_new openssl_csr_sign openssl_error_string openssl_free_key openssl_get_privatekey openssl_get_publickey openssl_open openssl_pkcs7_decrypt openssl_pkcs7_encrypt openssl_pkcs7_sign openssl_pkcs7_verify openssl_pkey_export_to_file openssl_pkey_export openssl_pkey_get_private openssl_pkey_get_public openssl_pkey_new openssl_private_decrypt openssl_private_encrypt openssl_public_decrypt openssl_public_encrypt openssl_seal openssl_sign openssl_verify openssl_x509_check_private_key openssl_x509_checkpurpose openssl_x509_export_to_file openssl_x509_export openssl_x509_free openssl_x509_parse openssl_x509_read	contained
syn keyword	phpFunctions	ora_bind ora_close ora_columnname ora_columnsize ora_columntype ora_commit ora_commitoff ora_commiton ora_do ora_error ora_errorcode ora_exec ora_fetch_into ora_fetch ora_getcolumn ora_logoff ora_logon ora_numcols ora_numrows ora_open ora_parse ora_plogon ora_rollback	contained
syn keyword	phpFunctions	flush ob_clean ob_end_clean ob_end_flush ob_flush ob_get_clean ob_get_contents ob_get_flush ob_get_length ob_get_level ob_get_status ob_gzhandler ob_implicit_flush ob_list_handlers ob_start output_add_rewrite_var output_reset_rewrite_vars	contained
syn keyword	phpFunctions	overload	contained
syn keyword	phpFunctions	ovrimos_close ovrimos_commit ovrimos_connect ovrimos_cursor ovrimos_exec ovrimos_execute ovrimos_fetch_into ovrimos_fetch_row ovrimos_field_len ovrimos_field_name ovrimos_field_num ovrimos_field_type ovrimos_free_result ovrimos_longreadlen ovrimos_num_fields ovrimos_num_rows ovrimos_prepare ovrimos_result_all ovrimos_result ovrimos_rollback	contained
syn keyword	phpFunctions	pcntl_exec pcntl_fork pcntl_signal pcntl_waitpid pcntl_wexitstatus pcntl_wifexited pcntl_wifsignaled pcntl_wifstopped pcntl_wstopsig pcntl_wtermsig	contained
syn keyword	phpFunctions	preg_grep preg_match_all preg_match preg_quote preg_replace_callback preg_replace preg_split	contained
syn keyword	phpFunctions	pdf_add_annotation pdf_add_bookmark pdf_add_launchlink pdf_add_locallink pdf_add_note pdf_add_outline pdf_add_pdflink pdf_add_thumbnail pdf_add_weblink pdf_arc pdf_arcn pdf_attach_file pdf_begin_page pdf_begin_pattern pdf_begin_template pdf_circle pdf_clip pdf_close_image pdf_close_pdi_page pdf_close_pdi pdf_close pdf_closepath_fill_stroke pdf_closepath_stroke pdf_closepath pdf_concat pdf_continue_text pdf_curveto pdf_delete pdf_end_page pdf_end_pattern pdf_end_template pdf_endpath pdf_fill_stroke pdf_fill pdf_findfont pdf_get_buffer pdf_get_font pdf_get_fontname pdf_get_fontsize pdf_get_image_height pdf_get_image_width pdf_get_majorversion pdf_get_minorversion pdf_get_parameter pdf_get_pdi_parameter pdf_get_pdi_value pdf_get_value pdf_initgraphics pdf_lineto pdf_makespotcolor pdf_moveto pdf_new pdf_open_CCITT pdf_open_file pdf_open_gif pdf_open_image_file pdf_open_image pdf_open_jpeg pdf_open_memory_image pdf_open_pdi_page pdf_open_pdi pdf_open_png pdf_open_tiff pdf_open pdf_place_image pdf_place_pdi_page pdf_rect pdf_restore pdf_rotate pdf_save pdf_scale pdf_set_border_color pdf_set_border_dash pdf_set_border_style pdf_set_char_spacing pdf_set_duration pdf_set_font pdf_set_horiz_scaling pdf_set_info_author pdf_set_info_creator pdf_set_info_keywords pdf_set_info_subject pdf_set_info_title pdf_set_info pdf_set_leading pdf_set_parameter pdf_set_text_matrix pdf_set_text_pos pdf_set_text_rendering pdf_set_text_rise pdf_set_value pdf_set_word_spacing pdf_setcolor pdf_setdash pdf_setflat pdf_setfont pdf_setgray_fill pdf_setgray_stroke pdf_setgray pdf_setlinecap pdf_setlinejoin pdf_setlinewidth pdf_setmatrix pdf_setmiterlimit pdf_setpolydash pdf_setrgbcolor_fill pdf_setrgbcolor_stroke pdf_setrgbcolor pdf_show_boxed pdf_show_xy pdf_show pdf_skew pdf_stringwidth pdf_stroke pdf_translate	contained
syn keyword	phpFunctions	pfpro_cleanup pfpro_init pfpro_process_raw pfpro_process pfpro_version	contained
syn keyword	phpFunctions	pg_affected_rows pg_cancel_query pg_client_encoding pg_close pg_connect pg_connection_busy pg_connection_reset pg_connection_status pg_convert pg_copy_from pg_copy_to pg_dbname pg_delete pg_end_copy pg_escape_bytea pg_escape_string pg_fetch_all pg_fetch_array pg_fetch_assoc pg_fetch_object pg_fetch_result pg_fetch_row pg_field_is_null pg_field_name pg_field_num pg_field_prtlen pg_field_size pg_field_type pg_free_result pg_get_notify pg_get_pid pg_get_result pg_host pg_insert pg_last_error pg_last_notice pg_last_oid pg_lo_close pg_lo_create pg_lo_export pg_lo_import pg_lo_open pg_lo_read_all pg_lo_read pg_lo_seek pg_lo_tell pg_lo_unlink pg_lo_write pg_meta_data pg_num_fields pg_num_rows pg_options pg_pconnect pg_ping pg_port pg_put_line pg_query pg_result_error pg_result_seek pg_result_status pg_select pg_send_query pg_set_client_encoding pg_trace pg_tty pg_unescape_bytea pg_untrace pg_update	contained
syn keyword	phpFunctions	posix_ctermid posix_get_last_error posix_getcwd posix_getegid posix_geteuid posix_getgid posix_getgrgid posix_getgrnam posix_getgroups posix_getlogin posix_getpgid posix_getpgrp posix_getpid posix_getppid posix_getpwnam posix_getpwuid posix_getrlimit posix_getsid posix_getuid posix_isatty posix_kill posix_mkfifo posix_setegid posix_seteuid posix_setgid posix_setpgid posix_setsid posix_setuid posix_strerror posix_times posix_ttyname posix_uname	contained
syn keyword	phpFunctions	printer_abort printer_close printer_create_brush printer_create_dc printer_create_font printer_create_pen printer_delete_brush printer_delete_dc printer_delete_font printer_delete_pen printer_draw_bmp printer_draw_chord printer_draw_elipse printer_draw_line printer_draw_pie printer_draw_rectangle printer_draw_roundrect printer_draw_text printer_end_doc printer_end_page printer_get_option printer_list printer_logical_fontheight printer_open printer_select_brush printer_select_font printer_select_pen printer_set_option printer_start_doc printer_start_page printer_write	contained
syn keyword	phpFunctions	pspell_add_to_personal pspell_add_to_session pspell_check pspell_clear_session pspell_config_create pspell_config_ignore pspell_config_mode pspell_config_personal pspell_config_repl pspell_config_runtogether pspell_config_save_repl pspell_new_config pspell_new_personal pspell_new pspell_save_wordlist pspell_store_replacement pspell_suggest	contained
syn keyword	phpFunctions	qdom_error qdom_tree	contained
syn keyword	phpFunctions	readline_add_history readline_clear_history readline_completion_function readline_info readline_list_history readline_read_history readline_write_history readline	contained
syn keyword	phpFunctions	recode_file recode_string recode	contained
syn keyword	phpFunctions	ereg_replace ereg eregi_replace eregi split spliti sql_regcase	contained
syn keyword	phpFunctions	ftok msg_get_queue msg_receive msg_remove_queue msg_send msg_set_queue msg_stat_queue sem_acquire sem_get sem_release sem_remove shm_attach shm_detach shm_get_var shm_put_var shm_remove_var shm_remove	contained
syn keyword	phpFunctions	sesam_affected_rows sesam_commit sesam_connect sesam_diagnostic sesam_disconnect sesam_errormsg sesam_execimm sesam_fetch_array sesam_fetch_result sesam_fetch_row sesam_field_array sesam_field_name sesam_free_result sesam_num_fields sesam_query sesam_rollback sesam_seek_row sesam_settransaction	contained
syn keyword	phpFunctions	session_cache_expire session_cache_limiter session_decode session_destroy session_encode session_get_cookie_params session_id session_is_registered session_module_name session_name session_regenerate_id session_register session_save_path session_set_cookie_params session_set_save_handler session_start session_unregister session_unset session_write_close	contained
syn keyword	phpFunctions	shmop_close shmop_delete shmop_open shmop_read shmop_size shmop_write	contained
syn keyword	phpFunctions	snmp_get_quick_print snmp_set_quick_print snmpget snmprealwalk snmpset snmpwalk snmpwalkoid	contained
syn keyword	phpFunctions	socket_accept socket_bind socket_clear_error socket_close socket_connect socket_create_listen socket_create_pair socket_create socket_get_option socket_getpeername socket_getsockname socket_iovec_add socket_iovec_alloc socket_iovec_delete socket_iovec_fetch socket_iovec_free socket_iovec_set socket_last_error socket_listen socket_read socket_readv socket_recv socket_recvfrom socket_recvmsg socket_select socket_send socket_sendmsg socket_sendto socket_set_block socket_set_nonblock socket_set_option socket_shutdown socket_strerror socket_write socket_writev	contained
syn keyword	phpFunctions	sqlite_array_query sqlite_busy_timeout sqlite_changes sqlite_close sqlite_column sqlite_create_aggregate sqlite_create_function sqlite_current sqlite_error_string sqlite_escape_string sqlite_fetch_array sqlite_fetch_single sqlite_fetch_string sqlite_field_name sqlite_has_more sqlite_last_error sqlite_last_insert_rowid sqlite_libencoding sqlite_libversion sqlite_next sqlite_num_fields sqlite_num_rows sqlite_open sqlite_popen sqlite_query sqlite_rewind sqlite_seek sqlite_udf_decode_binary sqlite_udf_encode_binary sqlite_unbuffered_query	contained
syn keyword	phpFunctions	stream_context_create stream_context_get_options stream_context_set_option stream_context_set_params stream_copy_to_stream stream_filter_append stream_filter_prepend stream_filter_register stream_get_contents stream_get_filters stream_get_line stream_get_meta_data stream_get_transports stream_get_wrappers stream_register_wrapper stream_select stream_set_blocking stream_set_timeout stream_set_write_buffer stream_socket_accept stream_socket_client stream_socket_get_name stream_socket_recvfrom stream_socket_sendto stream_socket_server stream_wrapper_register	contained
syn keyword	phpFunctions	addcslashes addslashes bin2hex chop chr chunk_split convert_cyr_string count_chars crc32 crypt explode fprintf get_html_translation_table hebrev hebrevc html_entity_decode htmlentities htmlspecialchars implode join levenshtein localeconv ltrim md5_file md5 metaphone money_format nl_langinfo nl2br number_format ord parse_str print printf quoted_printable_decode quotemeta rtrim setlocale sha1_file sha1 similar_text soundex sprintf sscanf str_ireplace str_pad str_repeat str_replace str_rot13 str_shuffle str_split str_word_count strcasecmp strchr strcmp strcoll strcspn strip_tags stripcslashes stripos stripslashes stristr strlen strnatcasecmp strnatcmp strncasecmp strncmp strpos strrchr strrev strripos strrpos strspn strstr strtok strtolower strtoupper strtr substr_compare substr_count substr_replace substr trim ucfirst ucwords vprintf vsprintf wordwrap	contained
syn keyword	phpFunctions	swf_actiongeturl swf_actiongotoframe swf_actiongotolabel swf_actionnextframe swf_actionplay swf_actionprevframe swf_actionsettarget swf_actionstop swf_actiontogglequality swf_actionwaitforframe swf_addbuttonrecord swf_addcolor swf_closefile swf_definebitmap swf_definefont swf_defineline swf_definepoly swf_definerect swf_definetext swf_endbutton swf_enddoaction swf_endshape swf_endsymbol swf_fontsize swf_fontslant swf_fonttracking swf_getbitmapinfo swf_getfontinfo swf_getframe swf_labelframe swf_lookat swf_modifyobject swf_mulcolor swf_nextid swf_oncondition swf_openfile swf_ortho2 swf_ortho swf_perspective swf_placeobject swf_polarview swf_popmatrix swf_posround swf_pushmatrix swf_removeobject swf_rotate swf_scale swf_setfont swf_setframe swf_shapearc swf_shapecurveto3 swf_shapecurveto swf_shapefillbitmapclip swf_shapefillbitmaptile swf_shapefilloff swf_shapefillsolid swf_shapelinesolid swf_shapelineto swf_shapemoveto swf_showframe swf_startbutton swf_startdoaction swf_startshape swf_startsymbol swf_textwidth swf_translate swf_viewport	contained
syn keyword	phpFunctions	sybase_affected_rows sybase_close sybase_connect sybase_data_seek sybase_deadlock_retry_count sybase_fetch_array sybase_fetch_assoc sybase_fetch_field sybase_fetch_object sybase_fetch_row sybase_field_seek sybase_free_result sybase_get_last_message sybase_min_client_severity sybase_min_error_severity sybase_min_message_severity sybase_min_server_severity sybase_num_fields sybase_num_rows sybase_pconnect sybase_query sybase_result sybase_select_db sybase_set_message_handler sybase_unbuffered_query	contained
syn keyword	phpFunctions	tidy_access_count tidy_clean_repair tidy_config_count tidy_diagnose tidy_error_count tidy_get_body tidy_get_config tidy_get_error_buffer tidy_get_head tidy_get_html_ver tidy_get_html tidy_get_output tidy_get_release tidy_get_root tidy_get_status tidy_getopt tidy_is_xhtml tidy_load_config tidy_parse_file tidy_parse_string tidy_repair_file tidy_repair_string tidy_reset_config tidy_save_config tidy_set_encoding tidy_setopt tidy_warning_count	contained
syn keyword	phpMethods	attributes children get_attr get_nodes has_children has_siblings is_asp is_comment is_html is_jsp is_jste is_text is_xhtml is_xml next prev tidy_node	contained
syn keyword	phpFunctions	token_get_all token_name	contained
syn keyword	phpFunctions	base64_decode base64_encode get_meta_tags http_build_query parse_url rawurldecode rawurlencode urldecode urlencode	contained
syn keyword	phpFunctions	doubleval empty floatval get_defined_vars get_resource_type gettype import_request_variables intval is_array is_bool is_callable is_double is_float is_int is_integer is_long is_null is_numeric is_object is_real is_resource is_scalar is_string isset print_r serialize settype strval unserialize unset var_dump var_export	contained
syn keyword	phpFunctions	vpopmail_add_alias_domain_ex vpopmail_add_alias_domain vpopmail_add_domain_ex vpopmail_add_domain vpopmail_add_user vpopmail_alias_add vpopmail_alias_del_domain vpopmail_alias_del vpopmail_alias_get_all vpopmail_alias_get vpopmail_auth_user vpopmail_del_domain_ex vpopmail_del_domain vpopmail_del_user vpopmail_error vpopmail_passwd vpopmail_set_user_quota	contained
syn keyword	phpFunctions	w32api_deftype w32api_init_dtype w32api_invoke_function w32api_register_function w32api_set_call_method	contained
syn keyword	phpFunctions	wddx_add_vars wddx_deserialize wddx_packet_end wddx_packet_start wddx_serialize_value wddx_serialize_vars	contained
syn keyword	phpFunctions	utf8_decode utf8_encode xml_error_string xml_get_current_byte_index xml_get_current_column_number xml_get_current_line_number xml_get_error_code xml_parse_into_struct xml_parse xml_parser_create_ns xml_parser_create xml_parser_free xml_parser_get_option xml_parser_set_option xml_set_character_data_handler xml_set_default_handler xml_set_element_handler xml_set_end_namespace_decl_handler xml_set_external_entity_ref_handler xml_set_notation_decl_handler xml_set_object xml_set_processing_instruction_handler xml_set_start_namespace_decl_handler xml_set_unparsed_entity_decl_handler	contained
syn keyword	phpFunctions	xmlrpc_decode_request xmlrpc_decode xmlrpc_encode_request xmlrpc_encode xmlrpc_get_type xmlrpc_parse_method_descriptions xmlrpc_server_add_introspection_data xmlrpc_server_call_method xmlrpc_server_create xmlrpc_server_destroy xmlrpc_server_register_introspection_callback xmlrpc_server_register_method xmlrpc_set_type	contained
syn keyword	phpFunctions	xslt_create xslt_errno xslt_error xslt_free xslt_output_process xslt_set_base xslt_set_encoding xslt_set_error_handler xslt_set_log xslt_set_sax_handler xslt_set_sax_handlers xslt_set_scheme_handler xslt_set_scheme_handlers	contained
syn keyword	phpFunctions	yaz_addinfo yaz_ccl_conf yaz_ccl_parse yaz_close yaz_connect yaz_database yaz_element yaz_errno yaz_error yaz_es_result yaz_get_option yaz_hits yaz_itemorder yaz_present yaz_range yaz_record yaz_scan_result yaz_scan yaz_schema yaz_search yaz_set_option yaz_sort yaz_syntax yaz_wait	contained
syn keyword	phpFunctions	zip_close zip_entry_close zip_entry_compressedsize zip_entry_compressionmethod zip_entry_filesize zip_entry_name zip_entry_open zip_entry_read zip_open zip_read	contained
syn keyword	phpFunctions	gzclose gzcompress gzdeflate gzencode gzeof gzfile gzgetc gzgets gzgetss gzinflate gzopen gzpassthru gzputs gzread gzrewind gzseek gztell gzuncompress gzwrite readgzfile zlib_get_coding_type	contained

if s:show_baselib
  syn keyword	phpMethods	query next_record num_rows affected_rows nf f p np num_fields haltmsg seek link_id query_id metadata table_names nextid connect halt free register unregister is_registered delete url purl self_url pself_url hidden_session add_query padd_query reimport_get_vars reimport_post_vars reimport_cookie_vars set_container set_tokenname release_token put_headers get_id get_id put_id freeze thaw gc reimport_any_vars start url purl login_if is_authenticated auth_preauth auth_loginform auth_validatelogin auth_refreshlogin auth_registerform auth_doregister start check have_perm permsum perm_invalid	contained
  syn keyword	phpFunctions	page_open page_close sess_load sess_save	contained
endif

" Conditional
syn keyword phpConditional  contained declare enddeclare if else elseif endif switch endswitch

" Repeat
syn keyword phpRepeat       contained foreach as endforeach do while endwhile for endfor

" need a special parenthesis block for a foreach statement
if s:alt_arrays
  syn keyword phpRepeat contained foreach nextgroup=phpForeachRegion skipwhite skipempty
endif

" need an alternate parenthesis block for 'for' structure
" when using strict blocks
if s:strict_blocks
  syn keyword phpRepeat contained for nextgroup=phpForRegion skipwhite skipempty

  " if looking for errors with semicolons, add the other 'nextgroups' as well
  if s:no_empty_construct
    syn keyword phpRepeat contained while switch nextgroup=phpConstructRegion skipwhite skipempty
    syn keyword phpConditional contained if elseif nextgroup=phpConstructRegion skipwhite skipempty
    syn keyword phpConditional contained else nextgroup=phpSemicolonNotAllowedHere skipwhite skipempty
    syn keyword phpRepeat contained do nextgroup=phpDoBlock,phpSemicolonNotAllowedHere skipwhite skipempty
    syn region phpDoBlock matchgroup=phpBlock start=/{/ end=/}/ keepend extend
          \ contained transparent
          \ nextgroup=phpDoWhile skipwhite skipempty
          \ matchgroup=phpHTMLError end=/?>/
    syn keyword phpDoWhile contained while
    hi link phpDoWhile phpRepeat
  endif
endif

" Switch
" Peter Hodge June 17 20067
" - removed 'switch' from here to reserve phpLabel
"   for code-flow entry points
syn keyword	phpLabel	case default contained

" Statement
" TODO: re-arrange things so this is near semicolon?
if ! s:smart_semicolon
  syn keyword phpStatement return break continue exit die contained
endif

" Keyword
syn keyword	phpKeyword	var const	contained

" Type
syn keyword	phpType	bool boolean int integer real double float string object null	contained

if s:alt_arrays
  syn cluster phpClInside add=phpArrayRegion
  " TODO: should the error highlighting be optional???
  if s:fold_arrays
    syn region phpArrayRegion contained matchgroup=phpArrayParens start=/\<array(/ end=/)/
          \ keepend extend contains=@phpClInside,phpArrayPair,phpArrayComma
          \ matchgroup=Error end=/;/
          \ fold
  else
    syn region phpArrayRegion contained matchgroup=phpArrayParens start=/\<array(/ end=/)/
          \ keepend extend contains=@phpClInside,phpArrayPair,phpArrayComma
          \ matchgroup=Error end=/;/
  endif
  syn match phpArrayComma contained /,/

  syn cluster phpClInside add=phpListRegion
  " need to make a region for the 'list' keyword as well!!!
  " TODO: should the error highlighting be optional???
  " TODO: only allow variables and stuff inside the list() construct
  syn region phpListRegion contained matchgroup=phpArrayParens start=/\<list(/ end=/)/
        \ keepend extend contains=@phpClInside,phpListComma
        \ matchgroup=Error end=/;/
  syn match phpListComma contained /,/
  hi link phpListComma phpArrayComma
else
  " need to use a match instead of keyword here ... to stop it
  " from blocking a match later on.
  syn match phpArray contained /\<array\>/

  syn keyword phpType contained list
endif

" Structure
" TODO: should 'instanceof' still be here?
syn keyword	phpStructure instanceof parent self	contained

" Operator
syn match   phpOperator contained display /[=+%^|*!.~:]/
" TODO: need to match special methods everywhere
syn match   phpOperator contained display /::/
syn match   phpOperator contained display /&\$\@!/
syn match   phpOperator contained display /->\@!/
syn match   phpOperator contained display /[-+*/%^&|.]=/
syn match   phpOperator contained display /\/[*/]\@!/
syn match   phpOperator contained display /\$/
syn match   phpOperator contained display /&&/
syn match   phpOperator contained display /||/
syn keyword phpOperator	contained and or xor

" a match for a static function call
syn cluster phpClInside add=phpStaticCall
syn match phpStaticCall contained display /::\h\w*\ze\%(\_s*\)\@>(/ contains=phpOperator,@phpClMethodNames

" 
syn cluster phpClInside add=phpTernaryRegion
syn region phpTernaryRegion matchgroup=phpOperator start=/?/ end=/:/ transparent keepend extend display
      \ contained matchgroup=Error end=/[;)\]}]/

" Peter Hodge - added support for array-building operator
" to stop the relations from mixing this up
if s:alt_arrays
  syn match	phpArrayPair /=>/ contained display
  syn match	phpArrayPairError /=>/ contained display
else
  syn match phpOperator /=>/ contained display
endif

" call-time pass-by-reference
" TODO: make this a little more robust ... it doesn't know how to protect
" itself when someone does something like '$foo&$bar' - it thinks that's a
" call-time by-reference arg.
" We really need a nextgroup= to find when an '&' bit-wise operator is being
" used, and not a call-time pass-by-ref.  Maybe some other time
syn match phpAssignByRef /&\$\@=/	contained display

" relations
" Peter Hodge, June 17 2006
" - altered relations to match strict comparisons (=== and !==)
" - highlight the 'instanceof' operator as a relation operator
"   rather than a structure, if comparison support is a priority.
syn match	phpRelation	"===\="	contained display
syn match	phpRelation	"!==\="	contained display
syn match	phpRelation	"<=\="	contained display
syn match	phpRelation	">=\="	contained display
if s:alt_comparisons
  syn keyword phpRelation instanceof contained containedin=phpRegion
endif

" identifier stuff
syn match phpMemberSelector /->/	contained display
syn match phpVarSelector	/\$/	contained display

syn cluster phpClConst add=phpUnknownSelector
syn match phpUnknownSelector /->\_s*{\@=/  contained display

" Identifier
syn match phpIdentifier /\$\h\w*/ contained display contains=phpEnvVar,phpIntVar,phpVarSelector
    \ nextgroup=phpIdentifierIndex

" match a dereference-identifier
syn cluster phpClInside add=phpIdentifierDeref
"syn match phpIdentifier /\$\$\h\w*/ contained display contains=phpVarSelectorDeref,phpDerefInvalid
"syn match phpVarSelectorDeref /\$\$/ contained display
"hi link phpVarSelectorDeref phpDefine
syn match phpIdentifierDeref /\$\$\h\w*/ contained display contains=phpVarSelector,phpDerefInvalid
hi link phpIdentifierDeref phpDefine

" variables you can't dereference
syn case match
syn keyword phpDerefInvalid contained this argc argv GLOBALS
      \ _GET _POST _REQUEST _COOKIE _SESSION _SERVER _ENV
syn case ignore
hi link phpDerefInvalid Error

"syn match	phpIdentifierSimply	"${\h\w*}"	contains=phpOperator,phpParent	contained display

" Peter Hodge:
" - changing this item to contain all PHP inside syntax, as it
"   is able to
syn region phpIdentifierComplex contained display matchgroup=phpSpecialChar start=/\${/ end=/}/
      \ keepend extend
      \ contains=@phpClInside
      \ nextgroup=phpIdentifierIndex

" create an identifier match for double-quoted strings:
syn match phpIdentifierInString "\$\h\w*" contained display
      \ nextgroup=phpIdentifierIndexInString,phpPropertyInString
      \ contains=phpEnvVar,phpIntVar,phpVarSelector containedin=@phpStringSubs
syn region phpIdentifierInStringComplex matchgroup=phpSpecialChar
      \ start=/{\ze\$/ start=/\${\ze\$/ end=/}/
      \ contained extend keepend
      \ contains=@phpClInside containedin=@phpStringSubs
hi link phpIdentifierInString phpIdentifier

syn region phpIdentifierInStringErratic matchgroup=phpSpecialChar
  \ start=/\${\ze\w/ end=/}/
  \ contained extend
  \ containedin=@phpStringSubs
hi link phpIdentifierInStringErratic phpIdentifier

" create a match for the identifier numeric indexes
" TODO: error if invalid characters inbetween?
syn match phpIdentifierIndexInString /\[.\{-}\]/ contained display
      \ contains=phpParent,phpIdentifierIndexInStringWrongCharsError
syn match phpIdentifierIndexInString /\[\]/ contained display
      \ contains=phpIdentifierIndexInStringNoMiddleError
syn match phpIdentifierIndexInString /\[\d\+\w.\{-}\]/ contained display
      \ contains=phpParent,phpIdentifierIndexInStringNonDigitError
syn match phpIdentifierIndexInStringNonDigitError /[^0-9]/ contained
syn match phpIdentifierIndexInStringWrongCharsError /[^a-zA-Z0-9_]/ contained
syn match phpIdentifierIndexInStringNoMiddleError /\[\]/ contained
hi link phpIdentifierIndexInStringWrongCharsError Error
hi link phpIdentifierIndexInStringNonDigitError Error
hi link phpIdentifierIndexInStringNoMiddleError Error
syn match phpIdentifierIndex /\[\d\+\]\|{\d\+}/ contained display extend
      \ contains=phpIdentifierIndexParens
syn match phpIdentifierIndexParens /[{}[\]]/ contained
hi link phpIdentifierIndexParens phpParent

syn match phpIdentifierIndexInString /\[\%(\d\+\|\h\w*\)\@>\]/ contained display
      \ contains=phpIdentifierIndexParens
hi link phpIdentifierIndexInString phpIdentifierIndex

" Methoden
" NOTE: have taken out phpMethods (because it just wasn't accurate)
" but have added phpSpecialMethods because they are always special
syn match phpMethodsVar /->\_s*\h\w*/ contained display contains=phpMemberSelector,@phpClMethodNames

" Peter Hodge - June 25, 2006
" - trying to fix support for things like
"   $foo->$bar
syn match phpMethodsVar /->\_s*\$\h\w*/ contained display contains=phpMemberSelector,phpIdentifier

" Include
syn keyword	phpInclude contained include require include_once require_once

" Peter Hodge - added 'clone' keyword here
" Define
syn keyword	phpObjectOperator contained new clone

" Peter Hodge - a separate keyword for null as its own value
syn keyword phpNull contained null

" Boolean
syn keyword	phpBoolean contained true false

" Number
syn match phpNumber	contained display /-\=\<\d\+\>/
syn match phpNumber	contained display /\<0x\x\{1,8}\>/

" Float
" Note: have split float into 3 matches which each have a fixed
" starting character
syn match phpFloat contained display /\.\d\+\>/
syn match phpFloat contained display /\<\d\+\.\d\+\>/
syn match phpFloat contained display /-\%(\<\d\+\)\=\.\d\+\>/

" SpecialChar
" TODO: these should be moved near strings and identifiers in strings, and
" should also be available in PCRE pattern strings
syn match phpSpecialChar contained display "\\[abcfnrtyv\\]"
syn match phpSpecialChar contained display "\\\o\{1,3}"
syn match phpSpecialChar contained display "\\x\x\x\="

" Error
syn match phpOctalError	/[89]/	contained display

" Todo
syn keyword	phpTodo	contained todo fixme xxx

" Comment
syn region	phpComment	start="/\*" end="\*/"	contained contains=phpTodo extend
if version >= 600
  syn match	phpComment	"#.\{-}\(?>\|$\)\@="	contained contains=phpTodo extend
  syn match	phpComment	"//.\{-}\(?>\|$\)\@="	contained contains=phpTodo extend
else
  syn match	phpComment	"#.\{-}$"         contained contains=phpTodo
  syn match	phpComment	"#.\{-}?>"me=e-2  contained contains=phpTodo
  syn match	phpComment	"//.\{-}$"        contained contains=phpTodo
  syn match	phpComment	"//.\{-}?>"me=e-2 contained contains=phpTodo
endif

" Peter Hodge - June 13, 2006
" - changed the matchgroup on these three regions from 'None'
"   to 'phpQuote<type>' so that they can be coloured individually
"   (which I have done below).

" Peter Hodge - July 20 2006
" - adding a cluster for strings which should have variable substitution
syn cluster phpStringSubs add=phpStringDouble,phpHereDoc,phpBacktick

" String
syn region phpStringDouble matchgroup=phpQuoteDouble start=/"/ skip=/\\./ end=/"/
      \ contained keepend extend contains=@phpAddStrings,phpSpecialChar
syn region phpBacktick      matchgroup=phpQuoteBacktick start=/`/ skip=/\\./ end=/`/
      \ contained keepend extend contains=@phpAddStrings,phpSpecialChar
syn region phpStringSingle  matchgroup=phpQuoteSingle start=/'/ skip=/\\./ end=/'/
      \ contained keepend extend contains=@phpAddStrings

" HereDoc
if version >= 600
  " Peter Hodge - July 20 2006
  " - removing contains=phpIdentifier stuff, these are now defined elsewhere
  "   and added in using contains=phpHereDoc
  syn case match
  syn region phpHereDoc keepend extend matchgroup=phpHereDocDelimiter
        \ end=/^\z1\%(;\=$\)\@=/ contained contains=phpSpecialChar
        \ start=/<<<\s*\z(\h\w*\)$/

" including HTML,JavaScript,SQL even if not enabled via options
  syn region phpHereDoc keepend extend matchgroup=phpHereDocDelimiter
        \ end=/^\z1\(;\=$\)\@=/ contained contains=@htmlTop,phpSpecialChar
        \ start=/\c<<<\s*\z(\%(\h\w*\)\=html\)$/

  syn region phpHereDoc keepend extend matchgroup=phpHereDocDelimiter
        \ end=/^\z1\(;\=$\)\@=/	contained contains=@sqlTop,phpSpecialChar
        \ start=/\c<<<\s*\z(\%(\h\w*\)\=sql\)$/

  syn region phpHereDoc keepend extend matchgroup=phpHereDocDelimiter
        \ end=/^\z1\(;\=$\)\@=/	contained contains=@htmlJavascript,phpSpecialChar
        \ start=/\c<<<\s*\z(\%(\h\w*\)\=javascript\)$/
  syn case ignore
endif

" a special match for when a semicolon is not allowed here
if s:no_empty_construct
  syn match phpSemicolonNotAllowedHere /;/ contained display
  hi link phpSemicolonNotAllowedHere Error
endif

" Parent
if s:strict_blocks
  " a block in global PHP scope
  syn cluster phpClTop add=phpBlockInGlobal
  if s:folding == 2
    syn region phpBlockInGlobal matchgroup=phpBlock start=/{/ end=/}/ keepend extend
          \ contained contains=@phpClTop
          \ fold
  else
    syn region phpBlockInGlobal matchgroup=phpBlock start=/{/ end=/}/ keepend extend
          \ contained contains=@phpClTop
  endif

  " a block inside a function
  syn cluster phpClInside add=phpBlockInFunc
  if s:folding == 2
    syn region phpBlockInFunc matchgroup=phpBlock start=/{/ end=/}/ keepend extend
          \ contained contains=@phpClTop
          \ fold
  else
    syn region phpBlockInFunc matchgroup=phpBlock start=/{/ end=/}/ keepend extend
          \ contained contains=@phpClTop
  endif

  " parenthesis for a foreach() block, not found automatically
  " (is triggered by a nextgroup=phpForeachRegion)
  " TODO: see if the 'dispay' option on these regions is dangerous
  if s:alt_arrays
    syn region phpForeachRegion matchgroup=phpParent start=/(/ end=/)/ keepend extend display
          \ contained contains=@phpClInside,phpArrayPair
          \ nextgroup=phpSemicolonNotAllowedHere skipwhite skipempty
  endif

  " parenthesis for a for() block, not found automatically
  " (is triggered by a nextgroup=phpForeachRegion)
  " TODO: see if the 'dispay' option on these regions is dangerous
  if s:alt_arrays
    syn region phpForRegion matchgroup=phpParent start=/(/ end=/)/ keepend extend display
          \ contained contains=@phpClInside
          \ nextgroup=phpSemicolonNotAllowedHere skipwhite skipempty
  endif

  " special parent regions for 'if/while' blocks so we can catch a semicolon
  " which shouldn't be at the end
  if s:no_empty_construct
    syn region phpConstructRegion matchgroup=phpParent start=/(/ end=/)/ keepend extend display
            \ contained contains=@phpClInside
            \ nextgroup=phpSemicolonNotAllowedHere skipwhite skipempty
  endif

  " match up ( and ), as well as [ and ]
  " TODO: see if the 'dispay' option on these regions is dangerous
  syn cluster phpClInside add=phpParentRegion
  syn region phpParentRegion contained contains=@phpClInside keepend extend display
        \ matchgroup=phpParent start=/(/ end=/)/
        \ matchgroup=Error end=/;/
  syn region phpParentRegion contained contains=@phpClInside keepend extend display
        \ matchgroup=phpParent start=/\[/ end=/\]/
        \ matchgroup=Error end=/;/

  " when a closing }, ) or ] is out of place ...
  if s:parent_error_close
    syn cluster phpClInside add=phpBlockError,phpParentError
    syn match phpBlockError  contained display /}/
    syn match phpParentError contained display /)/
    syn match phpParentError contained display /\]/
  endif

else
  syn match phpParent contained display /{/
  syn match phpParent contained display /}/
  syn match phpParent contained display /\[/
  syn match phpParent contained display /\]/
  syn match phpParent contained display /(/
  syn match phpParent contained display /)/
endif

syn cluster phpClConst add=phpNull,phpBoolean,phpNumber,phpFloat,phpMagicConstant,phpCoreConstant
syn cluster phpClConst add=phpStringSingle,phpStringDouble,phpBacktick,phpArray
syn cluster phpClConst add=phpIdentifier,phpIdentifierComplex,phpMethodsVar,phpOperator,phpRelation
syn cluster	phpClConst add=phpFunctions,phpKeyword,phpType,phpStructure
syn cluster phpClConst add=phpConditional,phpRepeat,phpStatement,phpException,phpBlock
syn cluster phpClConst add=phpObjectOperator

syn cluster	phpClInside add=@phpClConst,phpComment,phpLabel,phpParent,phpParentError,phpInclude,phpHereDoc
syn cluster	phpClInside add=phpStorageClass

syn cluster	phpClFunction add=@phpClInside,phpDefine,phpMacro
syn cluster phpClFunction add=phpParentError,phpStorageClass
syn cluster phpClFunction add=phpFoldTry,phpFoldCatch,phpStorageClass

syn cluster	phpClTop      add=@phpClFunction,phpFoldFunction,phpFoldClass,phpFoldInterface

" PHP Region
if s:long_tags
  syn region phpRegion matchgroup=phpRegionDelimiter start=/<?php/ end=/?>/
        \ keepend extend contains=@phpClTop
else
  syn region phpRegion matchgroup=phpRegionDelimiter start=/<?\(php\|=\)\=/ end=/?>/
        \ keepend extend contains=@phpClTop
endif

syn region phpRegionSc matchgroup=phpRegionDelimiter
      \ start=#<script language="php"># end=#</script>#
      \ contains=@phpClTop keepend extend

if s:asp_tags
  syn region phpRegionAsp matchgroup=phpRegionDelimiter start=/<%=\=/ end=/%>/
        \ keepend extend contains=@phpClTop
endif

if s:strict_blocks
  syn cluster phpClInside add=phpHTMLError
  syn match phpHTMLError /?>/ contained
endif

" if using strict blocks, need to look out for HTML inside
" blocks
if s:strict_blocks
  " only allow in base-level code (not inside () or [])
  syn cluster phpClFunction add=htmlRegion
  if s:long_tags
    " only match full php tags
    syn region htmlRegion contained contains=TOP matchgroup=phpRegionDelimiter
          \ start=/?>/ end=/<?php/ keepend extend
  else
    " match any php tags
    syn region htmlRegion contained contains=TOP matchgroup=phpRegionDelimiter
          \ start=/?>/ end=/<?\%(php\|=\)\=/ keepend extend
  endif

  if s:asp_tags
    syn region htmlRegion contained contains=TOP matchgroup=phpRegionDelimiter
          \ start=/%>/ end=/<%=\=/ keepend extend
  endif
endif

" if strict curly-braces matching is enabled, then match braces
" properly
if s:strict_blocks
  " DEFINITIONS FOR:
  "   function ...() {
  "   class ... {
  "     method ...() {
  " these need to be done piece-by-piece so that we can use 'nextgroups'
  " to match the { } code blocks - we want to use special colors for them!
  " {{{1

  " CLASSES: class myFoo extends baseFoo implements foo, Iterator { }: {{{2
  " I MATCH: <class myFoo> extends baseFoo implements foo, Iterator { }: {{{3
  
    " 1: Match the 'final' and 'abstract' keywords first
    syn keyword phpStructure contained abstract final

    " 2: match the start of the class declaration
    syn keyword phpStructure contained class
          \ nextgroup=phpDefineClassName skipwhite skipempty

    " 3: an empty placeholder for any class name (which in turn can contain
    " any of the known PHP class names)
    " NOTE: allow matching the class block immediately after the class name
    syn match phpDefineClassName /\h\w*/ contained contains=phpClasses,phpInterfaces
          \ nextgroup=@phpClDefineClassBlock
          \ skipwhite skipempty

  " II MATCH: class myFoo <extends baseFoo> implements foo, Iterator { }: {{{3

      " match the 'extends' keyword and follow it by the match
      " for class names in a declaration (as above)
      syn keyword phpStructure contained extends
            \ nextgroup=phpDefineClassName skipwhite skipempty

  " III MATCH: class myFoo extends baseFoo <implements foo, Iterator> { }: {{{3

      " 1: match the 'implements' keyword and follow it by the match
      " for class names in a declaration (as above)
      syn keyword phpStructure contained implements
            \ nextgroup=@phpClDefineClassImplements skipwhite skipempty

      " 2: define a place-holding for interfaces which matches any valid
      " interface name and also contains the recognized names
      syn cluster phpClDefineClassImplements add=phpDefineClassImplementsName
      syn match phpDefineClassImplementsName /\h\w*/ contained contains=phpClasses,phpInterfaces
            \ nextgroup=@phpClDefineClassImplements skipwhite skipempty

      " 3: allow a comma in the list
      syn cluster phpClDefineClassImplements add=phpDefineClassImplementsComma
      syn match phpDefineClassImplementsComma /,/ contained
            \ nextgroup=@phpClDefineClassImplements skipwhite skipempty

      " 4: there might be a '#' or '//'-style comment in-between!
      syn cluster phpClDefineClassImplements add=phpDefineClassImplementsCommentOneLine
      syn region phpDefineClassImplementsCommentOneLine
            \ start=/#/ start=,//, end=/$/ end=/.\ze?>/ oneline
            \ contained contains=phpComment
            \ nextgroup=@phpClDefineClassImplements skipwhite skipempty

      " 5: there might a C-style comment (/*...*/) in-between
      syn cluster phpClDefineClassImplements add=phpDefineClassImplementsCommentCStyle
      syn region phpDefineClassImplementsCommentCStyle start=,/\*, end=,\*/, keepend
            \ contained
            \ nextgroup=@phpClDefineClassImplements skipwhite skipempty
      hi link phpDefineClassImplementsCommentCStyle phpComment

      " 6: add the block to the list so it can match here also
      syn cluster phpClDefineClassImplements add=phpClassBlock

  " IV MATCH: class myFoo extends baseFoo implements foo, Iterator <{ }>: {{{3

    " 1: there might be a '#' or '//'-style comment in-between!
    syn cluster phpClDefineClassBlock add=phpDefineClassBlockCommentOneline
    syn region phpDefineClassBlockCommentOneline start=/#/ start=,//, end=/$/ end=/.\ze?>/ oneline
          \ contained contains=phpComment
          \ nextgroup=@phpClDefineClassBlock skipwhite skipempty

    " 2: there might a C-style comment (/*...*/) in-between
    syn cluster phpClDefineClassBlock add=phpDefineClassBlockCommentCStyle
    syn region phpDefineClassBlockCommentCStyle start=,/\*, end=,\*/, keepend
          \ contained
          \ nextgroup=@phpClDefineClassBlock skipwhite skipempty
    hi link phpDefineClassBlockCommentCStyle phpComment

    " 3: look for the actual { } block
    syn cluster phpClDefineClassBlock add=phpClassBlock
    if (s:folding == 1) || (s:folding == 2)
      syn region phpClassBlock matchgroup=phpBlockClass start=/{/ end=/}/ keepend extend
            \ contained contains=@phpClFunction
            \ matchgroup=phpHTMLError end=/?>/
            \ fold
    else
      syn region phpClassBlock matchgroup=phpBlockClass start=/{/ end=/}/ keepend extend
            \ contained contains=@phpClFunction
            \ matchgroup=phpHTMLError end=/?>/
    endif


  " }}}2

  " INTERFACES: interface myFoo extends baseFoo { }: {{{2
  " I MATCH: <interface myFoo> extends baseFoo { }: {{{3
  
    " 1: match the start of the interface declaration
    syn keyword phpStructure contained interface
          \ nextgroup=phpDefineInterfaceName skipwhite skipempty

    " 2: an empty placeholder for any interface name (which in turn can contain
    " any of the known PHP class names)
    " NOTE: allow matching the class block immediately after the class name
    " NOTE: maybe one day will make a separate block for interface bodies
    syn match phpDefineInterfaceName /\h\w*/ contained contains=phpClasses,phpInterfaces
          \ nextgroup=@phpClDefineClassBlock skipwhite skipempty

  " II MATCH: interface myFoo <extends baseFoo> { }: {{{3

    " NOTE: this is handled in the class syntax handling above

  " IV MATCH: class myFoo extends baseFoo implements foo, Iterator <{ }>: {{{3

    " NOTE: this is handled in the class syntax handling above

  " }}}2

  " FUNCTIONS: function & somefunc($a = 0, &$b) { }: {{{2
  " I MATCH: <function> somefunc($a = 0, &$b) { }: {{{3
  syn keyword	phpDefine function contained
        \ nextgroup=@phpClDefineFuncName,phpDefineFuncByRef
        \ skipwhite skipempty

  " II MATCH: function <&> somefunc($a = 0, &$b) { }: {{{3
  " second, there might be a '&' return-by-reference option, so add
  " a match for that.
  syn match phpDefineFuncByRef /&/ contained nextgroup=@phpClDefineFuncName skipwhite skipnl
  hi link phpDefineFuncByRef phpAssignByRef


  " III MATCH: function & <somefunc>($a = 0, &$b) { }: {{{3
  " what can go inside a function name? Anything that does will need
  " a 'nextgroup=phpDefineFuncProto' argument!

    " first up, an empty placeholder to match any valid function name.
    "     It should contain the special user-defineable function names.
    syn cluster phpClDefineFuncName add=phpDefineFuncName
    syn match phpDefineFuncName /\h\w*/ contained
          \ contains=phpFunctions,phpSpecialFunction
          \ nextgroup=phpDefineFuncProto
          \ skipwhite skipempty
    " TODO: allow adding comments between 'function' and 'someFunc'


  " IV MATCH: function & somefunc<(>$a = 0, &$b<)> { }: {{{3
  " match the parenthesis surrounding the function arguments
  syn region phpDefineFuncProto contained contains=@phpClDefineFuncProtoArgs
      \ matchgroup=phpParent start=/(/ end=/)/ keepend extend
      \ nextgroup=@phpClDefineFuncBlock
      \ skipwhite skipempty
  " TODO: allow comments in this cluster


  " V MATCH: function & somefunc(<stdClass> $a = 0, &$b) { }: {{{3
  " first: any valid class name
  syn cluster phpClDefineFuncProtoArgs add=phpClasses

  " VI MATCH: function & somefunc(stdClass <$a => 0, <&$b>) { }: {{{3

    " 1: match the by-ref '&'
    syn cluster phpClDefineFuncProtoArgs add=phpProtoArgByRef
    syn match phpProtoArgByRef /&/ contained
    hi link phpProtoArgByRef phpAssignByRef

    " 2: match a valid identifier
    " TODO: work out a way to get rid of the contains= part!!
    syn cluster phpClDefineFuncProtoArgs add=phpProtoIdentifier
    syn match phpProtoIdentifier /\$\h\w*/ contained
        \ contains=phpEnvVar,phpIntVar,phpVarSelector
        \ nextgroup=phpProtoAssign skipwhite
    hi link phpProtoIdentifier phpIdentifier

    " 3: match the '=' after the identifier
    syn match phpProtoAssign contained /=/
    hi link phpProtoAssign phpOperator

  " VII MATCH: function & somefunc(stdClass $a = <0>, &$b) { }: {{{3
  " What about other items? numbers? strings? arrays()?
  syn cluster phpClDefineFuncProtoArgs add=@phpClProtoValues

    " 1: simple types (null, boolean)
    syn cluster phpClProtoValues add=phpNull
    syn cluster phpClProtoValues add=phpBoolean

    " 2: numbers and strings
    syn cluster phpClProtoValues add=phpNumber,phpFloat
    syn cluster phpClProtoValues add=phpStringSingle,phpStringDouble

    " 3: arrays must be done separately to ensure ( and ) match correctly
    " (but only if using alt colors for arrays)
    if s:alt_arrays
      syn cluster phpClProtoValues add=phpProtoArray
      syn region phpProtoArray matchgroup=phpArrayParens start=/\<array(/ end=/)/ keepend extend
          \ contained contains=@phpClProtoValues,phpArrayPair

      " don't allow arbitrary parenthesis here!!
      syn cluster phpClProtoValues add=phpProtoParentError
      syn match phpProtoParentError /(/ contained
      hi link phpProtoParentError phpParentError
    else
      syn cluster phpClProtoValues add=phpArray

      " need to allow arbitrary parenthesis for arrays
      syn cluster phpClProtoValues add=phpParentRegion
    endif

    " 4: comments
    syn cluster phpClProtoValues add=phpComment


  " VIII MATCH: function & somefunc(</* foo */>) { }: {{{3
  " What about comment items?
  syn cluster phpClDefineFuncProtoArgs add=phpComment

  " IX MATCH: function & somefunc(stdclass $a = 0, &$b) <{ }>: {{{3

    " 1: there might be a '#' or '//'-style comment in-between!
    syn cluster phpClDefineFuncBlock add=phpDefineFuncBlockCommentOneline
    syn region phpDefineFuncBlockCommentOneline start=/#/ start=,//, end=/$/ end=/.\ze?>/ oneline
          \ contained contains=phpComment
          \ nextgroup=@phpClDefineFuncBlock skipwhite skipempty

    " 2: there might a C-style comment (/*...*/) in-between
    syn cluster phpClDefineFuncBlock add=phpDefineFuncBlockCommentCStyle
    syn region phpDefineFuncBlockCommentCStyle start=,/\*, end=,\*/, keepend
          \ contained
          \ nextgroup=@phpClDefineFuncBlock skipwhite skipempty
    hi link phpDefineFuncBlockCommentCStyle phpComment

    " 3: look for the actual { } block
    "    NOTE: how the function block will end at the next function
    "    declaration: this helps stop the region extending indefinitely,
    "    forcing the recalculation of all { } blocks for the rest of the file.
    "    Otherwise, inserting an open-brace will 
    "    NOTE: that the error can't happen on a 'final', 'abstract', 'class',
    "    or 'interface' keyword because they can't be contained in a function
    syn cluster phpClDefineFuncBlock add=phpFuncBlock
    if s:folding
      if s:nested_functions
        syn region phpFuncBlock keepend extend matchgroup=phpBlockFunc start=/{/ end=/}/
              \ matchgroup=Error end=/\%(^\|\s\)\%(public\|private\|protected\)\>/
              \ contained contains=@phpClFunction,phpBlockInFunc
              \ fold
      else
        syn region phpFuncBlock keepend extend matchgroup=phpBlockFunc start=/{/ end=/}/
              \ matchgroup=Error end=/\%(^\|\s\)function\>/
              \ matchgroup=Error end=/\%(^\|\s\)\%(public\|private\|protected\)\>/
              \ contained contains=@phpClFunction,phpBlockInFunc
              \ fold
      endif
    else
      if s:nested_functions
        syn region phpFuncBlock keepend extend matchgroup=phpBlockFunc start=/{/ end=/}/
              \ matchgroup=Error end=/\%(^\|\s\)\%(public\|private\|protected\)\>/
              \ contained contains=@phpClFunction,phpBlockInFunc
      else
        syn region phpFuncBlock keepend extend matchgroup=phpBlockFunc start=/{/ end=/}/
              \ matchgroup=Error end=/\%(^\|\s\)function\>/
              \ matchgroup=Error end=/\%(^\|\s\)\%(public\|private\|protected\)\>/
              \ contained contains=@phpClFunction,phpBlockInFunc
      endif
    endif

  " }}}2

  " METHODS: protected function & somefunc($a = 0, &$b) { }: {{{2
  " I MATCH: <protected function> somefunc($a = 0, &$b) { }: {{{3

    " 1: match the final / abstract / private keywords at start
    " TODO: rename 'phpStorageClass' to Typedef (for global and static keywords)
    " and rename 'phpStorageClass2' to 'phpStorageClass'
    syn keyword phpStorageClass2 contained private protected public static final abstract
          \ containedin=phpClassBlock
    hi link phpStorageClass2 phpStorageClass

    syn keyword phpDefineMethod function contained containedin=phpClassBlock
          \ nextgroup=@phpClDefineMethodName,phpDefineMethodByRef
          \ skipwhite skipempty
    " TODO: add phpDefineFunction in the proper place
    hi link phpDefineFunction phpDefine
    hi link phpDefineMethod phpDefineFunction

  " II MATCH: protected function <&> somefunc($a = 0, &$b) { }: {{{3
  " second, there might be a '&' return-by-reference option, so add
  " a match for that.
  syn match phpDefineMethodByRef /&/ contained
        \ nextgroup=@phpClDefineMethodName skipwhite skipnl
  hi link phpDefineMethodByRef phpDefineFuncByRef

  " III MATCH: protected function & <somefunc>($a = 0, &$b) { }: {{{3
  " what can go inside a method name? Anything that does will need
  " a 'nextgroup=phpDefineMethodProto' argument!

    " An empty placeholder to match any valid method name.
    " It should contain the special user-defineable method names.
    " NOTE: how we are just re-using 'function' block instead of
    " making more stuff to have a special 'method' block also.
    " I don't think it would be worthwhile at this stage.
    " NOTE: phpSpecialFunction must be included as well, because
    " that's a reserved function name and will break things.
    " TODO: cater for a new group, phpReservedFunction
    syn cluster phpClDefineMethodName add=phpDefineMethodName
    syn match phpDefineMethodName /\h\w*/ contained
          \ contains=phpSpecialFunction,@phpClMethodNames
          \ nextgroup=phpDefineFuncProto
          \ skipwhite skipempty
    " TODO: allow adding comments between 'function' and 'someFunc'

  " }}}2

  " EXCEPTIONS: try/catch { } {{{2
  
    " 1: match the start of a try block
    syn keyword phpException try contained nextgroup=@phpClTryBlock skipwhite skipnl

    " TODO: 2: allow having comments preceding the { } block?
  
    " 3: match the try block
    syn cluster phpClTryBlock add=phpTryBlock
    if s:folding == 2
      syn region phpTryBlock matchgroup=phpBlockTry start=/{/ end=/}/ keepend extend
            \ contained transparent
            \ fold
    else
      syn region phpTryBlock matchgroup=phpBlockTry start=/{/ end=/}/ keepend extend
            \ contained transparent
    endif

    " 3: match the start of the catch block
    syn keyword phpException catch contained nextgroup=phpCatchRegion skipwhite skipnl
    syn region phpCatchRegion matchgroup=phpParent start=/(/ end=/)/ keepend extend
          \ contained contains=@phpClInside
          \ nextgroup=@phpClCatchBlock skipwhite skipnl

    " TODO: 4: allow having comments preceding the { } block?

    " 5: match the catch block
    syn cluster phpClCatchBlock add=phpCatchBlock
    if s:folding == 2
      syn region phpCatchBlock matchgroup=phpBlockCatch start=/{/ end=/}/ keepend extend
            \ contained transparent
            \ fold
    else
      syn region phpCatchBlock matchgroup=phpBlockCatch start=/{/ end=/}/ keepend extend
            \ contained transparent
    endif

    " 6: the 'throw' keyword (not needed if using smart semicolons)
    if ! s:smart_semicolon
      syn keyword phpException contained throw
    endif

  " }}}2

  " }}}1

  " make sure 'static' and 'global' work inside a function block
  " TODO: refactor this?
  syn keyword phpStorageClass static global contained

  " set foldmethod if folding
  if s:folding
    set foldmethod=syntax
  endif
else
  " Fold
  if s:folding == 1 " {{{1
  " match one line constructs here and skip them at folding
    syn keyword	phpSCKeyword	abstract final private protected public static	contained
    syn keyword	phpFCKeyword	function	contained
    syn keyword	phpStorageClass	global	contained
    syn match	phpDefine	"\(\s\|^\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\(\s\+.*[;}]\)\@="	contained contains=phpSCKeyword
    syn match	phpStructure	"\(\s\|^\)\(abstract\s\+\|final\s\+\)*class\(\s\+.*}\)\@="	contained
    syn match	phpStructure	"\(\s\|^\)interface\(\s\+.*}\)\@="	contained
    syn match	phpException	"\(\s\|^\)try\(\s\+.*}\)\@="	contained
    syn match	phpException	"\(\s\|^\)catch\(\s\+.*}\)\@="	contained

    set foldmethod=syntax
    syn region	phpFoldHtmlInside	matchgroup=phpRegionDelimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
    syn region	phpFoldFunction	matchgroup=Storageclass start="^\z(\s*\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\s\([^};]*$\)\@="rs=e-9 matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldHtmlInside,phpFCKeyword contained transparent fold extend
    syn region	phpFoldFunction	matchgroup=Define start="^function\s\([^};]*$\)\@=" matchgroup=Delimiter end="^}" contains=@phpClFunction,phpFoldHtmlInside contained transparent fold extend
    syn region	phpFoldClass	matchgroup=Structure start="^\z(\s*\)\(abstract\s\+\|final\s\+\)*class\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction,phpSCKeyword contained transparent fold extend
    syn region	phpFoldInterface	matchgroup=Structure start="^\z(\s*\)interface\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
    syn region	phpFoldCatch	matchgroup=Exception start="^\z(\s*\)catch\%([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
    syn region	phpFoldTry	matchgroup=Exception start="^\z(\s*\)try\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend

  elseif s:folding == 2 " {{{1
    syn keyword	phpDefine	function	contained
    syn keyword	phpStructure	abstract class interface	contained
    syn keyword	phpException	catch throw try	contained
    syn keyword	phpStorageClass	final global private protected public static	contained

    set foldmethod=syntax
    syn region	phpFoldHtmlInside	matchgroup=phpRegionDelimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
    syn region	phpParent	matchgroup=Delimiter start="{" end="}" keepend extend contained contains=@phpClFunction,phpFoldHtmlInside transparent fold

  elseif s:folding == 3 " {{{1
    " match one line constructs here and skip them at folding
    syn keyword	phpSCKeyword	abstract final private protected public static	contained
    syn keyword	phpFCKeyword	function	contained
    syn keyword	phpStorageClass	global static contained
    syn keyword	phpException	catch throw try	contained

    syn match	phpDefine	"\(\s\|^\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\(\s\+.*[;}]\)\@="	contained contains=phpSCKeyword
    syn match	phpStructure	"\(\s\|^\)\(abstract\s\+\|final\s\+\)*class\(\s\+.*}\)\@="	contained
    syn match	phpStructure	"\(\s\|^\)interface\(\s\+.*}\)\@="	contained
    syn match	phpException	"\(\s\|^\)try\(\s\+.*}\)\@="	contained
    syn match	phpException	"\(\s\|^\)catch\(\s\+.*}\)\@="	contained

    " fold these:
    set foldmethod=syntax
    syn region	phpFoldFunction	matchgroup=Storageclass start="^\z(\s*\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\s\([^};]*$\)\@="rs=e-9 matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldHtmlInside,phpFCKeyword contained transparent fold extend
    syn region	phpFoldFunction	matchgroup=Define start="^function\s\([^};]*$\)\@=" matchgroup=Delimiter end="^}" contains=@phpClFunction,phpFoldHtmlInside contained transparent fold extend

    " don't fold these:
    syn region	phpFoldHtmlInside	matchgroup=phpRegionDelimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
    syn region	phpFoldClass	matchgroup=Structure start="^\z(\s*\)\(abstract\s\+\|final\s\+\)*class\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction,phpSCKeyword contained transparent extend
    syn region	phpFoldInterface	matchgroup=Structure start="^\z(\s*\)interface\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent extend
    syn region	phpFoldCatch	matchgroup=Exception start="^\z(\s*\)catch\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent extend
    syn region	phpFoldTry	matchgroup=Exception start="^\z(\s*\)try\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent extend

  else " {{{1
    syn keyword	phpDefine       contained function
    syn keyword	phpStructure	contained abstract class interface
    syn keyword	phpException	contained catch throw try
    syn keyword	phpStorageClass	contained final global private protected public static
  endif " }}} 1

  " always need these
  syn keyword phpStructure contained extends implements
endif

" ================================================================
" Peter Hodge - June 9, 2006
" Some of these changes (highlighting isset/unset/echo etc) are not so
" critical, but they make things more colourful. :-)

" corrected highlighting for an escaped '\$' inside a double-quoted string
syn match phpSpecialChar /\\\$/ contained display

" Peter Hodge - June 17 2006:
" - match \" as a specialchar inside a double-quoted string,
" - OR, match \' inside a single-quoted string
" TODO: \" should not be a specialchar inside HereDoc strings
syn match phpStringSpecialChar /\\["\\]/ contained containedin=@phpStringSubs display
syn match phpStringSpecialChar /\\['\\]/ contained containedin=phpStringSingle display
hi link phpStringSpecialChar phpSpecialChar

" Peter Hodge - August 22 2006:
" - match \{ as regular string content so that it stops \{$var} from
"   highlighting the { }
syn match phpStringRegular /\\{/ contained containedin=@phpStringSubs
hi link phpStringRegular String

" highlight incorrect use of -> as an error
syn cluster phpClConst add=phpMemberError
syn match phpMemberError /->\%(\_s*\)\@>[a-z{_$]\@!/ contained

" different syntax highlighting for 'echo', 'print', 'switch', 'die' and 'list' keywords
" to better indicate what they are.
syn keyword phpMacro echo print contained
"syn keyword phpType list contained

" Highlighting for PHP5's user-definable magic class methods
syn cluster phpClMethodNames add=phpSpecialMethods
syn keyword phpSpecialMethods contained containedin=phpRegion
    \ __construct __destruct __sleep __wakeup __clone __set_state __toString
    \ __set __get __unset __isset __call

" Highlighting for __autoload slightly different from line above
" TODO: need to remove this from here!!!
syn cluster phpClMethodNames add=phpSpecialFunction
syn keyword phpSpecialFunction contained containedin=@phpClFunction,phpRegion
	\ __autoload

" Highlighting for PHP5's built-in classes
" - built-in classes harvested from get_declared_classes() in 5.1.4
syn cluster phpClConst add=phpClasses
syn keyword phpClasses contained containedin=phpRegion
	\ stdClass __PHP_Incomplete_Class php_user_filter Directory ArrayObject
	\ Exception ErrorException LogicException BadFunctionCallException BadMethodCallException DomainException
	\ RecursiveIteratorIterator IteratorIterator FilterIterator RecursiveFilterIterator ParentIterator LimitIterator
	\ CachingIterator RecursiveCachingIterator NoRewindIterator AppendIterator InfiniteIterator EmptyIterator
	\ ArrayIterator RecursiveArrayIterator DirectoryIterator RecursiveDirectoryIterator
	\ InvalidArgumentException LengthException OutOfRangeException RuntimeException OutOfBoundsException
	\ OverflowException RangeException UnderflowException UnexpectedValueException
	\ PDO PDOException PDOStatement PDORow
	\ Reflection ReflectionFunction ReflectionParameter ReflectionMethod ReflectionClass
	\ ReflectionObject ReflectionProperty ReflectionExtension ReflectionException
	\ SplFileInfo SplFileObject SplTempFileObject SplObjectStorage
	\ XMLWriter LibXMLError XMLReader SimpleXMLElement SimpleXMLIterator
	\ DOMException DOMStringList DOMNameList DOMDomError DOMErrorHandler
	\ DOMImplementation DOMImplementationList DOMImplementationSource
	\ DOMNode DOMNameSpaceNode DOMDocumentFragment DOMDocument DOMNodeList DOMNamedNodeMap
	\ DOMCharacterData DOMAttr DOMElement DOMText DOMComment DOMTypeinfo DOMUserDataHandler
	\ DOMLocator DOMConfiguration DOMCdataSection DOMDocumentType DOMNotation DOMEntity
	\ DOMEntityReference DOMProcessingInstruction DOMStringExtend DOMXPath

" Highlighting for PHP5's built-in interfaces
" - built-in classes harvested from get_declared_interfaces() in 5.1.4
syn cluster phpClConst add=phpInterfaces
syn keyword phpInterfaces contained
	\ Iterator IteratorAggregate RecursiveIterator OuterIterator SeekableIterator
	\ Traversable ArrayAccess Serializable Countable SplObserver SplSubject Reflector
"
" add php_errormsg as a special variable
syn keyword	phpIntVar	contained php_errormsg

if s:show_semicolon
  " highlight the semicolon same colour as 'echo'
  syn cluster phpClConst add=phpSemicolon
  syn match phpSemicolon /;/ contained display

  " look for errors with a semicolon
  syn match phpSemicolonError contained display extend
        \ ";\%(\%(\_s*\%(//.*$\|#.*$\|/\*\_.\{-}\*/\)\@>\)*\)\@>\_s*\%([.*/\^|&,:!=<>]\|?>\@!\|++\@!\|--\@!\)"
        \ containedin=phpSemicolon
  hi link phpSemicolonError Error

  " need to sync back one line to capture the semicolon error properly
  syn sync linebreaks=1
endif

" re-write return/break/continue/exit/die statements.
if s:smart_semicolon
  syn cluster phpClFunction add=phpStatementRegion
  " with or without error on mis-matched /})]/ at end?
  " TODO: can we make the semi-colon end-error any shorter?
  if s:strict_blocks
    syn region phpStatementRegion extend keepend transparent contained
          \ matchgroup=phpStatement end=/;/
          \ start=/\$\@<!\<return\>/
          \ start=/\$\@<!\<break\>/
          \ start=/\$\@<!\<continue\>/
          \ start=/\$\@<!\<exit\>/
          \ start=/\$\@<!\<die\>/
          \ start=/\$\@<!\<throw\>/
          \ matchgroup=Error end=/}/ end=/)/ end=/\]/
          \ matchgroup=Error end=/;\_s*\%([.*\^|&,:!=<>]\|?>\@!\|\/[/*]\@!\|++\@!\|--\@!\)/
  else
    syn region phpStatementRegion extend keepend transparent contained
          \ matchgroup=phpStatement end=/;/
          \ start=/\$\@<!\<return\>/
          \ start=/\$\@<!\<break\>/
          \ start=/\$\@<!\<continue\>/
          \ start=/\$\@<!\<exit\>/
          \ start=/\$\@<!\<die\>/
  endif
endif

syn cluster phpClInside add=phpProperty
syn match phpProperty /->\s*\%(\$\=\h\w*\)\@>(\@!/ contained contains=phpPropertySelector,phpIdentifier
      \ nextgroup=phpIdentifierIndex skipwhite
syn match phpPropertySelector /->/ contained

" for going in string where can be followed by () without making it a method
" call
syn match phpPropertyInString /->\h\w*/ contained contains=phpPropertySelectorInString
syn match phpPropertySelectorInString /->/ contained
hi link phpPropertySelectorInString phpPropertySelector

if s:special_functions
  " Highlighting for PHP built-in functions which exhibit special behaviours
  " - isset()/unset()/empty() are not real functions.
  " - compact()/extract() directly manipulate variables in the local scope where
  "   regular functions would not be able to.
  " - eval() is the token 'make_your_code_twice_as_complex()' function for PHP.
  " - user_error()/trigger_error() can be overloaded by set_error_handler and also
  "   have the capacity to terminate your script when type is E_USER_ERROR.
  syn cluster phpClConst add=phpSpecialFunction
  syn keyword phpSpecialFunction contained containedin=phpRegion
        \ user_error trigger_error isset unset empty eval extract compact
endif

" special highlighting for '=&' operator
syn cluster phpClInside add=phpAssignByRef
syn match phpAssignByRef /=\s*&/ contained display

" highlighting for the '@' error-supressing operator
syn match phpSupressErrors /@/ contained display
syn cluster phpClConst add=phpSupressErrors

" ================================================================

" Sync
if php_sync_method == -1
  if s:long_tags
    syn sync match phpRegionSync grouphere phpRegion "^\s*<?php\s*$"
  else
    syn sync match phpRegionSync grouphere phpRegion "^\s*<?\(php\)\=\s*$"
  endif
  syn sync match phpRegionSync grouphere phpRegionSc +^\s*<script language="php">\s*$+
  if s:asp_tags
    syn sync match phpRegionSync grouphere phpRegionAsp "^\s*<%\(=\)\=\s*$"
  endif
  syn sync match phpRegionSync grouphere NONE "^\s*?>\s*$"
  syn sync match phpRegionSync grouphere NONE "^\s*%>\s*$"
  syn sync match phpRegionSync grouphere phpRegion "function\s.*(.*\$"
  "syn sync match phpRegionSync grouphere NONE "/\i*>\s*$"
elseif php_sync_method > 0
  exec "syn sync minlines=" . php_sync_method
else
  syn sync fromstart
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_php_syn_inits")
  if version < 508
    let did_php_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    "command -nargs=+ HiLink hi def link <args>
    command -nargs=+ HiLink hi link <args>
  endif

  " Peter Hodge, June 17 2006
  " - I'm optimizing these highlight links for the default
  "   colorscheme, or 'elflord' when it would make a major
  "   difference.
  "   After most HiLinks I have noted which color the group
  "   will revert back to under default or elflord.

  " TODO: remove this testing
  if exists('g:colors_name') && g:colors_name == 'elflord'
    let s:is_elflord = 1
  else
    let s:is_elflord = 0
  endif

  if exists("php_oldStyle")
    hi phpOperator guifg=SeaGreen ctermfg=DarkGreen
    hi phpIdentifier guifg=DarkGray ctermfg=Brown
"   hi phpIdentifierSimply guifg=DarkGray ctermfg=Brown
    hi phpVarSelector guifg=SeaGreen ctermfg=DarkGreen

    hi phpRelation guifg=SeaGreen ctermfg=DarkGreen

    hi phpIntVar guifg=Red ctermfg=DarkRed
    hi phpEnvVar guifg=Red ctermfg=DarkRed
  else
    HiLink phpOperator          Operator    " => Statement(Yellow) / Operator(Red)
    HiLink phpIdentifier        Identifier  " => Identifier(Cyan)
"   HiLink phpIdentifierSimply	phpIdentifier
    HiLink phpVarSelector       Operator         " => Statement (yellow)

    HiLink phpArray             phpType
    if s:alt_arrays
      HiLink phpArrayParens phpArray
      HiLink phpArrayPair phpArray

      " highlight the comma as well?
      if s:alt_arrays == 2
        HiLink phpArrayComma phpArrayParens
      endif
    else
      HiLink phpArrayParens phpParent
      HiLink phpArrayPair phpOperator
    endif

    if s:alt_comparisons
      if s:is_elflord
        HiLink phpRelation	Statement " => Yellow
      else
        HiLink phpRelation	Constant  " => Constant (SlateBlue)
      endif
    else
      HiLink phpRelation     phpOperator
    endif

    " special variables support:
    if s:superglobals
      HiLink phpIntVar      Tag         " => Special (orange/red)
      HiLink phpEnvVar      Tag         " => Special (ornage/red)
    else
      HiLink phpIntVar      phpIdentifier
      HiLink phpEnvVar      phpIdentifier
    endif
  endif

  " language:
  HiLink phpComment       Comment       " Slateblue

  HiLink phpSemicolon      Macro        " => PreProc (LightMagenta)
  HiLink phpDefine         Define       " => PreProc (LightMagenta)
  HiLink phpMacro          Macro        " => PreProc (LightMagenta)
  HiLink phpObjectOperator phpMacro
  HiLink phpInclude        Include      " => PreProc (LightMagenta)

  HiLink phpParent        Delimiter     " => Special (Red)
  HiLink phpBlock         phpParent     " => Special (Red)
  HiLink phpBlockError    Error         " => Error

  if s:alt_blocks
    HiLink phpBlockFunc     phpDefine
    HiLink phpBlockClass    phpStructure
    HiLink phpBlockMethod   phpDefine
    HiLink phpBlockTry      phpException
    HiLink phpBlockCatch    phpException
  else
    HiLink phpBlockFunc     phpBlock
    HiLink phpBlockClass    phpBlock
    HiLink phpBlockMethod   phpBlock
    HiLink phpBlockTry      phpBlock
    HiLink phpBlockCatch    phpBlock
  endif

  HiLink phpType          Type          " Green

  " other operations
  HiLink phpSupressErrors     PreProc   " LightMagenta

  if s:alt_refs
    HiLink phpAssignByRef     Type      " Green
  else
    HiLink phpAssignByRef     Operator  " Red
  endif

  HiLink phpMemberSelector    Structure " => Type (Green)
  if s:alt_properties
    HiLink phpPropertySelector  Function  " => Identifier (Cyan) / (White)
    HiLink phpUnknownSelector   Operator  " => Operator (Red) / (White)
  else
    HiLink phpPropertySelector  phpMemberSelector
    HiLink phpUnknownSelector   phpMemberSelector
  endif


  " execution control structures
  HiLink phpConditional   Conditional   " => Statement (Yellow) / Repeat (White)
  HiLink phpRepeat        Repeat        " => Statement (Yellow) / Repeat (White)
  HiLink phpStatement     Statement     " (Yellow / Brown)
  HiLink phpLabel         Label         " => Statement (Yellow / Brown)
  HiLink phpException     Exception     " => Statement (Yellow)

  " constants
  HiLink phpMagicConstant Constant      " Pink / Magenta
  HiLink phpCoreConstant  Constant      " Pink / Magenta
  HiLink phpNumber        Number        " => Constant (Pink)
  HiLink phpFloat         Float         " => Constant (Pink)
  HiLink phpBoolean       phpType
  HiLink phpNull          phpType
  HiLink phpStringSingle  String        " => Constant (Pink)
  HiLink phpStringDouble  String        " => Constant (Pink)
  HiLink phpBacktick      String        " => Constant (Pink)
  HiLink phpSpecialChar   SpecialChar   " => Special (Orange / Red)

  " keywords (mainly class / function definitions)
  HiLink phpStorageClass  StorageClass  " => Type (Green)
  HiLink phpSCKeyword     phpStorageClass
  HiLink phpStructure     Structure     " => Type (Green)
  HiLink phpFCKeyword     phpDefine
  HiLink phpKeyword       phpDefine

  if s:show_quotes
    HiLink phpQuoteSingle   String
    HiLink phpQuoteDouble   String
  else
    HiLink phpQuoteSingle   Normal
    HiLink phpQuoteDouble   Normal
  endif

  " always highlight backtick quotes like an operator
  " (seeing as it executes stuff)
  HiLink phpQuoteBacktick phpOperator

  " built-in langauge functions / classes
  HiLink phpFunctions       Function        " => Identifier (Cyan) / Function (White)
  HiLink phpClasses         phpFunctions
  HiLink phpMethods         phpFunctions
  HiLink phpInterfaces      phpCoreConstant
  HiLink phpSpecialFunction SpecialComment  " => Special (Orange / Red)
  HiLink phpSpecialMethods  phpSpecialFunction

  " other items
  HiLink phpMemberError     Error
  HiLink phpParentError     Error
  HiLink phpHTMLError       Error
  HiLink phpOctalError      Error
  HiLink phpTodo            Todo
  HiLink phpIdentifierIndex phpFunctions

  " Peter Hodge June 17, 2006:
  " changed matchgroup for phpRegion from Delimiter to phpRegionDelimiter
  HiLink phpRegionDelimiter   Debug               " => Special (Orange / Red)

  " changed matchgroup for phpHereDoc to phpHereDocDelimiter
  HiLink phpHereDocDelimiter  phpRegionDelimiter  " => Special (Orange / Red)

  delcommand HiLink
endif

" optional support for PCRE extension (preg_* functions)
if s:show_pcre
    " ===================================================
    " Note: I have deliberately neglected to support the '\cx' functionality
    "       - it would do more harm than good by complicating this already-
    "       mind-numbing syntax file when nobody really needs this feature in
    "       PHP.
    " TODO: add support for '\cx' sequences

    " 1) Allow for dropping out of SQ and concatenating a variable {{{

      " flag a lone quote as an error!
      syn match pregError /'/ contained containedin=pregPattern_S
      syn match pregError /"/ contained containedin=pregPattern_D

      " find real concatenations (overrides the errors)
      syn region pregConcat matchgroup=phpQuoteSingle start=/'\ze\_s*\./ end=/'/
        \ skip=/\['.\{-}'\]\|('.\{-}'[,)]/
        \ keepend extend
        \ contained containedin=pregPattern_S
        \ contains=@phpClInside
      syn region pregConcat matchgroup=phpQuoteDouble start=/"/ end=/"/
        \ skip=/\[".\{-}"\]\|(".\{-}"[,)]/
        \ keepend extend
        \ contained containedin=pregPattern_D
        \ contains=@phpClInside
    " }}}

    " 2) look for special characters {{{

      " TODO: re-examine how \$ is going to fit into a double-quoted string ...
      syn match pregSpecial /\$/ contained containedin=pregPattern_S display
      syn match pregSpecial /\$/ contained containedin=pregPattern_D display
        \ contains=phpIdentifierInString,phpIdentifierInStringComplex
      syn match pregSpecial /\^/ contained containedin=@pregPattern_Q display
      syn match pregSpecial /|/  contained containedin=@pregPattern_Q display
      syn match pregDot     /\./ contained containedin=@pregPattern_Q display

      " TODO: move these things out of here???
      " find a ] character at the start of a character range ...
      syn match pregClassIncStartBracket /\]/ contained display containedin=@pregClassIncStart_Q
      syn match pregClassExcStartBracket /\]/ contained display containedin=@pregClassExcStart_Q
      hi link pregClassIncStartBracket pregClassInc
      hi link pregClassExcStartBracket pregClassExc
    " }}}

    " 3) look for escape sequences {{{

      " look for any escape sequence inside the pattern and mark them as errors
      " by default, all escape sequences are errors
      syn match pregEscapeUnknown /\\./ contained containedin=@pregPattern_Q display

      " TODO: when \$ is encountered, the \ is a PHP escape and prevents
      " variable expansion, but the '$' becomes the end-of-line wildcard.
      " \\$ will match a literal '$', but the '$' might be part of a variable
      " name also. \\\$ is the proper way to match

      " TODO: deprecate these clusters?
      " TODO: deprecate pregClass_any
      syn cluster pregClass_any add=@pregClassInc,pregClassExc
      syn cluster pregClassRange_any_S add=pregClassIncRange_S,pregClassExcRange_S
      syn cluster pregClassRange_any_D add=pregClassIncRange_D,pregClassExcRange_D

      syn match pregClassEscapeUnknown /\\[^\^\-\]]/ contained containedin=@pregClass_any_Q display
      syn match pregClassEscape /\\[^a-zA-Z0-9]/ contained containedin=@pregClass_any_Q display

      " known escape sequences:
      syn match pregClassIncEscapeKnown /\C\\[abtnfret]/ contained display
            \ containedin=@pregClassInc_Q,@pregClassIncRange_Q
      syn match pregClassIncEscapeRange /\\[dsw]/ contained display
            \ containedin=@pregClassInc_Q,@pregClassIncRange_Q
      syn match pregClassExcEscapeKnown /\C\\[abtnfret]/ contained display
            \ containedin=@pregClassExc_Q,@pregClassExcRange_Q
      syn match pregClassExcEscapeRange /\\[dsw]/ contained display
            \ containedin=@pregClassExc_Q,@pregClassExcRange_Q

      " ... including hex sequences
      syn match pregClassIncEscapeKnown /\C\\x\x\{0,2}/ contained display
        \ containedin=@pregClassInc_Q,@pregClassIncRange_Q
      syn match pregClassExcEscapeKnown /\C\\x\x\{0,2}/ contained display
        \ containedin=@pregClassExc_Q,@pregClassExcRange_Q

      " ... and octal sequences
      syn match pregClassIncEscapeKnown /\\\o\{1,3}/ contained display
        \ containedin=@pregClassInc_Q,@pregClassIncRange_Q
      syn match pregClassExcEscapeKnown /\\\o\{1,3}/ contained display
        \ containedin=@pregClassExc_Q,@pregClassExcRange_Q

      syn match pregClassEscapeMainQuote /\\'/ contained transparent display contains=pregEscapePHP 
        \ containedin=@pregClass_any_S,@pregClassRange_any_S
      syn match pregClassEscapeMainQuote /\\"/ contained transparent display contains=pregEscapePHP 
        \ containedin=@pregClass_any_D,@pregClassRange_any_D

      syn match pregClassEscape /\\\\\ze\\'/ contained display
        \ containedin=@pregClass_any_S contains=pregEscapePHP
        \ nextgroup=pregClassEscapeMainQuote
      syn match pregClassEscape /\\\\\ze\\"/ contained display
        \ containedin=@pregClass_any_D contains=pregEscapePHP
        \ nextgroup=pregClassEscapeMainQuote

      syn match pregClassEscapeDouble1 /\\\\\ze\\\\/ contained containedin=@pregClass_any_Q display
        \ contains=pregEscapePHP
        \ nextgroup=pregClassEscapeDouble2
      syn match pregClassEscapeDouble2 /\\\\/ contained transparent display
        \ containedin=@pregClassRange_any_S,@pregClassRange_any_D
        \ contains=pregEscapePHP
      hi link pregClassEscapeDouble1 pregClassEscape

      " in the unknown escapes, match those that make a special character
      " take on its literal meaning (except for <single-quote> which is covered next)
      " NOTE: am changing these from being contained inside pregEscapeUnknown
      " to being in the main scope to make SQ and DQ containment easier
      syn match pregEscapeLiteral /\\[^A-Za-z0-9]/ contained containedin=@pregPattern_Q display
      syn match pregEscapeLiteral /\\\{4}/ contained containedin=@pregPattern_Q display

      " for single-quoted strings
      syn match pregEscapeLiteral /\\"/ contained containedin=pregPattern_S display
      syn match pregEscapeLiteral /\\\\\\'/ contained containedin=pregPattern_S display contains=pregEscapePHP

      " for double-quoted strings
      syn match pregEscapeLiteral /\\'/ contained containedin=pregPattern_D display
      syn match pregEscapeLiteral /\\\\\\"/ contained containedin=pregPattern_D display contains=pregEscapePHP

      syn match pregEscapeMainQuote /\\'/ contained containedin=pregPattern_S display
      syn match pregEscapeMainQuote /\\"/ contained containedin=pregPattern_D display

      " match the escaped strings which are known
      syn match pregBackreference /\\[1-9][0-9]\=/ contained containedin=pregEscapeUnknown display
      syn match pregEscapeSpecial /\C\\[rnt]/ contained containedin=pregEscapeUnknown display
      syn match pregEscapeSpecial /\C\\x\x\{0,2}/ contained containedin=pregEscapeUnknown display
      syn match pregEscapeSpecial /\\\%(0\o\{0,2}\|\o\o\o\)/ contained containedin=pregEscapeUnknown display
      syn match pregEscapeRange   /\\[wsd]/ contained containedin=pregEscapeUnknown display
      syn match pregEscapeAnchor  /\C\\[AbBGzZ]/ contained containedin=pregEscapeUnknown display

      " unicode characters
      syn match pregEscapeUnicode /\C\\X/ contained containedin=pregEscapeUnknown display
      syn match pregEscapeUnicodeError /\c\\p{\^\=\w\+}/ contained display
            \ containedin=pregEscapeUnknown,pregClassEscapeUnknown
      syn match pregEscapeUnicode /\\p{^\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CC[cfnos]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CL[lmotu]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CM[cen]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CN[dlo]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CP[cdefios]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CS[ckmo]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /\CZ[lps]\=/ contained containedin=pregEscapeUnicodeError display
      syn match pregEscapeUnicode /}/ contained containedin=pregEscapeUnicodeError display
      " shorthand
      syn match pregEscapeUnicode /\C\\[pP][CLMNPSZ]/ contained display
            \ containedin=pregEscapeUnknown,pregClassEscapeUnknown

      " match the PHP escaping in literal escapes
      syn match pregEscapePHP /\\./he=s+1 contained display containedin=pregEscapeMainQuote
      syn match pregEscapePHP /\\\\/he=s+1 contained display containedin=pregEscapeLiteral

      " this captures confusing usage of escape characters:
      " - need to make sure they don't capture the quote character because
      "   that wouldn't right
      syn match pregEscapeNotNeeded /\\\ze\\[^\\']/ contained display containedin=pregPattern_S,@pregClass_any_S
      syn match pregEscapeNotNeeded /\\\ze\\[^\\"]/ contained display containedin=pregPattern_D,@pregClass_any_D

      " a triple-backslash can be dangerous: it is not obvious that
      " the meaning of the 3rd backslash is dependent on the following
      " character; if the following character is changed to a
      " single-quote or backslash, it will change the meaning of the 3
      " backslashes
      syn match pregEscapeLiteral /\\\{3}\ze[^\\']/ contained display containedin=pregPattern_S
      syn match pregEscapeLiteral /\\\{3}\ze[^\\"]/ contained display containedin=pregPattern_D
      syn match pregClassEscape /\\\{3}\ze[^\\']/ contained display contains=pregClassEscapePHP containedin=@pregClass_any_S
      syn match pregClassEscape /\\\{3}\ze[^\\"]/ contained display contains=pregClassEscapePHP containedin=@pregClass_any_D
      syn match pregClassEscapePHP /\\\\/he=s+1 contained
      hi link pregClassEscapePHP  pregEscapePHP
    " }}}

    " 4) Look for quantifiers ?*+{1,2} {{{

      syn match pregQuantifier /\*?\=/ contained containedin=@pregPattern_Q display
      syn match pregQuantifier /+?\=/  contained containedin=@pregPattern_Q display
      syn match pregQuantifier /??\=/  contained containedin=@pregPattern_Q display

      syn match pregQuantifierComplex /{\d*\(,\d*\)\?}/ contained containedin=@pregPattern_Q display
      syn match pregQuantifier /\d\+/ contained containedin=pregQuantifierComplex display
    " }}}

    " 5) Look for sub-patterns {{{
      syn match pregParens /(/ contained containedin=@pregPattern_Q display
      syn match pregParens /(?<[=!]/ contained containedin=@pregPattern_Q display extend
      syn match pregParens /(?[:>=!]/ contained containedin=@pregPattern_Q display extend
      syn match pregParens /(?(?<\=[=!]/ contained containedin=@pregPattern_Q display extend

      " recursion
      syn match pregParens /(?R)/ contained containedin=@pregPattern_Q display extend
      syn match pregParens /(?[1-9]\d\=)/ contained containedin=@pregPattern_Q display extend
            \ contains=pregBackreferenceNumber

      " conditional sub-patterns
      syn match pregParens /(?(\d\+)/ contained containedin=@pregPattern_Q display
            \ contains=pregBackreferenceNumber
      syn match pregBackreferenceNumber /\d\+/ contained display
      " TODO: move hi link out of here?
      hi link pregBackreferenceNumber pregBackreference
      syn match pregParens /(?\a\+\(-\a\+\)\=[):]/ contained containedin=@pregPattern_Q display
        \ contains=pregOption
      syn match pregParens /(?-\a\+[):]/ contained containedin=@pregPattern_Q display
        \ contains=pregOption
      syn match pregParens /)/ contained containedin=@pregPattern_Q display

      " find a named backreference
      syn match pregBackreference contained containedin=@pregPattern_Q /(?P>\w\+)/
            \ contains=pregNamedBackreference
      syn match pregParens contained containedin=@pregPattern_Q /(?P<\w\+>/
            \ contains=pregNamedBackreference

      syn match pregNamedBackreference /(?P>\zs\w\+\ze)/ contained
      syn match pregNamedBackreference /(?P<\zs\w\+\ze>/ contained
      hi link pregNamedBackreference pregEscapeRange
    " }}}

    " 6) Look for PCRE patterns {{{
      syn cluster phpClInside add=phpPREGFunctions

      " look for preg_* functions which take a single pattern
      syn keyword phpPREGFunctions contained preg_match preg_match_all preg_split preg_grep
            \ nextgroup=phpPREGOpenParent,phpPREGRegion skipwhite skipempty

      " special case for preg_replace functions which can take an array of
      " patterns
      syn keyword phpPREGFunctions contained preg_replace preg_replace_callback
            \ nextgroup=phpPREGOpenParentMulti,phpPREGRegionMulti skipwhite skipempty

      if s:strict_blocks
        " regions for ( ) after name of preg_* function
        syn region phpPREGRegion matchgroup=phpParent start=/(/ end=/)/ keepend extend
              \ contained contains=@phpClInside,phpPREGStringStarter
        syn region phpPREGRegionMulti matchgroup=phpParent start=/(/ end=/)/ keepend extend
              \ contained contains=@phpClInside,phpPREGStringStarter,phpPREGArray

        " match an array of preg patterns
        if s:alt_arrays
          syn region phpPREGArray matchgroup=phpArrayParens start=/\%((\_s*\)\@<=array(/ end=/)/
                \ keepend extend
                \ contained
                \ contains=@phpClInside,phpPREGStringStarter,phpPREGArrayComma,phpPREGArrayComment
        else
          syn match phpPREGArray /\%((\_s*\)\@<=array/ contained
                \ nextgroup=phpPREGArrayRegion skipwhite skipempty
          
          syn region phpPREGArrayRegion matchgroup=phpParent start=/(/ end=/)/
                \ keepend extend
                \ contained
                \ contains=phpPREGStringStarter,phpPREGArrayComment,phpPREGArrayComma
        endif
        hi link phpPREGArray phpArray

        " a special match to open a pattern string immediately after a '('
        " TODO: will this work as a match instead?
"        syn region phpPREGStringStarter start=/\%((\_s*\)\@<=\z(['"]\)/ end=/\z1/ extend 
"              \ contained contains=@phpPREGString_any
        syn match phpPREGStringStarter /\%((\_s*\)\@<=['"]/ extend 
              \ contained contains=@phpPREGString_any

        " TODO: move 'hi link' commands out of here
        hi link phpPREGArrayComma phpArrayComma
      else
        " highlight the opening parenthesis
        syn match phpPREGOpenParent /(/ contained nextgroup=@phpPREGString_any display
        hi link phpPREGOpenParent phpParent
        syn match phpPREGOpenParentMulti /(/ contained display
              \ nextgroup=@phpPREGString_any,phpPREGArray skipwhite skipnl skipempty
        hi link phpPREGOpenParentMulti phpPREGOpenParent

        " TODO: move 'hi link' commands out of here
        " match an array of preg patterns
        syn keyword phpPREGArray array contained nextgroup=phpPREGArrayOpenParent
        hi link phpPREGArray phpType
        syn match phpPREGArrayOpenParent /(/ contained display
          \ nextgroup=@phpPREGArrayString_any skipwhite skipnl skipempty
        hi link phpPREGArrayOpenParent phpPREGOpenParent
      endif

      " match a phpString (single or double-quoted) which is able to contain a
      " pregPattern
      " NOTE: we can only error on comma-ending as long as the delimiter is
      " not a comma!!!
      syn cluster phpPREGString_any add=phpPREGStringSingle,phpPREGStringDouble
      syn region phpPREGStringSingle matchgroup=phpQuoteSingle start=/'\ze\z(.\)/ end=/'/
        \ keepend extend contained contains=pregPattern_S
        \ matchgroup=Error end=/\z1\@!,/
      syn region phpPREGStringDouble matchgroup=phpQuoteSingle start=/"\ze\z(.\)/ end=/"/
        \ keepend extend contained contains=pregPattern_D
        \ matchgroup=Error end=/\z1\@!,/

      " match a single-quoted string inside an array, followed by a comma
      " and another string
      " TODO: remove hi link commands from here
      syn cluster phpPREGArrayString_any add=phpPREGArrayStringSingle,phpPREGArrayStringDouble
      syn region phpPREGArrayStringSingle matchgroup=phpQuoteSingle start=/'/ end=/'/
        \ keepend extend contained contains=pregPattern_S
        \ nextgroup=phpPREGArrayComma skipwhite skipnl skipempty
      hi link phpPREGArrayStringSingle phpPREGStringSingle
      syn region phpPREGArrayStringDouble matchgroup=phpQuoteDouble start=/"/ end=/"/
        \ keepend extend contained contains=pregPattern_D
        \ nextgroup=phpPREGArrayComma skipwhite skipnl skipempty
      hi link phpPREGArrayStringDouble phpPREGStringDouble

      " use the comma inside a pattern array to trigger off the next pattern
      syn match phpPREGArrayComma /,/ contained
            \ nextgroup=@phpPREGArrayString_any skipwhite skipnl skipempty

      " use the comments inside a pattern array to trigger off the next pattern
      syn region phpPREGArrayComment start=#//# end=#$# contained keepend extend
            \ nextgroup=@phpPREGArrayString_any skipwhite skipnl skipempty
      syn region phpPREGArrayComment start=#/\*# end=#\*/# contained keepend extend
            \ nextgroup=@phpPREGArrayString_any skipwhite skipnl skipempty
      hi link phpPREGArrayComment phpComment
    " }}}

    " 7) Look for pattern delimiters {{{
      syn cluster pregPattern_Q add=pregPattern_S,pregPattern_D

      " add a region which starts with any valid delimiter character
      " and ends when the delimiter character is met again
      syn region pregPattern_S matchgroup=pregDelimiter
        \ start=/\z([ !"#$%&*+,-./:;=?@^_`|~]\)/ start=/\z(\\'\)/
        \ end=/\z1/ skip=/\\\\\{2,3}\|\\\\\z1\=\|\\\z1/ keepend extend
        \ contained nextgroup=pregOptionError_S

      function! s:pregPattern_S(open, close)
        execute 'syntax region pregPattern_S matchgroup=pregDelimiter'
              \ 'start=/\%x' . a:open . '/'
              \ 'end=/\%x' . a:close . '/'
              \ 'skip=/\\\{4}\|\\\\\=./ keepend extend'
              \ 'contained nextgroup=pregOptionError_S'
      endfunction
      function! s:pregPattern_D(open, close)
        execute 'syntax region pregPattern_D matchgroup=pregDelimiter'
              \ 'start=/\%x' . a:open . '/'
              \ 'end=/\%x' . a:close . '/'
              \ 'skip=/\\\{4}\|\\\\\=./ keepend extend'
              \ 'contained nextgroup=pregOptionError_D'
      endfunction
      call s:pregPattern_S('28', '29')
      call s:pregPattern_S('3C', '3E')
      call s:pregPattern_S('5B', '5D')
      call s:pregPattern_S('7B', '7D')
      call s:pregPattern_D('28', '29')
      call s:pregPattern_D('3C', '3E')
      call s:pregPattern_D('5B', '5D')
      call s:pregPattern_D('7B', '7D')

      " TODO: make a cluster for the things which go inside double-quoted
      " strings!
      syn region pregPattern_D matchgroup=pregDelimiter
        \ start=/\z([ !'#$%&*+,-./:;=?@^_`|~]\)/ start=/\z(\\"\)/
        \ end=/\z1/ skip=/\\\\\{2,3}\|\\\\\z1\=\|\\\z1/
        \ keepend extend
        \ contained nextgroup=pregOptionError_D
        \ contains=phpIdentifierInString,phpIdentifierInStringComplex

      " TODO: work out how to have '$' as delimiter in a double-quoted string
"      syn region pregPattern_D matchgroup=pregDelimiter
"        \ start=/\\\$\|\$[a-z_]\@!\%({[a-z_$]\)\@!/
"        \ end=/\\\$\|\$[a-z_]\@!\%({[a-z_$]\)\@!/ skip=/\\\{4}\|\\\{3}[^$]\|\\\\\$/
"        \ keepend extend
"        \ contained nextgroup=pregOptionError_D
"        \ contains=phpIdentifierInString,phpIdentifierInStringComplex

      " TODO move hi link out of here
      hi link pregPattern_S pregPattern
      hi link pregPattern_D pregPattern
    " }}}

    " 8) Look for character classes {{{
      " Inc[lusive] and Exc[lusive] character classes:
      "  if the first char is ']'
      " that is tricky so is handled by another match below
      syn cluster pregClassInc_Q add=pregClassInc_S,pregClassInc_D
      syn cluster pregClassExc_Q add=pregClassExc_S,pregClassExc_D
      syn cluster pregClass_any_S add=pregClassInc_S,pregClassExc_S
      syn cluster pregClass_any_D add=pregClassInc_D,pregClassExc_D
      syn cluster pregClass_any_Q add=@pregClassInc_Q,@pregClassExc_Q

      syn region pregClassInc_S matchgroup=pregClassParent start=/\[\ze[^\^\]]/ end=/\]/ skip=/\\./
            \ keepend display contained containedin=pregPattern_S
      syn region pregClassInc_D matchgroup=pregClassParent start=/\[\ze[^\^\]]/ end=/\]/ skip=/\\./
            \ keepend display contained containedin=pregPattern_D
      " TODO: move these out of here???
      hi link pregClassInc_S pregClassInc
      hi link pregClassInc_D pregClassInc
      hi link pregClassExc_S pregClassExc
      hi link pregClassExc_D pregClassExc

      syn region pregClassExc_S matchgroup=pregClassParent start=/\[\^\]\@!/ end=/\]/ skip=/\\./
        \ keepend display contained containedin=pregPattern_S
      syn region pregClassExc_D matchgroup=pregClassParent start=/\[\^\]\@!/ end=/\]/ skip=/\\./
        \ keepend display contained containedin=pregPattern_D

      " TODO: move hi link commands out of here

      " TODO: just use one match for all character classes???
      " this is an alternate form of the character class region,
      " it is not contained in @pregPattern_Q and can only be activated
      " by a nextgroup=pregClassInc.
      " 'EXECUTE'ed:
      "syntax region pregClassInc_S start=/\ze./ matchgroup=pregClassParent end=/\]/ skip=/\\\\\|\\]/ contained display
      "syntax region pregClassInc_D start=/\ze./ matchgroup=pregClassParent end=/\]/ skip=/\\\\\|\\]/ contained display
      "syntax region pregClassExc_S start=/\ze./ matchgroup=pregClassParent end=/\]/ skip=/\\\\\|\\]/ contained display
      "syntax region pregClassExc_D start=/\ze./ matchgroup=pregClassParent end=/\]/ skip=/\\\\\|\\]/ contained display
      let s:command = 'syntax region pregClass<TYPE> start=/\ze./ matchgroup=pregClassParent end=/\]/'
        \ . ' skip=/\\\\\|\\]/ contained display keepend'
      execute substitute(s:command, '<TYPE>', 'Inc_S', 'g')
      execute substitute(s:command, '<TYPE>', 'Inc_D', 'g')
      execute substitute(s:command, '<TYPE>', 'Exc_S', 'g')
      execute substitute(s:command, '<TYPE>', 'Exc_D', 'g')
      unlet! s:command

      " this is a special match to start off the character class
      " region when the very first character inside it is ']',
      " because otherwise the character class region would end
      " immediately
      syn cluster pregClassIncStart_Q add=pregClassIncStart_S,pregClassIncStart_D
      syn cluster pregClassExcStart_Q add=pregClassExcStart_S,pregClassExcStart_D
      let s:command = 'syntax match pregClassIncStart_<QUOTE> /\[\]/ contained display'
        \ . ' containedin=pregPattern_<QUOTE> nextgroup=pregClassInc_<QUOTE>,pregClassIncEnd'
      execute substitute(s:command, '<QUOTE>', 'S', 'g')
      execute substitute(s:command, '<QUOTE>', 'D', 'g')
      let s:command = 'syntax match pregClassExcStart_<QUOTE> /\[\^\]/ contained display'
        \ . ' containedin=pregPattern_<QUOTE> nextgroup=pregClassExc_<QUOTE>,pregClassExcEnd'
      execute substitute(s:command, '<QUOTE>', 'S', 'g')
      execute substitute(s:command, '<QUOTE>', 'D', 'g')
      unlet! s:command

      " TODO: move hi link commands out of here
      hi link pregClassIncStart_S pregClassParent
      hi link pregClassIncStart_D pregClassParent
      hi link pregClassExcStart_S pregClassParent
      hi link pregClassExcStart_D pregClassParent

      " this is a special match to end off the character class immediately
      " should a ']' be followed immediately by another ']'
      " TODO: move hi link commands out of here
      syn match pregClassIncEnd /\]/ contained display
      hi link pregClassIncEnd pregClassParent
      syn match pregClassExcEnd /\]/ contained display
      hi link pregClassExcEnd pregClassParent

      " add the range-matching string here
      syn cluster pregClassIncRange_Q add=pregClassIncRange_S,pregClassIncRange_D
      syn cluster pregClassExcRange_Q add=pregClassExcRange_S,pregClassExcRange_D
      syn match pregClassIncRange_S contained display
        \ containedin=pregClassInc_S,pregClassIncStart_S
        \ /\%([^\\]\|\\\%(\\\{2}[\\']\=\|x\x\{0,2}\|\o\{1,3}\|[^dsw]\)\)-\%(\\\{3,4}\|\\[^dsw]\|[^\\\]]\)/
      syn match pregClassIncRange_D contained display
        \ containedin=pregClassInc_D,pregClassIncStart_D
        \ /\%([^\\]\|\\\%(\\\{2}[\\"]\=\|x\x\{0,2}\|\o\{1,3}\|[^dsw]\)\)-\%(\\\{3,4}\|\\[^dsw]\|[^\\\]]\)/
      syn match pregClassExcRange_S contained display
        \ containedin=pregClassExc_S,pregClassExcStart_S
        \ /\%([^\\]\|\\\%(\\\{2}[\\']\=\|x\x\{0,2}\|\o\{1,3}\|[^dsw]\)\)-\%(\\\{3,4}\|\\[^dsw]\|[^\\\]]\)/
      syn match pregClassExcRange_D contained display
        \ containedin=pregClassExc_D,pregClassExcStart_D
        \ /\%([^\\]\|\\\%(\\\{2}[\\']\=\|x\x\{0,2}\|\o\{1,3}\|[^dsw]\)\)-\%(\\\{3,4}\|\\[^dsw]\|[^\\\]]\)/
      hi link pregClassIncRange_S pregClassIncRange
      hi link pregClassIncRange_D pregClassIncRange
      hi link pregClassExcRange_S pregClassExcRange
      hi link pregClassExcRange_D pregClassExcRange

      " what about the pre-defined sets using [:space:]?
      syn region pregClassSetRegion matchgroup=pregClassSet start=/\[:/ end=/:\]/
            \ extend keepend
            \ contained containedin=@pregClass_any_Q contains=pregClassSet
      hi link pregClassSetRegion Error
      syn keyword pregClassSet contained
            \ alnum digit punct
            \ alpha graph space
            \ blank lower upper
            \ cntrl print xdigit
      hi link pregClassSet pregEscapeRange
    " }}}
      
    " 9) Look for escaping using \Q and \E {{{
      syn region pregNonSpecial_S matchgroup=pregParens start=/\\Q/ end=/\\E/
            \ contained containedin=pregPattern_S
      syn region pregNonSpecial_D matchgroup=pregParens start=/\\Q/ end=/\\E/
            \ contained containedin=pregPattern_D
      hi link pregNonSpecial_S pregNonSpecial
      hi link pregNonSpecial_D pregNonSpecial
      hi link pregNonSpecial pregPattern

	  " I'm just going to rebuild escapes here to make it easier
	  syn match pregError /'/ contained containedin=pregNonSpecial_S
	  syn match pregError /"/ contained containedin=pregNonSpecial_D
	  syn match pregNonSpecialEscape /\\['\\]/ contained containedin=pregNonSpecial_S
	  syn match pregNonSpecialEscape /\\["\\$]/ contained containedin=pregNonSpecial_D
	  syn match pregNonSpecialEscapePHP /\\./he=s+1 contained containedin=pregNonSpecialEscape
	  syn match pregNonSpecialEscapePHP /\\[rnt]/ contained containedin=pregNonSpecial_D
      hi link pregNonSpecialEscapePHP pregEscapePHP
    " }}}

    " 10) Match PCRE pattern options {{{
      syn match pregOptionError_S /\%(\\[\\']\|[^']\)\+/ contained contains=pregOption display
      syn match pregOptionError_D /\%(\\[\\"]\|[^"]\)\+/ contained display
            \ contains=pregOption,phpIdentifierInString,phpIdentifierInStringComplex
      syn match pregOption /\C[eimsuxADSUX]\+/ contained display
      " TODO: move hi links out of here?
      hi link pregOptionError_S pregOptionError
      hi link pregOptionError_D pregOptionError
    " }}}

    " 11) PCRE pattern comments {{{
      syn match pregComment /\v\(\?\#[^)]*\)/ contained containedin=@pregPattern_Q

      " TODO: multi-line comments must be turned on explicitly!?
      " syntax match pregComment /\v\#(.*)@>/ contained containedin=@pregPattern_Q
    " }}}

    " 12) highlight links {{{
      command -nargs=+ HiLink hi link <args>

      HiLink phpPREGFunctions phpFunctions
      HiLink phpPREGOpenParent phpParent
      HiLink phpPREGStringSingle phpStringSingle
      HiLink phpPREGStringDouble phpStringDouble

      HiLink pregError Error
      HiLink pregAmbiguous Todo

      HiLink pregDelimiter Statement

      HiLink pregOptionError Error
      HiLink pregOption Type

      HiLink pregComment phpComment

      HiLink pregEscapeDelimiter pregDelimiter
      HiLink pregEscapeUnknown pregAmbiguous
      HiLink pregEscapeLiteral Comment
      HiLink pregEscapeSpecial Number
      HiLink pregEscapeAnchor  Typedef
      HiLink pregEscapeRange   Identifier
      HiLink pregEscapePHP	   phpSpecialChar
      HiLink pregEscapeUnicode pregEscapeRange
      HiLink pregEscapeUnicodeError pregError

      HiLink pregEscapeNotNeeded pregEscapePHP

      HiLink pregPattern	Normal
      HiLink pregSpecial	Typedef
      HiLink pregDot        Typedef
      HiLink pregParens	PreProc
      HiLink pregBackreference pregParens

      HiLink pregQuantifier        Typedef
      HiLink pregQuantifierComplex Typedef

      HiLink pregClassParent  pregParens
      HiLink pregClassInc     pregClassParent
      HiLink pregClassExc     pregClassParent
      HiLink pregClassIncRange Identifier
      HiLink pregClassExcRange Identifier
      HiLink pregClassEscape   Comment
      HiLink pregClassIncEscapeKnown pregEscapeSpecial
      HiLink pregClassIncEscapeRange pregClassIncRange
      HiLink pregClassExcEscapeKnown Type
      HiLink pregClassExcEscapeRange pregClassExcRange
      HiLink pregClassEscapeUnknown pregAmbiguous

      delcommand HiLink
    " }}}
endif

" ================================================================

let b:current_syntax = "php"

if main_syntax == 'php'
  unlet main_syntax
endif

" vim: sw=2 sts=2 expandtab foldmethod=marker foldcolumn=1 columns=110
