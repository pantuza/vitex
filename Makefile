#
# Makefile for compile my curriculum vitae
#


filename := cv.tex
TEX := xelatex
fontfile := fontin.zip
fontin := /usr/share/fonts/fontin


cv: cv.tex
	@echo -e "Compiling CV..."
	$(TEX) $(filename)
	evince cv.pdf


font: $(fontfile)
	@echo -e "# Installing Fontin on system\n"
	sudo mkdir -p $(fontin)
	sudo cp $(fontfile) $(fontin)
	sudo unzip $(fontin)/$(fontfile) -d $(fontin)
	sudo rm $(fontin)/$(fontfile)
	@echo -e "\n# Updating system font cache\n"
	sudo fc-cache -fv


clean:
	rm *.log *.aux *.out *.pdf

