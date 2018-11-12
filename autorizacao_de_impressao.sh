#!/bin/bash

usuario=$1
arquivo=$2
result=""
result=$(grep -w $usuario usuarios.csv)
arquivos_impresso=$(echo $result | awk -F ";" '{print $2}')
cota_utilizada=$(echo $result | awk -F ";" '{print $3}')
cota=$(cat cota)
clear
if [ "$result" = "" ]; then
	echo "Erro: Usuário não cadastrado."
elif [ "$cota_utilizada" -ge "$cota" ]  ;then
	echo "Erro: Cota consumida"
else
	paginas=$(./impressao.sh $arquivo)
	arquivos_impresso=$(expr $arquivos_impresso + 1)
	cota_utilizada=$(expr $cota_utilizada + $paginas)
	sed -i "/$usuario/ c $usuario;$arquivos_impresso;$cota_utilizada" usuarios.csv
	echo "Impressao bem sucedida"
	echo "Total de paginas impressas: $paginas"
	echo "Cota utilizada: $cota_utilizada"
fi
