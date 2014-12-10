NAME = BV_AM_Final

$(NAME).pdf: $(NAME).tex
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)

clean:
	rm -f $(NAME).aux $(NAME).bbl $(NAME).dvi $(NAME).blg $(NAME).ps $(NAME).pdf $(NAME).out *log *~

