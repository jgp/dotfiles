" fonts
imap <LocalLeader>tt {\tt }<Left>
vmap <LocalLeader>tt <Esc>`>a}<Esc>`<i{\tt<Esc>%
imap <LocalLeader>ee \emph{}<Left>
vmap <LocalLeader>ee <Esc>`>a}<Esc>`<i\emph{<Esc>%
imap <LocalLeader>bb {\bf }<Left>
vmap <LocalLeader>bb <Esc>`>a}<Esc>`<i{\bf <Esc>%

" brackets
imap <LocalLeader>uv \uv{}<Left>
vmap <LocalLeader>uv <Esc>`>a}<Esc>`<i\uv{<Esc>%

" environments
imap <LocalLeader>st \starttyping<CR><CR>\stoptyping<Up>
vmap <LocalLeader>st <Esc>`>a\stoptyping<Esc>`<i\starttyping<Esc>F\

" uzavření; napište \begin{cosi} a použijte <LocalLeader>.
imap <LocalLeader>. <Esc>F{lyt}f}a\end{}<Esc>PF\i

" poskakuje před (\) a za (}) TeXovské konstrukce
map <M-Right> f}
imap <M-Right> <C-O>f}<Right>
map <M-Left> F\
imap <M-Left> <C-O>F\

" pro překlad a zobrazení chyb
set makeprg=make
set shellpipe=>&
