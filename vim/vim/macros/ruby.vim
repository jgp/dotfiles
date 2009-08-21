" #{}
imap <LocalLeader>ov #{}<Esc>i

" @variable = variable
imap <LocalLeader>ggg <Esc>y^<End>a = <Esc>pa

command! RunThisRubyScript call RunThisRubyScript()

function! RunThisRubyScript()
  rubyfile "%"
  w
endfunction
