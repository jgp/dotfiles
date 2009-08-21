if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" require
exec "Snippet task desc \"".st."taskname".et."\", \"".st.et."\"<CR>def ".st."taskname".et."<CR>".st.et."<CR>end".st.et
