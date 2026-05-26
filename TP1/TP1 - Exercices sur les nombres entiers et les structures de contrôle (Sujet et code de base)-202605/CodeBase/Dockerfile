FROM ubuntu:24.04

# Installation des dépendances nécessaires pour exécuter le code de ce TP.
RUN apt-get update
RUN yes | apt-get install g++
RUN yes | apt-get install nasm
RUN yes | apt-get install make

# Spécifie le dossier de travail. 
WORKDIR /app

# Copie le code source de l'application dans le répertoire app.
COPY . ./

# Le dossier Build devient le répertoire de travail. 
WORKDIR /app
