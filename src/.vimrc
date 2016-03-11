"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" windows gvim设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Linux下使用这段配置
set fileencodings=utf-8,cp936,gb18030,big5,gb2312

" 此处要与secureCRT的terminal设置一致
set termencoding=utf-8

" 此处决定以什么编码格式保存文件
set encoding=utf-8

" Windows下打开下面这段
" 配置多语言环境,解决中文乱码问题
" if has("multi_byte")
"     " UTF-8 编码
"     set encoding=utf-8
"     set termencoding=utf-8
"     set formatoptions+=mM
"     set fencs=utf-8,gbk
" endif

" set mapleader
"译注:映射快捷键开始命令为","号,g:表示全局设置.其使用方法见下
let mapleader = ";"
let g:mapleader = ";"

"那么这里可以用,w命令来代替:w!命令,亲自试一下,是不是方便多了,手不
"用再挪大半个键盘打几个键了.mapleader可以自由设定
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>wq :wq<cr>

if has("win32")
 "本句的意思是快速重读配置文件,这样,就不需要关闭文件重开一下来读入
 map <silent> <leader>s :source $vim/_vimrc<cr>
 "译注:上面的那一句看懂了,这句就很简单了,这是快速打开配置文件
 map <silent> <leader>e :call SwitchToBuf("$vim/_vimrc")<cr>
 "译注:autocmd是自动执行命令,这句的意思是当配置文件被更改后重新
 autocmd! bufwritepost _vimrc source $vim/_vimrc
else
 map <silent> <leader>s :source ~/.vimrc<cr>
 map <silent> <leader>e :call SwitchToBuf("~/.vimrc")<cr>
 autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" history文件中需要记录的行数
set history=1024

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 语法高亮
syntax on
syntax enable

" 设置配色方案
colo torte

"显示行号
set nu

set lbr

" 设置当文件被改动时自动载入
set autoread

" 高亮当前行
set cursorline

" 让 gvim 支持 Alt+n 来切换标签页
autocmd VimEnter * call BufPos_Initialize()

" 译注:设置文件类型,是UNIX文件,DOS文件还是Mac文件
set ffs=unix,dos,mac "Default file types

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" => Fuzzy finder
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD **/<CR>
catch
endtry

"译注:本句的作用是移走Windows下的^M字符
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"译注:在指定目录下创建一个临时文件
map <leader>q :e ~/buffer<cr>

" 用户目录变量$VIMFILES
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

"保存一下,是不是超酷的效果啊,颜色请自行配置,一定要和背景色有反差
" 光标十字架
if has("gui_running")
set cursorline
  hi cursorline guibg=#333333
  set cursorcolumn
  hi CursorColumn guibg=#333333
endif

"译注:切换到当前目录
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 不要备份文件（根据自己需要取舍）
set nobackup

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

" 增强模式中的命令行自动完成操作
set wildmenu

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
set backspace=eol,start,indent

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 启动的时候不显示那个援助索马里儿童的提示
"set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
set noerrorbells

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"状态行显示内容
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"状态行显示内容
" %F 当前文件名
" %m 当前文件修改状态
" %r 当前文件是否只读
" %Y 当前文件类型
" %{&fileformat} 当前文件编码
" %b 当前光标处字符的 ASCII 码值
" %B 当前光标处字符的十六进制值
" %l 当前光标行号
" %c 当前光标列号
" %V 当前光标虚拟列号 (根据字符所占字节数计算)
" %p 当前行占总行数的百分比
" %% 百分号
" %L 当前文件总行数
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=CWD:\ %r%{CurDir()}%h\ %F%m%r%h\ %w\ \ \ \ \ Line:\ %l/%L:%c
" 显示状态栏 (默认值为 1, 无法显示状态栏)
" 译注:默认情况下,只有两个以上的窗口才显示状态栏.其值定义为
" 本选项的值影响最后一个窗口何时有状态行:
" 0: 永不
" 1: 只有在有至少两个窗口时
" 2: 总是
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set 7 lines to the curors - when moving vertical..
set so=7

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set magic on
set magic

"How many tenths of a second to blink
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动格式化
"set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

"译注:开启新行时使用智能自动缩进
set smartindent

" 使用C样式的缩进
"set cindent

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
" set noexpandtab

" 使用空格代替制表符
set expandtab

" 不要换行
"set nowrap

" 在行和段开始处使用制表符
set smarttab

" 设置每行120个字符自动换行
"set textwidth=120

" 折叠代码
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevel=100           " 文件打开时不折叠
set foldclose=all           " 设置为自动关闭折叠                           

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"菜单栏、工具栏显示与隐藏的切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guioptions-=T
set guioptions-=m
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>

"窗口最大化
au GUIEnter * simalt ~x "maximum the initial window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动实例括号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vnoremap可视模式,使用$1来输入()
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" 使用$2来输入()
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" 使用$3来输入()
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" 使用$$来输入()
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" 使用$q来输入()
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
" 使用$e来输入()
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i

"用于编辑中文的前后双引号,自己编辑常用的成对符号时,一定要注意,
"前面的符号放在<i后,后面的符号放在>a后,不要反了
"vnoremap $w <esc>`>a"<esc>`<i"<esc>
"vnoremap $w <esc>`>a><esc>`<i<<esc>
"vnoremap $w <esc>'>a”<esc>`<i“<esc>

