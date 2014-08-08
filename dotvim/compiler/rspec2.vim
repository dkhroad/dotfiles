" Vim compiler file
" Language:     RSpec2
" Maintainer:       John Cinnamond
" Last Change:      2013-04-07

if exists("current_compiler")
  finish
endif
let current_compiler = "rspec2"

if exists(":CompilerSet") != 2      " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=bundle\ exec\ rspec\ -r\ ./spec/support/vim_formatter.rb\ -f\ VimFormatter

CompilerSet errorformat=
      \F:%f:%l:%m,
      \P:%f:%l:%m

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
