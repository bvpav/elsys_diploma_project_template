.POSIX:
.SUFFIXES:
.PHONY: all clean

MAIN_SRC = elsys_diploma_project.tex
TARGET_NAME = elsys_diploma_project

TARGET = $(TARGET_NAME).pdf
SOURCES = elsys_diploma_project.cls cleanthesis.sty \
	chapters/appendix.tex \
	chapters/chapter1-research.tex \
	chapters/chapter2-requirements.tex \
	chapters/chapter3-implementation.tex \
	chapters/chapter4-user-manual.tex \
	chapters/conclusion.tex \
	chapters/intro.tex \
	chapters/sections/examples.tex \
	chapters/sections/sample-text.tex \
	documents/guide_to_visualising.pdf \
	documents/sample_assignment_km.pdf \
	documents/sample_assignment_sp.pdf \
	images/boxplot_finger_distance.pdf \
	images/elsys_logo.pdf \
	images/relu.pdf \
	images/synthetic_2.png \
	images/synthetic.png \

all: $(TARGET)

$(TARGET): $(MAIN_SRC) $(SOURCES)
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -jobname=$(TARGET_NAME) $(MAIN_SRC)

mostlyclean:
	latexmk -c

clean:
	latexmk -C
	rm -f *.bbl *-SAVE-ERROR
