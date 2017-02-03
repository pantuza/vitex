#
# Makefile for compile my curriculum vitae
#


EN_FILE := cv_en
PT_FILE := cv_pt

TEX := xelatex

fontfile := fontin.zip
fontin := /usr/share/fonts/fontin


help:
	@echo "ViTeX target rules"
	@echo
	@echo "all   - Compiles english and portuguese PDF files"
	@echo "en    - Only compiles the english version"
	@echo "pt    - Only compiles the portuguese version"
	@echo "font  - Installs the font file into a linux box"
	@echo "clean - Cleans up the project"
	@echo "help  - Prints this help message with possible target rules"


all: $(EN_FILE).tex $(PT_FILE).tex
	$(TEX) $(EN_FILE).tex
	$(TEX) $(PT_FILE).tex


en: $(EN_FILE).tex
	@echo -e "Compiling English CV..."
	$(TEX) $(EN_FILE).tex
	evince $(EN_FILE).pdf


pt: $(PT_FILE).tex
	@echo -e "Compiling Portuguese (BR) CV..."
	$(TEX) $(PT_FILE).tex
	evince $(PT_FILE).pdf


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
