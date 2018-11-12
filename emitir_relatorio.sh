#!/bin/bash
clear;
echo "RELATORIO DE RECURSOS"
echo -e "\nUsuarios Arquivos Paginas";
cat usuarios.csv | awk -F ';' '{

		total+=$3
		qtdEspacoNome = 13 - length($1)
		qtdEspacoNum = 8 - length($2)
		espacoNome = ""
		espacoNum = ""
		for(i = 0 ; i < qtdEspacoNome; i++){
			espacoNome = espacoNome " "
		}
		for(j = 0; j < qtdEspacoNum; j++){
			espacoNum = espacoNum " "
		}
		print $1 espacoNome $2 espacoNum $3
	
	} END {
		print "\nTotal de Paginas Impressas: "total"\n"
	}';