if [ `uname` = 'Darwin' ]; then
  alias twiki='open -a Firefox ~/TiddlyWiki/twiki.html'
  alias twikiw='open -a Firefox ~/TiddlyWiki/twikiw.html'
else 
  alias twiki='firefox ~/TiddlyWiki/twiki.html &'
  alias twikiw='firefox ~/TiddlyWiki/twikiw.html &'
fi
