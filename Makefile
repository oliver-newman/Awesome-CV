.PHONY: documents

CC = xelatex
DOCUMENTS_DIR = documents
RESUME_DIR = $(DOCUMENTS_DIR)/resume
CV_DIR = $(DOCUMENTS_DIR)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

documents: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(DOCUMENTS_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(DOCUMENTS_DIR) $<

cv.pdf: $(DOCUMENTS_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(DOCUMENTS_DIR) $<

coverletter.pdf: $(DOCUMENTS_DIR)/coverletter.tex
	$(CC) -output-directory=$(DOCUMENTS_DIR) $<

clean:
	rm -rf $(DOCUMENTS_DIR)/*.pdf
	rm -rf $(DOCUMENTS_DIR)/*.log
