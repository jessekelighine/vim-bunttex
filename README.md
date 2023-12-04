# vim-bunttex

LaTeX syntax highlight in Vim/Nvim are way too complicated (causing Vim to be extremely slow on large TeX files) and unnecessarily colourful.
Thus, I created my own LaTeX syntax highlight file with the aim of being simple and readable.
See what it looks like in the [Showcase](#showcase) section.

Two features of my LaTeX syntax files:

- **minimalism**:
  LaTeX files can be *huge*.
  I don't need complex regex rules to highlight every detail.
  The [main syntax file](syntax/tex.vim) contains less than 50 lines (excluding comments).
  It only highlights what I consider to be necessary.
- **supporting files**:
  Sometimes you need extra highlightings, e.g., when writing beamer or Ti*k*Z.
  I also provide additional syntax files you can [use](#tips) in specific circumstances:
	- [`tikz.vim`](syntax-additional/tikz.vim): For Ti*k*Z syntax. (see a [showcase](#tikz))
	- [`beamer.vim`](syntax-additional/beamer.vim): For beamer, highlighting `frame` and `block` environments. (see a [showcase](#beamer))
	- [`figure.vim`](syntax-additional/figure.vim): For highlighting `figure` and `table` environments.
	- [`mathnotes.vim`](syntax-additional/mathnotes.vim): For highlighting environments such as `definition`, `theroem`, `proof`, etc.
	- [`plain_tex.vim`](syntax-additional/plain_tex.vim): For highlighting plain TeX command, e.g., `\@maketitle`.
	- [`document.vim`](syntax-additional/document.vim): For highlighting `\begin{document}` and `\end{document}`.

## Installation

Install using your favourite plugin manager, or use Vim's built-in package
support:
```sh
mkdir -p ~/.vim/pack/jessekelighine/start
cd ~/.vim/pack/jessekelighine/start
git clone https://github.com/jessekelighine/vim-bunttex
```

**However**, I urgue you to simply put the file [`tex.vim`](syntax/tex.vim) in directory `~/.vim/syntax/` (or `~/.config/nvim/syntax/` for Neovim)
and only download the supporting files you need for two reasons:

1. It's less than 50 lines of code.
2. You would probably customize it a lot. (Make it your own!)
3. You don't need all the supporting files, only download the ones you need.

See [Tips](#tips) section to learn a how to use the supporting files.

## Tips

Source the support files only when you need them.
For example, when you open a Ti*k*Z file (e.g., [`tikz.tex`](demo/tikz.tex)),
simply run
```vim
:source path/to/tikz.vim
```
and you will get highlighting for Ti*k*Z (something that looks like [this](#tikz)).
To 'undo' the Ti*k*Z highlighting, run
```vim
:set ft=tex
```
and the Ti*k*Z highlighting will be reverted.

To avoid typing and memorizing `path/to/tikz.vim`,
you can put this in your `~/.vim/ftplugin/tex.vim` (or `~/.config/nvim/ftplugin/tex.vim` for Neovim):
```vim
command! -buffer -nargs=0 HighlightTikz :source path/to/tikz.vim
```
Now you can use `:HighlightTikz` whenever you need Ti*k*Z highlighting!

## Showcase

All showcased code can be found in the directory [`demo`](demo).

### Basic LaTeX

This is what you'll get with only the 50 lines of code from [`tex.vim`](syntax/tex.vim):

<font face="monospace">
<span id="L1" ><font color="#8a8a8a">&nbsp;1&nbsp;</font></span><font color="#ff8700"><b>\documentclass</b></font>[a4paper]{article}<br>
<span id="L2" ><font color="#8a8a8a">&nbsp;2&nbsp;</font></span><font color="#87af87"><b>\usepackage</b></font>{fontspec}<font color="#87af87">\defaultfontfeatures</font>{Ligatures=TeX}<br>
<span id="L3" ><font color="#8a8a8a">&nbsp;3&nbsp;</font></span><font color="#8a8a8a"><i>% \usepackage{setspace}\setstretch{1.3} % \begin{spacing}{1.3}</i></font><br>
<span id="L4" ><font color="#8a8a8a">&nbsp;4&nbsp;</font></span><font color="#8a8a8a"><i>% \usepackage[a4paper,vmargin={4cm,4cm},hmargin={4cm,4cm}]{geometry}</i></font><br>
<span id="L5" ><font color="#8a8a8a">&nbsp;5&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L6" ><font color="#8a8a8a">&nbsp;6&nbsp;</font></span><font color="#d787af"><i>%%% Math %%%</i></font><br>
<span id="L7" ><font color="#8a8a8a">&nbsp;7&nbsp;</font></span><font color="#87af87"><b>\usepackage</b></font>{amsmath,mathtools,amssymb,mathrsfs}<br>
<span id="L8" ><font color="#8a8a8a">&nbsp;8&nbsp;</font></span><font color="#8a8a8a"><i>% \usepackage{centernot}</i></font><br>
<span id="L9" ><font color="#8a8a8a">&nbsp;9&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L10" ><font color="#8a8a8a">10&nbsp;</font></span><br>
<span id="L11" ><font color="#8a8a8a">11&nbsp;</font></span><font color="#d75f5f">\begin</font>{document}<br>
<span id="L12" ><font color="#8a8a8a">12&nbsp;</font></span><br>
<span id="L13" ><font color="#8a8a8a">13&nbsp;</font></span><font color="#d75f5f">\begin</font>{enumerate}[label = (<font color="#87af87">\alph</font>*)]<br>
<span id="L14" ><font color="#8a8a8a">14&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\item</font><br>
<span id="L15" ><font color="#8a8a8a">15&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Something Interesting&nbsp;<font color="#d787af"><i>%%&nbsp;</i></font><font color="#ffaf00">TODO</font><font color="#d787af"><i>: something more interesting</i></font><br>
<span id="L16" ><font color="#8a8a8a">16&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\item</font><br>
<span id="L17" ><font color="#8a8a8a">17&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Not really, 99<font color="#ffaf00">\%</font>.<br>
<span id="L18" ><font color="#8a8a8a">18&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Here are some maths:<br>
<span id="L19" ><font color="#8a8a8a">19&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#8a8a8a">&dollar;</font><font color="#87af87">\forall\epsilon</font>&gt;0<font color="#8a8a8a">&dollar;</font>&nbsp;and refer to&nbsp;<font color="#ff8700">\eqref</font>{eq:A}.<br>
<span id="L20" ><font color="#8a8a8a">20&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\begin</font>{align}<font color="#ff8700">\label</font>{eq:A}<br>
<span id="L21" ><font color="#8a8a8a">21&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A =<br>
<span id="L22" ><font color="#8a8a8a">22&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\begin</font>{bmatrix}<br>
<span id="L23" ><font color="#8a8a8a">23&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;<font color="#ff8700">&amp;</font>&nbsp;2&nbsp;<font color="#ff8700">&amp;</font>&nbsp;3&nbsp;<font color="#87af87">\\</font><br>
<span id="L24" ><font color="#8a8a8a">24&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;<font color="#ff8700">&amp;</font>&nbsp;5&nbsp;<font color="#ff8700">&amp;</font>&nbsp;6&nbsp;<font color="#87af87">\\</font><br>
<span id="L25" ><font color="#8a8a8a">25&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7&nbsp;<font color="#ff8700">&amp;</font>&nbsp;8&nbsp;<font color="#ff8700">&amp;</font>&nbsp;9&nbsp;<font color="#87af87">\\</font><br>
<span id="L26" ><font color="#8a8a8a">26&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\end</font>{bmatrix}<br>
<span id="L27" ><font color="#8a8a8a">27&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\tag</font>{matrix}<br>
<span id="L28" ><font color="#8a8a8a">28&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\end</font>{align}<br>
<span id="L29" ><font color="#8a8a8a">29&nbsp;</font></span><font color="#d75f5f">\end</font>{enumerate}<br>
<span id="L30" ><font color="#8a8a8a">30&nbsp;</font></span><br>
<span id="L31" ><font color="#8a8a8a">31&nbsp;</font></span><font color="#d75f5f">\end</font>{document}<br>
</font>

---

### Ti*k*Z

This is what you'll get from sourcing [`tikz.vim`](syntax-additional/tikz.vim):

<font face="monospace">
<span id="L1" ><font color="#8a8a8a">&nbsp;1&nbsp;</font></span><font color="#ff8700"><b>\documentclass</b></font>{standalone}<br>
<span id="L2" ><font color="#8a8a8a">&nbsp;2&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L3" ><font color="#8a8a8a">&nbsp;3&nbsp;</font></span><font color="#d787af"><i>%%% TikZ %%%</i></font><br>
<span id="L4" ><font color="#8a8a8a">&nbsp;4&nbsp;</font></span><font color="#87af87"><b>\usepackage</b></font>{tikz}<br>
<span id="L5" ><font color="#8a8a8a">&nbsp;5&nbsp;</font></span><font color="#87af87">\usetikzlibrary</font>{calc}<br>
<span id="L6" ><font color="#8a8a8a">&nbsp;6&nbsp;</font></span><font color="#87af87">\usetikzlibrary</font>{<font color="#ffaf00">intersections</font>}<br>
<span id="L7" ><font color="#8a8a8a">&nbsp;7&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L8" ><font color="#8a8a8a">&nbsp;8&nbsp;</font></span><br>
<span id="L9" ><font color="#8a8a8a">&nbsp;9&nbsp;</font></span><font color="#d75f5f">\begin</font>{document}<br>
<span id="L10" ><font color="#8a8a8a">10&nbsp;</font></span><br>
<span id="L11" ><font color="#8a8a8a">11&nbsp;</font></span><font color="#d75f5f">\begin</font>{<font color="#87afaf">tikzpicture</font>}[scale<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.7</font><font color="#eeeeee"><b>,</b></font>yscale<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.6</font><font color="#eeeeee"><b>,</b></font>thick<font color="#eeeeee"><b>,</b></font>line cap<font color="#eeeeee"><b>=</b></font>round]<br>
<span id="L12" ><font color="#8a8a8a">12&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\tikzstyle</font>{bai}=[solid<font color="#eeeeee"><b>,</b></font>circle<font color="#eeeeee"><b>,</b></font>draw<font color="#eeeeee"><b>=</b></font>black<font color="#eeeeee"><b>,</b></font>inner sep<font color="#eeeeee"><b>=</b></font><font color="#87afaf">.8pt</font><font color="#eeeeee"><b>,</b></font>fill<font color="#eeeeee"><b>=</b></font>white];<br>
<span id="L13" ><font color="#8a8a8a">13&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d787af"><i>%% Demand</i></font><br>
<span id="L14" ><font color="#8a8a8a">14&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[blue<font color="#eeeeee"><b>,</b></font>name path<font color="#eeeeee"><b>=</b></font>D]&nbsp;(<font color="#87afaf">0</font>,<font color="#87afaf">10</font>)&nbsp;<font color="#ff8700">--</font>&nbsp;(<font color="#87afaf">10</font>,<font color="#87afaf">0</font>)&nbsp;<font color="#ff8700">node</font>[<font color="#8a8a8a">below</font>]{Demand};<br>
<span id="L15" ><font color="#8a8a8a">15&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[blue<font color="#eeeeee"><b>,</b></font>name path<font color="#eeeeee"><b>=</b></font>MR]&nbsp;(<font color="#87afaf">0</font>,<font color="#87afaf">10</font>)&nbsp;<font color="#ff8700">--</font>&nbsp;(<font color="#87afaf">5</font>,<font color="#87afaf">0</font>)&nbsp;<font color="#ff8700">node</font>[<font color="#8a8a8a">below</font>]{<font color="#87af87">\textsl</font>{MR}};<br>
<span id="L16" ><font color="#8a8a8a">16&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d787af"><i>%% MC</i></font><br>
<span id="L17" ><font color="#8a8a8a">17&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[red<font color="#eeeeee"><b>,</b></font>name path<font color="#eeeeee"><b>=</b></font>MC]<br>
<span id="L18" ><font color="#8a8a8a">18&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#87afaf">0.5</font>,<font color="#87afaf">4.2</font>)&nbsp;<font color="#ff8700">to</font>[out<font color="#eeeeee"><b>=</b></font><font color="#87afaf">-85</font><font color="#eeeeee"><b>,</b></font>in<font color="#eeeeee"><b>=</b></font><font color="#87afaf">180</font><font color="#eeeeee"><b>,</b></font>looseness<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.8</font>]<br>
<span id="L19" ><font color="#8a8a8a">19&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#87afaf">2</font>,<font color="#87afaf">1.5</font>)&nbsp;<font color="#ff8700">coordinate</font>&nbsp;(M)&nbsp;<font color="#ff8700">to</font>[out<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0</font><font color="#eeeeee"><b>,</b></font>in<font color="#eeeeee"><b>=</b></font><font color="#87afaf">240</font><font color="#eeeeee"><b>,</b></font>looseness<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.55</font>]<br>
<span id="L20" ><font color="#8a8a8a">20&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#87afaf">10</font>,<font color="#87afaf">8</font>)&nbsp;<font color="#ff8700">node</font>[<font color="#8a8a8a">above</font>&nbsp;<font color="#8a8a8a">right</font>]{<font color="#87af87">\textsl</font>{MC}};<br>
<span id="L21" ><font color="#8a8a8a">21&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\path</font>[name intersections<font color="#eeeeee"><b>=</b></font>{ of<font color="#eeeeee"><b>=</b></font>&nbsp;MC and D&nbsp;&nbsp;}];<br>
<span id="L22" ><font color="#8a8a8a">22&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\coordinate</font>&nbsp;(MC-D)&nbsp;&nbsp;<font color="#ffaf00">at</font>&nbsp;(<font color="#ffaf00">intersection</font><font color="#87afaf">-1</font>) {};<br>
<span id="L23" ><font color="#8a8a8a">23&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\path</font>[name intersections<font color="#eeeeee"><b>=</b></font>{ of<font color="#eeeeee"><b>=</b></font>&nbsp;MC and MR }];<br>
<span id="L24" ><font color="#8a8a8a">24&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\coordinate</font>&nbsp;(MC-MR)&nbsp;<font color="#ffaf00">at</font>&nbsp;(<font color="#ffaf00">intersection</font><font color="#87afaf">-1</font>) {};<br>
<span id="L25" ><font color="#8a8a8a">25&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d787af"><i>%% Axes</i></font><br>
<span id="L26" ><font color="#8a8a8a">26&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[&lt;-&gt;]&nbsp;(<font color="#87afaf">0</font>,<font color="#87afaf">11</font>)&nbsp;<font color="#ff8700">node</font>[<font color="#8a8a8a">above</font>]{Price}<br>
<span id="L27" ><font color="#8a8a8a">27&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">--</font>&nbsp;(<font color="#87afaf">0</font>,<font color="#87afaf">0</font>)<br>
<span id="L28" ><font color="#8a8a8a">28&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">--</font>&nbsp;(<font color="#87afaf">11</font>,<font color="#87afaf">0</font>)&nbsp;<font color="#ff8700">node</font>[<font color="#8a8a8a">right</font>]{Quantity};<br>
<span id="L29" ><font color="#8a8a8a">29&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d787af"><i>%% Dotted Lines</i></font><br>
<span id="L30" ><font color="#8a8a8a">30&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[dotted]&nbsp;<font color="#87afaf">let</font>&nbsp;<font color="#87af87">\p</font><font color="#87afaf">1</font>=(MC-MR)&nbsp;<font color="#87afaf">in</font>&nbsp;(MC-MR)<br>
<span id="L31" ><font color="#8a8a8a">31&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">--</font>&nbsp;(<font color="#87af87">\x</font><font color="#87afaf">1</font>,<font color="#87afaf">10cm</font>-<font color="#87af87">\x</font><font color="#87afaf">1</font>)&nbsp;<font color="#ff8700">node</font>[bai]{}<br>
<span id="L32" ><font color="#8a8a8a">32&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](P<font color="#87afaf">4</font>) (<font color="#87afaf">0</font>,<font color="#87afaf">0</font>);<br>
<span id="L33" ><font color="#8a8a8a">33&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[dotted]&nbsp;(MC-MR)<br>
<span id="L34" ><font color="#8a8a8a">34&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](P<font color="#87afaf">1</font>) (<font color="#87afaf">0</font>,<font color="#87afaf">0</font>)<br>
<span id="L35" ><font color="#8a8a8a">35&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](Q<font color="#87afaf">1</font>) (MC-MR);<br>
<span id="L36" ><font color="#8a8a8a">36&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[dotted]&nbsp;(MC-D)<br>
<span id="L37" ><font color="#8a8a8a">37&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](P<font color="#87afaf">2</font>) (<font color="#87afaf">0</font>,<font color="#87afaf">0</font>)<br>
<span id="L38" ><font color="#8a8a8a">38&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](Q<font color="#87afaf">2</font>) (MC-D);<br>
<span id="L39" ><font color="#8a8a8a">39&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\draw</font>[dotted]&nbsp;(M)<br>
<span id="L40" ><font color="#8a8a8a">40&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](P<font color="#87afaf">3</font>) (<font color="#87afaf">0</font>,<font color="#87afaf">0</font>)<br>
<span id="L41" ><font color="#8a8a8a">41&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8700">-|</font>&nbsp;<font color="#ff8700">coordinate</font>[pos<font color="#eeeeee"><b>=</b></font><font color="#87afaf">0.5</font>](Q<font color="#87afaf">3</font>) (M);<br>
<span id="L42" ><font color="#8a8a8a">42&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d787af"><i>%% Nodes</i></font><br>
<span id="L43" ><font color="#8a8a8a">43&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\node</font>[bai]&nbsp;<font color="#ffaf00">at</font>&nbsp;(<font color="#87afaf">0</font>,<font color="#87afaf">0</font>)&nbsp;&nbsp; {};<br>
<span id="L44" ><font color="#8a8a8a">44&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\node</font>[bai]&nbsp;<font color="#ffaf00">at</font>&nbsp;(MC-MR) {};<br>
<span id="L45" ><font color="#8a8a8a">45&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\node</font>[bai]&nbsp;<font color="#ffaf00">at</font>&nbsp;(MC-D)&nbsp;&nbsp;{};<br>
<span id="L46" ><font color="#8a8a8a">46&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\node</font>[bai]&nbsp;<font color="#ffaf00">at</font>&nbsp;(M)&nbsp;&nbsp;&nbsp;&nbsp; {};<br>
<span id="L47" ><font color="#8a8a8a">47&nbsp;</font></span><font color="#d75f5f">\end</font>{<font color="#87afaf">tikzpicture</font>}<br>
<span id="L48" ><font color="#8a8a8a">48&nbsp;</font></span><br>
<span id="L49" ><font color="#8a8a8a">49&nbsp;</font></span><font color="#d75f5f">\end</font>{document}<br>
</font>

---

### Beamer

This is what you'll get from sourcing [`beamer.vim`](syntax-additional/beamer.vim) (now `frame` and `block` environments are in blue):

<font face="monospace">
<span id="L1" ><font color="#8a8a8a">&nbsp;1&nbsp;</font></span><font color="#ff8700"><b>\documentclass</b></font>{beamer}<br>
<span id="L2" ><font color="#8a8a8a">&nbsp;2&nbsp;</font></span><font color="#87af87">\usetheme</font>{EastLansing}<br>
<span id="L3" ><font color="#8a8a8a">&nbsp;3&nbsp;</font></span><font color="#87af87">\usecolortheme</font>{crane}<br>
<span id="L4" ><font color="#8a8a8a">&nbsp;4&nbsp;</font></span><font color="#87af87">\usefonttheme</font>{professionalfonts}<br>
<span id="L5" ><font color="#8a8a8a">&nbsp;5&nbsp;</font></span><font color="#87af87">\useinnertheme</font>{rectangles}<br>
<span id="L6" ><font color="#8a8a8a">&nbsp;6&nbsp;</font></span><font color="#8a8a8a"><i>% \linespread{1.2}</i></font><br>
<span id="L7" ><font color="#8a8a8a">&nbsp;7&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L8" ><font color="#8a8a8a">&nbsp;8&nbsp;</font></span><br>
<span id="L9" ><font color="#8a8a8a">&nbsp;9&nbsp;</font></span><font color="#d75f5f">\begin</font>{document}<br>
<span id="L10" ><font color="#8a8a8a">10&nbsp;</font></span><br>
<span id="L11" ><font color="#8a8a8a">11&nbsp;</font></span><font color="#d75f5f">\begin</font>{<font color="#87afaf">frame</font>}{This is the Title}<br>
<span id="L12" ><font color="#8a8a8a">12&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\begin</font>{<font color="#87afaf">block</font>}{Block}<br>
<span id="L13" ><font color="#8a8a8a">13&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Content of the block.<br>
<span id="L14" ><font color="#8a8a8a">14&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\end</font>{<font color="#87afaf">block</font>}<br>
<span id="L15" ><font color="#8a8a8a">15&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\begin</font>{itemize}<br>
<span id="L16" ><font color="#8a8a8a">16&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\item</font>&nbsp;alpha<br>
<span id="L17" ><font color="#8a8a8a">17&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\item</font>&nbsp;beta<br>
<span id="L18" ><font color="#8a8a8a">18&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\item</font>&nbsp;gamma<br>
<span id="L19" ><font color="#8a8a8a">19&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\item</font>&nbsp;delta<br>
<span id="L20" ><font color="#8a8a8a">20&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\end</font>{itemize}<br>
<span id="L21" ><font color="#8a8a8a">21&nbsp;</font></span><font color="#d75f5f">\end</font>{<font color="#87afaf">frame</font>}<br>
<span id="L22" ><font color="#8a8a8a">22&nbsp;</font></span><br>
<span id="L23" ><font color="#8a8a8a">23&nbsp;</font></span><font color="#d75f5f">\end</font>{document}<br>
</font>

### Plain TeX

This is what you'll get from sourcing [`plain_tex.vim`](syntax-additional/plain_tex.vim) (now commands like `\@maketitle` is colored in yellow):

<font face="monospace">
<span id="L1" ><font color="#8a8a8a">&nbsp;1&nbsp;</font></span><font color="#ff8700"><b>\documentclass</b></font>[a4paper]{article}<br>
<span id="L2" ><font color="#8a8a8a">&nbsp;2&nbsp;</font></span><font color="#87af87"><b>\usepackage</b></font>{fontspec}<font color="#87af87">\defaultfontfeatures</font>{Ligatures=TeX}<br>
<span id="L3" ><font color="#8a8a8a">&nbsp;3&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L4" ><font color="#8a8a8a">&nbsp;4&nbsp;</font></span><font color="#d787af"><i>%%% Default Title %%%</i></font><br>
<span id="L5" ><font color="#8a8a8a">&nbsp;5&nbsp;</font></span><font color="#ffaf00">\makeatletter</font><font color="#87af87">\def</font><font color="#ffaf00">\@maketitle</font>{<font color="#8a8a8a"><i>%</i></font><br>
<span id="L6" ><font color="#8a8a8a">&nbsp;6&nbsp;</font></span><font color="#87af87">\newpage\null\vskip</font>2em<font color="#8a8a8a"><i>%</i></font><br>
<span id="L7" ><font color="#8a8a8a">&nbsp;7&nbsp;</font></span><font color="#d75f5f">\begin</font>{center}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L8" ><font color="#8a8a8a">&nbsp;8&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\let</font><font color="#ff8700">\footnote</font><font color="#87af87">\thanks</font><font color="#8a8a8a"><i>%</i></font><br>
<span id="L9" ><font color="#8a8a8a">&nbsp;9&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;{<font color="#87af87">\LARGE</font><font color="#ffaf00">\@title</font><font color="#87af87">\par</font>}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L10" ><font color="#8a8a8a">10&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\vskip</font>1.5em<font color="#8a8a8a"><i>%</i></font><br>
<span id="L11" ><font color="#8a8a8a">11&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;{<font color="#87af87">\large\lineskip</font>.5em<font color="#8a8a8a"><i>%</i></font><br>
<span id="L12" ><font color="#8a8a8a">12&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\begin</font>{tabular}[t]{c}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L13" ><font color="#8a8a8a">13&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffaf00">\@author</font><font color="#8a8a8a"><i>%</i></font><br>
<span id="L14" ><font color="#8a8a8a">14&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#d75f5f">\end</font>{tabular}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L15" ><font color="#8a8a8a">15&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\par</font>}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L16" ><font color="#8a8a8a">16&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#87af87">\vskip</font>1em<font color="#8a8a8a"><i>%</i></font><br>
<span id="L17" ><font color="#8a8a8a">17&nbsp;</font></span>&nbsp;&nbsp;&nbsp;&nbsp;{<font color="#87af87">\large</font><font color="#ffaf00">\@date</font>}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L18" ><font color="#8a8a8a">18&nbsp;</font></span><font color="#d75f5f">\end</font>{center}<font color="#8a8a8a"><i>%</i></font><br>
<span id="L19" ><font color="#8a8a8a">19&nbsp;</font></span><font color="#87af87">\par\vskip</font>1.5em}<br>
<span id="L20" ><font color="#8a8a8a">20&nbsp;</font></span><font color="#ffaf00">\makeatother</font><br>
<span id="L21" ><font color="#8a8a8a">21&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L22" ><font color="#8a8a8a">22&nbsp;</font></span><font color="#d787af"><i>%%% Title %%%</i></font><br>
<span id="L23" ><font color="#8a8a8a">23&nbsp;</font></span><font color="#87af87">\title</font>{This is the Title}<br>
<span id="L24" ><font color="#8a8a8a">24&nbsp;</font></span><font color="#87af87">\author</font>{Iam A. Author}<br>
<span id="L25" ><font color="#8a8a8a">25&nbsp;</font></span><font color="#87af87">\date</font>{<font color="#87af87">\today</font>}<br>
<span id="L26" ><font color="#8a8a8a">26&nbsp;</font></span><font color="#8a8a8a"><i>%----------------------------------------------------------------------%</i></font><br>
<span id="L27" ><font color="#8a8a8a">27&nbsp;</font></span><br>
<span id="L28" ><font color="#8a8a8a">28&nbsp;</font></span><font color="#d75f5f">\begin</font>{document}<br>
<span id="L29" ><font color="#8a8a8a">29&nbsp;</font></span><br>
<span id="L30" ><font color="#8a8a8a">30&nbsp;</font></span><font color="#87af87">\maketitle</font><br>
<span id="L31" ><font color="#8a8a8a">31&nbsp;</font></span><br>
<span id="L32" ><font color="#8a8a8a">32&nbsp;</font></span><font color="#d75f5f">\end</font>{document}<br>
</font>

## License

Distributed under the same terms as Vim itself. See `:help license`.
