au BufRead,BufNewFile *.inc,*.ihtml,*.html,*.tpl,*.class set filetype=php
        \ | let Comment="<!-- " | let EndComment=" -->"
au BufRead,BufNewFile *.sh,*.pl,*.tcl,*.py let Comment="# " | let EndComment=""
au BufRead,BufNewFile *.js set filetype=html | let Comment="//" | let EndComment=""
au BufRead,BufNewFile *.cc,*.php,*.cxx let Comment="//" | let EndComment=""
au BufRead,BufNewFile *.c,*.h let Comment="/*" | let EndComment="*/"
au BufRead,BufNewFile *.vim let Comment="\"" | let EndComment=""
