<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
  <link rel="Stylesheet" type="text/css" href="/css/style.css" >
  <title>indent/python.vim - An alternative indentation script for python : vim online</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="KEYWORDS" content="Vim, Vi IMproved, text editor, home, documentation, tips, scripts, news">
  <link rel="shortcut icon" type="image/x-icon" href="/images/vim_shortcut.ico">
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#ffffff"> 

<!-- HEADER, SPONSOR IMAGE, VIM IMAGE AND BOOK AD -->
<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="red">
  <tr>
    <td colspan="4" class="lightbg"><img src="/images/spacer.gif" width="1" height="5" alt=""></td>
  </tr>
  <tr>
  <td class="lightbg">&nbsp;&nbsp;&nbsp;</td>
  <td class="lightbg" align="left"><a href="/sponsor/index.php"><img src="/images/sponsorvim.gif" alt="sponsor Vim development" border="0"></a></td>
    <td class="lightbg" align="center"><a href="/index.php"><img src="/images/vim_header.gif" border="0" alt="Vim logo"></a></td>
    <td class="lightbg" align="right"><a href="http://iccf-holland.org/click5.html"><img src="/images/buyhelplearn.gif" alt="Vim Book Ad" border="0"></a></td>
  </tr>
  <tr>
    <td colspan="4" class="lightbg"><img src="/images/spacer.gif" width="1" height="5" alt=""></td>
  </tr>
  <tr>
    <td colspan="4" class="darkbg"><img src="/images/spacer.gif" width="1" height="10" alt=""></td>
  </tr>
</table>
<!-- THE PAGE BODY: BETWEEN HEADER AND FOOTER -->

<table cellpadding="0" cellspacing="0" border="0" width="100%">
  <col width="180">
  <col width="1">

  <tr valign="top">
    <td class="sidebar">
      <table width="180" cellpadding="4" cellspacing="0" border="0">
        <tr valign="top">
          <td class="sidebar">

<!-- INCLUDE THE PAGE NAVIGATION -->
<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="red">
    <tr>
        <td><small>not logged in (<a href="/login.php">login</a>)</small></td>
    </tr>
    <tr><td>
<small>&nbsp;</small>
<form action="http://www.google.com/cse" id="cse-search-box">
  <div>
    <input type="hidden" name="cx" value="partner-pub-3005259998294962:bvyni59kjr1" />
    <input type="hidden" name="ie" value="ISO-8859-1" />
    <input type="text" name="q" size="20" />
    <br>
    <input type="submit" name="sa" value="Search" />
  </div>
</form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box&amp;lang=en"></script>
    </td></tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="1"></td>
    </tr>
    <tr>
        <td class="darkbg"><img src="/images/spacer.gif" alt='' border="0" height="3"></td>
    </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="2"></td>
    </tr>
        <tr>
            <td class="sidebarheader"><a href="/index.php">Home</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/search.php">Advanced search</a></td>
        </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="7"></td>
    </tr>
    <tr>
        <td class="checker"><img src="/images/spacer.gif" alt='' border="0" height="1"></td>
    </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="7"></td>
    </tr>
        <tr>
            <td class="sidebarheader"><a href="/about.php">About Vim</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/community.php">Community</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/news/news.php">News</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/sponsor/index.php">Sponsoring</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/trivia.php">Trivia</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/docs.php">Documentation</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/download.php">Download</a></td>
        </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="7"></td>
    </tr>
    <tr>
        <td class="checker"><img src="/images/spacer.gif" alt='' border="0" height="1"></td>
    </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="7"></td>
    </tr>
        <tr>
            <td class="sidebarheader"><a href="/scripts/index.php">Scripts</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/tips/index.php">Tips</a></td>
        </tr>
        <tr>
            <td class="sidebarheader"><a href="/account/index.php">My Account</a></td>
        </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="7"></td>
    </tr>
    <tr>
        <td class="checker"><img src="/images/spacer.gif" alt='' border="0" height="1"></td>
    </tr>
    <tr>
        <td><img src="/images/spacer.gif" alt="" border="0" width="1" height="7"></td>
    </tr>
        <tr>
            <td class="sidebarheader"><a href="/huh.php">Site Help</a></td>
        </tr>
