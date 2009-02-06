""""""""""""""""""""""""""""""""""""""""""
" Macrofile: ruby.vim                    "
" Author: Botanicus                      "
" Licence: Ruby/BSD                      "
" Contact: knava.bestvinensis@gmail.com  "
" Description: This macros can help you  "
" write your ruby code very quickly and  "
" without troubles :)                    "
""""""""""""""""""""""""""""""""""""""""""

" ====== DEFINITIONS ======"

" def
imap def<Tab> def <Esc>oend<Up><End>

imap <LocalLeader># #{}<Esc>i
imap do<Tab> do \|item\|<Enter>end<Esc>O

" class basic
imap <LocalLeader>dc <Esc>Iclass <Esc>oend<Esc>O

" class with initialize
imap <LocalLeader>di <Esc>Iclass <Esc>o<CR>def initialize<CR>end<CR><CR>end<Esc>2kO

" module
imap <LocalLeader>dm <Esc>Imodule <Esc>oend<Esc>O


" ===== CONDITIONS ===== "

" if
imap if<Tab> if <Esc>oend<Esc>O

" if + else
imap <LocalLeader>ie <Esc>Iif <Esc>oelse<Esc>oend<Esc>kO

" if + elsif + else
imap <LocalLeader>ia <Esc>Iif <Esc>oelse<Esc>oend<Esc>kO


" ===== CYCLES ===== "

" case
imap <LocalLeader>cc <Esc>Icase <Esc>oend<Esc>Owhen 

" do
imap <LocalLeader>cd do<Esc>oend<Esc>O

" each
imap <LocalLeader>ee .each do \|foo\|<Esc>oend<Esc>O

" each_index
imap <LocalLeader>ei .each_index do \|foo\|<Esc>oend<Esc>O

" times
imap <LocalLeader>ctb .times {}<Esc>i
imap <LocalLeader>cta .times do<CR>end<Esc>O

" step

" upto

" 3.upto(5)

" downto

" while

" until

" files
imap <LocalLeader>fl <Esc>IFile(<Esc>A) do \|file\|<CR>end<Esc>O
imap <LocalLeader>fi <Esc>IFile(<Esc>A) do \|file\|<CR>file.each do \|line\|<CR>end<CR>end<Esc><Up>O

" do while
imap <LocalLeader>lkl <Esc>Iend while <Esc>Obegin<CR>

" do until

" ===== EXCEPTIONS ===== "

" Basic exception
imap <LocalLeader>exb begin<CR>rescue<CR>end<Esc>kO

" Exception with rescue block
imap <LocalLeader>exe begin<CR>rescue<CR>ensure<CR>end<Esc>2kO


" ====== DATA TYPES ===== "

" Data types with %?{}
imap <LocalLeader>da %W{ }<Esc>F{a 
imap <LocalLeader>dr %r{ }<Esc>F{a 
imap <LocalLeader>dx %x{ }<Esc>F{a 
imap <LocalLeader>da %W{ }<Esc>F{a 
imap <LocalLeader>dq %Q{ }<Esc>F{a 
imap <LocalLeader>da %W{ }<Esc>F{a 

" String <<-EOF
imap <LocalLeader>ds <<-EOF<Esc>oEOF<Esc>O

" Creating new arrays and hashes
imap <LocalLeader>nh  = Hash.new
imap <LocalLeader>na  = Array.new

" Create and fill arrays and hashes
imap <LocalLeader>ch  = {<CR>"" => "",<CR>}<Esc>kyyf"a
imap <LocalLeader>ca  = [<CR>"",<CR>]<Esc>kyyf"a


" ======= METHODS ====== "

" defined?
imap <LocalLeader>md defined?()<Esc>i

" FileTest
imap <LocalLeader>ftd FileTest.directory?()<Esc>i
imap <LocalLeader>ftf FileTest.file?()<Esc>i
imap <LocalLeader>ftx FileTest.executable?()<Esc>i
imap <LocalLeader>fte FileTest.exists?()<Esc>i
imap <LocalLeader>ftz FileTest.zero?()<Esc>i
imap <LocalLeader>fts FileTest.symlink?()<Esc>i
imap <LocalLeader>ftw FileTest.writable?()<Esc>i
imap <LocalLeader>ftr FileTest.readable?()<Esc>i
imap <LocalLeader>ftg FileTest.grpowned?()<Esc>i
imap <LocalLeader>fto FileTest.owned?()<Esc>i

" Load files
imap <LocalLeader>Fo = File.open(, "")<Esc>F,i
imap <LocalLeader>Yo = YAML::load(File.open())<Esc>F(a

" Substitions methods
imap <LocalLeader>sss .sub(//, "")<Esc>F/i
imap <LocalLeader>ssd .sub!(//, "")<Esc>F/i
imap <LocalLeader>sgg .gsub(//, "")<Esc>F/i
imap <LocalLeader>sgd .gsub!(//, "")<Esc>F/i

" Require
imap <LocalLeader>sssss require ""<Esc>i


" ====== EXTERNAL ===== "

" irb
map <F12> :rubyfile


" ====== COMMENTS ===== "
imap <LocalLeader>CB =begin<CR>=end<Esc>O
imap <LocalLeader>CC <Esc>mtI#<Esc>`ta
vmap <LocalLeader>C =begin<Esc>gv...=end !!!


" ====== OTHERS ===== "

" #{}
imap <LocalLeader>ov #{}<Esc>i

" Dir[""]
imap <LocalLeader>D Dir[""]<Esc>F"i

" ("")
imap <LocalLeader>br ("")<Esc>F"i

" @variable = variable
imap <LocalLeader>ggg <Esc>y^<End>a = <Esc>pa

" @array = array.dup
imap <LocalLeader>ccc <Esc>I<Esc>y<End>A = <Esc>pa.dup

" Only now for debuging
imap <F3> <Esc>:source ~/.vim/macros/ruby.vim<CR>a
map <F3> :source ~/.vim/macros/ruby.vim<CR>

" Just a small help
imap <LocalLeader>help Definitions: dd, dc, di, dm<CR>Cycles: cc, cd, ee, ei<CR>Exceptions: exb exe<CR>Methods: md<CR>Filetest: ftd, ftf, ftx, fte, ftz, fts, ftw, ftr, ftg, fto<CR>Substitions: sss, ssd, sgg, sgd<CR>Files: Fo, Yo<CR>Comments: C-B, C-C<CR>Files: fl, fi<CR>Others: ov #{}, 
