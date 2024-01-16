;ExaU2 comparar dos numeros de tres cifras y muestra el mayor,  
;Examen U2
.MODEL SMALL
.STACK 20h
.DATA
    cDescrip    DB 10,13,'Gustavo Maximiliano Ambriz Zamarripa 18131215$'
    cFinProg    DB 10,13,'Fin de programa...$'
	num1		DB 00h
	num2		DB 00h
	esMayor		DB 10,13,'El mayor es $'
	
.CODE
    inicio: 
        mov ax, @DATA
		mov ds,ax
		
		mov ah, 09h
		mov ah, offset cDescrip
		int 21h
		
		mov ah, 01h ;Se necesita ingresar un numero de un valor
		int 21h
		mov bl, al  ;guardamos el digito ingresado en un segmento diferente para que no se borre al ingresar el siguiente
		int 21h
		mov ah, 01h ;Guardamos el segundo numero de un digito en este momento 
		int 21h
		mov cl, al ; Vamos guardando los valores ingresados en una variable para no perderlos
		int 21h
		mov ah 01h
		int 21h
		add num1, al
		mov ah, 01h
		int 21h
		mov cl, al
		int 21h
		mov ah, 01h
		int 21h
		add num2, al
		int 21h
		mov ah , 01h
		int 21h
		add num2, al 
		cmp num1, num2 
		ja mayor
   
    eMayor:
		mov ah,09
		mov dx, offset esMayor
		int 21h
		jmp salir
    
	eFinProg:
		mov ah, offset cFinProg
		int 21h


      
END inicio