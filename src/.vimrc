"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" windows gvim�趨
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" һ���趨
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Linux��ʹ���������
set fileencodings=utf-8,cp936,gb18030,big5,gb2312

" �˴�Ҫ��secureCRT��terminal����һ��
set termencoding=utf-8

" �˴�������ʲô�����ʽ�����ļ�
set encoding=utf-8

" Windows�´��������
" ���ö����Ի���,���������������
" if has("multi_byte")
"     " UTF-8 ����
"     set encoding=utf-8
"     set termencoding=utf-8
"     set formatoptions+=mM
"     set fencs=utf-8,gbk
" endif

" set mapleader
"��ע:ӳ���ݼ���ʼ����Ϊ","��,g:��ʾȫ������.��ʹ�÷�������
let mapleader = ";"
let g:mapleader = ";"

"��ô���������,w����������:w!����,������һ��,�ǲ��Ƿ������,�ֲ�
"����Ų�������̴򼸸�����.mapleader���������趨
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>wq :wq<cr>

if has("win32")
 "�������˼�ǿ����ض������ļ�,����,�Ͳ���Ҫ�ر��ļ��ؿ�һ��������
 map <silent> <leader>s :source $vim/_vimrc<cr>
 "��ע:�������һ�俴����,���ͺܼ���,���ǿ��ٴ������ļ�
 map <silent> <leader>e :call SwitchToBuf("$vim/_vimrc")<cr>
 "��ע:autocmd���Զ�ִ������,������˼�ǵ������ļ������ĺ�����
 autocmd! bufwritepost _vimrc source $vim/_vimrc
else
 map <silent> <leader>s :source ~/.vimrc<cr>
 map <silent> <leader>e :call SwitchToBuf("~/.vimrc")<cr>
 autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���
set nocompatible

" history�ļ�����Ҫ��¼������
set history=1024

" ����ļ�����
filetype on

" �����ļ����Ͳ��
filetype plugin on

" Ϊ�ض��ļ�����������������ļ�
filetype indent on

" �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-

" �﷨����
syntax on
syntax enable

" ������ɫ����
colo torte

"��ʾ�к�
set nu

set lbr

" ���õ��ļ����Ķ�ʱ�Զ�����
set autoread

" ������ǰ��
set cursorline

" �� gvim ֧�� Alt+n ���л���ǩҳ
autocmd VimEnter * call BufPos_Initialize()

" ��ע:�����ļ�����,��UNIX�ļ�,DOS�ļ�����Mac�ļ�
set ffs=unix,dos,mac "Default file types

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" => Fuzzy finder
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD **/<CR>
catch
endtry

"��ע:���������������Windows�µ�^M�ַ�
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"��ע:��ָ��Ŀ¼�´���һ����ʱ�ļ�
map <leader>q :e ~/buffer<cr>

" �û�Ŀ¼����$VIMFILES
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

"����һ��,�ǲ��ǳ����Ч����,��ɫ����������,һ��Ҫ�ͱ���ɫ�з���
" ���ʮ�ּ�
if has("gui_running")
set cursorline
  hi cursorline guibg=#333333
  set cursorcolumn
  hi CursorColumn guibg=#333333
endif

"��ע:�л�����ǰĿ¼
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �ļ�����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ��Ҫ�����ļ��������Լ���Ҫȡ�ᣩ
set nobackup

" ��Ҫ����swap�ļ�����buffer��������ʱ��������
setlocal noswapfile
set bufhidden=hide

" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu

" ��״̬������ʾ�������λ�õ��кź��к�
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set cmdheight=1

" ʹ�ظ����backspace����������indent, eol, start��
set backspace=2
set backspace=eol,start,indent

" ����backspace�͹�����Խ�б߽�
set whichwrap+=<,>,h,l

" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ
"set shortmess=atI

" ͨ��ʹ��: commands������������ļ�����һ�б��ı��
set report=0

