command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus  packadd minpac | source $MYVIMRC | call minpac#status()

if !exists('*minpac#init')
  finish
endif

call minpac#init({'verbose': 1})

" minpac must have {'type': 'opt'} so that it can be loaded with
" `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('dsawardekar/riml.vim', {'type': 'opt'})

" Optional packages. Use packadd  
call minpac#add('kien/ctrlp.vim',{'type': 'opt'})

" General enhancements
call minpac#add('rking/ag.vim')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-characterize')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-ragtag')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-tbone')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-vinegar')
call minpac#add('nelstrom/vim-visual-star-search')
" call minpac#add('SirVer/ultisnips')
call minpac#add('godlygeek/tabular')
call minpac#add('neomake/neomake')
call minpac#add('tommcdo/vim-exchange')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('szw/vim-g')
call minpac#add('scrooloose/nerdtree')
" call minpac#add('kana/vim-smartinput')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
if has('nvim')
  call minpac#add('neoclide/coc.nvim',{'do': { -> coc#util#install()}})
  " call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'})
  " call minpac#add('deoplete-plugins/deoplete-jedi')
  " call minpac#add('carlitux/deoplete-ternjs')
  " call minpac#add('Shougo/neosnippet')
  " call minpac#add('Shougo/neosnippet-snippets')
  " call minpac#add('ternjs/tern_for_vim')
endif
call minpac#add('sheerun/vim-polyglot')
call minpac#add('janko-m/vim-test')
call minpac#add('vim-scripts/taglist.vim')
call minpac#add('ludovicchabant/vim-gutentags')


" Custom textobjects
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-syntax')
call minpac#add('kana/vim-textobj-line')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('Julian/vim-textobj-variable-segment')
call minpac#add('bkad/CamelCaseMotion')
call minpac#add('b4winckler/vim-angry')
call minpac#add('saihoooooooo/vim-textobj-space')
call minpac#add('christoomey/vim-tmux-runner')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('junegunn/fzf.vim')
call minpac#add('junegunn/fzf')
call minpac#add('powerman/vim-plugin-AnsiEsc')

" For Vimscript
call minpac#add('tpope/vim-scriptease')
call minpac#add('tweekmonster/helpful.vim')
call minpac#add('nelstrom/vim-docopen')

" Markdown
call minpac#add('tpope/vim-markdown')
" call minpac#add('nelstrom/vim-markdown-folding')
call minpac#add('junegunn/vim-emoji', {'type': 'opt'})

" JavaScript
call minpac#add('pangloss/vim-javascript')
call minpac#add('elzr/vim-json')

" Ruby
call minpac#add('tpope/vim-bundler')
" call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('vim-ruby/vim-ruby')

" Go
call minpac#add('fatih/vim-go')
call minpac#add('garyburd/go-explorer')

" Elixir
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('slashmili/alchemist.vim')

" Python
call minpac#add('zchee/deoplete-jedi')

" Colorschemes
call minpac#add('lifepillar/vim-solarized8', {})
call minpac#add('morhetz/gruvbox', {'type': 'opt'})
call minpac#add('rakr/vim-one', {'type': 'opt'})
call minpac#add('NLKNguyen/papercolor-theme', {'type': 'opt'})
call minpac#add('reedes/vim-colors-pencil', {'type': 'opt'})
call minpac#add('tpope/vim-vividchalk')
call minpac#add('jpo/vim-railscasts-theme')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('sfsekaran/cobalt.vim')
call minpac#add('jacoborus/tender.vim')
call minpac#add('flazz/vim-colorschemes')
 
" Plugins for either Vim8 or NeoVim
if has('nvim')
  call minpac#add('Shougo/denite.nvim', {})
  call minpac#add('machakann/vim-highlightedyank', {})
  call minpac#add('kassio/neoterm', {})
  call minpac#add('Shougo/neomru.vim', {'type': 'opt'})
else
  call minpac#add('Shougo/unite.vim', {'type': 'opt'})
endif
