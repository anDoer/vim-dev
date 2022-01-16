#!/bin/bash 

nvim --headless +PlugInstall +qall
nvim --headless +'CocInstall -sync coc-snippets' +qall
nvim --headless +'CocInstall -sync coc-prettier' +qall
nvim --headless +'CocInstall -sync coc-jedi' +qall
nvim --headless +'CocInstall -sync coc-highlight' +qall
nvim --headless +'CocInstall -sync coc-eslint' +qall
nvim --headless +'CocInstall -sync coc-json' +qall
nvim --headless +'CocInstall -sync coc-git' +qall
nvim --headless +'CocUpdateSync' +qall