" ����vim��������ĵε���
set noerrorbells

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ������ƥ��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ������ʾƥ�������
set showmatch

" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set matchtime=5

" ��������ʱ����Դ�Сд
set ignorecase

" ������ʱ������Ĵʾ�����ַ�����������firefox��������
set incsearch

" ����:set list������Ӧ����ʾЩɶ��
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���
set scrolloff=3

" ��Ҫ��˸
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"״̬����ʾ����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"״̬����ʾ����
" %F ��ǰ�ļ���
" %m ��ǰ�ļ��޸�״̬
" %r ��ǰ�ļ��Ƿ�ֻ��
" %Y ��ǰ�ļ�����
" %{&fileformat} ��ǰ�ļ�����
" %b ��ǰ��괦�ַ��� ASCII ��ֵ
" %B ��ǰ��괦�ַ���ʮ������ֵ
" %l ��ǰ����к�
" %c ��ǰ����к�
" %V ��ǰ��������к� (�����ַ���ռ�ֽ�������)
" %p ��ǰ��ռ�������İٷֱ�
" %% �ٷֺ�
" %L ��ǰ�ļ�������
" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩
set statusline=CWD:\ %r%{CurDir()}%h\ %F%m%r%h\ %w\ \ \ \ \ Line:\ %l/%L:%c
" ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
" ��ע:Ĭ�������,ֻ���������ϵĴ��ڲ���ʾ״̬��.��ֵ����Ϊ
" ��ѡ���ֵӰ�����һ�����ں�ʱ��״̬��:
" 0: ����
" 1: ֻ������������������ʱ
" 2: ����
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
" �ı���ʽ���Ű�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" �Զ���ʽ��
"set formatoptions=tcrqn

" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
set autoindent

"��ע:��������ʱʹ�������Զ�����
set smartindent

" ʹ��C��ʽ������
"set cindent

" �Ʊ��Ϊ4
set tabstop=4

" ͳһ����Ϊ4
set softtabstop=4
set shiftwidth=4

" ��Ҫ�ÿո�����Ʊ��
" set noexpandtab

" ʹ�ÿո�����Ʊ��
set expandtab

" ��Ҫ����
"set nowrap

" ���кͶο�ʼ��ʹ���Ʊ��
set smarttab

" ����ÿ��120���ַ��Զ�����
"set textwidth=120

" �۵�����
set foldenable              " ��ʼ�۵�
set foldmethod=syntax       " �����﷨�۵�
set foldcolumn=0            " �����۵�����Ŀ��
setlocal foldlevel=1        " �����۵�����Ϊ
set foldlevel=100           " �ļ���ʱ���۵�
set foldclose=all           " ����Ϊ�Զ��ر��۵�                           

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�˵�������������ʾ�����ص��л�
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

"�������
au GUIEnter * simalt ~x "maximum the initial window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�Զ�ʵ������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vnoremap����ģʽ,ʹ��$1������()
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" ʹ��$2������()
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" ʹ��$3������()
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" ʹ��$$������()
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" ʹ��$q������()
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
" ʹ��$e������()
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i

"���ڱ༭���ĵ�ǰ��˫����,�Լ��༭���õĳɶԷ���ʱ,һ��Ҫע��,
"ǰ��ķ��ŷ���<i��,����ķ��ŷ���>a��,��Ҫ����
"vnoremap $w <esc>`>a"<esc>`<i"<esc>
"vnoremap $w <esc>`>a><esc>`<i<<esc>
"vnoremap $w <esc>'>a��<esc>`<i��<esc>

" �ÿո���������۵�
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

" ��vimð�������п�����linux������һ��ʹ��ctrl+[aekpn]
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ��������ģʽ��ʹ��alt+[jk]�����ù�����ı����ϻ������ƶ�
" �ڲ���ģʽ��ʹ��ctrl+[jk]�����ù�����ı����ϻ������ƶ�
" ����������gvim�Լ����еĹ���


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
"map <space> /
"map <c-space> ?
"map <silent> <leader><cr> :noh<cr>

