PDFDIR= docs/pdf
TEXDIR= tex

vpath %.tex $(TEXDIR)

ALL= \
	$(PDFDIR)/toc.pdf \
	$(PDFDIR)/intro.pdf \
	$(PDFDIR)/inventory.pdf \
	$(PDFDIR)/inventory-answers.pdf \
	$(PDFDIR)/detectors.pdf \
	$(PDFDIR)/detectors-answers.pdf \
	$(PDFDIR)/atmosphere.pdf \
	$(PDFDIR)/atmosphere-answers.pdf \
	$(PDFDIR)/telescopes.pdf \
	$(PDFDIR)/telescopes-answers.pdf \
	$(PDFDIR)/ism.pdf \
	$(PDFDIR)/ism-answers.pdf \
	$(PDFDIR)/images.pdf \
	$(PDFDIR)/images-answers.pdf \
	$(PDFDIR)/spectra.pdf \
	$(PDFDIR)/spectra-answers.pdf \
	$(PDFDIR)/emission-line.pdf \
	$(PDFDIR)/emission-line-answers.pdf \
	$(PDFDIR)/dynamics.pdf \
	$(PDFDIR)/dynamics-answers.pdf \
	$(PDFDIR)/lensing.pdf \
	$(PDFDIR)/lensing-answers.pdf \
	$(PDFDIR)/galaxies.pdf \
	$(PDFDIR)/galaxies-answers.pdf \
	$(PDFDIR)/stellar-evolution.pdf \
	$(PDFDIR)/stellar-evolution-answers.pdf \
	$(PDFDIR)/stellar-clusters.pdf \
	$(PDFDIR)/stellar-clusters-answers.pdf \
	$(PDFDIR)/cosmology.pdf \
	$(PDFDIR)/cosmology-answers.pdf \
	$(PDFDIR)/structure.pdf \
	$(PDFDIR)/structure-answers.pdf \
	$(PDFDIR)/light-1.pdf \
	$(PDFDIR)/light-1-answers.pdf \
	$(PDFDIR)/light-2.pdf \
	$(PDFDIR)/light-2-answers.pdf

$(PDFDIR)/%.pdf $(PDFDIR)/%-answers.pdf: $(TEXDIR)/%.tex \
	$(TEXDIR)/%-text.tex $(TEXDIR)/%-answers.tex $(TEXDIR)/exex_defs.tex
	cd $(TEXDIR); pdflatex $(*F); bibtex $(*F); pdflatex $(*F); pdflatex $(*F)
	cd $(TEXDIR); pdflatex $(*F)-answers; bibtex $(*F)-answers; pdflatex $(*F)-answers; pdflatex $(*F)-answers
	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)
	mv $(TEXDIR)/$(*F)-answers.pdf $(PDFDIR)

$(PDFDIR)/%.pdf: $(TEXDIR)/%.tex
	cd $(TEXDIR); pdflatex $(*F); bibtex $(*F); pdflatex $(*F); pdflatex $(*F)
	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)

all: $(ALL)

texclean:
	rm -f $(TEXDIR)/*.log $(TEXDIR)/*.aux $(TEXDIR)/*.bbl $(TEXDIR)/*.blg $(TEXDIR)/*.out

fullclean: texclean
	rm -f $(PDFDIR)/*.pdf

dummy:
