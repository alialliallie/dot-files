function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <Up> <C-o>:call MoveLineUp()<CR>
inoremap <silent> <Down> <C-o>:call MoveLineDown()<CR>
vnoremap <silent> <Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <Down> :<C-u>call MoveVisualDown()<CR>
xnoremap <silent> <Up> :<C-u>call MoveVisualUp()<CR>
xnoremap <silent> <Down> :<C-u>call MoveVisualDown()<CR>
