#!/bin/bash
ano=$(date +%Y)
mes=$(date +%m)
cota=$(cat cota)
ano_cota=$ano
mes_cota=$(expr $mes - 1)
if [ ! -d "$ano" ]; then
	mkdir $ano

	if [ "$mes" = "1"];then 
		ano_cota=$(expr ano - 1)
		mes_cota=12
	fi
fi

if [ ! -f  "$ano/usuarios_$mes.csv" ]; then
	while read linha 
	do 
		nome=$(echo $linha | awk -F ";" '{print $1}')
		cota_consumida=$(echo $linha | awk -F ";" '{print $3}')

		if [ "$cota_consumida" -gt "$cota" ]; then
			cota_consumida=$(expr $cota_consumida - $cota)
		else
			cota_consumida=0
		fi
		echo "$nome;0;$cota_consumida" >> $ano/"usuarios_$mes.csv"
		
	done < "$ano_cota/usuarios_$mes_cota.csv"
fi
