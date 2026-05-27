	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern lireEntier
extern afficherString

section .data
	message db "Donnez moi le nombre suivant :", 0
	messageMax db "Le nombre maximun est :", 0

	base dq 0.0
	hauteur dq 0.0
	deux dq 2.0
section .bss
	compteur resd 1

	nombres resq 5
section .text
	global main
main:

	;; Ajoutez votre code ici.

	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

maxDe5Nombres:	
	;; Ajoutez votre code ici.

	RET
