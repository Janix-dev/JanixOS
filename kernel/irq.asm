; ==========================================
; IRQ handler (irq.asm)
; ==========================================
BITS 32
GLOBAL init_irq

init_irq:
    ; Remap PIC
    mov al, 0x11
    out 0x20, al
    out 0xA0, al

    mov al, 0x20
    out 0x21, al
    mov al, 0x28
    out 0xA1, al

    mov al, 0x04
    out 0x21, al
    mov al, 0x02
    out 0xA1, al

    mov al, 0x01
    out 0x21, al
    out 0xA1, al

    mov al, 0x0
    out 0x21, al
    out 0xA1, al
    ret
