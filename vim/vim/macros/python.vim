" <F12> spusti program, pak necha pustenej xterm
map <F12> :silent !killargs 'xterm .* -e python'<cr>:silent !xterm -geom 75x20-0+0 -fg darkblue -bg white -e python -i % $PYARGS &<CR>
set shiftwidth=4
set tabstop=4
