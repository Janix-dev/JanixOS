; ==========================================
; JANIX Kernel (kernel.asm)
; ==========================================
BITS 32
ORG 0x1000

extern setup_gdt
extern setup_idt
extern vga_print
extern init_irq

start_kernel:
    cli
    call setup_gdt
    call setup_idt
    call init_irq

    mov esi, msg_kernel
    call vga_print

.hang:
    hlt
    jmp .hang

msg_kernel db "JANIX Kernel Loaded! IRQs enabled.",0