" 用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" 在vim冒号命令行可以像linux命令行一样使用ctrl+[aekpn]
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" 在命令行模式下使用alt+[jk]可以让光标后的文本向上或向下移动
" 在插入模式下使用ctrl+[jk]可以让光标后的文本向上或向下移动
" 上面两行是gvim自己就有的功能


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
"map <space> /
"map <c-space> ?
"map <silent> <leader><cr> :noh<cr>

" 译注:窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 译注: ,bd命令快速关闭当前缓冲区文件
map <leader>bd :Bclose<cr>

" 译注: ,ba命令快速关闭所有缓冲区文件
map <leader>ba :1,300 bd!<cr>

" Tab configuration
map <leader>tn :tabnew %<cr> " 译注:将当前内容在新标签中打开
map <leader>te :tabedit      " 译注:打开空白新标签
map <leader>tc :tabclose<cr> " 译注:关闭当前标签
map <leader>tm :tabmove      " 译注:移动当前标签,使用方法为

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Specify the behavior when switching between buffers
"try
  "set switchbuf=usetab
  "set stal=2
"catch
"endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" minibufexpl插件的一般设置
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
" minibuffer操作快捷方式!
" nnoremap <TAB> :MBEbn<CR>
" nnoremap <C-TAB> :MBEbp<CR>
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"译注:右方向键切换到下一个缓冲区文件
" map <right> :bn<cr>
"译注:左方向键切换到上一个缓冲区文件
" map <left> :bp<cr>
"译注:删除一个缓冲区文件时,不关闭窗口


" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 ,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" win manager
" 布局规划变量
let g:winManagerWindowLayout = 'FileExplorer'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
map <C-W><C-F> :FirstExplorerWindow<cr>
map <C-W><C-B> :BottomExplorerWindow<cr>
map <C-W><C-T> :WMToggle<cr>

 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动补齐括号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap < <><ESC>i
" :inoremap > <c-r>=ClosePair('>')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数定义
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if file not opened, create a new tab, or switch to the opened file
function! SwitchToBuf(filename)
 " find in current tab
 let bufwinnr = bufwinnr(a:filename)
 if bufwinnr != -1
 exec bufwinnr . "wincmd w"
 return
 else
 " search each tab
 tabfirst
 let tb = 1
 while tb <= tabpagenr("$")
 let bufwinnr = bufwinnr(a:filename)
 if bufwinnr != -1
 exec "normal " . tb . "gt"
 exec bufwinnr . "wincmd w"
 return
 endif
 tabnext
 let tb = tb +1
 endwhile
 " not exist, new tab
 exec "tabnew " . a:filename
 endif
endfunction


function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


function! BufPos_ActivateBuffer(num)
 let l:count = 1
 for i in range(1, bufnr("$"))
 if buflisted(i) && getbufvar(i, "&modifiable")
 if l:count == a:num
 exe "buffer " . i
 return
 endif
 let l:count = l:count + 1
 endif
 endfor
 echo "No buffer!"
endfunction
function! BufPos_Initialize()
 for i in range(1, 9)
 exe "map <M-" . i . "> :call BufPos_ActivateBuffer(" . i . ")<CR>"
 endfor
 exe "map <M-0> :call BufPos_ActivateBuffer(10)<CR>"
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction


" 译注:简单说一下其功能,设置了一个函数CurDir(),该函数调用了getcwd()
" 函数,getcwd()的作用是返回当前路径这个值.
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" 启用omnicppcomplete
set nocp
filetype plugin on

" ctags生成tags 及 cscope生成.out文件
" map <C-t> :!touch cstags.dir; ctags -R --c++-kinds=+p --fields=+iaS --extra=+q `cat cstags.dir`; cscope `awk '{print "-I"$0}' cstags.dir` -Rbkq <CR> 
map <C-t> :! ~/.vim/scripts/retag <CR> 
" map <C-c> :!touch cstags.dir; cscope `awk '{print "-I"$0}' cstags.dir` -Rbkq <CR> 
" map <C-x> :qa <CR>
map <C-e> :!

nmap <F9> :cp<CR>
nmap <F10> :cn<CR>

" taglist相关
nnoremap <silent> <F8> :TlistToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不使用swp文件
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 区分大小写
set noic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 给set paste和set nopaste添加快捷键
" map <C-5> :set paste<CR> 
" map <C-6> :set nopaste<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠选项设定
" set foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag 和 cscope文件的添加

set tags+=~/tags/tags

cs add ~/tags/cscope.out

" ------------------------------------------------------------------ 
" Desc: OmniCppComplete
" ------------------------------------------------------------------ 

" set Ctrl+j in insert mode, like VS.Net
" imap <unique> <C-]> <C-X><C-O>
" :inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>" 

" set completeopt as don't show menu and preview
set completeopt=menuone

" use global scope search
let OmniCpp_GlobalScopeSearch = 1

" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2

" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1

" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0

" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1

" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1

" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
" let OmniCpp_DefaultNamespaces = ["std", "SEC"]

" Complete Behaviour
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1

" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

command! E Explore

" Disable Undo file
set noundofile

" 按一下 ; 后再按一下 f 窗口高度 + 15
nmap <leader>f :res +15<cr>
" 按一下 ; 后再按一下 g 窗口宽度 + 30
nmap <leader>g :vertical res +30<cr>

