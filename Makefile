IMAGES=camels.gif dragon_tree4.jpg entrega.jpeg etsii.png ggoogle.gif gv.jpeg icon_errata.jpg logopcgull.gif moodlelogo.jpeg moodlePP2logo.jpeg next_g.png sytw.png prev_g.pngull-escu.gif ull.gif 

all: sytw html zip setimages public 

sytw: sytw.tex 
	pdflatex sytw.tex
	#latex sytw.tex
	#dvips -o sytw.ps sytw.dvi

fichagrupos.ps : fichagrupos.tex
	latex fichagrupos.tex
	dvips -t landscape fichagrupos.dvi -o fichagrupos.ps

#%.dvi : %.tex 
#	latex $<

# convert latex into html
html:
#	dohtml
	#listinginput.pl sytw.tex
	latex sytw.tex
	latex2html -html_version 4.0,latin1,unicode -bottom_navigation -link 8 -toc_depth 8 -address "" -info ""  -title "SyTW 13-14" -local_icons sytw.tex

# building PS and PDF files 

zip:
	zip -r sytw.zip sytw

public: 
	cp sytw.pdf sytw.zip sytw/
	rsync -av sytw/ ~/Dropbox/Public/STW/1314/programa_sytw_1314/

setimages: 
	cp images/* sytw/

lista:
	latex lista2003_2004; dvips lista2003_2004.dvi -o lista2003_2004.ps

clean:
	rm -f *.bak *.ps *.pdf *.log *.dvi *.aux *.idx *.bbl *.blg *.out

veryclean: clean
	rm -fR sytw.zip sytw/
