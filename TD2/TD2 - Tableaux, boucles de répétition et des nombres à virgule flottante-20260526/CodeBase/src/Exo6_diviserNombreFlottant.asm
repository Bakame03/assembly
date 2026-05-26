	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherDouble
extern lireEntier
extern printf
	
	;; Séction des données initialisés. 	
section .data
	resultats times 100 dq 0.0 

	nombreA dq 15.3
	nombreB dq 3.2

	mille dq 1000.0

	;; Section des données pas initialisées.	
section .bss

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
	
