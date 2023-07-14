"--------------------------------------------------------------------------------------------------"
"
" termencoding : terminal display
" encoding : vim internal buffer
" fileencoding : current file,
" fileencodings : possible encoding list for try decoding
set termencoding=utf-8 encoding=utf-8 fileencoding=utf-8 
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb18030,big5,latin1,cp1252,default,latin9
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
"
"--------------------------------------------------------------------------------------------------"
"
" vimdiff
if &diff
    colorscheme evening
    " colorscheme blue
    " colorscheme darkblue
    " colorscheme delek
    " colorscheme desert
    " colorscheme elflord
    " colorscheme evening
    " colorscheme industry
    " colorscheme koehler
    " colorscheme morning
    " colorscheme murphy
    " colorscheme pablo
    " colorscheme peachpuff
    " colorscheme ron
    " colorscheme shine
    " colorscheme slate
    " colorscheme torte
    " colorscheme zellner
endif
"
"--------------------------------------------------------------------------------------------------"
"
set hlsearch
set nocompatible
set backspace=indent,eol,start
set backspace=2

set nu cursorline cursorcolumn nowrap showcmd history=10000 nobackup noswapfile showmatch 
set autoindent cindent
syntax enable 
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"
set foldmethod=syntax   "autoindent fold by syntax description
" set fdm=manual         " manual fold
set foldmethod=indent
" 打开关闭折叠
" zv 查看此行
" zm 关闭折叠
" zM 关闭所有
" zr 打开
" zR 打开所有
" zc 折叠当前行
" zo 打开当前折叠
" zd 删除折叠
" zD 删除所有折叠
"
"--------------------------------------------------------------------------------------------------"
" tab -> space
" expandtab: this option makes sure that spaces are used for indenting lines, 
"           even when you press the 'tab' key.
" tabstop: takes a numerical value. let's say i typed set tabstop=2, 
"           this will insert 2 spaces for a line indent.
" shiftwidth: manages the indentation when you use the '>>' or '<<' operators to 
"           add or remove indentation to an already existing line/block of code.
set autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4 smarttab
" show tab : set list
" show tab espace
" set list（TAB 键显示为 ^I，$ 显示在每行的结尾，方便找到被忽略的空白字符）
" set listchars=tab:>-,trail:-（TAB 会被显示成 ">—"，而行尾多余的空白字符显示成 "-"）


" TAB替换为空格：
" set ts=4
" set expandtab
" retab! （加 ! 是用于处理非空白字符之后的 TAB，即所有的 TAB；若不加 !，则只处理行首的 TAB）


" 空格替换为TAB：
" set ts=4
" set noexpandtab
" retab! （加 ! 是用于处理非空白字符之后的 TAB，即所有的 TAB；若不加 !，则只处理行首的 TAB）

" 1,50s/from/to/ （表示在第 1 行到第 50 行进行搜索和替换）

"--------------------------------------------------------------------------------------------------"
" Bracket auto matching
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

function! RemovePairs()
    let s:line = getline(".")
    let s:previous_char = s:line[col(".")-1]

    if index(["(","[","{"],s:previous_char) != -1
        let l:original_pos = getpos(".")
        execute "normal %"
        let l:new_pos = getpos(".")
        " only right (
        if l:original_pos == l:new_pos
            execute "normal! a\<BS>"
            return
        end

        let l:line2 = getline(".")
        if len(l:line2) == col(".")
            execute "normal! v%xa"
        else
            execute "normal! v%xi"
        end
    else
        execute "normal! a\<BS>"
    end
endfunction

function! RemoveNextDoubleChar(char)
    let l:line = getline(".")
    let l:next_char = l:line[col(".")]

    if a:char == l:next_char
        execute "normal! l"
    else
        execute "normal! i" . a:char . ""
    end
endfunction

inoremap <BS> <ESC>:call RemovePairs()<CR>a
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a
"--------------------------------------------------------------------------------------------------"
" a.vim
" A few of quick commands to swtich between source files and header files quickly.
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <Leader>ih switches to file under cursor
" <Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
" <Leader>ihn cycles through matches
" 
" E.g. if you are editing foo.c and need to edit foo.h 
" simply execute :A and you will be editting foo.h, to switch back to foo.c execute :A again. 
"--------------------------------------------------------------------------------------------------"
"
" taglist
" https://vim-taglist.sourceforge.net/manual.html
" let winManagerWindowLayout = 'FileExplorer|TagList'
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Display_Prototype = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 60

" ctags configure
" "set autochdir   " automatic find tags by upward recursion
set tags+=./tags;
" ta xxx    jump to the first definition of the symbol xxx
" ts xxx    list all definition of the symbol xxx
" tj xxx    if the definition is only, like ta; otherwise, like ts
"
"--------------------------------------------------------------------------------------------------"

" cscope
"--------------------------------------------------------------------------------------------------"
"--------------------------------------------------------------------------------------------------"

" winmanager
"--------------------------------------------------------------------------------------------------"
" let loaded_winmanager = 1
" let AutoOpenWinManager = 1
"--------------------------------------------------------------------------------------------------"


"--------------------------------------------------------------------------------------------------"
" nerd tree
" let NERDTree = 1
" let loaded_nerd_tree = 1
" let NERDTreeShowLineNumbers = 1
" open nerd tree when open vim
let NERDTreeWinPos = 1
" let NERDTreeMinimalUI=1
" let NERDChristmasTree=1
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

"
" when open nerdtree plugin, cursor still on file 
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
"
"--------------------------------------------------------------------------------------------------"


" vim vundle : vim plugin manager
"--------------------------------------------------------------------------------------------------"
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"
"" alternatively, pass a path where Vundle should install plugins
"" call vundle#begin('~/some/path/here')
"call vundle#begin()
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'preservim/nerdtree'
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
"" filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
""--------------------------------------------------------------------------------------------------"


"--------------------------------------------------------------------------------------------------"
nmap <F1> :w<CR><CR>
nmap <F2> :wq<CR><CR>
nmap <F3> :q<CR><CR>
nmap <F4> :q!<CR><CR>
nmap <F6> :<C-w,l><CR>
nmap <F8> :TlistToggle<CR><CR>
nmap <F9> :NERDTreeToggle<CR><CR>
nmap <F10> :AS<CR><CR>
"--------------------------------------------------------------------------------------------------"
"
" bash command
" find ./ -type f -name "*.c" -o -name "*.h" >cscope.file
" cscope.exe -Rbkq
