# Bulk Application Generator

This is a script I used to generate my graduate school personal statements. It can generate PDFs from Markdown templates and append school-specific paragraphs to each statement. 


## Contents
- [Bulk Application Generator](#bulk-application-generator)
  - [Contents](#contents)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
    - [Template](#template)
    - [Custom Files](#custom-files)
    - [Compiling](#compiling)

## Prerequisites

- [pandoc](https://github.com/jgm/pandoc)
- [LaTeX](https://www.latex-project.org/get/)

## Usage

### Template

- `header.yaml` contains the LaTeX specifications. 
  - See pandoc's YAML metadata block [documentation](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) for details.
- `template.md` contains the part of your statement that is shared across all schools. 
  - Use `SCHOOL_NAME` as a placeholder for the school's name. 
    - This will also be used as the name of the subfolder under `statements` for the output files. 
  - You can also use `SCHOOL_ALT_NAME` as a placeholder for an alternative name of school, e.g., "the University of Chicago" as opposed to "UChicago"
  - Values for the placeholders are specified in `Makefile`, and discussed in the [Compiling](#compiling) section. 

### Custom Files

School-specific writings should be place in the `custom` folder. 

- Use `SCHOOL_NAME_last.md` for a paragraph that will be appended to main statement. 
- Other `SCHOOL_NAME_*.md` files are for statements that are written specifically for a school. 
  - For example, one can write a `Berkeley_diversity.md` for Berkeley's diversity statement requirement. 
  - `header.yaml` will be automatically prepended to the file. 

### Compiling

- Edit `Makefile` so that under `all:`, you have one command for each school that specifies the desired values for the placeholders. 
  - The value for `SCHOOL` will replace instances of `SCHOOL_NAME` in `template.md`. An optional `SCHOOL_ALT_NAME` can also be specified. 
  - `make statement` will compile only the main statement, while `make other` will compile only the additional school-specific statements like the diversity statement. `make both` will compile both. 
  - Examples: 
    ```
    make both SCHOOL=Michigan
    make both SCHOOL=UChicago SCHOOL_ALT_NAME="the University of Chicago" 
    ```
- Run `make all` in the root folder. The resulting PDFs and intermediary Markdown files for the main statement should be in the `statements` folder. (Files generated in the folder will be overridden each time one runs `make`.)
- By default, the PDFs will be opened automatically once they are generated. 