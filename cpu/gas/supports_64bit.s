# Used to verify if a cpu can be put into 64-bit
# long mode using the extended cpuid functions

mov 	$0x80000000, %eax	# Check if extended functions supported
cpuid
cmp 	$0x80000000, %eax
jbe 	long_mode_not_supported
mov 	$0x80000001, %eax	# Extended processor info and features
cpuid
bt 	$29, %edx		# Bit 29 is lm (long mode)
jnc 	long_mode_not_supported
