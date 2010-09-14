PKG := mathdelim

DTX := $(PKG).dtx
INS := $(PKG).ins
STY := $(PKG).sty
PDF := $(PKG).pdf
IDXSRC := $(PKG).idx
IDXDST := $(PKG).ind
GLOSRC := $(PKG).glo
GLODST := $(PKG).gls

SOURCES := $(DTX) $(INS)
OBJECTS := $(STY) $(PDF)

TEXMF := $(shell kpsewhich -var-value=TEXMFHOME)
STYDIR := $(TEXMF)/tex/latex/phst
PDFDIR := $(TEXMF)/doc/latex/phst


default: $(STY)

doc: $(PDF)

all: default doc

install: default
	install -d $(STYDIR)
	install $(STY) $(STYDIR)
	mktexlsr

install-doc: doc
	install -d $(PDFDIR)
	install $(PDF) $(PDFDIR)
	mktexlsr

install-all: install install-doc

$(STY): $(SOURCES)
	tex $(INS)

$(PDF): $(STY) $(DTX)
	pdflatex -file-line-error -interaction=nonstopmode -draftmode $(DTX)
	makeindex -s gind.ist -o $(IDXDST) $(IDXSRC)
	makeindex -s gglo.ist -o $(GLODST) $(GLOSRC)
	pdflatex -file-line-error -interaction=nonstopmode -draftmode $(DTX)
	pdflatex -file-line-error -interaction=nonstopmode -synctex=-1 $(DTX)
