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
extern afficherEntierAvecMessage

section .data
	msgA db "Donnez-moi un nombre A (supérieur à 100) :", 0
	msgB db "Donnez-moi un nombre B (inférieur à 6) :", 0

	msgResultat db "Le résultat de la division est :", 0
	msgReste db "Le reste de la division est :", 0

	nombres dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

section .bss
	A resd 1
	B resd 1
	resultat resd 1
	reste resd 1

section .text
	global main
main:
	;; Il faut coder ici.
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

