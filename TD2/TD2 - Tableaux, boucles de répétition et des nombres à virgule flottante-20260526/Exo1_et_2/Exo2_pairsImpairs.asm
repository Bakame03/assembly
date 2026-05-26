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
	messagePair db "Les nombres pairs sont : ", 0
	messageImpair db "Les nombres impairs sont : ", 0
	formatTexte:    db "%s", 0 
	formatNumber:    db "%d" 

	nombres dd 10, 25, 40, 54, 3, 5, 6, 8, 12, 45, 97
	pairs times 7 dd 0
	impairs times 7 dd 0

	compteurImpair dd 0
	compteurPair dd 0	
	;; Section des données pas initialisées.	
section .bss
	resultat resd 1
	reste resd 1	
	compteur resb 1
	

	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	MOV ESI, -4
	
Boucle:
	;; Attention, il faut toujours initialiser EDX avant de diviser.
	MOV EAX, 0
	MOV EDX, 0		
	ADD ESI, 4
	;; Somme des nombres.
	MOV EAX, [nombres + ESI]
	MOV ECX, 2
	DIV ECX
	
	MOV [resultat], EAX
	MOV [reste], EDX
	
	CMP dword [reste], 0
	JE AjouterPair

AjouterImpair:
	MOV ECX, 0
	MOV EAX, [nombres + ESI]
	MOV ECX, [compteurImpair]
	MOV [impairs + ECX], EAX
	ADD dword [compteurImpair], 4	
	JMP Suivant
	
AjouterPair:	
	MOV EAX, [nombres + ESI]
	MOV EDX, [compteurPair]
	MOV [pairs + EDX], EAX
	ADD byte [compteurPair], 4

Suivant:	
	;; Comparaison en cherchant la condition de sortie. 
	CMP ESI, 40
	JNE Boucle

	;;  Affichage des nombres pairs.
	push rbp ; 
	mov	rdi, formatTexte	; Premier paramètre de la fonction.
	mov	rsi, messagePair	; Deuxième paramètre de la fonction.	
	mov	rax,0			; La valeur de retour sera ici.
	call printf		
	pop	rbp			
	

	MOV EAX, [compteurPair]
	MOV ECX, 0
AfficherPairs:

	PUSH RAX
	PUSH RCX
	push rbp
	mov EDI, [pairs + ECX]
	call afficherEntier
	pop rbp
	POP RCX
	POP RAX

	ADD ECX, 4
	CMP ECX, EAX
	JNE AfficherPairs

	;;  Affichage des nombres impairs.
	push rbp ; 
	mov	rdi, formatTexte	; Premier paramètre de la fonction.
	mov	rsi, messageImpair	; Deuxième paramètre de la fonction.	
	mov	rax,0			; La valeur de retour sera ici.
	call printf		
	pop	rbp			

	MOV EAX, [compteurImpair]
	MOV ECX, 0
AfficherImpairs:

	PUSH RAX
	PUSH RCX
	push rbp
	mov EDI, [impairs + ECX]
	call afficherEntier
	pop rbp
	POP RCX
	POP RAX

	ADD ECX, 4
	CMP ECX, EAX
	JNE AfficherImpairs
	
    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

