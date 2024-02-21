org 0000H
	;d: DW 0C8H,8CH,82H,28H,0A0H

	mov TMOD,#01H 

	rst:
	mov P2,#00H
	setb P2.7
	mov R0,#60H

	strt:
	jnb P3.2, rst
	jb P3.0, strt
	
	; s=1, d=10 n=200
	mov A,@R0
	ACALL delay ;10.04991753 delay period
	clr P1.0
	setb P2.0 ;10.04992513
	inc R0
	
	; s=2 d=7 n=140
	mov A,@R0
	ACALL delay ;17.0844987
	clr P1.2
	setb P2.1
	inc R0
	
	; s=3 d=13 n=260(130*2)
	mov A,@R0
	ACALL delay ;23.61680773
	mov A,@R0
	ACALL delay ;30.14911567
	clr P2.7
	setb P2.2
	inc R0
	
	; s=4 d=2 n=40
	mov A,@R0
	ACALL delay ;32.15906142
	clr P3.1
	setb P2.3
	inc R0
	
	; s=5 d=8 n=160
	mov A,@R0
	ACALL delay ;40.19882487
	clr P2.6
	setb P2.4
	

	sjmp strt
	
	
	delay: 
		mov TL0,#0CH
		mov TH0,#4CH
		setb TR0
		rep:
			jnb P3.2,rst
			jnb TF0,rep
		clr TR0
		clr TF0
		dec A
		cjne A,#00H,delay
		;DJNZ A,delay
	ret
end