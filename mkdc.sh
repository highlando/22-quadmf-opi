MDFILE=slides.md

pandoc $MDFILE -o index.html \
    --citeproc --csl=frontiers-in-physics.csl \
    --mathjax -t revealjs --slide-level=2 -s \
    -V theme=solarized \
    -V viewDistance=15 -V width=1280 -V height=880 -V margin=0.05

vim -s jointhelines.vim index.html

# pandoc $MDFILE -o slides.pdf \
#     --citeproc \
#     --mathjax -t beamer -V theme:Berlin
# 
# pandoc $MDFILE -o slides-body.tex \
#     --citeproc \
#     --mathjax -t beamer
# 
# pandoc $MDFILE -s -o slides.tex \
#     --citeproc \
#     --mathjax -t beamer
