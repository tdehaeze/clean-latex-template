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
all: pdf

# PDF
.PHONY: pdf
ifeq ($(f),)
ifeq ($(t), tikz)
pdf:
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c
else
pdf:
	mkdir -p main/build && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_main $(PREVIEW_CONTINUOUSLY) main/main.tex
endif
else
ifeq ($(t), tikz)
pdf:
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c
else
pdf:
	cd $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -bibtex $(f)/$(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c
endif
endif

# CLEAN
.PHONY: clean
ifeq ($(f),)
clean:
	latexmk -cd -c -bibtex main/build/main.pdf
else
clean:
	cd $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c
endif

# OPEN
.PHONY: open
ifeq ($(f),)
open:
	(${PDFVIEWER} main/build/main.pdf &)
else
ifeq ($(t), tikz)
open:
	(${PDFVIEWER} ressources/tikz/$(f).pdf &)
else
open:
	(${PDFVIEWER} $(f)/$(f).pdf &)
endif
endif

# WATCH
.PHONY: watch
ifeq ($(f),)
watch:
	mkdir -p main/build && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_main $(PREVIEW_CONTINUOUSLY) -pvc main/main.tex
else
ifeq ($(t), tikz)
watch:
	cd ressources/tikz/ && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -pvc $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c
else
watch:
	cd $(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -bibtex -pvc $(f)/$(f) && \
	latexmk -r $(MAINDIRECTORY)/.latexmkrc_subfiles -c
endif
endif

