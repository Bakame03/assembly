	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern afficherDouble
extern lireEntier
extern printf
	
	;; Séction des données initialisés. 	
section .data
	tableau DD 3, 6, 7, 9, 10, 15, 25, 16, 30, 40
	
	;; Section des données pas initialisées.	
section .bss
	indiceA resd 1
	indiceB resd 1

	
	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
		;; Il faut coder ici.
	
    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h