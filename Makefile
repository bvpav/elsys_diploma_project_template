.POSIX:
.SUFFIXES:
.PHONY: all clean

MAIN_SRC = elsys_diploma_project.tex
TARGET_NAME = elsys_diploma_project

LATEX = pdflatex
LATEX_FLAGS = -interaction=nonstopmode

BIBER = biber
BIBER_FLAGS =

BUILD_DIR = build
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

$(TARGET): $(BUILD_DIR) $(MAIN_SRC) $(SOURCES)
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) -jobname=$(TARGET_NAME) $(MAIN_SRC)
	$(BIBER) $(BIBER_FLAGS) $(BUILD_DIR)/$(TARGET_NAME)
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) -jobname=$(TARGET_NAME) $(MAIN_SRC)
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) -jobname=$(TARGET_NAME) $(MAIN_SRC)
	ln $(BUILD_DIR)/$(TARGET_NAME).pdf $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

mostlyclean:
	rm -rf $(BUILD_DIR)

clean: mostlyclean
	rm -f $(TARGET)
