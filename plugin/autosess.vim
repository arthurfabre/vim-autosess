" Ensure we're only loaded once
if exists("g:loaded_autosess") && g:loaded_autosess
    finish
endif
let g:loaded_autosess = 1

" Reset line continuation - see http://vimhelp.appspot.com/usr_41.txt.html#41.11
let s:save_cpo = &cpo
set cpo&vim


function s:Save()
    if strlen(v:this_session)
        execute "mksession! ".v:this_session
    endif
endfunction

function s:Disable()
    autocmd! Session
endfunction

function s:Enable()
    autocmd Session BufAdd,BufDelete,BufWritePost * :call SessionSave()
endfunction

if !exists(":SessionSave")
    command SessionSave :call s:Save()
endif

if !exists(":SessionDisable")
    command SessionDisable :call s:Disable()
endif

if !exists(":SessionEnable")
    command SessionEnable :call s:Enable()
endif


" Restore line continuation
let &cpo = s:save_cpo
unlet s:save_cpo
