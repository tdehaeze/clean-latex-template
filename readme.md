# LaTeX Template

## Tikz

You should create one .tex file for each Tikz picture with the standalone class as below.

``` latex
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

``` latex
\begin{figure}[ht]
    \centering
    \includestandalone{filename}
    \caption{Caption}%
    \label{fig:label}
\end{figure}
```

But it will compile each time you make your main file (and it will not work for subfiles, see Troubleshoot section).

An other solution to speed up the global compilation is to make one pdf file for each Tikz file and then use `\includegraphics`.

``` latex
\begin{figure}[ht]
    \centering
    \includegraphics{filename}
    \caption{Caption}%
    \label{fig:label}
\end{figure}
```

It will produce the exact same output but with no compilation time.

To produce a pdf file out of the standalone class, use `make tikz f=filename` where filename is the name of the filename with the standalone class containing your Tikz picture.

It will create the file `filename.pdf` in the same directory (`ressources/tikz`).

To compile each Tikz figures into pdf, use `make tikz`.


### Workflow

`make` - Build the entire project
`make clean` - Clean the `main/build` directory (should not be used)
`make watch` - Watch for changes and rebuild the entire project
`make open` - Open the generated pdf


`make tikz` - 
`make tikz f=filename` - 
`make tikz-watch f=filename` - continuously compile a tikz file into a pdf. Open the pdf, make changes to the .tex file until you are happy with the result. Then stop the build with `C-c` and you are good to go.


`make filename` - Build the subfile located `filename/filename.tex` into `filename/filename.pdf` (`filename` can be `titlepage`, `chap1`, `chap2`, `introduction`, ...)
`make f-watch f=filename` - Watch the file for changes


`make appendix` - 
`make appendix f=filename` - 
`make appendix-watch f=filename` - 

## Troubleshoot

You can't use `\includestandalone` from a file with the class `subfiles`. So I recommend generating a `pdf` file from the Tikz Standalone file using `make tikz f=filename` and then include the generated pdf using `\includegraphics`.


## Ressources

http://ash.id.au/post/2014/09/19/thesis-in-latex/
https://github.com/derric/cleanthesis
http://texdoc.net/texmf-dist/doc/support/latexmk/latexmk.pdf


## TODO


- Changer la page de garde pour faire un truc plus général (logo d'entreprise général)
- Changer la numérotation pour les section, subsection... (enlever un niveau, et reset à chaque chapitre)
- Mettre la numérotation des sections dans la marge
- Refaire bien le fichier de présentation
- Compléter ce readme
    - exemples et "snippets"
    - explication de chaque dossier
- expliquer les commandes make
- Peut être plutôt faire un subfile par chapitre
    - ça va permettre de faire un make chap1 ou make chap2 pour compiler qu'il seul chapitre, sinon c'est plus compliquer pour chaque section
- Ajouter un watch tikz file dans le makefile
- Mieux partitionner les packages
- Peut être faire un dossier pour chaque annexe, comme ça on peut faire des règles dans le makefile plus générales

