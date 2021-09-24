.model small
.data 
    ; number framing variables
    units db 0
    tens db 0
    hundreds db 0
    completenumber db 0
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
        
        mov al, hundreds
        mov bl, 100
        mul bl
        mov completenumber, al

        mov al, completenumber
        mov bl, 100
        div bl
        mov hundreds, al

        mov dl, hundreds
        add dl, 30h
        mov ah, 02h
        int 21h

        ;printing of an enter
        mov dl, 0Ah
        int 21h

        ; finish program
        mov ah, 4ch
        int 21h
end ulam