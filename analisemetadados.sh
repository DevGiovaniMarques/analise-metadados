#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Erro: Forneça os argumentos necessários."
    echo "Uso: $0 <domínio> <extensão_do_arquivo>"
    echo "Exemplo: $0 site.com pdf"
    exit 1
fi


dominio=$1
arquivo=$2

echo "Procurando por arquivos com extensão '$arquivo' no domínio '$dominio'..."

lynx --dump "http://google.com/search?&q=site:$dominio+ext:$arquivo" | grep "$arquivo" |>

for url in $(cat resultados.txt); do
        wget -q $url;
done

exiftool *.$arquivo
