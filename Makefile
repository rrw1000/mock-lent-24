# requires GNU make

# Warning: this Makefile does, by default, not know about all
# prerequisites of the PDFs it builds. If you update a figure, a simple
# "make" run may therefore not update all affected PDF target files.
# Therefore, after updating a figure file run "make --always-make"
# (or shorter "make -B") to unconditionally make all targets.

SHELL=/bin/bash

.DELETE_ON_ERROR:

%.pdf %.aux: %.tex
	pdflatex -halt-on-error -file-line-error $<
	while grep 'Rerun to get ' $*.log ; do pdflatex -halt-on-error $< ; done
%-solutions.pdf %-solutions.aux: %.tex
	pdflatex -halt-on-error -file-line-error -jobname '$*-solutions' \
	  '\documentclass{tripos}\begin{document}'\
	  '\begin{solutionnotes}\input{$*}\end{solutionnotes}\end{document}'
	while grep 'Rerun to get ' $*-solutions.log ; do \
	  pdflatex -halt-on-error -jobname '$*-solutions' \
	    '\documentclass{tripos}\begin{document}'\
	    '\begin{solutionnotes}\input{$*}\end{solutionnotes}\end{document}';\
	done
%-signoff.pdf %-signoff.aux: %.tex
	pdflatex -halt-on-error -file-line-error -jobname '$*-signoff' \
	  '\documentclass{tripos}\begin{document}'\
	  '\begin{signoff}\input{$*}\end{signoff}'\
	  '\begin{signoffchecker}\input{$*}\end{signoffchecker}'\
	  '\end{document}'
	while grep 'Rerun to get ' $*-signoff.log ; do \
	  pdflatex -halt-on-error -jobname '$*-signoff' \
	    '\documentclass{tripos}\begin{document}'\
	    '\begin{signoff}\input{$*}\end{signoff}'\
	    '\begin{signoffchecker}\input{$*}\end{signoffchecker}'\
	    '\end{document}' ;\
	done
# for xfig graphics
%.pdf: %.fig
	fig2dev -L pdf $< $*.pdf
%.pdftex %.pdftex_t: %.fig
	fig2dev -L pdftex_t -p $*.pdftex $< $*.pdftex_t
	fig2dev -L pdftex $< $*.pdftex

# build lists of papers and questions from wildcards
papers_tex := $(sort $(wildcard 20??-p??.tex))
papers_pdf := $(papers_tex:.tex=.pdf)
papersolutions_pdf := $(papers_tex:.tex=-solutions.pdf)
questions_tex := $(sort $(wildcard 20??-p??-q??.tex))
questions_pdf := $(questions_tex:.tex=.pdf)
questionsolutions_pdf := $(questions_tex:.tex=-solutions.pdf)
# other LaTeX files that produce PDF figures
auxiliary_tex := $(sort $(wildcard 20[2-9]?-p??-q??-*.tex))
auxiliary_pdf := $(auxiliary_tex:.tex=.pdf)

all: mock-ia.pdf

mock-ia.pdf: \
	tripos.cls

2023-p01.pdf 2023-p01-solutions.pdf 2023-p01-signoff.pdf: \
	2023-p01-q01.tex \
	2023-p01-q02.tex \
	2023-p01-q03.tex \
	2023-p01-q04.tex \
	2023-p01-q05.tex \
	2023-p01-q06.tex \
	2023-p01-q07.tex \
	2023-p01-q08.tex \
	2023-p01-q09.tex \
	2023-p01-q10.tex
2023-p02.pdf 2023-p02-solutions.pdf 2023-p02-signoff.pdf: \
	2023-p02-q01.tex \
	2023-p02-q02.tex \
	2023-p02-q03.tex \
	2023-p02-q04.tex \
	2023-p02-q05.tex \
	2023-p02-q06.tex \
	2023-p02-q07.tex \
	2023-p02-q08.tex \
	2023-p02-q09.tex \
	2023-p02-q10.tex
