#!/bin/bash

pdflatex -interaction=nonstopmode Artigo_ITSC_2016.tex
pdflatex -interaction=nonstopmode Artigo_ITSC_2016.tex
pdflatex -interaction=nonstopmode Artigo_ITSC_2016.tex

pdflatex -interaction=nonstopmode Artigo_ITSC_2016.tex > salida.txt

./clean.sh

#./clean.sh
