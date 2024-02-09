" mathnotes.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match TexEnv "{\zs\(assumption\|lemma\|corollary\|example\|remark\|proposition\)\ze\*\=}" contained
syntax match TexEnv "{\zs\(theorem\|definition\|proof\|claim\|axiom\)\ze\*\=}" contained
syntax match TexEnv "{\zs\(exercise\|problem\|question\)\ze\*\=}" contained
