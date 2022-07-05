#!/usr/bin/env xonsh

p"~/.xonshrc".exists() && source ~/.xonshrc

from os.path import dirname,abspath,exists
from fire import Fire


@Fire
def main(pdf):
  if not exists(pdf):
    return

  dir = pdf[:-4]

  rm -rf @(dir)
  mkdir -p @(dir)

  pdfimages -png @(pdf) @(dir)/

  cd @(dir)

  for i in $(ls .).split('\n'):
    print(i)
    if i.startswith('-'):
      pngquant ./@(i) -o @(i[1:])
      rm -rf ./@(i)
