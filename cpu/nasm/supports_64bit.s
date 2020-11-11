; Used to verify if a cpu can be put into 64-bit
; long mode using the extended cpuid functions

mov 	eax, 0x80000000	; Check if extended functions supported
cpuid
cmp 	eax, 0x80000000
jbe 	long_mode_not_supported
mov 	eax, 0x80000001	; Extended processor info and features
cpuid
bt 	edx, 29		; Bit 29 is lm (long mode)
jnc 	long_mode_not_supported
