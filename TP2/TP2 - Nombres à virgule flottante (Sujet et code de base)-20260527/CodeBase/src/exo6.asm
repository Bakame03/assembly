	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern afficherDouble
extern afficher2Doubles
extern lireEntier
extern lireDouble
extern afficherString

section .data
	msgCentreX db "Donnez-moi le centre du disque en X :", 0
	msgCentreY db "Donnez-moi le centre du disque en Y :", 0
	msgRayon db "Donnez-moi le rayon du disque :", 0
	msgNombrePoints db "Donnez-moi le nombre de points du disque à afficher :", 0

	
	zero dq 0.0
	
	compteur dd 0

	DPI dq 6.2832
section .bss
	centre resq 2
	rayon resq 1
	nombrePoints resq 1
	
section .text
	global main
main:	
	;; Ajoutez votre code ici.
		
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

afficherCercle:
	;; Ajoutez votre code ici.

	
	RET
