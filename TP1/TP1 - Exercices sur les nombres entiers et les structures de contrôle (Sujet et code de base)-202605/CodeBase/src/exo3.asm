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
	msgN db "Donnez-moi un nombre N (entre 5 et 15) :", 0

	msgMultiplication db "Le résultat de la multiplication est :", 0

	nombres dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

section .bss
	N resd 1
	nombre resd 1
	multiplication resd 1

section .text
	global main
main:
	;; Il faut coder ici.
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

