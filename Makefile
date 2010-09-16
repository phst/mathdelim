PKG := mathdelim

DTX := $(PKG).dtx
INS := $(PKG).ins
STY := $(PKG).sty
PDF := $(PKG).pdf
EL := $(PKG).el
IDXSRC := $(PKG).idx
IDXDST := $(PKG).ind
IDXSTY := gind.ist
GLOSRC := $(PKG).glo
GLODST := $(PKG).gls
GLOSTY := gglo.ist

SOURCES := $(DTX) $(INS)
OBJECTS := $(STY) $(PDF)

TEXMF := $(shell kpsewhich --var-value=TEXMFHOME)
STYDIR := $(TEXMF)/tex/latex/phst
PDFDIR := $(TEXMF)/doc/latex/phst
ELDIR := ~/.emacs.d/auctex/style/phst

INSTALL := install
MKTEXLSR := mktexlsr
TEX := tex
LATEX := pdflatex
LATEXFLAGS := --file-line-error --interaction=nonstopmode
DRAFTFLAGS := --draftmode
FINALFLAGS := --synctex=1
MAKEINDEX := makeindex


all: package doc auctex-style

package: $(STY)

doc: $(PDF)

auctex-style: $(EL)

install: install-package install-doc install-auctex-style

install-package: package
	$(INSTALL) -d $(STYDIR)
	$(INSTALL) -c -m 644 $(STY) $(STYDIR)
	$(MKTEXLSR)

install-doc: doc
	$(INSTALL) -d $(PDFDIR)
	$(INSTALL) -c -m 644 $(PDF) $(PDFDIR)
	$(MKTEXLSR)

install-auctex-style: auctex-style
	$(INSTALL) -d $(ELDIR)
	$(INSTALL) -c -m 644 $(EL) $(ELDIR)

$(STY): $(SOURCES)
	$(TEX) $(INS)

$(PDF): $(STY) $(DTX)
	$(LATEX) $(LATEXFLAGS) $(DRAFTFLAGS) $(DTX)
	$(MAKEINDEX) -s $(IDXSTY) -o $(IDXDST) $(IDXSRC)
	$(MAKEINDEX) -s $(GLOSTY) -o $(GLODST) $(GLOSRC)
	$(LATEX) $(LATEXFLAGS) $(DRAFTFLAGS) $(DTX)
	$(LATEX) $(LATEXFLAGS) $(FINALFLAGS) $(DTX)
