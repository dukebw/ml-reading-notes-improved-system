NOTES=ml-reading-notes

all:
	xelatex $(NOTES).tex
	bibtex $(NOTES).aux
	xelatex $(NOTES).tex
	xelatex $(NOTES).tex
	$(MAKE) clean

clean:
	rm -rf *.acn *.alg *.glg *.glo *.gls *.glsdefs *.ist *.xdy *.acr *.bbl *.blg *.aux *.dvi *.log *.lot *.idx *.toc *.lof *.brf *.out

mrproper: clean
	rm -rf *.pdf