</table>

            <table width="172" cellpadding="0" cellspacing="0" border="0">
              <tr><td><img src="/images/spacer.gif" alt="" border="0" width="1" height="8"></td></tr>
              <tr><td class="darkbg"><img src="/images/spacer.gif" width="1" height="3" alt=""></td></tr>
            </table>
            <br>

<!-- INCLUDE THE PAGE SIDEBAR TEXT -->
&nbsp;

          </td>
        </tr>
      </table>
    </td>

    <td class="darkbg"><img src="/images/spacer.gif" width="1" height="1" border="0" alt=""><br></td>
    <td>
      <table width="100%" cellpadding="10" cellspacing="0" border="0" bordercolor="red">
        <tr>
          <td valign="top">

<span class="txth1">indent/python.vim : An alternative indentation script for python</span> 

<br>
<br>

<!-- karma table -->
<table cellpadding="4" cellspacing="0" border="1" bordercolor="#000066">
<tr>
  <td class="lightbg"><b>&nbsp;script karma&nbsp;</b></td>
  <td>
    Rating <b>1359/402</b>,
    Downloaded by 15635  </td>
  <td class="lightbg">
  <b>&nbsp;Comments, bugs, improvements&nbsp;</b>
  </td>
  <td>
    <a href="http://vim.wikia.com/wiki/Script:974">Vim wiki</a>
  </td>  
</tr>
</table>
<p>

