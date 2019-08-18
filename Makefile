TEMPLATE = template.md
YAML_FILE = header.yaml
OUT_SUFFIX = _main
OUT_DIR = statements
CUSTOM_DIR = custom

SCHOOL = Chicago
SCHOOL_ALT_NAME = $(SCHOOL)
OUT_NAME = $(SCHOOL)$(OUT_SUFFIX)
SCHOOL_DIR = $(OUT_DIR)/$(SCHOOL)
CUSTOM_FOLDER = $(SCHOOL_DIR)
SCHOOL_MD = $(SCHOOL_DIR)/$(OUT_NAME).md
MAIN_PDF = $(SCHOOL_DIR)/$(OUT_NAME).pdf
CUSTOM_LAST = $(CUSTOM_DIR)/$(OUT_NAME)_last.md

statement: 
	mkdir -p $(SCHOOL_DIR)
	# copying manually to save intermediary .md files
	cp $(YAML_FILE) $(SCHOOL_MD)
	sed "s/SCHOOL_NAME/$(SCHOOL)/g; s/SCHOOL_ALT_NAME/$(SCHOOL_ALT_NAME)/g" $(TEMPLATE) >> $(SCHOOL_MD)	
	if [[ -a $(CUSTOM_LAST) ]] ; then cat $(CUSTOM_LAST) >> $(SCHOOL_MD) ; fi; 
	pandoc $(SCHOOL_MD) -o $(MAIN_PDF) --pdf-engine=xelatex
	# rm $(SCHOOL_MD)
	open $(MAIN_PDF)

other: 
	# make a pdf for everything other than _last.md in the custom directory
	# prepend yaml file if necessary
	for file in $(CUSTOM_DIR)/$(SCHOOL)_*.md ; do \
		if [[ ! $$file =~ \.*_last.md ]] ; then \
			filename="$$(basename $${file%.*})" ; \
			school="$${filename%_*}" ; \
			out="$(OUT_DIR)/$$school/$$filename.pdf" ; \
			command="$$file -o $$out --pdf-engine=xelatex" ; \
			if [[ "$$(grep -c 'pdf_document' $$file)" -lt 1 ]] ; then \
				pandoc $(YAML_FILE) $$command ; \
			else \
				pandoc $$command ; \
			fi ; \
			open $$out ; \
		fi ; \
	done

both: statement other

all:
	make both SCHOOL=Berkeley
	make both SCHOOL=Michigan
	make both SCHOOL=UChicago SCHOOL_ALT_NAME="the University of Chicago" 
