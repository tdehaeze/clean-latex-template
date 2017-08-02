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
    \import{../../configuration/}{custom_packages.tex}%
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

But it will compile each time you make your main file.

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

To produce a pdf file out of the standalone class, use `make tikz filename` where filename is the name of the filename with the standalone class containing your Tikz picture.

It will create the file `filename.pdf` in the same directory (`ressources/tikz`).

To compile each Tikz figures into pdf, use `make tikz-all`.





## Ressources

http://ash.id.au/post/2014/09/19/thesis-in-latex/
https://github.com/derric/cleanthesis


## TODO

- Changer la page de garde pour faire un truc plus général (logo d'entreprise général)
- Changer la numérotation pour les section, subsection... (enlever un niveau, et reset à chaque chapitre)
- Mettre la numérotation des sections dans la marge
- Refaire bien le fichier de présentation
- Compléter ce readme avec des exemples et des "snippets"
- expliquer les commandes make
- Peut être plutôt faire un subfile par chapitre
    - ça va permettre de faire un make chap1 ou make chap2 pour compiler qu'il seul chapitre, sinon c'est plus compliquer pour chaque section
- faire un dossier script avec des scripts qui sont appelés par le makefile
- Faire un make tikz all pour générer tous les .tikz en .pdf
