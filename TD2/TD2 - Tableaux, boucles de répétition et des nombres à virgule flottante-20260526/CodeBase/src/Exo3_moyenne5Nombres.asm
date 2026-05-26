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
	messagePair db "Les nombres pairs sont : ", 0
	messageImpair db "Les nombres impairs sont : ", 0
	formatTexte:    db "%s", 0 
	formatNumber:    db "%d" 

	compteur dd 0
	position dd 0
	moyenne dd 0.0
	resultat dq 0.0
	;; Section des données pas initialisées.	
section .bss
	nombre resd 1

	nombres resd 5
	somme resd 1

	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	;; Il faut coder ici.

	mov ebx, 0

Boucle_Lecture:
    cmp ebx, 5              
    jge Fin_Lecture 

	call lireEntier

	mov [nombres + ebx*4], eax 
        
    inc ebx                 
    jmp Boucle_Lecture      
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h