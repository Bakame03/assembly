	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherStringPlusShort
extern afficherString
extern lireEntier

	;; Séction des données initialisés. 	
section .data
        demande db "Donnez moi un nombre entier: ", 0
        lenDemande EQU $-demande

        message db "Le nombre le plus grand est : ", 0
        lenMessage EQU $-message

        passageLigne db 10
        lenPassageLigne EQU $-passageLigne

	;; Section des données non initialisées.	
section .bss
        valA resb 1
        valB resb 1
        valC resb 1
        max resb 1

	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

    main:

	;; Afficher le message pour demander les nombres.
   	push rbp 			; Push stack. Pour conserver le contexte global.
        MOV EDI, demande
	call afficherString
	pop rbp	

   	push rbp 			; Push stack. Pour conserver le contexte global.
	call lireEntier
	pop rbp			; Pop stack

	MOV [valA], AL

	;; Il faut coder ici.
  
    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

