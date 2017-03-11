ALL= \
	toc.pdf \
	intro.pdf \
	light-1.pdf

%.pdf : %.tex
	pdflatex $*; bibtex $*; pdflatex $*; pdflatex $*

all: $(ALL)

fullclean:
	rm *.pdf *.log *.aux *.bbl *.blg *.out

dummy:
