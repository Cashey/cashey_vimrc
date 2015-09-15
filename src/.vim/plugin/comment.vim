if exists("loaded_vimrc_by_lennon")
    finish
endif
let loaded_vimrc_by_lennon = 1
" Author Lennon
" ==============================================================
" **                       C文件快捷方式                      **
" ==============================================================
let s:author = "casheywen"

" 生成源代码的标准文件头注释
function F_FILEHEAD()
    call append(0, "/******************************************************************************")
    call append(1, " * 文件名称：".bufname("%"))
    call append(2, " * 文件描述：") 
    call append(3, " * 创建日期：".strftime("%Y-%m-%d"))
    call append(4, " * 作    者：".s:author)
    call append(5, " ******************************************************************************/")
endfunc
command! -nargs=0 CodeHead :call F_FILEHEAD()

function F_INITHEADFILE(prefix)
    let macro_name = "_".toupper(a:prefix)."_".substitute(toupper(bufname("%")), '[^A-Z]\+', "_", "g")."_INCLUDED_"
    call F_FILEHEAD()
    call append(6, "#ifndef ".macro_name)
    call append(7, "#define ".macro_name)
    call append(8, "")
    call append(9, "")
    call append(10, "")
    call append(11, "#endif")
endfunc
command! -nargs=1 InitHead :call F_INITHEADFILE("<args>")

function F_DEFHEADFILE()
    let macro_name = "_".substitute(toupper(bufname("%")), '[^A-Z]\+', "_", "g")."_INCLUDED_"
    call append(6, "#ifndef ".macro_name)
    call append(7, "#define ".macro_name)
    call append(8, "")
    call append(9, "")
    call append(10, "")
    call append(11, "#endif")
endfunc
command! -nargs=0 DefHead :call F_DEFHEADFILE()

function F_INITCHEADFILE(prefix)
    let macro_name = "_".toupper(a:prefix)."_".substitute(toupper(bufname("%")), '[^A-Z]\+', "_", "g")."_INCLUDED_"
    call F_FILEHEAD()
    call append(6, "#ifndef ".macro_name)
    call append(7, "#define ".macro_name)
    call append(8, "")
    call append(9, "#ifdef __cplusplus")
    call append(10, "extern \"C\" { ")
    call append(11, "#endif")
    call append(12, "")
    call append(13, "// TODO: Add your code here.")
    call append(14, "")
    call append(15, "#ifdef __cplusplus")
    call append(16, "}")
    call append(17, "#endif")
    call append(18, "")
    call append(19, "#endif")
endfunc
command! -nargs=1 InitCHead :call F_INITCHEADFILE("<args>")

" 生成源代码的标准函数头注释
function F_FUNCHEAD()
    let prefix = strpart(getline("."), 0, col(".") - 1)
    " 获取函数名
    let funcname = matchstr(getline("."), ' [a-zA-Z0-9_]\+(')
    let funcname = strpart(funcname, 1, strlen(funcname) - 2)
    " 获取参数列表
    let param_line = matchstr(getline("."), '([ a-zA-Z0-9_,*&\[\]]\+)') "add \[\] 
    let param_line = strpart(param_line, 1, strlen(param_line) - 2)

    call append(line(".")-1, prefix."/******************************************************************************")
    call append(line(".")-1, prefix." * 函数名称：".funcname)
    call append(line(".")-1, prefix." * 函数描述: ")
    let tmp = param_line
    let param_idx = stridx(tmp, ",")
    while param_idx >= 0
        let param = strpart(tmp, 0, param_idx)
        let param = substitute(param, '^[ ]\+', "", "g") " trim left
        let param = substitute(param, '[ \[\]]\+$', "", "g") " trim right | add \[\]
        let lastspace = strridx(param, " ")
        if (lastspace >= 0)
            let param = strpart(param, lastspace + 1)
            if (strpart(param, 0, 1) == "*" || strpart(param, 0, 1) == "&")
                let param = strpart(param, 1)
            endif
        else
            let param = "(".param.")"
        endif
        call append(line(".")-1, prefix." * 输入参数：".param)
        let tmp = strpart(tmp, param_idx + 1)
        let param_idx = stridx(tmp, ",")
    endwhile
    if (strlen(tmp) > 0)
        let param = substitute(tmp, '^[ ]\+', "", "g") " trim left
        let param = substitute(param, '[ \[\]]\+$', "", "g") " trim right |  add \[\]
        let lastspace = strridx(param, " ")
        if (lastspace >= 0)
            let param = strpart(param, lastspace + 1)
            if (strpart(param, 0, 1) == "*")
                let param = strpart(param, 1)
            endif
        else
            let param = "(".param.")"
        endif
        call append(line(".")-1, prefix." * 输入参数：".param)
    endif
    call append(line(".")-1, prefix." * 返回值  : ")
    call append(line(".")-1, prefix." * 创建日期: ".strftime("%Y-%m-%d"))
    call append(line(".")-1, prefix." * 作    者：".s:author)
    call append(line(".")-1, prefix." * 修改历史: ")
    call append(line(".")-1, prefix." ******************************************************************************/")
endfunc
command! -nargs=0 FuncHead :call F_FUNCHEAD() 
function F_SOCKAPP()
    call append( 0, "#include <stdio.h>")
    call append( 1, "#include <unistd.h>")
    call append( 2, "#include <sys/socket.h>")
    call append( 3, "#include <netinet/in.h>")
    call append( 4, "");
    call append( 5, "int main(int argc, char *argv[])")
    call append( 6, "{")
    call append( 7, "    int iSock = 0;")
    call append( 8, "    struct sockaddr_in stAddr = {0};")
    call append( 9, "    if ((iSock = socket(AF_INET, SOCK_DGRAM, 0)) < 0)")
    call append(10, "    {")
    call append(11, "        perror(\"socket\");")
    call append(12, "        return -1;")
    call append(13, "    }")
    call append(14, "    stAddr.sin_family = AF_INET;")
    call append(15, "    stAddr.sin_port = htons(XXX);")
    call append(16, "    stAddr.sin_addr.s_addr = inet_addr(\"\");")
    call append(17, "    return 0;")
    call append(18, "}")
endfunc

command! -nargs=0 Sockapp :call F_SOCKAPP()

function F_MODIFY()
    call append(line(".")-1, "\/* Modified by ".s:author." ".strftime("%Y-%m-%d").": ### */")
endfunc
command! -nargs=0 Modify :call F_MODIFY()


function F_NOTE()
    call append(line(".")-1, "\/* Note by ".s:author." ".strftime("%Y-%m-%d").": ### */")
endfunc
command! -nargs=0 Note :call F_NOTE()


function F_BEGIN()
    call append(line(".")-1, "\/*===== BEGIN ".s:author." ".strftime("%Y-%m-%d").": ###=====*/")
endfunc
command! -nargs=0 Begin :call F_BEGIN()


function F_END()
    call append(line(".")-1, "\/*===== END ".s:author." ".strftime("%Y-%m-%d")." =====*/")
endfunc
command! -nargs=0 End :call F_END()
