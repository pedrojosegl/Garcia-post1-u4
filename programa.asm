; programa.asm - Laboratorio Post1 Unidad 4

CR          EQU 0Dh
LF          EQU 0Ah
TERMINADOR  EQU 24h
ITERACIONES EQU 5

section .data
    bienvenida  db "=== Laboratorio NASM - Unidad 4 ===", 0Dh, 0Ah, 24h
    separador   db "----------------------------------------", 0Dh, 0Ah, 24h
    etiqueta_a  db "Variable A (word): ", 24h
    fin_msg     db "Programa finalizado correctamente.", 0Dh, 0Ah, 24h
    var_byte    db 42
    var_word    dw 1234h
    var_dword   dd 0DEADBEEFh
    tabla_bytes db 10, 20, 30, 40, 50

section .bss
    buffer    resb 80
    resultado resw 1

section .text
    global main

main:
    push ds
    mov ax, seg bienvenida
    mov ds, ax

    mov ah, 09h
    mov dx, bienvenida
    int 21h

    mov ah, 09h
    mov dx, separador
    int 21h

    mov ah, 09h
    mov dx, etiqueta_a
    int 21h

    mov al, [var_byte]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    mov si, tabla_bytes
    mov cx, ITERACIONES

imprimir_tabla:
    mov al, [si]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    inc si
    loop imprimir_tabla

    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    mov ah, 09h
    mov dx, fin_msg
    int 21h

    mov ax, 4C00h
    int 21h