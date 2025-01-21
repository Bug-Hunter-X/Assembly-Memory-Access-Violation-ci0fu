section .data
array dd 10, 20, 30, 40, 50
array_size equ $ - array ; Calculate array size
section .text
global _start
_start:
mov esi, 2 ; Index into array
; Bounds checking:
 cmp esi, array_size/4 ;Check if index is within bounds
 jge error_handling ;If out of bounds, jump to error handling
mov ebx, array ;Base address of array
mov eax, [ebx+esi*4] ;Access array element safely
; ... further code to use eax ...
jmp exit
error_handling:
; Handle out of bounds error (e.g., exit with error code)
mov eax, 1 ;sys_exit
mov ebx, 1 ;Error code
int 0x80
exit:
mov eax, 1 ;sys_exit
mov ebx, 0 ;Success code
int 0x80