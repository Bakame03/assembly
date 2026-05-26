	;; Codes pour les interruptions.
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern afficherDouble
extern afficherStringPlusDouble
extern afficherStringPlusFloat
extern lireEntier
extern lireDouble
extern printf
extern afficherString

	;; Séction des données initialisés.
section .data
	un dq 1.0
	zero dq 0.0

	msgCarreCoteA db "Le carré du coté a est : ", 0
	msgCarreCoteB db "Le carré du coté b est : ", 0
	msgSommeCotes db "La somme de deux cotées est : ", 0

	msgCoteA db "Donnez la longueur du coté a :", 0
	msgCoteB db "Donnez la longueur du coté b :", 0
	msgHypotenuse db "La valeur de l'hypotenuse est ", 0

	msgAngleA db "Donnez l'angle du coté a :", 0
	msgAngleB db "Donnez l'angle du coté b :", 0
	msgTailleCoteB db "La longueur du coté b est : ", 0


	;; Section des données pas initialisées.
section .bss
	coteA resq 1
	coteB resq 1
	hypotenuse resq 1

	angleA resq 1
	angleB resq 1

	;; Section du programme.
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	;; Faire le calcul de la longueur de l'hypotenuse d'un triangle en recevant la
	;; longueur de deux autres cotés de la part de l'utilisateur.
	PUSH RBP
	MOV EDI, msgCoteA
	call afficherString
	POP RBP

	PUSH RBP
	call lireDouble
	POP RBP

	MOVSD [coteA], XMM0

	PUSH RBP
	MOVSD XMM0, [coteA]
	call afficherDouble
	POP RBP

	PUSH RBP
	MOV EDI, msgCoteB
	call afficherString
	POP RBP

	PUSH RBP
	call lireDouble
	POP RBP

	MOVSD [coteB], XMM0

	PUSH RBP
	MOVSD XMM0, [coteB]
	call afficherDouble
	POP RBP

	;; Activation du mode du coprocesseur x87.
	EMMS

	;; Carré du premier nombre.
	fld qword [coteA]
	fld qword [coteA]
	fmul
	fstp qword [coteA]
	fstp ST0

	PUSH RBP
	MOV RDI, msgCarreCoteA
	MOVSD XMM0, [coteA]
	call afficherStringPlusDouble
	POP RBP

	;; Carré du deuxième nombre.
	fld qword [coteB]
	fld qword [coteB]
	fmul
	fstp qword [coteB]
	fstp ST0

	PUSH RBP
	MOV RDI, msgCarreCoteB
	MOVSD XMM0, [coteB]
	call afficherStringPlusDouble
	POP RBP

	;; Somme de deux carrés.
	fld qword [coteA]
	fld qword [coteB]
	fadd
	fstp qword [hypotenuse]
	fstp ST0

	PUSH RBP
	MOV RDI, msgSommeCotes
	MOVSD XMM0, [hypotenuse]
	call afficherStringPlusDouble
	POP RBP

	;; Calcul de l'hypotenuse en calculant la racine de la somme des deux carrés des 
	;; autres cotés du triangle.
	fld qword [hypotenuse]
	fsqrt
	fstp qword [hypotenuse]

	PUSH RBP
	MOV RDI, msgHypotenuse
	MOVSD XMM0, [hypotenuse]
	call afficherStringPlusDouble
	POP RBP


Fin :
	; Code de finalisation du programme.
	mov eax, SYS_EXIT
	mov ebx, 0
	int 80h

