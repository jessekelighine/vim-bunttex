" footnote.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax region TexFootnoteRegion
			\ matchgroup=TexFootnote
			\ start="\\\(footnote\(text\)\{0,1}\|sidenote\){"
			\ end="}"
			\ contains=TOP

highlight def link TexFootnote Keyword
highlight TexFootnoteRegion cterm=underdotted gui=underdotted
