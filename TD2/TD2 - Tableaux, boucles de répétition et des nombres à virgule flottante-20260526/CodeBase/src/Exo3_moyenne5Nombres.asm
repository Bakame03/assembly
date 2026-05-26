	;; Codes pour les interruptions. 
	SYS_EXIT  equ 1
	SYS_LIRE  equ 3
	SYS_ECRIRE equ 4
	STDIN     equ 2
	STDOUT    equ 1
	SUCCES    equ 0

extern afficherEntier
extern afficherDouble
extern lireEntier
extern printf
	
	;; Séction des données initialisés. 	
section .data
	messagePair db "Les nombres pairs sont : ", 0
	messageImpair db "Les nombres impairs sont : ", 0
	formatTexte:    db "%s", 0 
	formatNumber:    db "%d" 

	compteur dd 0
	position dd 0
	moyenne dd 0.0
	resultat dq 0.0
	;; Section des données pas initialisées.	
section .bss
	nombre resd 1

	nombres resd 5
	somme resd 1

	;; Section du programme.	
section .text
	;; Global nécessaire pour le linkage du programme.
        global main

main:
	;; Il faut coder ici.

	;; ==========================================
        ;; 1. LIRE LES 5 NOMBRES ET REMPLIR LE TABLEAU
        ;; ==========================================
        mov ebx, 0              ; EBX sera notre "compteur" (il va aller de 0 à 4)
        
    Boucle_Lecture:
        cmp ebx, 5              ; Est-ce qu'on a déjà lu 5 nombres ?
        jge Fin_Lecture         ; Si ebx >= 5, on a fini, on sort de la boucle !
        
        call lireEntier         ; On attend que tu tapes un entier (le résultat va dans EAX)
        
        ;; MAGIE DES TABLEAUX :
        ;; Chaque nombre prend 32 bits (4 octets). Donc pour avancer de case en case,
        ;; on fait un décalage : ebx * 4.
        mov [nombres + ebx*4], eax 
        
        inc ebx                 ; On ajoute +1 au compteur
        jmp Boucle_Lecture      ; On remonte au début de la boucle

    Fin_Lecture:

        ;; ==========================================
        ;; 2. APPELER LA PROCEDURE POUR LA MOYENNE
        ;; ==========================================
        call calculerMoyenne    ; Le processeur met le main en pause et saute à notre procédure en bas

        ;; ==========================================
        ;; 3. AFFICHER LE RESULTAT (DOUBLE)
        ;; ==========================================
        ;; Pour la fonction 'afficherDouble', le nombre à virgule doit obligatoirement être dans XMM0
        movq xmm0, [resultat]   
        call afficherDouble     ; On affiche la moyenne finale !

        jmp Fin                 ; TRÈS IMPORTANT : On saute à la fin pour ne pas exécuter la procédure par erreur !


;; =====================================================================
;; PROCEDURE : calculerMoyenne
;; (Elle est placée ici, en dehors du flux principal du main)
;; =====================================================================
calculerMoyenne:
        ;; Règle du cours (Callee's rules) : on sauvegarde EBX car on va l'utiliser
        push rbx                

        mov ebx, 0              ; On recycle EBX comme compteur pour lire le tableau
        mov eax, 0              ; EAX va stocker la SOMME totale (on commence à 0)

    Boucle_Somme:
        cmp ebx, 5              ; A-t-on additionné nos 5 nombres ?
        jge Fin_Somme           
        
        add eax, [nombres + ebx*4] ; On ajoute l'élément actuel du tableau à EAX
        
        inc ebx
        jmp Boucle_Somme

    Fin_Somme:
        mov [somme], eax        ; On sauvegarde la somme totale en mémoire (juste au cas où)

        ;; ==========================================
        ;; ATTENTION : ZONE VIRGULE FLOTTANTE (SSE)
        ;; ==========================================
        ;; Pour avoir une vraie moyenne (ex: 2.5), on doit transformer nos entiers en "Double"
        cvtsi2sd xmm0, eax      ; Convertit l'entier EAX (la somme) en 'double' dans le registre XMM0
        
        mov eax, 5              ; On prépare le diviseur (5)
        cvtsi2sd xmm1, eax      ; Convertit l'entier 5 en 'double' dans le registre XMM1
        
        divsd xmm0, xmm1        ; Fait la division décimale : XMM0 = XMM0 / XMM1
        
        movq [resultat], xmm0   ; Sauvegarde la moyenne finale (qui est dans XMM0) dans la variable 'resultat'

        ;; Fin de la procédure
        pop rbx                 ; Règle du cours : on restaure la valeur originale de EBX
        ret                     ; "Return" : renvoie le processeur juste après le 'call calculerMoyenne' du main
	
    Fin :
       ; Code de finalisation du programme.
       mov eax, SYS_EXIT
       mov ebx, 0
       int 80h