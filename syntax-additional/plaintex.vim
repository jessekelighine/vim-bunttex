" plain_tex.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match TexPlainCommand /\\[a-zA-Z]*@[a-zA-Z@]*/ contains=@NoSpell
syntax match TexPlainCommand /\\[a-zA-Z]*_[a-zA-Z_]*/ contains=@NoSpell
syntax match TexPlainCommand /\\\(makeatletter\|makeatother\)\>/ contains=@NoSpell

highlight def link TexPlainCommand Yellow
