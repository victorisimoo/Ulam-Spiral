.model small
.stack
.data 
    ; number framing variables
    units db 0
    tens db 0
    hundreds db 0
    number db 0
    msg0 db 10, 13, 7, 'Enter the desired length of the spiral: ', '$'
    msg1 db 10, 13, 7, 'The number entered is invalid, please try again.', '$'
    msg2 db 10, 13, 7, 'Value is less', '$'
.code
    ulam:
        ; program start
        mov ax, @data
        mov ds, ax

        ; obtaining the ulam spiral extension 
        mov ah, 09h
        lea dx, msg0
        int 21h

        ; hundreds
        mov ah, 01h
        int 21h
        sub al, 30h
        mov hundreds, al

        ; tens
        mov ah, 01h
        int 21h
        sub al, 30h
        mov tens, al

        ; units
        mov ah, 01h
        int 21h
        sub al, 30h
        mov units, al
        
        ; number construction
        mov al, hundreds
        mov bl, 100
        mul bl
        mov number, al
        mov al, tens
        mov bl, 10
        mul bl
        add number, al
        mov al, units
        add number, al

        ; number  validation
        mov al, number
        cmp al, 100
        jz lower
        cmp al, 100
        jc  lower
        cmp al, 100
        jnz higher
    ;

    ; the number is greater
    higher:
        mov ah, 09h
        lea dx, msg1
        int 21h
        ;end program method
        jmp endprogram

    ; the number is less
    lower:
        mov ah, 09h
        lea dx, msg2
        int 21h

        ;end program method
        jmp endprogram

    ; end program method
    endprogram:
        ; end of program
        mov ah, 4ch
        int 21h
        
end ulam


