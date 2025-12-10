.section .text.startup
.globl _start

_start:
    la gp, __global_pointer$
    la sp, _stack_top
    la a0, __sbss_start
    la a1, __sbss_end
    call zero_init
    la a0, __bss_start
    la a1, __bss_end
    call zero_init
    call main
    j .
zero_init:
    beq a0, a1, zero_init_done
    sw x0, 0(a0)
    addi a0, a0, 4
    j zero_init
zero_init_done:
    ret
