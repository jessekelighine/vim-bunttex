" acronym.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match TexAlgorithm /\\\(END\)\?\(FOR\|IF\|WHILE\|LOOP\)\>/ contains=@NoSpell
syntax match TexAlgorithm /\\\(AND\|OR\|XOR\|NOT\|TRUE\|FALSE\)\>/ contains=@NoSpell
syntax match TexAlgorithm /\\\(REQUIRE\|ENSURE\|RETURN\|PRINT\)\>/ contains=@NoSpell
syntax match TexAlgorithm /\\\(STATE\|COMMENT\|ELSE\|TO\|REPEAT\|UNTIL\)\>/ contains=@NoSpell
syntax match TexEnv /{\zs\(algorithm\|algorithmic\)\ze}/ contained

highlight def link TexAlgorithm Type
