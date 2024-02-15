#!/usr/bin/env bash
#
# extrai_titulos.sh - Extrai titulos do site
#
# Site:       https://github.com/rocoxta
# Autor:      Rodrigo Costa
# Manutenção: Rodrigo Costa
#
# ------------------------------------------------------------------------ #
#  Este programa irá extrair títulos do site ubuntuforum-br, colocar em um arquivo de
#  texto e ler mostrando com cores na tela.
#
#  Exemplos:
#      $ ./extrai_titulos.sh
#      Neste exemplo o programa vai extrair os titulos e mostrar na tela.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 14/02/2024, Rodrigo:
#       - Montamos a expressões regular com fator em comum
#   v1.1 15/02/2024, Rodrigo:
#       - Criado primeiro código com cores
# ------------------------------------------------------------------------ #
# Testado em:
# 	bash 5.1.16
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_TITULOS="titulos.txt"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y # Verifica se o Lynx está instalado.
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
lynx -source https://ubuntuforum-br.org/ | grep subject | sed 's/<a class=.*">//;s/<\/a>.*//' > titulos.txt

while read -r titulo_lx  #Para cada título do arquivo titulo.txt, irá coloca a informação dentro da variável titulo_lx.
do
  echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lx"
done < "$ARQUIVO_DE_TITULOS"
# ------------------------------------------------------------------------ #
