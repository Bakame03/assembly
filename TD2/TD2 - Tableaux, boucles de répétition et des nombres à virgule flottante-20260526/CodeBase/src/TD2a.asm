	;; Codes pour les interruptions.
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherStringPlusInt
extern afficherDouble
extern lireEntier
extern lireDouble
extern printf
extern afficherString

	;; Séction des données initialisés.
section .data
	compteur db 0
	total dd 0

	message db "le nombre suivant est :", 0
	messageFinal db "le nombre final est :", 0

	;; Section du programme.
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	;; Boucles de répétition.
	;; Faire la somme de 15 premiers nombres supérieurs ou égaux au nombre fourni par
	;; l'utilisateur.
	;;PUSH RBP
	call lireEntier
	;POP RBP

	MOV EBX, EAX

Boucle:
	ADD [total], EBX

	; Affichage de la somme cumulée jusqu'à ce point.
	PUSH RDX
	MOV RDI, message
	MOV dword ESI, [total]
	call afficherStringPlusInt
	POP RDX

	INC EBX
	INC byte [compteur]
	CMP byte [compteur], 15
	JL Boucle

	PUSH RBP
	MOV RDI, messageFinal
	MOV dword ESI, [total]
	call afficherStringPlusInt
	POP RBP

Fin :
	; Code de finalisation du programme.
	mov eax, SYS_EXIT
	mov ebx, 0
	int 80h

