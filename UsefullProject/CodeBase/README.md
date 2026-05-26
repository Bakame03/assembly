# README

## Exécution en linux bash ou Linux Subsystem for Windows (WSL)

* Il faut se placer dans le répertoire principal du projet.
* Exécutez la commande : make
* Les fichiers exécutables seront déposés dans le dossier Build

## Exécution avec Docker et docker-compose
Il faut commencer par installer et exécuter le Docker Desktop dans votre ordinateur. 
Il faudra aussi avoir une connexion internet parce que le projet docker demandera de
télécharger un image Ubuntu.

* Il faut se placer dans le répertoire principal du projet.
* Exécutez la commande : docker-compose up -d 
    * Cela lancera la construction de l'image Ubuntu spécifiée dans le Dockerfile.
    * Ensuite, il lancera le réseau et le conteneur avec l'image nasm-td1.
* Accédez au conteneur en marche avec la commande : docker exec -it nasm-td1 bash
* Une fois dans le conteneur, vous pouvez suivre la procédure indiqué dans la partie précedente comme étant dans une machine linux avec bash.

