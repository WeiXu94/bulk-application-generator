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
\fancyhead[C]{\textcolor{gray}{Statement of Purpose}}
\fancyhead[R]{\textcolor{gray}{jane.doe@school.edu}}

I was born in Michigan.

I have published in \textit{Science}.

I am applying to Michigan’s PhD program because Michigan is awesome. 

