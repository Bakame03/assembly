	;; Codes à utiliser pour les interruptions.
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
	STDOUT    equ 1
	SUCCES    equ 0

	;; Séction des données initialisés. 
section .data
	;; Déclaration de trois entiers.
        valA db 1
        valB db 3
        valC db 3

	;; Message à afficher pour la somme.
        message db "La valeur de la somme est : "
        lenMessage EQU $-message

	;; Passage à la ligne pour mieux visualiser la sortie.
        passageLigne db 10
        lenPassageLigne EQU $-passageLigne

	;; Section des données pas initialisées.
section .bss
	;; Variable que contiendra le résultat.
        somme resb 1

	;; Section du programme.
section .text
	;; Global nécessaire pour le linkage du programme.
        global _start

    _start:

	;; Ces lignes font la somme des nombres.
        MOV AL, [valA]
        ADD AL, [valB]
        ADD AL, [valC]
	
	;; Permet de visualiser le résultat comme un ASCII.
        ADD AL, '0'

	;; Stocke le résultat en ASCII dans la variable somme.
        MOV [somme], AL

       ;Afficher le message de la somme
       mov eax, SYS_ECRIRE
       mov ebx, STDOUT
       mov ecx, message
       mov edx, lenMessage
       int 80h

       ;Afficher la somme.
       mov eax, SYS_ECRIRE
       mov ebx, STDOUT
       mov ecx, somme
       mov edx, 1
       int 80h

       ;Afficher un passage à la ligne.
       mov eax, SYS_ECRIRE
       mov ebx, STDOUT
       mov ecx, passageLigne
       mov edx, lenPassageLigne
       int 80h

    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

