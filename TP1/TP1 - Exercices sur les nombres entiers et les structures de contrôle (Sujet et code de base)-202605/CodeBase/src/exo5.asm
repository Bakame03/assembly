	;; Codes pour les interruptions.
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherString
extern afficherEntier
extern afficherEntierAvecMessage
extern lireEntier

	;; Séction des données initialisés.
section .data
        demandeBase db "Donnez moi une base entre 0 et 9 : ", 0
        lenDemandeBase EQU $-demandeBase

        demandeExpo db "Donnez moi un exposant entre 0 et 9 : ", 0
        lenDemandeExpo EQU $-demandeExpo

        message db "La puissance est ", 0

	formatTexte:    db "%s", 0
	formatNumber:    db "%d"


	;; Section des données pas initialisées.
section .bss
        base resd 1
	exposant resd 1
	puissance resd 1

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

