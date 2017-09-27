PRESENTATION=pytorch-internals

all:
	xelatex $(PRESENTATION).tex
	bibtex $(PRESENTATION).aux
	xelatex $(PRESENTATION).tex
	xelatex $(PRESENTATION).tex
	$(MAKE) clean

clean:
	rm -rf *.acn *.alg *.glg *.glo *.gls *.glsdefs *.ist *.xdy *.acr *.bbl *.blg *.aux *.dvi *.log *.lot *.idx *.toc *.lof *.brf *.out *.snm *.nav *.vrb

mrproper: clean
	rm -rf *.pdf
