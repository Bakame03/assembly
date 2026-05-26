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

