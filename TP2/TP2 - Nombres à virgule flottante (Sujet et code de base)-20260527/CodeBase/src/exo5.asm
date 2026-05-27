	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern afficherDouble
extern afficherFloat
extern lireEntier
extern lireDouble
extern afficherString

section .data
	msgQuantite db "Donnez-moi la quantité de nombres à récupérer :", 0
	msgNombre db "Donnez-moi le nombre suivant :", 0
	msgMoyenne db "La moyenne des nombres fournis est :", 0

	zero dq 4.0

	compteur dd 0
section .bss
	quantite resd 1
	
section .text
	global main
main:	
	;; Ajoutez votre code ici.
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h


calculerMoyenne:
	;; Ajoutez votre code ici.
	
	ret
