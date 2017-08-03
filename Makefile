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

MAINDIRECTORY := $(shell pwd)
# =============================================================


# =============================================================
# Main builders
# =============================================================
all: main.pdf

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

# =============================================================
# Tikz Standalone files
# =============================================================
.PHONY: tikz
tikz:
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c

.PHONY: tikz-watch
tikz-watch:
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -pvc $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c

# =============================================================
# Appendix
# =============================================================
.PHONY: appendix
appendix:
	cd appendix/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c

.PHONY: appendix-watch
appendix-watch:
	cd appendix/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -pvc $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c

# =============================================================
# Main files
# =============================================================
titlepage: titlepage/titlepage.pdf
introduction: introduction/introduction.pdf
chap1: chap1/chap1.pdf
chap2: chap2/chap2.pdf
chap3: chap3/chap3.pdf
chap4: chap4/chap4.pdf
conclusion: conclusion/conclusion.pdf

.PHONY: FORCE_MAKE
%.pdf: %.tex FORCE_MAKE
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -bibtex $< && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c $<

.PHONY: f-watch
f-watch:
	cd $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -bibtex -pvc $(f)/$(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c

