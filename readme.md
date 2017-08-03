# LaTeX Template

<!-- vim-markdown-toc GFM -->
* [Tikz](#tikz)
* [Makefile](#makefile)
    * [Entire project](#entire-project)
    * [Subfiles](#subfiles)
    * [Tikz Figures](#tikz-figures)
* [Troubleshoot](#troubleshoot)
* [Ressources](#ressources)
* [TODO](#todo)

<!-- vim-markdown-toc -->

## Tikz

You should create one .tex file for each Tikz picture with the standalone class as below.

``` tex
\documentclass[12pt,tikz]{standalone}

\ifstandalone%
    \usepackage{import}
    \import{../../configuration/}{comon_packages.tex}%
    \import{../../configuration/}{variables.tex}%
    \import{../../configuration/}{conftikz.tex}%
    \import{../../configuration/}{custom_config.tex}%
\fi

\begin{document}
    \begin{tikzpicture}
        \draw[->, >=latex] (0, 0) -- (0, 1);
    \end{tikzpicture}
\end{document}
```

This file should be located in the `ressources/tikz/` directory.

This permit to compile this file on its own.

To include it into your document, just use `\includestandalone` like below.

``` tex
\begin{figure}[ht]
    \centering
    \includestandalone{filename}
    \caption{Caption}%
    \label{fig:label}
\end{figure}
```

But it will compile each time you make your main file (and it will not work for subfiles, see Troubleshoot section).

An other solution to speed up the global compilation is to make one pdf file for each Tikz file and then use `\includegraphics`.

``` tex
\begin{figure}[ht]
    \centering
    \includegraphics{filename}
    \caption{Caption}%
    \label{fig:label}
\end{figure}
```

It will produce the exact same output but with no compilation time.

To produce a pdf file out of the standalone class, use `make pdf t=tikz f=filename` where filename is the name of the filename with the standalone class containing your Tikz picture.

It will create the file `filename.pdf` in the same directory (`ressources/tikz`).

To compile each Tikz figures into pdf, use `make pdf t=tikz`.


## Makefile

### Entire project

| command      | commentary                                                                     |
| ------------ | ------------------------------------------------------------------------------ |
| `make`       | Build the entire project                                                       |
| `make pdf`   | Build the entire project                                                       |
| `make watch` | Watch for changes and rebuild the entire project                               |
| `make open`  | Open the generated pdf                                                         |
| `make clean` | Clean the `main/build` directory                                               |


### Subfiles

| command      | filename     | commentary                                                                     |
| ------------ | ------------ | ------------------------------------------------------------------------------ |
| `make pdf`   | `f=filename` | Build the subfile located `filename/filename.tex` into `filename/filename.pdf` |
| `make watch` | `f=filename` | Watch the file for changes                                                     |
| `make open`  | `f=filename` | Open the pdf file corresponding to the filename                                |


### Tikz Figures

| command      | filename     | type     | commentary                                                                     |
| ------------ | ------------ | -------- | ------------------------------------------------------------------------------ |
| `make pdf`   | `f=filename` | `t=tikz` | Build `ressources/tikz/filename.tex` into `ressources/tikz/filename.pdf`       |
| `make pdf`   |              | `t=tikz` | Build all `.tex` files into the `ressources/tikz/` folder into `.pdf` files    |
| `make watch` | `f=filename` | `t=tikz` | Continuously compile a tikz file into a pdf                                    |
| `make open`  | `f=filename` | `t=tikz` | Open the pdf file corresponding to the Tikz figure                             |



## Troubleshoot

You can't use `\includestandalone` from a file with the class `subfiles`. So I recommend generating a `pdf` file from the Tikz Standalone file using `make pdf t=tikz f=filename` and then include the generated pdf using `\includegraphics`.


## Ressources

- http://ash.id.au/post/2014/09/19/thesis-in-latex/
- https://github.com/derric/cleanthesis
- http://texdoc.net/texmf-dist/doc/support/latexmk/latexmk.pdf


## TODO

- [ ] Changer la page de garde pour faire un truc plus général (logo d'entreprise général)
- [ ] Mettre la numérotation des sections dans la marge
- [ ] Refaire bien le fichier de présentation
- [ ] Compléter ce readme
    - [ ] exemples et "snippets"
    - [ ] explication de chaque dossier
- [ ] Mieux partitionner les packages
    - [ ] Enlever les packages inutiles pour ne laisser que les packages indispensables
- [ ] Faire une partie dans le readme avec les pré requis : latexmk, distribution texlive, dire que c'est pour système unix etc...
- [ ] Voir ce qu'il se passe quand on build un subfile avec du code minted. Peut-être qu'on pourrait n'avoir qu'un seul latexmkrc

