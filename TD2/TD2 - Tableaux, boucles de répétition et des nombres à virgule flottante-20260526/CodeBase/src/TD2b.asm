	;; Codes pour les interruptions.
	SYS_EXIT  equ 1

extern afficherEntier
extern afficherDouble
extern lireEntier
extern lireDouble
extern printf
extern afficherString

	;; Séction des données initialisés.
section .data
	compteur db 0

	totalSomme dq 0.0
	un dq 1.0
	zero dq 0.0
	denominateur dq 1.0

	msgSomme db "La somme des fractions est :", 0

	;; Section du programme.
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	;; Faire la somme des premiers N facteurs du type 1/N avec des nombres
	;; à virgule flottante. N = 1.0

	call lireEntier

	MOV byte [compteur], AL
	MOVSD XMM1, [un]
	MOVSD XMM0, [un]
	MOVSD XMM2, [zero]
Boucle:
	DIVSD XMM0, XMM1
	ADDSD XMM2, XMM0
	MOVSD [totalSomme], XMM2

	;; C'est la méthode pour stocker des nombres flottants dans la pile.
	;; Il faut simuler le PUSH en créant de la place pour les flottants.
	;; 16 octets par nombre.
	;; Ce stockage permet de conserver les valeurs dans XMM1 et XMM2 pour les
	;; calculs d'après. 
	SUB RSP, 32
	MOVSD [RSP], XMM1
	MOVSD [RSP+16], XMM2

	PUSH RBP
	MOVSD XMM0, [totalSomme]
	call afficherDouble
	POP RBP

	;; C'est la méthode pour stocker des nombres flottants dans la pile.
	;; Il faut simuler le POP en créant de la place pour les flottants.
	;; 16 octets par nombre.
	;; Ce stockage permet de conserver les valeurs dans XMM1 et XMM2 pour les
	;; calculs d'après. 
	MOVSD XMM2, [RSP+16]
	MOVSD XMM1, [RSP]
	ADD RSP, 32

	ADDSD XMM1, [un]
 	MOVSD XMM0, [un]
 	DEC byte [compteur]
 	CMP byte [compteur], 0
 	JG Boucle


	PUSH RBP
	MOV EDI, msgSomme
	call afficherString
	POP RBP


	PUSH RBP
	MOVSD XMM0, [totalSomme]
	call afficherDouble
	POP RBP

Fin :
	; Code de finalisation du programme.
	mov eax, SYS_EXIT
	mov ebx, 0
	int 80h

