#!/bin/bash

pdflatex -interaction=nonstopmode Artigo-versao-portugues.tex
pdflatex -interaction=nonstopmode Artigo-versao-portugues.tex
pdflatex -interaction=nonstopmode Artigo-versao-portugues.tex

pdflatex -interaction=nonstopmode Artigo-versao-portugues.tex > salida.txt

./clean.sh

#./clean.sh
