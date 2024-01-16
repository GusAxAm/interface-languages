;prog70.asm, 
;Programa que pinta la pantalla pixel por pixel de color violeta

Datos MACRO
    mov ax, @Data
    mov ds, ax
ENDM


ReadKey MACRO
    mov ah, 08h         ;Simula un ReadKey()
    int 21h
ENDM

Consola MACRO   
    mov ax, 4c00h
    int 21h
ENDM
    
.MODEL SMALL
.STACK 20h
.DATA
    cDescrip    DB 10,13,'Programa que dibuja una linea de pixeles en pantalla ;)$'
    cFinProg    DB 10,13,'Fin de programa...$'
    
.CODE
    inicio: 
        Datos
        ReadKey

        mov ah, 00h
        mov al, 12h
        int 10h
        
        mov ah, 0bh
        mov bh, 00h
        mov bl, 07h
        int 10h
        
        mov ah, 0ch				;función
        mov al, 01h				;color del pixel
        mov bh, 00h				;página
        mov cx, 00h				;columna
        mov dx, 00h				;renglon
        int 10h

		mov al, 01h

		elineaV:
			
			eLineaH:
				inc cx
				int 10h
		
				cmp cx, 280h
				jb  eLineaH
			
			mov cx, 00h
        	inc dx
			cmp dx, 1E0h
			jbe eLineaV


        eFinProg:
            ;MostrarCadena cFinProg
            ReadKey
            Consola 
    END inicio