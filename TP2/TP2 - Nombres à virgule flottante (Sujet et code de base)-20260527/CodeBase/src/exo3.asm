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
extern afficherStringMessage

section .data
	msgSeuil db "Donnez-moi le seuil d'arrêt :", 0
	msgDelta db "Donnez-moi le delta d'échantillonnage :", 0

	zero dq 0.0
	deux dq 2.0
	trois dq 3.0
	cinq dq 5.0
	un dq 1.0

	compteur dd 0
section .bss
	seuil resq 1
	delta resq 1
	cosinus resq 1
	sinus resq 1
	angle resq 1

	t resq 1
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

