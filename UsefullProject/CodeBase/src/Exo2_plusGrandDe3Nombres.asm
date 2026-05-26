	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
	STDOUT    equ 1
	SUCCES    equ 0

	;; Séction des données initialisés. 	
section .data
        demande db "Donnez moi trois nombres entre 0 et 9 : "
        lenDemande EQU $-demande

        message db "Le nombre le plus grand est : "
        lenMessage EQU $-message

        passageLigne db 10
        lenPassageLigne EQU $-passageLigne

        ;; Déclaration de trois entiers.
        valA db 1
        valB db 2
        valC db 3

	;; Section des données pas initialisées.	
section .bss
        max resb 1

	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global _start

    _start:

        ;; Il faut coder ici.
        mov al, [valA]

        cmp al, [valB]
        jge check_valC      
        mov al, [valB]      
        
        check_valC:
        cmp al, [valC]
        jge store_res       
        mov al, [valC]    

        store_res:
        ;; Convertion en ASCII 
        add al, '0'
        mov [max], al  

        ;; pour l'affichage
        mov eax, SYS_ECRIRE
        mov ebx, STDOUT
        mov ecx, message
        mov edx, lenMessage
        int 80h

        mov eax, SYS_ECRIRE
        mov ebx, STDOUT
        mov ecx, max
        mov edx, 1
        int 80h
         
        mov eax, SYS_ECRIRE
        mov ebx, STDOUT
        mov ecx, passageLigne
        mov edx, lenPassageLigne
        int 80h
        

    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