" ��ע:���ڷָ�ʱ,�����л��İ����ȼ���Ҫ��������,������·������ƶ�
"��굽�Ϸ�����,��Ҫ<c-w><c-w>k,�ǳ��鷳,������ӳ��Ϊ<c-k>,�л���
"ʱ����÷ǳ�����.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ��ע: ,bd������ٹرյ�ǰ�������ļ�
map <leader>bd :Bclose<cr>

" ��ע: ,ba������ٹر����л������ļ�
map <leader>ba :1,300 bd!<cr>

" Tab configuration
map <leader>tn :tabnew %<cr> " ��ע:����ǰ�������±�ǩ�д�
map <leader>te :tabedit      " ��ע:�򿪿հ��±�ǩ
map <leader>tc :tabclose<cr> " ��ע:�رյ�ǰ��ǩ
map <leader>tm :tabmove      " ��ע:�ƶ���ǰ��ǩ,ʹ�÷���Ϊ

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Specify the behavior when switching between buffers
"try
  "set switchbuf=usetab
  "set stal=2
"catch
"endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" minibufexpl�����һ������
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
" minibuffer������ݷ�ʽ!
" nnoremap <TAB> :MBEbn<CR>
" nnoremap <C-TAB> :MBEbp<CR>
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"��ע:�ҷ�����л�����һ���������ļ�
" map <right> :bn<cr>
"��ע:������л�����һ���������ļ�
" map <left> :bp<cr>
"��ע:ɾ��һ���������ļ�ʱ,���رմ���


" plugin - NERD_commenter.vim   ע�ʹ����õģ�
" [count],cc �������count���������ע��(7,cc)
" [count],cu �������count������ȡ��ע��(7,cu)
" [count],cm �������count�г�����ӿ�ע��(7,cm)
" ,cA ����β���� ,���ҽ������ģʽ�� ��������дע�͡�
" ע��count������ѡ������Ĭ��Ϊѡ���л�ǰ��
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " ��ע�ͷ������֮����һ���ո�
let NERDCompactSexyComs=1   " ����ע��ʱ���Ӹ��ÿ�

" win manager
" ���ֹ滮����
let g:winManagerWindowLayout = 'FileExplorer'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
map <C-W><C-F> :FirstExplorerWindow<cr>
map <C-W><C-B> :BottomExplorerWindow<cr>
map <C-W><C-T> :WMToggle<cr>

 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �Զ���������
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
" ��������
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


" ��ע:��˵һ���书��,������һ������CurDir(),�ú���������getcwd()
" ����,getcwd()�������Ƿ��ص�ǰ·�����ֵ.
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

" ����omnicppcomplete
set nocp
filetype plugin on

" ctags����tags �� cscope����.out�ļ�
" map <C-t> :!touch cstags.dir; ctags -R --c++-kinds=+p --fields=+iaS --extra=+q `cat cstags.dir`; cscope `awk '{print "-I"$0}' cstags.dir` -Rbkq <CR> 
map <C-t> :!touch cstags.dir; ~/.vim/scripts/retag <CR> 
" map <C-c> :!touch cstags.dir; cscope `awk '{print "-I"$0}' cstags.dir` -Rbkq <CR> 
" map <C-x> :qa <CR>
map <C-e> :!

nmap <F9> :cp<CR>
nmap <F10> :cn<CR>

" taglist���
nnoremap <silent> <F8> :TlistToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��ʹ��swp�ļ�
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���ִ�Сд
set noic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��set paste��set nopaste��ӿ�ݼ�
" map <C-5> :set paste<CR> 
" map <C-6> :set nopaste<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �۵�ѡ���趨
" set foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag �� cscope�ļ������

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


nmap <leader>f :res +15<cr>
nmap <leader>g :vertical res +30<cr>

