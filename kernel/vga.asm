; ==========================================
; VGA Text Output (vga.asm)
; ==========================================
BITS 32
GLOBAL vga_print

vga_print:
    pusha
    mov edi, 0xB8000
.loop:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0F
    stosw
    jmp .loop
.done:
    popa
    ret
