#
# Makefile for compile my curriculum vitae
#


EN_FILE := cv_en
PT_FILE := cv_pt

TEX := xelatex

fontfile := fontin.zip
fontin := /usr/share/fonts/fontin

OUT_NAME := gustavo-pantuza

DOCKER_CMD := docker run -it --rm -v $(PWD):/doc vitex:latest

help:
	@echo "ViTeX target rules"
	@echo
	@echo "all          - Compiles english and portuguese PDF files"
	@echo "en           - Only compiles the english version"
	@echo "pt           - Only compiles the portuguese version"
	@echo "font         - Installs the font file into a linux box"
	@echo "docker_build - Build docker image"
	@echo "docker_all   - Compilies all cv files using docker"
	@echo "docker_en    - Compilies english cv file using docker"
	@echo "docker_pt    - Compilies portuguese cv file using docker"
	@echo "clean        - Cleans up the project"
	@echo "help         - Prints this help message with possible target rules"


all: en pt


en: $(EN_FILE).tex
	@echo -e "Compiling English CV..."
	$(TEX) $(EN_FILE).tex && mv $(EN_FILE).pdf $(OUT_NAME)-en.pdf


pt: $(PT_FILE).tex
	@echo -e "Compiling Portuguese (BR) CV..."
	$(TEX) $(PT_FILE).tex && mv $(PT_FILE).pdf $(OUT_NAME)-pt.pdf


font: $(fontfile)
	@echo -e "# Installing Fontin on system\n"
	sudo mkdir -p $(fontin)
	sudo cp $(fontfile) $(fontin)
	sudo unzip $(fontin)/$(fontfile) -d $(fontin)
	sudo rm $(fontin)/$(fontfile)
	@echo -e "\n# Updating system font cache\n"
	sudo fc-cache -fv

docker_build: Dockerfile
	@docker build --tag vitex:latest .

docker_all:
	$(DOCKER_CMD) make all

docker_en:
	$(DOCKER_CMD) make en

docker_pt:
	$(DOCKER_CMD) make pt

docker_shell:
	$(DOCKER_CMD) sh

clean:
	rm *.log *.aux *.out *.pdf
