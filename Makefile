# =============================================================
# Some Notes About Makefiles
# =============================================================
# cible: dependance
# 	commandes

# $@ 	Le nom de la cible
# $< 	Le nom de la première dépendance
# $^ 	La liste des dépendances
# $? 	La liste des dépendances plus récentes que la cible
# $* 	Le nom du fichier sans suffixe

# The .PHONY rule keeps make from processing a file named "watch" or "clean".
# =============================================================


# =============================================================
# Define Some Variables
# =============================================================
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
PDFVIEWER = evince
endif

ifeq ($(UNAME), Darwin)
PDFVIEWER = open
endif

TIKZFILES := $(wildcard ressources/tikz/*.tex) 

MAINDIRECTORY := $(shell pwd)
# =============================================================

all: main.pdf

# -pdf tells latexmk to generate a PDF instead of DVI.
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.
# -synctex=1 is required to jump between the source PDF and the text editor.
# -pvc (preview continuously) watches the directory for changes.
# -quiet suppresses most status messages (https://tex.stackexchange.com/questions/40783/can-i-make-latexmk-quieter).
# -jobname=directory/name used to change to output directory
main.pdf: main/main.tex
	mkdir -p main/build && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_main $(PREVIEW_CONTINUOUSLY) main/main.tex

.PHONY: watch
watch: PREVIEW_CONTINUOUSLY=-pvc
watch: main.pdf

.PHONY: clean
clean:
	latexmk -cd -c -bibtex main/build/main.pdf

.PHONY: open
open:
	(${PDFVIEWER} main/build/main.pdf &)

.PHONY: tikz
tikz:
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles $(argument) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c

.PHONY: tikz-all
tikz-all: $(TIKZFILES)
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles $^ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c $^

introduction: introduction/introduction.pdf
conclusion: conclusion/conclusion.pdf
titlepage: titlepage/titlepage.pdf

.PHONY : FORCE_MAKE
%.pdf : %.tex FORCE_MAKE
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -bibtex $< && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c $<

