	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern printf
	
	;; Séction des données initialisés. 	
section .data
	message db "La somme est : ", 0	
	formatTexte:    db "%s", 0 
	formatNumber:    db "%d" 

	nombres dd 10, 25, 40, 54, 3, 5, 6
	;; Section des données pas initialisées.	
section .bss
	somme resd 1

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

