	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern lireCaractere	
extern afficherCaractere	
extern afficherString

section .data
	msgLettre db "Donnez moi la lettre à transformer :", 0
	msgMajuscule db "La lettre transformée est :", 0

section .bss
	carac resb 1
	majus resb 1
	
section .text
	global main
main:	
	;; Ajoutez votre code ici.
	mov rdi, msgLettre
    call afficherString
	call lireCaractere
	mov [carac], al

	;; ------------------------
	mov edi, [carac]            
    call majuscule          
    mov [majus], al
    ;; ------------------------
	mov rdi, msgMajuscule   
    call afficherString

	mov edi, [majus]        
    call afficherCaractere
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h


majuscule:	
	;; Ajoutez votre code ici.
	mov eax, edi         
	sub eax, 32             
    ret
