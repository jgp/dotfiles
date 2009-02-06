" get it better
imap <LocalLeader>a <Esc>mt?http://<CR>i<a href="<Esc>`a"></a><Esc>5hi 
imap <LocalLeader>tb <table><CR><tr><CR><td></td><CR></tr><CR></table> 
imap <LocalLeader>img <img src="" alt="" border="0"><Esc>19hi
imap <LocalLeader>A <Esc>yiWi<a href="http://<Esc>Ea"></a><Esc>3hP4la
" Pro HTML - Alt + --> skoci na dalsi tag
imap <M-Right> <Esc>f>a
" C-q doplni htmltag
imap  </><Esc>2F<lywf>f/pf>a

"entity
imap ,sp &nbsp;

"písma
imap ,tt <code></code><C-O>F<
vmap ,tt <Esc>`>a</code><Esc>`<i<code><Esc>
imap ,ee <em></em><C-O>F<
vmap ,ee <Esc>`>a</em><Esc>`<i<em><Esc>
imap ,bb <strong></strong><C-O>F<
vmap ,bb <Esc>`>a</strong><Esc>`<i<strong><Esc>

"odstavec
imap ,pp <p></p><C-O>F<

"prostředí pro změnu vzhledu textu
imap ,cen <div><CR><CR></div><Up>
vmap ,cen <Esc>`>a</div><Esc>`<i<div><Esc>
imap ,quo <blockquote><CR><CR></blockquote><Up>
vmap ,quo <Esc>`>a</blockquote><Esc>`<i<blockquote><Esc>
imap ,ver <pre><CR><CR></pre><Up>
vmap ,ver <Esc>`>a</pre><Esc>`<i<pre><Esc>
imap ,qv <blockquote><pre><CR><CR></pre></blockquote><Up>
vmap ,qv <Esc>`>a</pre></blockquote><Esc>`<i<blockquote><pre><Esc>

"tabulka, obrázek, odkaz
imap ,tab <table><CR><tr><td></td><td></td></tr><CR></table><Esc>k02f>a
imap ,img <img src="" alt=""><Esc>9F"i
imap ,aa <a href=""></a><C-O>F"
vmap ,aa <Esc>`>a</a><Esc>`<i<a href=""><Left><Left>

"uzavření; napište <cosi> a použijte ,.
imap ,. <Esc>F<yef>pa><Esc>F<a/<Left><Left>

"posun před/za značku
map <M-Right> f>
imap <M-Right> <C-O>f><Right>
map <M-Left> F<
imap <M-Left> <C-O>F<

" abbr
imap <! <!--  --><Esc>F i
imap <p> <p></p><Esc>F<i
imap <code> <code></code><Esc>F<i
imap <ul> <ul></ul><Esc>F<i
imap <ol> <ol></ol><Esc>F<i
imap <h1> <h1></h1><Esc>F<i
imap <h2> <h2></h2><Esc>F<i
imap <h3> <h3></h3><Esc>F<i
imap <h4> <h4></h4><Esc>F<i
imap <h5> <h5></h5><Esc>F<i
imap <h6> <h6></h6><Esc>F<i
imap <strong> <strong></strong><Esc>F<i
imap <em> <em></em><Esc>F<i
imap <i> <i></i><Esc>F<i
imap <b> <b></b><Esc>F<i
imap <pre> <pre></pre><Esc>F<i
imap <li> <li></li><Esc>F<i
imap <a> <a href=""></a><Esc>F"i

"vmap <!
imap <LocalLeader>tg &lt;&gt;<Esc>F;a
imap <LocalLeader>quo &bdquo;&rdquo;<Esc>F;a
