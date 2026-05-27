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
extern lireDouble
extern afficherString

section .data
	msgN db "Donnez-moi un nombre N (entre 5 et 100) :", 0

	PI dq 3.1416
	zero dq 0.0
	compteur dd 0
section .bss
	N resd 1
	delta resq 1
	x resq 1
	y resq 1

section .text
	global main
main:
	;; Il faut coder ici. 
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

