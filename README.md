# vim-bunttex

LaTeX syntax highlight in Vim/Neovim are too complicated and unnecessarily colourful.
Thus, I created my own LaTeX syntax highlight file with the aim of being simple and readable.

Two features of my LaTeX syntax files:

- **minimalism**:
  LaTeX files can be *huge*.
  I don't need complex regex rules to highlight every detail.
  The [main syntax file](syntax/tex.vim) only highlights what I consider to be necessary.
- **supporting files**:
  Sometimes you need extra highlightings, e.g., when writing Ti*k*Z.
  I also provide additional syntax files you can use in specific circumstances.
  See directory [`syntax-additional`](syntax-additional) to see the additional files.

## Installation

Install using your favourite plugin manager, or use Vim's built-in package
support:
```sh
mkdir -p ~/.vim/pack/jessekelighine/start
cd ~/.vim/pack/jessekelighine/start
git clone https://github.com/jessekelighine/vim-bunttex
```

## Tips

Source the support files only when you need them.
For example, when you open a Ti*k*Z file,
simply run
```vim
:source path/to/syntax-additional/tikz.vim
```
and you will get highlighting for Ti*k*Z.
To 'undo' the Ti*k*Z highlighting, run
```vim
:set ft=tex
```

## License

Distributed under the same terms as Vim itself. See `:help license`.