<table cellspacing="0" cellpadding="0" border="0">
<tr><td class="prompt">created by</td></tr>
<tr><td><a href="/account/profile.php?user_id=2913">Eric Mc Sween</a></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="prompt">script type</td></tr>
<tr><td>indent</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="prompt">description</td></tr>
<tr><td>This indentation script for python tries to match more closely what is suggested in PEP 8 (<a target="_blank" href="http://www.python.org/peps/pep-0008.html">http://www.python.org/peps/pep-0008.html</A>).&nbsp;&nbsp;In particular, it handles continuation lines implied by open (parentheses), [brackets] and {braces} correctly and it indents multiline if/for/while statements differently.<br><br>Comments are welcome!<br></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="prompt">install details</td></tr>
<tr><td>Drop the script in your ~/.vim/indent directory.</td></tr>
<tr><td>&nbsp;</td></tr>
</table>

<!-- rating table -->
<form name="rating">
<input type="hidden" name="script_id" value="974">
<table cellpadding="4" cellspacing="0" border="1" bordercolor="#000066">
<tr>
  <td class="lightbg"><b>rate this script</b></td>
  <td valign="middle">
    <input type="radio" name="rating" value="life_changing">Life Changing
    <input type="radio" name="rating" value="helpful">Helpful
    <input type="radio" name="rating" value="unfulfilling">Unfulfilling&nbsp;
    <input type="submit" value="rate">
  </td>
</tr>
</table>
</form>
<span class="txth2">script versions</span> (<a href="add_script_version.php?script_id=974">upload new version</a>)
<p>
Click on the package to download.
<p>

<table cellspacing="2" cellpadding="4" border="0" width="100%">
<tr class='tableheader'>
        <th valign="top">package</th>
    <th valign="top">script version</th>
    <th valign="top">date</th>
    <th valign="top">Vim version</th>
    <th valign="top">user</th>
    <th valign="top">release notes</th>
</tr>
<tr>
        <td class="rowodd" valign="top" nowrap><a href="download_script.php?src_id=4316">python.vim</a></td>
    <td class="rowodd" valign="top" nowrap><b>0.3</b></td>
    <td class="rowodd" valign="top" nowrap><i>2005-05-23</i></td>
    <td class="rowodd" valign="top" nowrap>6.0</td>
    <td class="rowodd" valign="top"><i><a href="/account/profile.php?user_id=2913">Eric Mc Sween</a></i></td>
    <td class="rowodd" valign="top" width="2000">Changes:<br>- Update one shiftwidth instead of aligning with parens that stand at the end of a line.</td>
</tr>
<tr>
        <td class="roweven" valign="top" nowrap><a href="download_script.php?src_id=3105">python.vim</a></td>
    <td class="roweven" valign="top" nowrap><b>0.2</b></td>
    <td class="roweven" valign="top" nowrap><i>2004-06-07</i></td>
    <td class="roweven" valign="top" nowrap>6.0</td>
    <td class="roweven" valign="top"><i><a href="/account/profile.php?user_id=2913">Eric Mc Sween</a></i></td>
    <td class="roweven" valign="top" width="2000">Changes:<br>- Fix: skip parentheses in strings and comments.<br>- Line up elif/else and except/finally with the most probable corresponding if or try statement.<br>- Dedent after 'pass'. (Jeffrey Collins)</td>
</tr>
<tr>
        <td class="rowodd" valign="top" nowrap><a href="download_script.php?src_id=2981">python.vim</a></td>
    <td class="rowodd" valign="top" nowrap><b>0.1</b></td>
    <td class="rowodd" valign="top" nowrap><i>2004-04-26</i></td>
    <td class="rowodd" valign="top" nowrap>6.0</td>
    <td class="rowodd" valign="top"><i><a href="/account/profile.php?user_id=2913">Eric Mc Sween</a></i></td>
    <td class="rowodd" valign="top" width="2000">Initial upload</td>
</tr>
</table>
<!-- finish off the framework -->
          </td>
        </tr>
      </table>
    </td>

  </tr>
</table>

<!-- END OF THE PAGE BODY: BETWEEN HEADER AND FOOTER -->

<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="red">
  <tr><td colspan="4"><img src="/images/spacer.gif" width="1" height="5" alt=""></td></tr>
  <tr><td colspan="4" bgcolor="#000000"><img src="/images/spacer.gif" height="2" width="1" alt=""></td></tr>
  <tr><td colspan="4"><img src="/images/spacer.gif" width="1" height="5" alt=""></td></tr>
  <tr>
    <td><img src="/images/spacer.gif" width="5" height="1" alt=""></td>

    <td align="left" valign="top"><small>
      If you have questions or remarks about this site, visit the
      <a href="http://vimonline.sf.net">vimonline development</a> pages.
      Please use this site responsibly.
      <br> 
      
      Questions about <a href="http://www.vim.org/about.php">Vim</a> should go
      to the <a href="http://www.vim.org/maillist.php">maillist</a>.
      Help Bram <a href="http://iccf-holland.org/">help Uganda</a>.
      </small>
	&nbsp;
	&nbsp;

	<!-- Start of StatCounter Code -->
	<script type="text/javascript" language="javascript">
	var sc_project=1417324; 
	var sc_invisible=1; 
	var sc_partition=11; 
	var sc_security="d41633bc"; 
	</script>

	<script type="text/javascript" language="javascript" src="http://www.statcounter.com/counter/counter.js"></script><noscript><a href="http://www.statcounter.com/" target="_blank"><img  src="http://c12.statcounter.com/counter.php?sc_project=1417324&java=0&security=d41633bc&invisible=0" alt="free tracking" border="0"></a> </noscript>
	<!-- End of StatCounter Code -->
          </td>

    <td align="right" valign="top">
      		<a href="http://sourceforge.net/projects/vim" rel="nofollow"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=8&type=1" width="88" height="31" border="0" alt="SourceForge.net Logo" /></a>
    </td>

    <td><img src="/images/spacer.gif" width="5" height="1" alt=""></td>
  </tr>

    
  <tr><td colspan="4"><img src="/images/spacer.gif" width="1" height="5" alt=""></td>
  
  </tr>
</table>

</body>
</html>

