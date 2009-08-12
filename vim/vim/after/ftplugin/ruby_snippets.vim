if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" class, module, def
exec "Snippet c class ".st."className".et."<CR>".st.et."<CR>end".st.et
exec "Snippet m module ".st."className".et."<CR>".st.et."<CR>end".st.et
exec "Snippet d def ".st."methodName".et."<CR>".st.et."<CR>end".st.et
exec "Snippet begin begin<CR>".st.et."<CR>rescue ".st."Exception".et." => ".st."e".et."<CR>".st.et."<CR>end".st.et

" { and do
exec "Snippet { { |".st."item".et."| ".st."".et. " }".st.et.st.et
exec "Snippet do do<CR>".st.et."<CR>end".st.et
exec "Snippet doo do |".st."object".et."|<CR>".st.et."<CR>end".st.et

" cycles
exec "Snippet e each do |".st."item".et."|<CR>".st."item".et.".".st.et."<CR>end".st.et
exec "Snippet mapo map do |".st."item".et."|<CR>".st."item".et.".".st.et."<CR>end".st.et
exec "Snippet map map { |".st."item".et."| ".st."item".et.".".st.et." }".st.et

" file manipulation
exec "Snippet fr File.open(\"".st."path".et."\") { |file| ".st.et." }".st.et
exec "Snippet fw File.open(\"".st."path".et."\", \"w\") { |file| ".st.et." }".st.et
exec "Snippet fro File.open(\"".st."path".et."\") do |file|<CR>".st.et."<CR>end".st.et
exec "Snippet fwo File.open(\"".st."path".et."\", \"w\") do |file|<CR>".st.et."<CR>end".st.et

" IO operations
exec "Snippet p puts ".st.et
exec "Snippet r raise ".st."value".et.".inspect".st.et
exec "Snippet dbg logger.debug \"".st."desc".et.": #{".st."value".et.".inspect}\"".st.et

" Array.new, Hash.new
exec "Snippet a Array.new"
exec "Snippet h Hash.new"

" logger
exec "Snippet ld logger.debug ".st.et
exec "Snippet li logger.info ".st.et
exec "Snippet lw logger.warn ".st.et
exec "Snippet lf logger.fatal ".st.et

" conditions
exec "Snippet case case ".st."object".et."<CR>when ".st."condition".et."<CR>".st.et."<CR>end".st.et
exec "Snippet if if ".st."condition".et."<CR>".st.et."<CR>end".st.et
exec "Snippet unless unless ".st."condition".et."<CR>".st.et."<CR>end".st.et
exec "Snippet ife if ".st."condition".et."<CR>".st.et."<CR>else<CR>".st.et."<CR>end".st.et
exec "Snippet when when ".st."condition".et."".st.et

" others
exec "Snippet : :".st."key".et." => \"".st."value".et."\"".st.et."".st.et
exec "Snippet # #{".st."variable".et."}".st.et
