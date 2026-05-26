
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
	STDOUT    equ 1
	SUCCES    equ 0

; Attention, ce code doit être compilé avec l'option -no-pie
; Define printf as an external function
default rel
extern lireEntier
extern afficherEntier	
extern printf

section .data
        demande db "Donnez moi un nombre : ", 0
	messageMul db "Le resultat de la multiplication est : ", 0
	messageDiv db "Le resultat de la division est : ", 0
	messageDivReste db "Le reste de la division est : ", 0	
	
		formatTexte:    db "%s", 0 ; printf format string follow by a newline(10) and a null terminator(0), "\n",'0'
	formatNumber:    db "%d" ; printf format string follow by a newline(10) and a null terminator(0), "\n",'0'



section .bss
        nombreA resd 1
        nombreB resd 1
	resultatMul resd 1
	resultatDiv resd 1
	resteDiv resd 1
	
section .text
        global main

main:
		;; Il faut coder ici.
	mov, rdi, demande
	mov eax, 0
	call printf
	call lireEntier
	
    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

	
