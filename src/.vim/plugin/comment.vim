if exists("loaded_cashey_vimrc")
    finish
endif

let loaded_cashey_vimrc = 1
let s:author = ""

" For standard C headers
function F_FILEHEAD()
    call append(0, "/******************************************************************************")
    call append(1, " * Name: ".bufname("%"))
    call append(2, " * Author: ".s:author) 
    call append(3, " * Date: ".strftime("%Y-%m-%d"))
    call append(4, " * Description: ")
    call append(5, " ******************************************************************************/")
endfunc
command! -nargs=0 CodeHead :call F_FILEHEAD()

function F_INITHEADFILE(prefix)
    let macro_name = "_".toupper(a:prefix)."_".substitute(toupper(bufname("%")), '[^A-Z0-9]\+', "_", "g")."_INCLUDED_"
    call F_FILEHEAD()
    call append(line(".")-1, "#ifndef ".macro_name)
    call append(line(".")-1, "#define ".macro_name)
    call append(line(".")-1, "")
    call append(line(".")-1, "")
    call append(line(".")-1, "")
    call append(line(".")-1, "#endif")
endfunc
command! -nargs=1 InitHead :call F_INITHEADFILE("<args>")

function F_DEFHEADFILE()
    let macro_name = "_".substitute(toupper(bufname("%")), '[^A-Z0-9]\+', "_", "g")."_INCLUDED_"
    call append(line(".")-1, "#ifndef ".macro_name)
    call append(line(".")-1, "#define ".macro_name)
    call append(line(".")-1, "")
    call append(line(".")-1, "")
    call append(line(".")-1, "")
    call append(line(".")-1, "#endif")
endfunc
command! -nargs=0 DefHead :call F_DEFHEADFILE()

function F_INITCHEADFILE(prefix)
    let macro_name = "_".toupper(a:prefix)."_".substitute(toupper(bufname("%")), '[^A-Z0-9]\+', "_", "g")."_INCLUDED_"
    call F_FILEHEAD()
    call append(line(".")-1, "#ifndef ".macro_name)
    call append(line(".")-1, "#define ".macro_name)
    call append(line(".")-1, "")
    call append(line(".")-1, "#ifdef __cplusplus")
    call append(line(".")-1, "extern \"C\" { ")
    call append(line(".")-1, "#endif")
    call append(line(".")-1, "")
    call append(line(".")-1, "// TODO: Add your code here.")
    call append(line(".")-1, "")
    call append(line(".")-1, "#ifdef __cplusplus")
    call append(line(".")-1, "}")
    call append(line(".")-1, "#endif")
    call append(line(".")-1, "")
    call append(line(".")-1, "#endif")
endfunc
command! -nargs=1 InitCHead :call F_INITCHEADFILE("<args>")

" Generate the comment for C functions.
function F_FUNCHEAD()
    let prefix = strpart(getline("."), 0, col(".") - 1)
    " Get function name.
    let funcname = matchstr(getline("."), ' [a-zA-Z0-9_]\+(')
    let funcname = strpart(funcname, 1, strlen(funcname) - 2)
    " Get param list.
    let param_line = matchstr(getline("."), '([ a-zA-Z0-9_,*&\[\]]\+)') "add \[\] 
    let param_line = strpart(param_line, 1, strlen(param_line) - 2)

    call append(line(".")-1, prefix."/******************************************************************************")
    call append(line(".")-1, prefix." * Function Name: ".funcname)
    call append(line(".")-1, prefix." * Function Desc: ")
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
        call append(line(".")-1, prefix." * Param: ".param)
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
        call append(line(".")-1, prefix." * Param: ".param)
    endif
    call append(line(".")-1, prefix." * Return: ")
    call append(line(".")-1, prefix." * Date: ".strftime("%Y-%m-%d"))
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
