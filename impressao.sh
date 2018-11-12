#!/bin/bash

arquivo=$1

caractere=$(cat $arquivo | wc -m)
linhas=$(cat $arquivo | wc -l)

total=$(expr $caractere - $linhas)

paginas=$(./ceiling $total 3600)

echo $paginas