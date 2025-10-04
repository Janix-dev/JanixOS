; ==========================================
; JANIX Bootloader (boot.asm)
; ==========================================
BITS 16
ORG 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov si, msg_boot
.print:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .print
.done:

    ; Load kernel (sector 2-20 -> 0x1000)
    mov bx, 0x1000
    mov ah, 0x02
    mov al, 20
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, [BOOT_DRIVE]
    int 0x13
    jc disk_error

    jmp 0x0000:0x1000

disk_error:
    mov si, msg_err
    call print_string
    hlt

print_string:
    lodsb
    or al, al
    jz .ret
    mov ah, 0x0E
    int 0x10
    jmp print_string
.ret:
    ret

msg_boot db "JANIX Booting...",0
msg_err  db "Disk error!",0
BOOT_DRIVE db 0

TIMES 510-($-$$) db 0
DW 0xAA55
