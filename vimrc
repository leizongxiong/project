set nocompatible
set number
set tabstop=4
set shiftwidth=4
set guioptions=m
set guioptions=T
set softtabstop=4
set autoindent
set smartindent
set mouse=a
set cin 
set showcmd
set encoding=utf-8
set fileencodings=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set fileencoding=gb2312
set termencoding=utf-8

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
let g:snips_author="leizongxiong"
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

"运行可执行文件
func! CompileCode()
        exec "w"
        if &filetype == "c"
            exec "!gcc -Wall -std=c99 %<.c -o %<"
        elseif &filetype == "cpp"
            exec "!g++ -Wall -std=c++98 %<.cpp -o %<"
        elseif &filetype == "java"
            exec "!javac %<.java"
        elseif &filetype == "haskell"
            exec "!ghc --make %<.hs -o %<"
        elseif &filetype == "lua"
            exec "!lua %<.lua"
        elseif &filetype == "perl"
            exec "!perl %<.pl"
        elseif &filetype == "python"
            exec "!python %<.py"
        elseif &filetype == "ruby"
            exec "!ruby %<.rb"
        endif
endfunc

" 运行可执行文件
func! RunCode()
        exec "w"
        if &filetype == "c" || &filetype == "cpp" || &filetype == "haskell"
            exec "! ./%<"
        elseif &filetype == "java"
            exec "!java %<"
        elseif &filetype == "lua"
            exec "!lua %<.lua"
        elseif &filetype == "perl"
            exec "!perl %<.pl"
        elseif &filetype == "python"
            exec "!python %<.py"
        elseif &filetype == "ruby"
            exec "!ruby %<.rb"
        endif
endfunc

" Ctrl + C 一键保存、编译
map <c-c> :call CompileCode()<CR>
imap <c-c> <ESC>:call CompileCode()<CR>
vmap <c-c> <ESC>:call CompileCode()<CR>

" Ctrl + R 一键保存、运行
map <c-r> :call RunCode()<CR>
imap <c-r> <ESC>:call RunCode()<CR>
vmap <c-r> <ESC>:call RunCode()<CR>

"cscope setting
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:cs add /home/zxlei/programming/vim72/cscope.out /home/zxlei/programming/vim72
"the directory of tags
set tags=tags;
set tags+=~/.vim/systags
set tags+=/var/www/project/tags
set autochdir

"taglist setting
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"winManageWindowLayout setting
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
"cscope setting
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"cs add /home/zxlei/programming/cscope.out /home/zxlei/programming
""nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>

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

"omnicppcomplete setting

"let g:OmniCpp_NamespaceSearch=1
"let g:OmniCpp_GlobalScopeSearch=1
"let g:OmniCpp_DisplayMode =1
"let g:OmniCpp_ShowScopeInAbbr=1
"let g:OmniCpp_ShowPrototypeInAbbr=1
"let g:OmniCpp_ShowAccess=1
"let g:OmniCpp_DefaultNamespaces=0
"let g:OmniCpp_MayCompleteDot=1
"let g:OmniCpp_MayCompleteArray=1
"let g:OmniCpp_MayCompleteScope=1
"let g:OmniCpp_SelectFirstItem=2

"ctags seting 
map <C-F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
map <silent> <F5> :!ctags -R --c-kinds=+p --fields=+ialS --extra=+q .<CR>  
"neocomplcache setting
let g:acp_enableAtStartup = 0 
let g:neocomplcache_enable_at_startup = 1 
let g:neocomplcache_enable_smart_case = 1 
let g:neocomplcache_enable_quick_match = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"pydiction setting"
let g:pydiction_location="~/.vim/dict/complete-dict"
