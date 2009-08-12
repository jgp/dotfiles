" How to define new ex commands: http://www.vim.org/htmldoc/usr_40.html#40.2
command! RmSelf call RemoveCurrentFile()

function! RemoveCurrentFile()
  !rm "%"
  bd
endfunction

"command RmSelf !rm "%"
