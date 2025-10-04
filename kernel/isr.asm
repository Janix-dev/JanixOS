; ==========================================
; Exception stubs (isr.asm)
; ==========================================
BITS 32
GLOBAL isr_common_stub

isr_common_stub:
    pusha
    mov esi, msg_isr
    call vga_print
    popa
    iretd

msg_isr db "Unhandled Exception!",0
