call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

call plug#end()
set autoread
syntax enable
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set t_Co=256        	" использовать больше цветов в терминале
set wrap            	" (no)wrap - динамический (не)перенос длинных строк
set linebreak       	" переносить целые слова
set showcmd         	" показывать незавершенные команды в статусбаре (автодополнение ввода)
set mouse=a 			" включает поддержку мыши при работе в терминале (без GUI)
colorscheme gruvbox 	" тема для цветовой схем
set mousehide 			" скрывать мышь в режиме ввода текста
set background=dark		" тёмная тема 
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h15 " font
set clipboard=unnamed 	" во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
set history=128 		" хранить больше истории команд
set whichwrap=b,<,>,[,],l,h " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.

" Настройка для поиска в файле
set ignorecase          " ics - поиск без учёта регистра символов
set smartcase           " - если искомое выражения содержит символы в верхнем регистре - ищет с учётом регистра, иначе - без учёта
set nohlsearch          " (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
set incsearch           " поиск фрагмента по мере его набора

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent          " автоматичесий отступ при переносе строки 
set number              " номера строк

let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ }
map ,V :source $MYVIMRC<CR>map ,V :source $MYVIMRC<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

nmap <silent>  ;s  :call ToggleSyntax()<CR>
" comment out highlighted lines according to file type
" put a line like the following in your ~/.vim/filetype.vim file
" and remember to turn on filetype detection: filetype on
" au! BufRead,BufNewFile *.sh,*.tcl,*.php,*.pl let Comment="#"
" if the comment character for a given filetype happens to be @
" then use let Comment="\@" to avoid problems...
function CommentLines()
  "let Comment="#" " shell, tcl, php, perl
  exe ":s@^@".g:Comment."@g"
  exe ":s@$@".g:EndComment."@g"
endfunction
" map visual mode keycombo 'co' to this function
vmap co :call CommentLines()<CR>
