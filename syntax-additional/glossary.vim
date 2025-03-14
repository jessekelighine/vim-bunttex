" acronym.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax region TexAcronym start="\\acr\(long\|short\)"       end="}"        contains=@NoSpell
syntax region TexAcronym start="\\glsentry\(long\|short\){" end="}"        contains=@NoSpell
syntax region TexAcronym start="\\gls\*\?{"                 end="}"        contains=@NoSpell
syntax region TexAcronym start="\\newacronym{"              end="}{.\{-}}" contains=@NoSpell
