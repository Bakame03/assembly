	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern printf
	
	;; Séction des données initialisés. 	
section .data
	message db "La somme est : ", 0	
	formatTexte:    db "%s", 0 
	formatNumber:    db "%d" 

	nombres dd 10, 25, 40, 54, 3, 5, 6
	;; Section des données pas initialisées.	
section .bss
	somme resd 1

	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	MOV word [somme], 0
	MOV ESI, -4
	MOV EAX, 0
	
Boucle:
	ADD ESI, 4
	;; On met ici le nombre à additionner si la condition est remplie.
	MOV EAX, [nombres + ESI]

	;; On va additionner uniquement les nombres plus grands que 5.
	CMP EAX, 5
	JLE Continuer

	PUSH RAX	
	push RSI
	push rbp
	mov EDI, [somme]
	call afficherEntier
	pop rbp
	POP RSI
	POP RAX


	ADD [somme], EAX

Continuer:
	;; Comparaison en cherchant la condition de sortie. 
	CMP ESI, 24
	JNE Boucle

	;;  Affichage du résultat de la division.
	push rbp ; 
	mov	rdi, formatTexte	; Premier paramètre de la fonction.
	mov	rsi, message		; Deuxième paramètre de la fonction.	
	mov	rax,0			; La valeur de retour sera ici.
	call printf		
	pop	rbp			

	push rbp
	mov EDI, [somme]
	call afficherEntier
	pop rbp	
	
    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

