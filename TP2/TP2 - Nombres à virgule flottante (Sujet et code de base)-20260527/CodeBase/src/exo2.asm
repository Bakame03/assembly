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
extern lireString

section .data
	message db "Donnez moi la chaîne de caractères à transformer :", 0
	messageCC db "La chaîne de caractères transformée est :", 0

section .bss
	carac resb 1
	majus resb 1

	phrase  resb 100 	
section .text
	global main
main:	
	;; Ajoutez votre code ici. 


Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h

	;; La fonction qui convertisse la chaîne de caractères en capital case. 
capitalCase:	
	;; Ajoutez votre code ici.
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov byte [rdi + rax], 32
Boucle:
	cmp rax, 0
	je suivant

	cmp byte [rdi + rax], ' '
	jne suivant

majuscule:	
	;; Ajoutez votre code ici.
	SUB BYTE [rdi + rax + 1], 32
	
	ret
	
