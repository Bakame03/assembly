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
extern lireEntierRef
extern lireDouble
extern afficherString

section .data
	msgN db "Donnez-moi un nombre N :", 0
	msgNombre db "Donnez-moi un nombre :", 0

	msgSomme db "Le résultat de la somme est :", 0

section .bss
	N resd 1
	somme resd 1
	compteur resd 1

section .text
	global main
main:
	;; Il faut coder ici.
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

