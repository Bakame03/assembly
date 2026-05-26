SYS_EXIT  equ 1
SYS_LIRE  equ 3
SYS_ECRIRE equ 4
STDIN     equ 0
STDOUT    equ 1
SUCCES    equ 0

extern afficherEntier
extern afficherString
extern afficherStringPlusValue
extern afficherStringPlusInt
extern afficherStringPlusShort
extern afficherEntierAvecMessage
extern afficherEntierNonSigneAvecMessage

section .data
	;; Traitement de chaînes de caractères.
	messageA db "Bonjour à tout le monde"
	lenMessageA EQU $-messageA

	messageB db "Bonjour à tous les autres"
	lenMessageB EQU $-messageB

	messageEntier db "Le nombre est: ", 0
	lenMessageEntier EQU $-messageEntier

	messageResultatDivision db "Le résultat de la division est: ", 0
	messageResteDivision db "Le reste de la division est: ", 0
	
	;; Traitement des enregistrements.

	passageDeLigne db 10
	
	;; Traitement de nombres entiers.
	;; Il faut déclarer avec le bon type. 
	numA dd 12
	numB dd 15
	numC dd 20

	;; Trois nombres à un octet et initialisés en binaire.
	nombre1 db 00110001b
	nombre2 db 00110010b
	nombre3 db 00110011b

	;; Un nombre à 4 octets et initialisé en binaire.
	nombreComplet dd 00000000001100010011001000110011b

	nombre dw 10022

	msgNombre db "La valeur est %d", 10, 0
	
	tabNombres dd 5, 10, 15, 20, 25
	lenTabNombres dd $-tabNombres

	tab dw 10, 20, 30, 40, 50

section .bss
	dixNombres rest 1

section .text
		global main
main:		
	;; Traitement de chaînes de caractères.  
	mov eax, SYS_ECRIRE
	mov ebx, STDOUT
	mov ecx, messageA
	mov edx, lenMessageA
	int 80h

	;; Traitement de chaînes de caractères.
	;; L'affichage dépasse la chaîne courante.  
	mov eax, SYS_ECRIRE
	mov ebx, STDOUT
	mov ecx, passageDeLigne
	mov edx, 1
	int 80h

	;; Affichage d'un entier mais cela ne marche pas. 
	;; Les octets sont traités comme des codes ASCII. 
	mov eax, SYS_ECRIRE
	mov ebx, STDOUT
	mov ECX, nombreComplet
	mov edx, 3
	int 80h

	;; Traitement de chaînes de caractères.
	;; L'affichage du passage à la ligne suivante. 
	mov eax, SYS_ECRIRE
	mov ebx, STDOUT
	mov ecx, passageDeLigne
	mov edx, 1
	int 80h

	;; Traitement des enregistrements.
	;; Les deux premiers 4 octets sont affectés.
	MOV EDX, 100000000b
	
	;; Affichage du nombre en EDX. 
	PUSH RDX
	MOV EDI, EDX
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX

	;; Uniquement le premier octet est affecté. 
	MOV DL, 1b

	;; Affichage du nombre en EDX. 
	PUSH RDX
	MOV EDI, EDX
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX

	JMP Fin

	;; Changement de la valeur de la deuxième case de ce tableau de nombres.
	MOV byte [dixNombres + 1], 15

	;; Affichage du message.
	PUSH RDX
	mov EDI, messageEntier
	MOV ESI, [dixNombres + 1]
	call afficherStringPlusShort
	POP RDX

	;; Changement de la valeur de la troisième case de ce tableau de nombres.
	MOV byte [dixNombres + 2], 1

	;; Affichage du message.
	PUSH RDX
	mov EDI, messageEntier
	MOV ESI, [dixNombres + 1]
	call afficherStringPlusShort
	POP RDX

	;; Affichage du message.
	PUSH RDX
	mov EDI, messageEntier
	MOV ESI, [tab + 6]
	call afficherStringPlusShort
	POP RDX


	MOV EDX, 255
	;; Ajout d'un nombre au deuxième octet du registre RDX.
	ADD DH, 1

	;; Affichage du nombre modifié. 
	PUSH RDX
	MOV EDI, EDX
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX

	;; Addressage dans un tableau de nombres.
	;; Des petites opérations arithmétiques sont supportées dans ce contexte.  
	PUSH RDX
	MOV EDI, [numC - 4*2]
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX

