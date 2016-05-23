## 安装条件

1. vim版本为7.3以上

2. ctags、cscope已经安装（开发机一般都已经装了）


> **相关软件最新版下载地址：**
> 
> http://www.vim.org/
>
> http://vim.org
> 
> http://ctags.sourceforge.net/
> 
> 编译vim时建议 `./configure --with-features=huge`  将全部功能包含进来。
> 
> 如果是自家电脑，直接 `apt-get` 或 `yum` 安装即可。

## 如何安装

下载 [install_vimrc.tgz](https://github.com/DeepinW/vimrc/blob/master/Installer/install_vimrc.tgz)，解压并执行目录中的`Install.sh`。

执行完毕后，即安装完成。你的旧`vim`配置被打包备份在`~/oldvim`中，同时你的`.bashrc`会被增加一行内容，为了安全起见，旧的`.bashrc`也在一起打包在备份文件中。

安装完后，需要`source ~/.bashrc`，这样下文中提到的`shell`命令`retag`和`genmake`才能使用。

## 如何使用

此处主要介绍本vim配置文件提供的功能，vim自带功能不着重介绍。

### 代码跳转

#### 1. 创建tags索引

直接执行`retag`命令。

如果是第一次使用，执行`retag`命令后会提示类似这样的信息：

    Directory list not set, please add your directory paths to /home/casheywen/tags/directory.txt

此时`~/tags`目录及里面的目录列表文件`~/tags/directory.txt`已经创建。

此时我们在`~/tags/directory.txt`里添加一行，内容为一个代码目录路径，然后再执行`retag`：

	echo ~/QQMail/antispam >> ~/tags/directory.txt
	retag

这样所有在该目录下的代码文件就全部被创建了索引，索引文件在`~/tags/tags`。

如果你有多个目录需要索引，你可以在`~/tags/directory.txt`里添加多行，每行为一个代码路径。路径越多索引时间越长，请酌量添加。

如果代码被修改，则需要重新索引建立索引，此时还是调用`retag`命令。

#### 2. vim中使用跳转

此时我们打开文件一个文件查看：

	vim ~/QQMail/antispam/mmspamchecksvr/mmbizspamhelper.cpp

![enter image description here](http://localhost/using-tags.gif)

这里用到了一些快捷键，用快捷键之前先按`ESC`切换到命令模式：

1. 跳转进入光标下符号：`Ctrl + ]`
2. 后退：`Ctrl + o`
3. 前进：`Ctrl + i`

## 符号高亮

![enter image description here](http://localhost/highlight.gif)

这里用到的快捷键会稍复杂一些，大家操作时按顺序按，确保在命令模式下：

	[ESC]
	... (移动光标到你要高亮或取消高亮的词)
	Ctrl + \
	m

以上高亮效果是全字匹配的，如果你需要匹配一部分，可以在命令模式下输入：

	:Mark iLocal
![enter image description here](http://localhost/mark.png)

至于全字匹配，也可以用输入命令的方式：

	:MarkOneWord md5

这样会全字匹配高亮`md5`。

如果要不区分大小写，可以用`vim`中的大小写开关来控制：

	:set ic
	:set noic

上面分别为设置区分大小写和设置不区分大小写（`ic = ignore case`）。

## 函数列表窗口

按下`[F8]`后，窗口左侧会展示函数列表窗口：

![enter image description here](http://localhost/function-list.png)

按快捷键 `ctrl + w`或 `ctrl + h` 可切到该函数列表窗口。

光标移动到该窗口的某个函数、符号名上，按下`[ENTER]`，则会在右侧窗口中自动跳转到该函数、符号的定义处。

> **注：**
> 
>  `ctrl + w` 为 vim原生窗口切换快捷键，多次按下会在多个窗口间来回切换。
>  
>  `ctrl + h` 为配置文件定义的向左切换窗口，同时还有：`ctrl + l`向右切换窗口、`ctrl + h`向上切换窗口、`ctrl + j`向下切换窗口。

## 代码补全

本配置中集成的代码补全插件为`Omnicppcomplete`，效果如下：

![enter image description here](http://localhost/complete.gif)

这里的补全是基于`tags`的，所以如果补全出不来，请确定把路径添加到了`~/tags/directory.txt`，并调用`retag`。

此处用到的快捷键：

`[Ctrl + n]` 下一处补全
`[Ctrl + p]` 前一处补全

## 编译整合

![enter image description here](http://localhost/compile.gif)

`vim`本身有自带对`make`的整合，对于使用`make`进行编译的项目，可以直接在`vim`的命令模式下输入：

	:make

这样效果等同于在`shell`下执行`make`命令，但`vim`会解析`make`的输出，然后我们可以按下`[F9]`、`[F10]`跳到下一处错误、前一处错误（若有warning也会跳到该处），这里的跳转是可以跨文件的，尽管示例中只使用了一个文件。

> **注：**
> 
> 这里的`[F9]`、`[F10]`为配置文件定义的快捷键，在无配置文件的`vim`下可使用`:cn`、`:cp`跳转。

如果对这样的查看方式不满意，还可以使用`:copen`打开`查看窗口`，并在该窗口内查找对应的错误。有些项目中有大量`warning`，如果只想看`error`可以在`查看窗口`中搜索`error:`，然后在对应行按下`[ENTER]`即可快速跳到错误点。

## 编码配置

	" Linux下使用这段配置
	set fileencodings=utf-8,cp936,gb18030,big5,gb2312
	
	" 此处要与secureCRT的terminal设置一致
	set termencoding=utf-8
	
	" 此处决定以什么编码格式保存文件
	set encoding=utf-8

以上为配置文件`.vimrc`中默认对编码的设定，默认的`termencoding`及`encoding`都是`utf-8`。

即你的`SecureCRT`设置的终端编码为`utf-8`，并且编辑后保存的文件编码也为`utf-8`。

如果有需要，请自己修改`.vimrc`中对应行的编码。
