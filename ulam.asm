.model small
.data 
    ulamelength db ?
    msg0 db 10, 13, 7, 'Enter the desired length of the spiral: ', '$'
.stack
.code
    ulam:
        ; program start
        mov ax, @data
        mov ds, ax

        ; obtaining the ulam spiral extension
        mov ah, 09h
        lea dx, msg0
        int 21h

        mov ah, 01h
        int 21h
        sub al, 30h
        mov ulamelength, al

        mov ah, 4ch
        int 21h
end ulam