;; Etiquette pour cette partie du code.
;; Adresse pour l'instruction dans la ligne suivante. 
Somme:
	;; Implémentation d'une somme.
	MOV DX, [numA]
	ADD DX, [numB]
	MOV [numC], DX

	;; Affichage du résultat.
	PUSH RDX
	MOV EDI, [numC]
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX

;; Etiquette pour cette partie du code.
;; Adresse pour l'instruction dans la ligne suivante. 
Soustraction:

	;; Une soustraction.
	;; Pour obtenir un nombre négatif, il faut faire attention à la taille. Si on utilise DX,
	;; cela ne marchera pas. 
	MOV EDX, 50
	SUB [numC], EDX 

	;; Affichage du résultat.
	PUSH RDX
	push RBP
	MOV EDI, [numC]
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	pop RBP
	POP RDX

	;; Affichage du résultat.
	PUSH RDX
	push RBP
	MOV EDI, [numC]
	MOV ESI, messageEntier
	call afficherEntierNonSigneAvecMessage
	pop RBP
	POP RDX

;; Etiquette pour cette partie du code.
;; Adresse pour l'instruction dans la ligne suivante. 
Multiplication:

	;;  Une multiplication.
	MOV EAX, [numA]
	MUL dword [numB]
	
	PUSH RDX
	MOV EDI, EAX
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX

;; Etiquette pour cette partie du code.
;; Adresse pour l'instruction dans la ligne suivante. 
Division:

	;; Une division.
	MOV EAX, [numB]
	DIV dword [numA]

	;; Le résultat est en EAX.
	PUSH RDX
	MOV EDI, EAX
	MOV ESI, messageResultatDivision
	call afficherEntierAvecMessage
	POP RDX

	;; Le reste de la division entière se trouve en EDX.
	PUSH RDX
	MOV EDI, EDX
	MOV ESI, messageResteDivision
	call afficherEntierAvecMessage
	POP RDX

	;; Traitement d'un tableau.
	;; Les déplacements doivent suivre la taille des éléments du tableau. 2 ne marchera pas.
	MOV EAX, 4
	MOV EDX, [tabNombres + 4]
	MOV EDX, [tabNombres + EAX*2]

	;; Affectation d'un caractère à une de cases du tableau de caractères. 
	MOV byte [msgNombre + 1], 'a'	

;; Etiquette pour cette partie du code.
;; Adresse pour l'instruction dans la ligne suivante. 	
Remplacement:

	;; Remplace une des lettres de la chaîne de caractères. 
	MOV byte [msgNombre + 3], 'T'

	PUSH RDX
	MOV EDI, msgNombre
	call afficherString
	POP RDX

;; Etiquette pour cette partie du code.
;; Adresse pour l'instruction dans la ligne suivante. 
SousRoutine:

	call afficherNombre


; Ce code permet de finir proprement le programme. 
Fin:
	MOV EAX, SYS_EXIT
	int 80h	; Laisse le contrôle au système d'exploitation. 
	
	
;; Une fonction ou procédure en Assembleur n'est qu'un code avec un nom et qui 
;; suit la convention d'appel pour les sous-routines en 64 bits.  	
afficherNombre:	
	push RBP
	PUSH RDX
	MOV EDI, EDX
	MOV ESI, messageEntier
	call afficherEntierAvecMessage
	POP RDX
	pop RBP
	ret	;; Instruction de return pour une sous-routine. 

