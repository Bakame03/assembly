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
extern afficherStringMessage

section .data
	msgA db "Donnez-moi un nombre a :", 0
	msgB db "Donnez- moi un nombre b :", 0

	msgErreur db "Erreur, a est plus grand que  b.", 0

section .bss
	a resd 1
	b resd 1

section .text
	global main
main:
	;; Il faut coder ici.
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

