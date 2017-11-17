.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
 option casemap:none                ; case sensitive

.data 
	g DD 4

.code

public min

min:	 push	ebp				; push frame pointer 
		 mov 	ebp, esp		; update ebp
		 mov    eax, [ebp+8]    ; eax = a
		 cmp 	eax, [ebp+12]	; if(b > v)
		 jle	min1
		 mov 	eax, [ebp+12]

min1: 	 cmp 	eax, [ebp+16]	
	 	 jle	min2
	 	 mov 	eax, [ebp+16]	

min2: 	 mov     esp, ebp       ; restore esp
         pop     ebp            ; restore ebp
		 ret     0				; return

public p

p: 		 push	ebp				; push frame pointer 
		 mov 	ebp, esp		; update ebp

		 mov 	eax, [ebp+16]	;
		 push	eax				;
		 mov 	eax, [ebp+12]	;
		 push 	eax
		 mov 	eax, [ebp+8]	;
		 push 	eax
		 call 	min
		 add	esp, 16

		 mov 	ecx, [ebp+20]	;
		 push 	ecx				;
		 mov 	ecx, [ebp+24]	;
		 push 	ecx
		 push 	eax				;

		 call 	min 			;

		 mov     esp, ebp       ; restore esp
         pop     ebp            ; restore ebp
		 ret 	0				;

public gcd

gcd:	 push 	ebp
		 mov  	ebp, esp		;

		 xor 	eax, eax
		 cmp 	eax, [ebp+12]	;
		 je 	end

		 mov 	eax, [ebp+8]	;
		 cdq
		 idiv 	ecx				;
		 sub 	eax, ecx		;

		 mov 	ecx, [ebp+12]	;
		 push 	ecx
		 push 	eax
		 call 	gcd				;



end:	 mov	 eax,[ebp+8]	;
		 mov     esp, ebp       ; restore esp
         pop     ebp            ; restore ebp
		 ret     0				; return