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
extern printf
extern afficherString

	;; Séction des données initialisés.
section .data
	compteur db 0
	totalA dd 0

	totalB dq 0.0
	un dq 1.0
	zero dq 0.0
	denominateur dq 1.0

	msgSommeB db "La somme des fractions est :", 0

	msgCoteA db "Donnez la longueur du coté a :", 0
	msgCoteB db "Donnez la longueur du coté b :", 0
	msgHypotenuse db "La valeur de l'hypotenuse est %lf\n"

	msgAngleA db "Donnez l'angle du coté a :", 0
	msgAngleB db "Donnez l'angle du coté b :", 0
	msgTailleCoteB db "La longueur du coté b est : ", 0

	PI dq 3.1416
	ANGLE dq 180.0


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

	JMP Exo4
Exo1:
	;; Boucles de répétition.
	;; Faire la somme de 15 premiers nombres supérieurs ou égaux au nombre fourni par
	;; l'utilisateur.
	PUSH RBP
	call lireEntier
	POP RBP

	MOV EBX, EAX

BoucleA:
	ADD [totalA], EBX

	; Affichage de la somme cumulée jusqu'à ce point.
	PUSH RBX
	MOV dword EDI, [totalA]
	call afficherEntier
	POP RBX

	INC BX
	INC byte [compteur]
	CMP byte [compteur], 15
	JL BoucleA

	PUSH RBP
	MOV RDI, [totalA]
	call afficherEntier
	POP RBP

	JMP Fin

Exo2:
	;; Faire la somme des premiers N facteurs du type 1/N avec des nombres
	;; à virgule flottante. N = 10
	MOV byte [compteur], 10
	MOVSD XMM1, [un]
	MOVSD XMM0, [un]
	MOVSD XMM2, [zero]
BoucleB:
	DIVSD XMM0, XMM1
	ADDSD XMM2, XMM0
	MOVSD [totalB], XMM2

	;; C'est la méthode pour stocker des nombres flottants dans la pile.
	;; Il faut simuler le PUSH en créant de la place pour les flottants.
	;; 16 octets par nombre.
	SUB RSP, 32
	MOVSD [RSP], XMM1
	MOVSD [RSP+16], XMM2

	PUSH RBP
	MOVSD XMM0, [totalB]
	call afficherDouble
	POP RBP

	;; C'est la méthode pour stocker des nombres flottants dans la pile.
	;; Il faut simuler le POP en créant de la place pour les flottants.
	;; 16 octets par nombre.
	MOVSD XMM2, [RSP+16]
	MOVSD XMM1, [RSP]
	ADD RSP, 32

	ADDSD XMM1, [un]
 	MOVSD XMM0, [un]
 	DEC byte [compteur]
 	CMP byte [compteur], 0
 	JG BoucleB


	PUSH RBP
	MOV EDI, msgSommeB
	call afficherString
	POP RBP


	PUSH RBP
	MOVSD XMM0, [totalB]
	call afficherDouble
	POP RBP

	JMP Fin

Exo3 :
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
	fstp ST1

	PUSH RBP
	MOVSD XMM0, [coteA]
	call afficherDouble
	POP RBP

	;; Carré du deuxième nombre.
	fld qword [coteB]
	fld qword [coteB]
	fmul
	fstp qword [coteB]
	fstp ST1

	PUSH RBP
	MOVSD XMM0, [coteB]
	call afficherDouble
	POP RBP

	;; Somme de deux carrés.
	fld qword [coteA]
	fld qword [coteB]
	fadd
	fstp qword [hypotenuse]
	fstp ST1

	PUSH RBP
	MOVSD XMM0, [hypotenuse]
	call afficherDouble
	POP RBP

	;;  Calcul de l'hypotenuse.
	fld qword [hypotenuse]
	fsqrt
	fstp qword [hypotenuse]

	PUSH RBP
	MOVSD XMM0, [hypotenuse]
	call afficherDouble
	POP RBP

	JMP Fin

Exo4:
	;; Appel à une fonction qui calcule la longueur du coté B d'un triangle
	;; en utilisant la loi de sinus. On connaît coteA, angleA et angleB.
	;; coteA /sin(angleA) = coteB /sin(angleb)

	;; Demande le cote A.
	PUSH RBP
	MOV EDI, msgCoteA
	call afficherString
	POP RBP

	PUSH RBP
	call lireDouble
	POP RBP
	MOVSD [coteA], XMM0

	;; Demande l'angle A.
	PUSH RBP
	MOV EDI, msgAngleA
	call afficherString
	POP RBP

	PUSH RBP
	call lireDouble
	POP RBP
	MOVSD [angleA], XMM0

	;; Demande l'angle B.
	PUSH RBP
	MOV EDI, msgAngleB
	call afficherString
	POP RBP

	PUSH RBP
	call lireDouble
	POP RBP
	MOVSD [angleB], XMM0

	PUSH RBP
	MOVSD XMM0, [coteA]
	MOVSD XMM1, [angleA]
	MOVSD XMM2, [angleB]
	call calculerCoteTriangle
	POP RBP

	;; Attention, il faut conserver XMM0 avant d'appeler la fonction afficherString.
	SUB RSP, 16
	MOVSD [RSP], XMM0

	;; Affiche le message final.
	PUSH RBP
	MOV EDI, msgTailleCoteB
	call afficherString
	POP RBP

	;; Récupère la valeur calculée et stockée en XMM0.
	MOVSD XMM0, [RSP]
	ADD RSP, 16

	;; Affiche la valeur calculée dans la fonction calculerCoteTriangle.
	PUSH RBP
	call afficherDouble
	POP RBP


    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h



calculerCoteTriangle:
	PUSH RBP
	;; Crée un contexte local.
	MOV RBP, RSP
	SUB RSP, 48

	MOVSD [RSP], XMM0

	MULSD XMM1, [PI]
	DIVSD XMM1, [ANGLE]

	MOVSD [RSP + 16], XMM1

	MULSD XMM2, [PI]
	DIVSD XMM2, [ANGLE]

	MOVSD [RSP + 32], XMM2

	;; Activation du coprocesseur x87.
	EMMS

	;; Calcul du sinus de l'angleA.
	fld qword [RSP + 16]
	fsin
	fstp qword [RSP + 16]


	;; Calcul du sinus de l'angleB.
	fld qword [RSP + 32]
	fsin
	fstp qword [RSP + 32]

	;; Division entre le coté A et le sinus de l'angle A.
	fld qword [RSP + 16]
	fld qword [RSP]
	fdiv ST1

	;; Il dépose les valeurs calculés en mémoire.
	fstp qword [RSP]	;ST0
	fstp qword [RSP + 16]	;ST0, avant ST1.

	fld qword [RSP]
	fld qword [RSP + 32]
	fmul

	fstp qword [RSP]
	MOVSD XMM0, [RSP]

End:
	;; Elimination des variables locales.
	ADD RSP, 48

	;; Restauration de la pile.
	MOV RSP, RBP
	POP RBP
	ret

