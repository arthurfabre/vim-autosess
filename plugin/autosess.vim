" Ensure we're only loaded once
if exists("g:loaded_autosess") && g:loaded_autosess
    finish
endif
let g:loaded_autosess = 1

" Reset line continuation - see http://vimhelp.appspot.com/usr_41.txt.html#41.11
let s:save_cpo = &cpo
set cpo&vim


function s:Save()
    " No active session
    if !strlen(v:this_session)
        return
    endif

    " If we're loading a session right now, don't overwrite it
    if exists("g:SessionLoad")
        return
    endif

    execute "mksession! ".v:this_session
endfunction

function s:Disable()
    autocmd! Session
endfunction

function s:Enable()
    augroup Session
        autocmd BufReadPost,BufWritePost * :call s:Save()
    augroup END
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
