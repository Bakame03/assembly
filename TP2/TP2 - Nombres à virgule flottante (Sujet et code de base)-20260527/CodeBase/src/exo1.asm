	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 0
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
    mov rdi, msgLettre
    call afficherString
    call lireCaractere
    mov [carac], al
    ;; ------------------------
    mov edi, 0              ;; vide le registre
    mov dil, [carac]        ;; 1 octet
    call majuscule
    mov [majus], al
    ;; ------------------------
    mov rdi, msgMajuscule   
    call afficherString
    mov edi, 0              ;; vide le registre
    mov dil, [majus]        ;; 1 octet
    call afficherCaractere
	
Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

majuscule:	
    mov eax, edi         
    sub eax, 32             
    ret
