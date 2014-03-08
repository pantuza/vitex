#
# Makefile for compile my curriculum vitae
#


filename := cv.tex
output := vitex.pdf


cv: cv.tex
	@echo -e "Compiling CV..."
	$(TEX) $(filename) $(output)


clean:
	rm *.tmp *.out *.pdf

