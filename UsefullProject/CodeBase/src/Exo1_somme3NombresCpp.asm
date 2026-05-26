	;; Codes à utiliser pour les interruptions.
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherStringPlusShort

	;; Séction des données initialisés. 
section .data
	;; Déclaration de trois entiers.
        valA db 1
        valB db 5
        valC db 3

	;; Message à afficher pour la somme.
        message db "La valeur de la somme est : ", 0
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
        global main

    main:

	;;Il faut coder ici.

    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

