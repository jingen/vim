" cp means compatible mode
"echo "loaded!"
let g:loaded_vimrc_files=[]
let g:discovered_vimrc_files=[]

if (exists("g:loaded_projectvimrc") || &cp)
    finish
endif
let g:loaded_projectvimrc="loaded"


"user can override the name of the vim file
if (!exists("g:vimrc_name"))
    let g:vimrc_name=".vimproject"
    "let g:vimrc_name=".vimrc"
endif

function s:projectize()
  "  if &buftype!=""
  "      return
  "  endif
    
    let l:directory= escape(expand("%:p:h"), ' ~|!"$%&()=?{[]}+*#'."'")
    let l:rcfiles=findfile(g:vimrc_name, l:directory.";",-1)
    for l:rcfile in reverse(l:rcfiles)
        if (filereadable(l:rcfile) && !s:vimrc_loaded(l:rcfile)) 
            "//let answer=input("Do you want to load ".s:get_abs_path(l:rcfile)."? \npress y will load this vimfile and change current working dir into ".fnamemodify(s:get_abs_path(l:rcfile),":p:h")."\n(y/n)")
            "//if (l:answer=="y")
                call s:load_rcfile(l:rcfile)
            "//endif
        endif
    endfor

    " clear command line
"    redraw!
    return 1
endfunction

function s:load_rcfile(rcfile)
    let l:abs_path=s:get_abs_path(a:rcfile)
    exec "source ".escape(a:rcfile,' ~|!"$%&()=?{[]}+*#'."'") 
    call insert(g:loaded_vimrc_files,l:abs_path)
    "cd into the folder where vimrc file exists
    exec "cd ".escape(fnamemodify(l:abs_path,":p:h"),' ~|!"$%&()=?{[]}+*#'."'")
endfunction

function! s:vimrc_loaded(file_path)
    let l:abs_path=s:get_abs_path(a:file_path)
    if (index(g:loaded_vimrc_files,l:abs_path)== -1)
        return 0
    endif
    return 1
endfunction

function! s:get_abs_path(rel_path)
    return fnamemodify(a:rel_path,":p")
endfunction

"Automatic invoke projectize when vim is started 
augroup localvimrc
    autocmd!
    autocmd VimEnter * call s:projectize()
    "autocmd BufNew * call s:project_vimrc()
augroup END

"Map command
command -nargs=0 Projectize call s:projectize()


