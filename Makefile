.POSIX:
.SUFFIXES:
.PHONY: all clean

TARGET = elsys_diploma_project.pdf
SOURCE = elsys_diploma_project.tex

all: $(TARGET)

$(TARGET): $(SOURCE)
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $(SOURCE)

mostlyclean:
	latexmk -c

clean:
	latexmk -C
	rm -f *.bbl
