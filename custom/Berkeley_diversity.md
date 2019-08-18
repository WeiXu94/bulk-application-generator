---
output: 
  pdf_document:
    latex_engine: xelatex
fontsize: 12pt

numbersections: true
geometry: margin=1in
header-includes: |
  \usepackage{xcolor}
  \usepackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \usepackage{setspace}
  \setstretch{1}
  \usepackage{fontspec}
  \setmainfont{Lato}
  \setlength{\parskip}{1.1em}
  \usepackage{lastpage}
  \cfoot{\color{gray}\thepage\ of \pageref{LastPage}}

---

\fancyhead[L]{\textcolor{gray}{Candidate: Jane Doe}}
\fancyhead[C]{\textcolor{gray}{Diversity Statement}}
\fancyhead[R]{\textcolor{gray}{jane.doe@school.edu}}

I recognize the difficulties facing women and minorities in academia. 