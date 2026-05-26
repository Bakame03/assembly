    SYS_EXIT  equ 1
    SYS_LIRE  equ 3
    SYS_ECRIRE equ 4
    STDIN     equ 0
    STDOUT    equ 1
    SUCCES    equ 0

extern afficherStringPlusShort
extern afficherString
extern lireEntier

    section .data
        demande db "Donnez moi un nombre entre 0 et 9 : "
        lenDemande EQU $-demande

        message db "La quantité des nombres plus grand est : "
        lenMessage EQU $-message

        passageLigne db 10
        lenPassageLigne EQU $-passageLigne

	;; Ensemble de données à comparer. 
        nombres DB 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        qteNombres DB 10

	;; Section des données pas initialisées.
section .bss
        val resb 1
        compteur resb 1

	;; Section du programme.
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

    main:

	;; Il faut coder ici.

    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

