.global _start

; padding bytes because aligned memory is faster than unaligned
.align 4

; cannot use x18

_start:
    adr     x1,     hello_world     ; load a register with the string
    mov     x2,     #12             ; put string length in register
    mov     x0,     #1              ; set write to stdout
    mov     x16,    #4              ; syscall 4 (write)
    svc     #0x80                   ; darwin system call

    mov     x0,     #0              ;
    mov     x16,    #1              ; syscall 1 (exit)
    svc     #0x80                   ; darwin system call

hello_world:
    .ascii  "hello world\n"