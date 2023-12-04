" plain_tex.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match TexSubCommand "\\[a-zA-Z]*@[a-zA-Z@]*" contains=@NoSpell
syntax match TexSubCommand "\\[a-zA-Z]*_[a-zA-Z_]*" contains=@NoSpell
syntax match TexSubCommand "\\\(makeatletter\|makeatother\)" contains=@NoSpell

highlight def link TexSubCommand Yellow
