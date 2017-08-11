.PHONY: documents

CC = xelatex
DOCUMENTS_DIR = documents
RESUME_DIR = $(DOCUMENTS_DIR)/resume
CV_DIR = $(DOCUMENTS_DIR)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

documents: $(foreach d, coverletter cv resume, $d)

resume: $(DOCUMENTS_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(DOCUMENTS_DIR) $<

cv: $(DOCUMENTS_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(DOCUMENTS_DIR) $<

coverletter: $(DOCUMENTS_DIR)/coverletter.tex
	$(CC) -output-directory=$(DOCUMENTS_DIR) $<

clean:
	rm -rf $(DOCUMENTS_DIR)/*.pdf
	rm -rf $(DOCUMENTS_DIR)/*.log
	rm -rf $(DOCUMENTS_DIR)/*.out
	rm -rf $(DOCUMENTS_DIR)/*.aux
