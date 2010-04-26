" Vim syntax file
" Language:	SQL, MySQL
" Maintainer:   Giuseppe Maxia	
" Last Change:	2001 Oct 01

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlSpecial false null true 

syn keyword sqlKeyword ascii asc asin atan avg avg_row_length bit bit_and bit_count bit_or case ceiling outer auto_increment char_length 
syn keyword sqlKeyword character_length check checksum coalesce column columns comment concat constraint conv cos cot count curdate current_date
syn keyword sqlKeyword current_time curtime data date_format date_sub day day_hour day_minute day_second dayname dayofmonth dayofweek 
syn keyword sqlKeyword dayofyear decode degrees delay_key_write dumpfile else elt encode encrypt end escape escaped exists export_set 
syn keyword sqlKeyword extract file find_in_set floor for foreign format from_days from_unixtime full get_lock global hosts hour 
syn keyword sqlKeyword hour_minute hour_second if ifnull in insert_id instr isam isnotnull isnull key keys last_insert_id lcase 
syn keyword sqlKeyword leading least left length lines low_priority lpad ltrim make_set match max max_rows mid min min_rows minute 
syn keyword sqlKeyword minute_second mod month monthname myisam oct octet_length ord outfile pack_keys password period_add period_diff 
syn keyword sqlKeyword pi position pow power precision quarter radians rand regexp release_lock repeat reverse right rlike round row 
syn keyword sqlKeyword row_format rows rpad rtrim sec_to_time second session_user sign sin soname soundex space sql_big_result 
syn keyword sqlKeyword sql_big_selects sql_big_tables sql_log_off sql_log_update sql_low_priority_updates sql_select_limit sql_small_result 
syn keyword sqlKeyword sql_warnings sqrt std stddev strcmp subdate substring substring_index sum sysdate system_user tan time_format 
syn keyword sqlKeyword time_to_sec to_days trim ucase unix_timestamp upper usage user variables version week weekday year year_month abs 
syn keyword sqlKeyword acos add adddate aggregate all now heap hex nchar 

syn keyword sqlOperator	between binary change no not on or by order as default delayed desc distinct distinctrow field fields first from 
syn keyword sqlOperator group having high_priority identified ignore infile inner interval into is join like limit local lower natural optionally 
syn keyword sqlOperator partial primary references starting straight_join temporary terminated then to trailing type unique using 
syn keyword sqlOperator values varying when where with after and 

syn keyword sqlStatement insert benchmark create database databases date_add delete describe drop exp explain flush function grant 
syn keyword sqlStatement grants index kill load locate lock log logs modify optimize option privileges procedure process processlist 
syn keyword sqlStatement read reload rename replace revoke select show shutdown status table tables truncate unlock update use alter 

syn keyword sqlType boolean char character date float integer long bigint blob bool char date float mediumblob mediumint mediumtext 
syn keyword sqlType middleint enum set timestamp tinyblob tinyint tinytext varchar datetime dec decimal double int integer long 
syn keyword sqlType longblob longtext real smallint text time unsigned zerofill 

" Strings and characters:
syn region sqlString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlString		start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:
syn match sqlNumber		"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment    start="/\*"  end="\*/"
syn match sqlComment	"--.*"
syn match sqlComment	"#.*"

syn sync ccomment sqlComment

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
  if version < 508
    let did_sql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sqlComment	Comment
  HiLink sqlKeyword	sqlSpecial 
  HiLink sqlNumber	Number
  HiLink sqlOperator	sqlStatement
  HiLink sqlSpecial	Special
  HiLink sqlStatement	Statement
  HiLink sqlString	String
  HiLink sqlType	Type

  delcommand HiLink
endif

let b:current_syntax = "mysql"

" vim: ts=8
