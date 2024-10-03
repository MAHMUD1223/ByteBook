org 0x7c00
bits 16

main:
    ; Set up segment registers
    xor ax, ax         ; Zero out AX (equivalent to mov ax, 0)
    mov ds, ax         ; Set DS, ES, and SS to zero (segment 0)
    mov es, ax
    mov ss, ax

    ; Set up stack pointer (SP) safely below 0x7C00
    mov sp, 0x7B00     ; Avoid overwriting bootloader code

    ; Print message
    mov si, os_boot_msg
    call print

    ; Halt the CPU
    hlt

halt:
    jmp halt           ; Infinite loop after halt

print:
    push si            ; Save registers
    push ax
    push bx

print_loop:
    lodsb              ; Load byte from SI into AL and increment SI
    or al, al          ; Check if AL is zero (null terminator)
    jz print_done      ; If zero, end of string

    mov ah, 0x0E       ; BIOS teletype service (output character)
    mov bh, 0          ; Page number (for some BIOSes)
    int 0x10           ; BIOS interrupt to print character in AL

    jmp print_loop     ; Repeat for next character

print_done:
    pop bx             ; Restore registers
    pop ax
    pop si
    ret                ; Return to main

os_boot_msg db "Hello, MoM! I am on boot menu", 0x0D, 0x0A, 0

times 510-($-$$) db 0  ; Pad with zeros to make the boot sector 512 bytes
dw 0xAA55              ; Boot sector signature