2023-p03.pdf 2023-p03-solutions.pdf 2023-p03-signoff.pdf: \
	2023-p03-q01.tex \
	2023-p03-q02.tex \
	2023-p03-q03.tex \
	2023-p03-q04.tex \
	2023-p03-q05.tex \
	2023-p03-q06.tex \
	2023-p03-q07.tex \
	2023-p03-q08.tex \
	2023-p03-q09.tex
2023-p04.pdf 2023-p04-solutions.pdf 2023-p04-signoff.pdf: \
	2023-p04-q01.tex \
	2023-p04-q02.tex \
	2023-p04-q03.tex \
	2023-p04-q04.tex \
	2023-p04-q05.tex \
	2023-p04-q06.tex \
	2023-p04-q07.tex \
	2023-p04-q08.tex
2023-p05.pdf 2023-p05-solutions.pdf 2023-p05-signoff.pdf: \
	2023-p05-q01.tex \
	2023-p05-q02.tex \
	2023-p05-q03.tex \
	2023-p05-q04.tex \
	2023-p05-q05.tex \
	2023-p05-q06.tex \
	2023-p05-q07.tex \
	2023-p05-q08.tex
2023-p06.pdf 2023-p06-solutions.pdf 2023-p06-signoff.pdf: \
	2023-p06-q01.tex \
	2023-p06-q02.tex \
	2023-p06-q03.tex \
	2023-p06-q04.tex \
	2023-p06-q05.tex \
	2023-p06-q06.tex \
	2023-p06-q07.tex \
	2023-p06-q08.tex \
	2023-p06-q09.tex \
	2023-p06-q10.tex
2023-p07.pdf 2023-p07-solutions.pdf 2023-p07-signoff.pdf: \
	2023-p07-q01.tex \
	2023-p07-q02.tex \
	2023-p07-q03.tex \
	2023-p07-q04.tex \
	2023-p07-q05.tex \
	2023-p07-q06.tex \
	2023-p07-q07.tex \
	2023-p07-q08.tex \
	2023-p07-q09.tex \
	2023-p07-q10.tex
2023-p08.pdf 2023-p08-solutions.pdf 2023-p08-signoff.pdf: \
	2023-p08-q01.tex \
	2023-p08-q02.tex \
	2023-p08-q03.tex \
	2023-p08-q04.tex \
	2023-p08-q05.tex \
	2023-p08-q06.tex \
	2023-p08-q07.tex \
	2023-p08-q08.tex \
	2023-p08-q09.tex \
	2023-p08-q10.tex \
	2023-p08-q11.tex \
	2023-p08-q12.tex \
	2023-p08-q13.tex
2023-p09.pdf 2023-p09-solutions.pdf 2023-p09-signoff.pdf: \
	2023-p09-q01.tex \
	2023-p09-q02.tex \
	2023-p09-q03.tex \
	2023-p09-q04.tex \
	2023-p09-q05.tex \
	2023-p09-q06.tex \
	2023-p09-q07.tex \
	2023-p09-q08.tex \
	2023-p09-q09.tex \
	2023-p09-q10.tex \
	2023-p09-q11.tex \
	2023-p09-q12.tex \
	2023-p09-q13.tex

# show a table of contents
toc:
	perl -ne '/\\begin\{question\}\[.*?,author=([\w+]+)\]\{(.*?)\}/ && printf "%-21s %s (%s)\n", $$ARGV, $$2, $$1' \
	  *.tex

clean:
	rm -f *.aux *.log *.synctex.gz *~
	rm -f $(questions_pdf) $(questionsolutions_pdf)
	rm -f $(papers_pdf) $(papersolutions_pdf)

# You can manually add further dependencies (e.g., figure files)
# in "Makefile-dependencies". Or use a tool such as
# https://github.com/mgkuhn/tdepend to do this for you.
include $(sort $(wildcard *-dependencies))
