set nocompatible
set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set mouse=a
set cin 
set showcmd
set encoding=utf-8
set fileencodings=utf-8,gb18030,usc-bom,euc-jp,gbk,gb2312,cp936
set fileencoding=gb2312
set termencoding=utf-8
set hlsearch

filetype plugin on 
filetype plugin indent on
syntax enable
syntax on 
colorscheme zellner 
set showmatch 
set runtimepath=/usr/share/vim/vim72,~/.vim,~/.vim/after
let $VIMRUNTIME ="/home/zxlei/.vim"
let $VIM="/home/zxlei/.vim/"
let g:snippets_dir="/home/zxlei/.vim/snippets"
" some tip 
inoremap () ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap < <><ESC>i
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
        return a:char
	endif
endfunction
"the directory of tags
set tags=tags;
"set tags+=~/.vim/systags
set autochdir

"taglist setting
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"winManageWindowLayout setting
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"minibuffex setting
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

"a setting
nnoremap <silent> <F12> :A<CR>
let g:alternateExtensions_cxx = "H"
let g:alternateExtensions_H = "cxx"
set completeopt=longest,menu


"grep setting
nnoremap <silent> <F3> :Grep<CR>
"file fold
set foldmethod=syntax
set foldlevel=100

"ctags seting 
map <C-F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
map <silent> <F5> :!ctags -R --c-kinds=+p --fields=+ialS --extra=+q .<CR>  
