PDFDIR= ../docs/pdf

ALL= \
	toc.pdf \
	intro.pdf \
	light-1.pdf

%.pdf : %.tex
	pdflatex $*; bibtex $*; pdflatex $*; pdflatex $*
	mv $*.pdf $(PDFDIR)

all: $(ALL)

fullclean:
	rm *.log *.aux *.bbl *.blg *.out

dummy:
