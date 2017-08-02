# File adapted from this stackoverflow question: https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: main.pdf

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate a PDF instead of DVI.
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.
# -synctex=1 is required to jump between the source PDF and the text editor.
# -pvc (preview continuously) watches the directory for changes.
# -quiet suppresses most status messages (https://tex.stackexchange.com/questions/40783/can-i-make-latexmk-quieter).
main.pdf: main/main.tex
	latexmk -quiet -bibtex $(PREVIEW_CONTINUOUSLY) -f -pdf -cd -jobname=build/main -pdflatex="pdflatex -synctex=1 -interaction=nonstopmode -shell-escape" -use-make main/main.tex

# The .PHONY rule keeps make from processing a file named "watch" or "clean".
.PHONY: watch
# Set the PREVIEW_CONTINUOUSLY variable to -pvc to switch latexmk into the preview continuously mode
watch: PREVIEW_CONTINUOUSLY=-pvc
watch: main.pdf

.PHONY: clean
# -bibtex also removes the .bbl files (http://tex.stackexchange.com/a/83384/79184).

clean:
	latexmk -CA -bibtex

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
PDFVIEWER = evince
endif

ifeq ($(UNAME), Darwin)
PDFVIEWER = open
endif

open:
	(${PDFVIEWER} main.pdf &)

