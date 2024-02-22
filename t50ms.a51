org 0000H
	mov TMOD,#01H 
	rst:
	mov P1,#0FFH
	mov P2,#0C0H
	setb P3.2
	setb P3.0
	
	strt:
	jnb P3.2, rst
	jb P3.0, strt
	
	; s=1, d=10 n=200
	mov R0,#0C8H
	ACALL delay ;10.04970378
	clr P1.0 ; 10.04970269
	setb P2.0 ; 10.04970377
	
	; s=2 d=7 n=140
	mov R0,#8CH
	ACALL delay ;17.0844987
	clr P1.2 ; 17.08449761
	setb P2.1 ; 17.08449869
	
	; s=3 d=13 n=260(130*2)
	mov R0,#82H
	ACALL delay ;23.61680773
	mov R0,#82H
	ACALL delay ;30.14911567
	clr P2.7 ; 30.14911566
	setb P2.2 ; 30.14911675
	
	; s=4 d=2 n=40
	mov R0,#28H
	ACALL delay ;32.15906142
	clr P3.1
	setb P2.3
	
	; s=5 d=8 n=160
	mov R0,#0A0H
	ACALL delay ;40.19882487
	clr P2.6
	setb P2.4
	
	setb P3.0
	sjmp strt
	
	
	delay: 
		mov TL0,#27H
		mov TH0,#4BH
		setb TR0
		rep:
			jnb P3.2,rst
			jnb TF0,rep
		clr TR0
		clr TF0
		DJNZ R0,delay
	ret
end
