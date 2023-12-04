" mathnotes.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match AmsthmEnv "{\zs\(assumption\|lemma\|corollary\|example\|remark\|proposition\|problem\|question\|theorem\|definition\|proof\|claim\|axiom\)\ze\*\=}" contained

highlight def link AmsthmEnv Blue
