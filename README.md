# Quadratic Manifold Operator Inference

Benner, Goyal, Heiland, Pontes-Duff

at Eccomas 2022

## How to use

To edit the contents change the file

```
slides.md
```

To get the `html` output run

```sh
source mkdc.sh
```

and watch `slides.html` with your browser.

## Notes

1. The `slides.html` produced by `pandoc v2.17` have an **unwanted line break** in the options section where `parallaxBackgroundSize` is defined (which makes the browser refuse to display the slides). The vim script `jointhelines.vim` joins these two lines. 

2. This script produces a beamer PDF and the sources as `.tex`, too.

## Documentation

 * [Slide shows with pandoc](https://pandoc.org/MANUAL.html#slide-shows)
 * [Pandoc Manual](https://pandoc.org/MANUAL.html)
 * [Reveal.js options](https://revealjs.com/config/)

