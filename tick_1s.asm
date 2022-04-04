ORG 0000H
LJMP MAIN

ORG 0100H
MAIN:
	CLR P1.7
	SETB P1.0		;P1.0=1
	MOV TMOD,#61H	;TMOD=01100001d
	MOV TH1,#0FBH	
	MOV TL1,#0FBH
	SETB TR1		;TR1=1
	CPL P1.7		;取反P1.7
LOP2:		;T0定时0.1s
	MOV TH0,#3CH	
	MOV TL0,#0BH
	SETB TR0		;TR0置位1，开始计数
LOP3:
	JCB TF0,LOP4
	SJMP LOP3
LOP4:
	CPL P1.0
	JBC TF1,LOP1
	AJMP LOP2
END