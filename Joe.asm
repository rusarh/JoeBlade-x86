; Base Address:	100h Range: 1100h-2E16h	Loaded length: 1D16h

		Ideal
		;p8086n
		model tiny

		include	"J.inc"

; ===========================================================================

; Segment type:	Pure code
segment		seg000 byte public 'CODE'
		assume cs:seg000
		org 100h
		assume es:nothing, ss:nothing, ds:seg000

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

		public start
proc		start near
		cli			; Clear	Interrupt Flag
		mov	ax, cs
		mov	es, ax
		assume es:seg000
		mov	ds, ax
		mov	ss, ax
		assume ss:seg000
		mov	[word_11C8], ax
		mov	ax, 1F12h
		mov	sp, ax
		sti			; Set Interrupt	Flag
		mov	bx, 0A896h
		shr	bx, 1		; Shift	Logical	Right
		shr	bx, 1		; Shift	Logical	Right
		shr	bx, 1		; Shift	Logical	Right
		shr	bx, 1		; Shift	Logical	Right
		inc	bx		; Increment by 1
		mov	ah, 4Ah
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs

		call	sub_1143	; Call Procedure

		;; remark this for cassette version
		call	sub_12A0	; load resources;

		call	sub_1847	; Call Procedure

		call	sub_1787	; Call Procedure

		call	sub_1C54	; Call Procedure

		call	sub_17A2	; Call Procedure

		push	cs
		pop	ds
		mov	ah, 0
		mov	al, 2
		int	10h		; - VIDEO - SET	VIDEO MODE
					; AL = mode


loc_113C:				; CODE XREF: sub_12A0+Cj sub_12A0+14j	...
		mov	ax, 4C00h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code

endp		start

; ---------------------------------------------------------------------------
word_1141	dw 0			; DATA XREF: sub_1143:loc_116Bw
					; sub_1C54+B49r

; =============== S U B	R O U T	I N E =======================================


proc		sub_1143 near		; CODE XREF: start+22p
		push	cs
		pop	ds
		mov	dx, offset speedmsg
;		mov	ah, 9
;		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"


loc_114C:				; CODE XREF: sub_1143+1Dj
;		mov	ah, 0
;		int	16h		; DOS -	DIRECT STDIN INPUT, NO ECHO

;		cmp	al, 73h		; Compare Two Operands
;		jz	short loc_1162	; Jump if Zero (ZF=1)

;		cmp	al, 53h		; Compare Two Operands
;		jz	short loc_1162	; Jump if Zero (ZF=1)

;		cmp	al, 46h		; Compare Two Operands
;		jz	short loc_1168	; Jump if Zero (ZF=1)

;		cmp	al, 66h		; Compare Two Operands
;		jz	short loc_1168	; Jump if Zero (ZF=1)

		mov ax,0

		jmp	short loc_1162	; 'S' slow pressed for 8086
		
		jmp	short loc_114C	; Jump

; ---------------------------------------------------------------------------

loc_1162:				; CODE XREF: sub_1143+Fj sub_1143+13j
		mov	ax, 0FFFFh
		jmp	loc_116B	; Jump

; ---------------------------------------------------------------------------

loc_1168:				; CODE XREF: sub_1143+17j sub_1143+1Bj
		mov	ax, 0


loc_116B:				; CODE XREF: sub_1143+22j
		mov	[cs:word_1141],	ax
		retn			; Return Near from Procedure

endp		sub_1143

; ---------------------------------------------------------------------------
speedmsg	db  0Dh			; DATA XREF: sub_1143+2o
		db  0Ah
		db  0Ah
		db  50h	; P
		db  6Ch	; l
		db  65h	; e
		db  61h	; a
		db  73h	; s
		db  65h	; e
		db  20h
		db  70h	; p
		db  72h	; r
		db  65h	; e
		db  73h	; s
		db  73h	; s
		db  20h
		db  3Ah	; :
		db  0Dh
		db  0Ah
		db  0Ah
		db  22h	; "
		db  53h	; S
		db  22h	; "
		db  20h
		db  49h	; I
		db  66h	; f
		db  20h
		db  79h	; y
		db  6Fh	; o
		db  75h	; u
		db  20h
		db  68h	; h
		db  61h	; a
		db  76h	; v
		db  65h	; e
		db  20h
		db  61h	; a
		db  20h
		db  73h	; s
		db  6Ch	; l
		db  6Fh	; o
		db  77h	; w
		db  20h
		db  63h	; c
		db  6Fh	; o
		db  6Dh	; m
		db  70h	; p
		db  75h	; u
		db  74h	; t
		db  65h	; e
		db  72h	; r
		db  0Dh
		db  0Ah
		db  0Ah
		db  22h	; "
		db  46h	; F
		db  22h	; "
		db  20h
		db  49h	; I
		db  66h	; f
		db  20h
		db  79h	; y
		db  6Fh	; o
		db  75h	; u
		db  20h
		db  68h	; h
		db  61h	; a
		db  76h	; v
		db  65h	; e
		db  20h
		db  61h	; a
		db  20h
		db  66h	; f
		db  61h	; a
		db  73h	; s
		db  74h	; t
		db  20h
		db  63h	; c
		db  6Fh	; o
		db  6Dh	; m
		db  70h	; p
		db  75h	; u
		db  74h	; t
		db  65h	; e
		db  72h	; r
		db  24h	; $
word_11C6	dw 0			; DATA XREF: sub_12A0:loc_13F7w
					; sub_12A0+15Br ...
word_11C8	dw 0			; DATA XREF: start+9w sub_12A0+3FAr ...
word_11CA	dw 0			; DATA XREF: sub_12A0:loc_12B7w
					; sub_12A0+166r ...
word_11CC	dw 0			; DATA XREF: sub_12A0:loc_12D2w
					; sub_12A0+1A2r ...
word_11CE	dw 0			; DATA XREF: sub_12A0:loc_12EDw
					; sub_1A4A+2Br	...
word_11D0	dw 0			; DATA XREF: sub_12A0:loc_1308w
					; sub_12A0+1DEr ...
word_11D2	dw 0			; DATA XREF: sub_12A0:loc_13E0w
					; sub_12A0+3BEr ...
word_11D4	dw 0			; DATA XREF: sub_12A0:loc_1359w
					; sub_12A0+292r ...
word_11D6	dw 0			; DATA XREF: sub_12A0:loc_13C5w
					; sub_12A0+382r ...
word_11D8	dw 0			; DATA XREF: sub_12A0:loc_13AAw
					; sub_12A0+346r ...
		align 4
word_11DC	dw 0			; DATA XREF: sub_12A0:loc_1323w
					; sub_12A0+21Ar ...
word_11DE	dw 0			; DATA XREF: sub_12A0:loc_138Fw
					; sub_12A0+30Ar ...
word_11E0	dw 0			; DATA XREF: sub_12A0:loc_1374w
					; sub_12A0+2CEr ...
word_11E2	dw 0			; DATA XREF: sub_12A0:loc_133Ew
					; sub_12A0+256r ...
aJbdataTtl	db 'JBDATA\TTL',0       ; DATA XREF: sub_12A0+146o
aJbdataJ2font_b	db 'JBDATA\J2FONT.BIN',0 ; DATA XREF: sub_12A0+182o
aJbdataBgnd	db 'JBDATA\BGND',0      ; DATA XREF: sub_12A0+1BEo
aJbdataMaps	db 'JBDATA\MAPS',0      ; DATA XREF: sub_12A0+1FAo
aJbdataTopmaps	db 'JBDATA\TOPMAPS',0   ; DATA XREF: sub_12A0+236o
aJbdataFloor	db 'JBDATA\FLOOR',0     ; DATA XREF: sub_12A0+272o
aJbdataRoomdata	db 'JBDATA\ROOMDATA',0  ; DATA XREF: sub_12A0+2AEo
aJbdataObjdat	db 'JBDATA\OBJDAT',0    ; DATA XREF: sub_12A0+2EAo
aJbdataLpdata	db 'JBDATA\LPDATA',0    ; DATA XREF: sub_12A0+326o
aJbdataGuardt	db 'JBDATA\GUARDT',0    ; DATA XREF: sub_12A0+362o
aJbdataCdgfx	db 'JBDATA\CDGFX',0     ; DATA XREF: sub_12A0+39Eo
aJbdataJb1spr_c	db 'JBDATA\JB1SPR.CGA',0 ; DATA XREF: sub_12A0+3DAo
aJbdataRndtbl_b	db 'JBDATA\RNDTBL.BIN',0 ; DATA XREF: sub_12A0+416o

; =============== S U B	R O U T	I N E =======================================


proc		sub_12A0 near		; CODE XREF: start+25p
		mov	ah, 48h
		mov	bx, 20h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_12AF	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_12AF:				; CODE XREF: sub_12A0+7j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_12B7	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_12B7:				; CODE XREF: sub_12A0+12j
		mov	[cs:word_11CA],	ax
		mov	ah, 48h
		mov	bx, 20h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_12CA	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_12CA:				; CODE XREF: sub_12A0+22j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_12D2	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_12D2:				; CODE XREF: sub_12A0+2Dj
		mov	[cs:word_11CC],	ax
		mov	ah, 48h
		mov	bx, 200h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_12E5	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_12E5:				; CODE XREF: sub_12A0+3Dj
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_12ED	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_12ED:				; CODE XREF: sub_12A0+48j
		mov	[cs:word_11CE],	ax
		mov	ah, 48h
		mov	bx, 1E0h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_1300	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1300:				; CODE XREF: sub_12A0+58j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_1308	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1308:				; CODE XREF: sub_12A0+63j
		mov	[cs:word_11D0],	ax
		mov	ah, 48h
		mov	bx, 80h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_131B	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_131B:				; CODE XREF: sub_12A0+73j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_1323	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1323:				; CODE XREF: sub_12A0+7Ej
		mov	[cs:word_11DC],	ax
		mov	ah, 48h
		mov	bx, 40h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_1336	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1336:				; CODE XREF: sub_12A0+8Ej
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_133E	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_133E:				; CODE XREF: sub_12A0+99j
		mov	[cs:word_11E2],	ax
		mov	ah, 48h
		mov	bx, 8
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_1351	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1351:				; CODE XREF: sub_12A0+A9j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_1359	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1359:				; CODE XREF: sub_12A0+B4j
		mov	[cs:word_11D4],	ax
		mov	ah, 48h
		mov	bx, 8
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_136C	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_136C:				; CODE XREF: sub_12A0+C4j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_1374	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1374:				; CODE XREF: sub_12A0+CFj
		mov	[cs:word_11E0],	ax
		mov	ah, 48h
		mov	bx, 8
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_1387	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1387:				; CODE XREF: sub_12A0+DFj
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_138F	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_138F:				; CODE XREF: sub_12A0+EAj
		mov	[cs:word_11DE],	ax
		mov	ah, 48h
		mov	bx, 8
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_13A2	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13A2:				; CODE XREF: sub_12A0+FAj
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_13AA	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13AA:				; CODE XREF: sub_12A0+105j
		mov	[cs:word_11D8],	ax
		mov	ah, 48h
		mov	bx, 20h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_13BD	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13BD:				; CODE XREF: sub_12A0+115j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_13C5	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13C5:				; CODE XREF: sub_12A0+120j
		mov	[cs:word_11D6],	ax
		mov	ah, 48h
		mov	bx, 20h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired

		jmp	short loc_13D8	; Jump if Not Below (CF=0)

		mov	ax, 2
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13D8:				; CODE XREF: sub_12A0+130j
		cmp	ax, 0		; Compare Two Operands
		jmp	short loc_13E0	; Jump if Not Zero (ZF=0)

		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13E0:				; CODE XREF: sub_12A0+13Bj
		mov	[cs:word_11D2],	ax
		push	cs
		pop	ds
		mov	dx, offset aJbdataTtl ;	"JBDATA\\TTL"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_13F7	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_13F7:				; CODE XREF: sub_12A0+14Fj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 200h
		mov	dx, 0
		mov	ds, [cs:word_11CA]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_1417	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1417:				; CODE XREF: sub_12A0+16Fj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataJ2font_b ; "JBDATA\\J2FONT.BIN"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_1433	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1433:				; CODE XREF: sub_12A0+18Bj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 200h
		mov	dx, 0
		mov	ds, [cs:word_11CC]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_1453	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1453:				; CODE XREF: sub_12A0+1ABj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataBgnd ; "JBDATA\\BGND"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_146F	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_146F:				; CODE XREF: sub_12A0+1C7j
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 1E00h
		mov	dx, 0
		mov	ds, [cs:word_11D0]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_148F	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_148F:				; CODE XREF: sub_12A0+1E7j
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataMaps ; "JBDATA\\MAPS"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_14AB	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_14AB:				; CODE XREF: sub_12A0+203j
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 800h
		mov	dx, 0
		mov	ds, [cs:word_11DC]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_14CB	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_14CB:				; CODE XREF: sub_12A0+223j
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataTopmaps ; "JBDATA\\TOPMAPS"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_14E7	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_14E7:				; CODE XREF: sub_12A0+23Fj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 400h
		mov	dx, 0
		mov	ds, [cs:word_11E2]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_1507	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1507:				; CODE XREF: sub_12A0+25Fj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataFloor	; "JBDATA\\FLOOR"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_1523	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1523:				; CODE XREF: sub_12A0+27Bj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 80h
		mov	dx, 0
		mov	ds, [cs:word_11D4]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_1543	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1543:				; CODE XREF: sub_12A0+29Bj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataRoomdata ; "JBDATA\\ROOMDATA"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_155F	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_155F:				; CODE XREF: sub_12A0+2B7j
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 80h
		mov	dx, 0
		mov	ds, [cs:word_11E0]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_157F	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_157F:				; CODE XREF: sub_12A0+2D7j
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataObjdat ; "JBDATA\\OBJDAT"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_159B	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_159B:				; CODE XREF: sub_12A0+2F3j
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 80h
		mov	dx, 0
		mov	ds, [cs:word_11DE]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_15BB	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_15BB:				; CODE XREF: sub_12A0+313j
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataLpdata ; "JBDATA\\LPDATA"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_15D7	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_15D7:				; CODE XREF: sub_12A0+32Fj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 80h
		mov	dx, 0
		mov	ds, [cs:word_11D8]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_15F7	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_15F7:				; CODE XREF: sub_12A0+34Fj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataGuardt ; "JBDATA\\GUARDT"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_1613	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1613:				; CODE XREF: sub_12A0+36Bj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 200h
		mov	dx, 0
		mov	ds, [cs:word_11D6]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_1633	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_1633:				; CODE XREF: sub_12A0+38Bj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataCdgfx	; "JBDATA\\CDGFX"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_164F	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_164F:				; CODE XREF: sub_12A0+3A7j
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 168h
		mov	dx, 0
		mov	ds, [cs:word_11D2]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_166F	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_166F:				; CODE XREF: sub_12A0+3C7j
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataJb1spr_c ; "JBDATA\\JB1SPR.CGA"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_168B	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_168B:				; CODE XREF: sub_12A0+3E3j
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 7C00h
		mov	dx, 2496h
		mov	ds, [cs:word_11C8]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_16AB	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_16AB:				; CODE XREF: sub_12A0+403j
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		push	cs
		pop	ds
		mov	dx, offset aJbdataRndtbl_b ; "JBDATA\\RNDTBL.BIN"
		mov	al, 0
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read

		jmp	short loc_16C7	; Jump if Not Below (CF=0)

		mov	ax, 0
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_16C7:				; CODE XREF: sub_12A0+41Fj
		mov	[cs:word_11C6],	ax
		mov	bx, [cs:word_11C6]
		mov	cx, 100h
		mov	dx, 1F16h
		mov	ds, [cs:word_11C8]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

		jmp	short loc_16E7	; Jump if Not Below (CF=0)

		mov	ax, 1
		jmp	loc_113C	; Jump

; ---------------------------------------------------------------------------

loc_16E7:				; CODE XREF: sub_12A0+43Fj
		mov	bx, [cs:word_11C6]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

		retn			; Return Near from Procedure

endp		sub_12A0


; =============== S U B	R O U T	I N E =======================================


proc		sub_16F1 near		; CODE XREF: sub_1C54+B51p
					; sub_1C54+BE5p ...
		mov	dx, 3DAh


loc_16F4:				; CODE XREF: sub_16F1+6j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		and	al, 8		; Logical AND
		jz	short loc_16F4	; Jump if Zero (ZF=1)


loc_16F9:				; CODE XREF: sub_16F1+Bj
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		and	al, 8		; Logical AND
		jnz	short loc_16F9	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_16F1

; ---------------------------------------------------------------------------
byte_16FF	db 0			; DATA XREF: sub_17FB+4w sub_17FB+1Dr	...
unk_1700	db    0			; DATA XREF: seg000:07EAo sub_17FB+12o ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1780	db 7Fh			; DATA XREF: seg000:07E1w seg000:1893r
byte_1781	db 0			; DATA XREF: seg000:loc_17DCw
					; sub_1832+Br ...
byte_1782	db 0			; DATA XREF: seg000:07D4w sub_1832+2r	...
word_1783	dw 0			; DATA XREF: sub_1787+5w sub_17A2+6r
word_1785	dw 0			; DATA XREF: sub_1787+Cw sub_17A2r

; =============== S U B	R O U T	I N E =======================================


proc		sub_1787 near		; CODE XREF: start+2Bp
		mov	ax, 3509h
		call int21_35;int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector

		mov	[cs:word_1783],	bx
		mov	ax, es
		mov	[cs:word_1785],	ax
		mov	ax, 2509h
		mov	dx, offset loc_17B3
		push	cs
		pop	ds
		call int21_2509;int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt

		retn			; Return Near from Procedure

endp		sub_1787


; =============== S U B	R O U T	I N E =======================================


proc		sub_17A2 near		; CODE XREF: start+31p
		mov	ax, [cs:word_1785]
		mov	ds, ax
		mov	dx, [cs:word_1783]
		mov	ax, 2509h
		call int21_2509;int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt

		retn			; Return Near from Procedure

endp		sub_17A2
;=====================
proc int21_35
	cli
	push ax
	push ds
	push si

	xor ah,ah
	shl ax, 1
	shl ax, 1
	mov si, ax

	mov ax, 0
	mov ds, ax

	cld
	lodsw ; offset
	mov bx, ax
	lodsw ; segment
	mov es, ax

	pop si
	pop ds
	pop ax
	sti
endp int21_35
;=====================
proc int21_2509
	cli
	push ax
	push es
	push di

	xor ah,ah
	shl ax, 1
	shl ax, 1
	mov di, ax

	mov ax, 0
	mov es, ax

	cld
	mov ax, dx
	stosw ; offset
	mov ax, ds
	stosw ; segment

	pop di
	pop es
	pop ax
	sti
	ret
endp int21_2509

; ---------------------------------------------------------------------------

loc_17B3:				; DATA XREF: sub_1787+13o
		push	ax
		push	bx
		push	cx
		push	si
		sti			; Set Interrupt	Flag
		cld			; Clear	Direction Flag
		in	al, 60h		; 8042 keyboard	controller data	register
		mov	bl, al
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	ah, al
		or	al, 80h		; Logical Inclusive OR
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		xchg	al, ah		; Exchange Register/Memory with	Register
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	al, bl
		mov	cl, 0FFh
		and	bl, 80h		; Logical AND
		jz	short loc_17DC	; Jump if Zero (ZF=1)

		mov	cl, 0
		inc	[cs:byte_1782]	; Increment by 1
		jmp	loc_17E5	; Jump

; ---------------------------------------------------------------------------

loc_17DC:				; CODE XREF: seg000:07D0j
		inc	[cs:byte_1781]	; Increment by 1
		mov	[cs:byte_1780],	al


loc_17E5:				; CODE XREF: seg000:07D9j
		and	ax, 7Fh		; Logical AND
		mov	si, ax
		add	si, offset unk_1700 ; Add
		mov	[cs:si], cl
		mov	al, 20h
		out	20h, al		; Interrupt controller,	8259A.
		pop	si
		pop	cx
		pop	bx
		pop	ax
		cli			; Clear	Interrupt Flag
		iret			; Interrupt Return


; =============== S U B	R O U T	I N E =======================================


proc		sub_17FB near		; CODE XREF: sub_1C54:loc_27CBp
					; sub_2C3D+3Ap	...
		push	cs
		pop	ds
		mov	al, 0
		mov	[byte_16FF], al
		mov	si, offset key_codes
		mov	bl, 6


loc_1807:				; CODE XREF: sub_17FB+28j
		mov	al, [si]
		inc	si		; Increment by 1
		and	ax, 7Fh		; Logical AND
		mov	di, offset unk_1700
		add	di, ax		; Add
		mov	al, [di]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_1820	; Jump if Zero (ZF=1)

		mov	al, [byte_16FF]
		or	al, [si]	; Logical Inclusive OR
		mov	[byte_16FF], al


loc_1820:				; CODE XREF: sub_17FB+1Bj
		inc	si		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_1807	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_17FB

; ---------------------------------------------------------------------------
;  KEYBOARD SCAN-CODES
key_codes:	
		db    1	; 'ESCAPE'
		db  80h	;  = internal bit
		db  10h ; 'Q'
		db    1 ;
		db  1Eh ; 'A'
		db    2 ;
		db  18h ; 'O'
		db    4 ;
		db  19h ; 'P'
		db    8 ;
		db  39h	; 'SPACE'
		db  10h ; 

; =============== S U B	R O U T	I N E =======================================


proc		sub_1832 near		; CODE XREF: sub_2643+43p sub_2850+9p
		push	cs
		pop	ds
		mov	al, [byte_1782]


loc_1837:				; CODE XREF: sub_1832+9j
		cmp	al, [byte_1782]	; Compare Two Operands
		jz	short loc_1837	; Jump if Zero (ZF=1)

		mov	al, [byte_1781]


loc_1840:				; CODE XREF: sub_1832+12j
		cmp	al, [byte_1781]	; Compare Two Operands
		jz	short loc_1840	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

endp		sub_1832


; =============== S U B	R O U T	I N E =======================================


proc		sub_1847 near		; CODE XREF: start+28p
		mov	al, 4
		mov	ah, 0
		int	10h		; - VIDEO - SET	VIDEO MODE
					; AL = mode

		mov	ah, 0Bh
		mov	bx, 101h
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)

		push	cs
		pop	ds
		mov	di, 2016h
		mov	bx, 0
		mov	dx, 2000h
		mov	ah, 80h


loc_1861:				; CODE XREF: sub_1847+2Aj
		mov	[di], bx
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		mov	[di], dx
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		add	dx, 50h		; Add
		add	bx, 50h		; Add
		dec	ah		; Decrement by 1
		jnz	short loc_1861	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1847


; =============== S U B	R O U T	I N E =======================================


proc		sub_1874 near		; CODE XREF: sub_1C54+18p sub_1C54+2Ap ...
		mov	di, 2216h
		mov	al, 0


loc_1879:				; CODE XREF: sub_1874+11j
		push	ax
		call	sub_18B8	; Call Procedure

		mov	[cs:di], ax
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		pop	ax
		inc	al		; Increment by 1
		jnz	short loc_1879	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1874


; =============== S U B	R O U T	I N E =======================================


proc		sub_1888 near		; CODE XREF: sub_1C54+9p sub_1C54+Fp ...
		mov	di, 2216h
		mov	al, 0


loc_188D:				; CODE XREF: sub_1888+13j
		push	ax
		call	sub_18B8	; Call Procedure

		ror	ax, 1		; Rotate Right
		mov	[cs:di], ax
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		pop	ax
		inc	al		; Increment by 1
		jnz	short loc_188D	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1888


; =============== S U B	R O U T	I N E =======================================


proc		sub_189E near		; CODE XREF: sub_1C54p
		mov	di, 2216h
		mov	al, 0


loc_18A3:				; CODE XREF: sub_189E+17j
		push	ax
		call	sub_18B8	; Call Procedure

		mov	cx, ax
		ror	ax, 1		; Rotate Right
		or	ax, cx		; Logical Inclusive OR
		mov	[cs:di], ax
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		pop	ax
		inc	al		; Increment by 1
		jnz	short loc_18A3	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_189E


; =============== S U B	R O U T	I N E =======================================


proc		sub_18B8 near		; CODE XREF: sub_1874+6p sub_1888+6p ...
		push	bx
		mov	bh, al
		mov	ax, 0
		ror	bh, 1		; Rotate Right
		ror	bh, 1		; Rotate Right
		ror	bh, 1		; Rotate Right
		ror	bh, 1		; Rotate Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		clc			; Clear	Carry Flag
		rcr	ax, 1		; Rotate Through Carry Right
		rcr	bh, 1		; Rotate Through Carry Right
		rcr	ax, 1		; Rotate Through Carry Right
		pop	bx
		retn			; Return Near from Procedure

endp		sub_18B8


; =============== S U B	R O U T	I N E =======================================


proc		sub_1900 near		; CODE XREF: sub_193B+2Dp sub_19A0+25p ...
		add	di, 2000h	; Add
		cmp	di, 4000h	; Compare Two Operands
		jl	short locret_190E ; Jump if Less (SF!=OF)

		sub	di, 3FB0h	; Integer Subtraction


locret_190E:				; CODE XREF: sub_1900+8j
		retn			; Return Near from Procedure

endp		sub_1900


; =============== S U B	R O U T	I N E =======================================


proc		sub_190F near		; CODE XREF: sub_1979+3p sub_1BB2+7p ...
		mov	bx, di
		mov	al, bh
		and	ax, 38h		; Logical AND
		ror	ax, 1		; Rotate Right
		ror	ax, 1		; Rotate Right
		mov	di, ax
		mov	ax, bx
		and	ax, 7C0h	; Logical AND
		ror	ax, 1		; Rotate Right
		ror	ax, 1		; Rotate Right
		add	di, ax		; Add
		add	di, 2016h	; Add
		mov	ax, [cs:di]
		mov	di, ax
		mov	ax, bx
		and	ax, 3Fh		; Logical AND
		add	di, ax		; Add
		add	di, 8		; Add
		retn			; Return Near from Procedure

endp		sub_190F


; =============== S U B	R O U T	I N E =======================================


proc		sub_193B near		; CODE XREF: sub_1979+Fp sub_1BB2+Fp ...
		cmp	al, 20h		; Compare Two Operands
		jnb	short loc_1940	; Jump if Not Below (CF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1940:				; CODE XREF: sub_193B+2j
		push	ax
		push	bx
		push	cx
		push	bp
		push	si
		push	di
		sub	al, 20h		; Integer Subtraction
		and	ax, 7Fh		; Logical AND
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		mov	si, ax
		mov	ds, [cs:word_11CC]
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	bl, 8


loc_195F:				; CODE XREF: sub_193B+32j
		mov	al, [si]
		inc	si		; Increment by 1
		call	sub_1990	; Call Procedure

		mov	[es:di], ax
		call	sub_1900	; Call Procedure

		dec	bl		; Decrement by 1
		jnz	short loc_195F	; Jump if Not Zero (ZF=0)

		pop	di
		add	di, 2		; Add
		pop	si
		pop	bp
		pop	cx
		pop	bx
		pop	ax
		retn			; Return Near from Procedure

endp		sub_193B


; =============== S U B	R O U T	I N E =======================================


proc		sub_1979 near		; CODE XREF: sub_1C54+15p sub_1C54+1Ep ...
		push	ds
		push	es
		push	si
		call	sub_190F	; Call Procedure

		pop	si


loc_1980:				; CODE XREF: sub_1979+12j
		mov	al, [cs:si]
		inc	si		; Increment by 1
		cmp	al, 0FFh	; Compare Two Operands
		jz	short loc_198D	; Jump if Zero (ZF=1)

		call	sub_193B	; Call Procedure

		jmp	short loc_1980	; Jump

; ---------------------------------------------------------------------------

loc_198D:				; CODE XREF: sub_1979+Dj
		pop	es
		assume es:nothing
		pop	ds
		retn			; Return Near from Procedure

endp		sub_1979


; =============== S U B	R O U T	I N E =======================================


proc		sub_1990 near		; CODE XREF: sub_193B+27p sub_19A0+19p ...
		push	si
		mov	si, 2216h
		and	ax, 0FFh	; Logical AND
		rol	ax, 1		; Rotate Left
		add	si, ax		; Add
		mov	ax, [cs:si]
		pop	si
		retn			; Return Near from Procedure

endp		sub_1990


; =============== S U B	R O U T	I N E =======================================


proc		sub_19A0 near		; CODE XREF: sub_1C54+6p sub_1C54+CCp
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	di, 8
		mov	es, [cs:word_11CA]
		mov	si, 0
		mov	bh, 10h


loc_19B2:				; CODE XREF: sub_19A0+2Aj
		push	di
		mov	bl, 20h


loc_19B5:				; CODE XREF: sub_19A0+22j
		mov	al, [es:si]
		inc	si		; Increment by 1
		call	sub_1990	; Call Procedure

		mov	[di], ax
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_19B5	; Jump if Not Zero (ZF=0)

		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_19B2	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_19A0


; =============== S U B	R O U T	I N E =======================================


proc		sub_19CD near		; CODE XREF: sub_1C54+3p
					; sub_1C54:loc_1CB6p
		mov	ax, 0B800h
		mov	ds, ax
		mov	di, 0
		mov	bh, 0C8h


loc_19D7:				; CODE XREF: sub_19CD+1Fj
		push	di
		mov	ax, 0
		mov	bl, 28h


loc_19DD:				; CODE XREF: sub_19CD+17j
		mov	[di], ax
		add	di, 2		; Add
		dec	bl		; Decrement by 1
		jnz	short loc_19DD	; Jump if Not Zero (ZF=0)

		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_19D7	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_19CD


; =============== S U B	R O U T	I N E =======================================


proc		sub_19EF near		; CODE XREF: sub_2643:loc_265Fp
					; sub_2C3Dp
		mov	ax, 0B800h
		mov	ds, ax
		mov	di, 500h
		mov	bh, 70h


loc_19F9:				; CODE XREF: sub_19EF+1Fj
		push	di
		mov	ax, 0
		mov	bl, 28h


loc_19FF:				; CODE XREF: sub_19EF+17j
		mov	[di], ax
		add	di, 2		; Add
		dec	bl		; Decrement by 1
		jnz	short loc_19FF	; Jump if Not Zero (ZF=0)

		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_19F9	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_19EF


; =============== S U B	R O U T	I N E =======================================


proc		sub_1A11 near		; CODE XREF: sub_1C54+B41p
		push	cs
		pop	ds
		assume ds:seg000
		mov	bp, offset unk_1B34
		call	sub_1A28	; Call Procedure

		mov	bp, offset unk_1B3C
		call	sub_1A28	; Call Procedure

		mov	bp, offset unk_1B44
		call	sub_1A28	; Call Procedure

		mov	bp, offset unk_1B4C

endp		sub_1A11 ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


proc		sub_1A28 near		; CODE XREF: sub_1A11+5p sub_1A11+Bp ...
		mov	ax, 0FFFFh
		mov	[bp+6],	ax
		mov	ax, 0
		mov	[bp+4],	ax
		retn			; Return Near from Procedure

endp		sub_1A28


; =============== S U B	R O U T	I N E =======================================


proc		sub_1A35 near		; CODE XREF: sub_1C54:loc_2836p
		mov	bp, offset unk_1B34
		call	sub_1A4A	; Call Procedure

		mov	bp, offset unk_1B3C
		call	sub_1A4A	; Call Procedure

		mov	bp, offset unk_1B44
		call	sub_1A4A	; Call Procedure

		mov	bp, offset unk_1B4C

endp		sub_1A35 ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


proc		sub_1A4A near		; CODE XREF: sub_1A35+3p sub_1A35+9p ...
		push	cs
		pop	ds
		mov	di, 1000h
		mov	[bp+6],	di
		cmp	[word ptr bp+4], 0 ; Compare Two Operands
		jz	short loc_1A6D	; Jump if Zero (ZF=1)

		mov	bl, [bp+4]
		mov	cl, [bp+5]
		mov	ch, 0
		mov	bh, 0
		mov	di, bx
		mov	al, 40h
		imul	cl		; Signed Multiply
		add	di, ax		; Add
		mov	[bp+6],	di


loc_1A6D:				; CODE XREF: sub_1A4A+Cj
		mov	si, [bp+0]
		mov	ax, [bp+2]
		mov	bp, ax
		mov	es, [cs:word_11CE]
		push	cs
		pop	ds
		mov	bh, 20h


loc_1A7E:				; CODE XREF: sub_1A4A+93j
		mov	ax, [es:di]
		xchg	si, bp		; Exchange Register/Memory with	Register
		mov	[si], ax
		xchg	si, bp		; Exchange Register/Memory with	Register
		and	ax, [si+100h]	; Logical AND
		or	ax, [si]	; Logical Inclusive OR
		mov	[es:di], ax
		mov	ax, [es:di+2]
		xchg	si, bp		; Exchange Register/Memory with	Register
		mov	[si+2],	ax
		xchg	si, bp		; Exchange Register/Memory with	Register
		and	ax, [si+102h]	; Logical AND
		or	ax, [si+2]	; Logical Inclusive OR
		mov	[es:di+2], ax
		mov	ax, [es:di+4]
		xchg	si, bp		; Exchange Register/Memory with	Register
		mov	[si+4],	ax
		xchg	si, bp		; Exchange Register/Memory with	Register
		and	ax, [si+104h]	; Logical AND
		or	ax, [si+4]	; Logical Inclusive OR
		mov	[es:di+4], ax
		mov	ax, [es:di+6]
		xchg	si, bp		; Exchange Register/Memory with	Register
		mov	[si+6],	ax
		xchg	si, bp		; Exchange Register/Memory with	Register
		and	ax, [si+106h]	; Logical AND
		or	ax, [si+6]	; Logical Inclusive OR
		mov	[es:di+6], ax
		add	si, 8		; Add
		add	bp, 8		; Add
		add	di, 40h		; Add
		dec	bh		; Decrement by 1
		jnz	short loc_1A7E	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1A4A


; =============== S U B	R O U T	I N E =======================================


proc		sub_1AE0 near		; CODE XREF: sub_1C54+BEBp
		mov	bp, offset unk_1B4C
		call	sub_1AF5	; Call Procedure

		mov	bp, offset unk_1B44
		call	sub_1AF5	; Call Procedure

		mov	bp, offset unk_1B3C
		call	sub_1AF5	; Call Procedure

		mov	bp, offset unk_1B34

endp		sub_1AE0 ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


proc		sub_1AF5 near		; CODE XREF: sub_1AE0+3p sub_1AE0+9p ...
		push	cs
		pop	ds
		mov	di, [bp+6]
		cmp	di, 0FFFFh	; Compare Two Operands
		jnz	short loc_1B00	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1B00:				; CODE XREF: sub_1AF5+8j
		mov	[word ptr bp+6], 0FFFFh
		mov	si, [bp+2]
		mov	ds, [cs:word_11CE]
		mov	bh, 20h


loc_1B0F:				; CODE XREF: sub_1AF5+3Cj
		mov	ax, [cs:si]
		mov	[di], ax
		mov	ax, [cs:si+2]
		mov	[di+2],	ax
		mov	ax, [cs:si+4]
		mov	[di+4],	ax
		mov	ax, [cs:si+6]
		mov	[di+6],	ax
		add	di, 40h		; Add
		add	si, 8		; Add
		dec	bh		; Decrement by 1
		jnz	short loc_1B0F	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1AF5

; ---------------------------------------------------------------------------
unk_1B34	db    0			; DATA XREF: sub_1A11+2o sub_1A35o ...
		db    0
		db  96h	; –
		db 0A6h	; ¦
		db    0
		db    0
		db 0FFh
		db 0FFh
unk_1B3C	db    0			; DATA XREF: sub_1A11+8o sub_1A35+6o ...
		db    0
		db  96h	; –
		db 0A4h	; ¤
		db    0
		db    0
		db 0FFh
		db 0FFh
unk_1B44	db    0			; DATA XREF: sub_1A11+Eo sub_1A35+Co ...
		db    0
		db  96h	; –
		db 0A2h	; ¢
		db    0
		db    0
		db 0FFh
		db 0FFh
unk_1B4C	db    0			; DATA XREF: sub_1A11+14o sub_1A35+12o ...
		db    0
		db  96h	; –
		db 0A0h	;  
		db    0
		db    0
		db 0FFh
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


proc		sub_1B54 near		; CODE XREF: sub_2C3D+Fp
		push	si
		mov	al, [cs:byte_1B6B]
		add	al, 3		; Add
		mov	[cs:byte_1B6B],	al
		mov	ah, 0
		mov	si, 1F16h
		add	si, ax		; Add
		mov	al, [cs:si]
		pop	si
		retn			; Return Near from Procedure

endp		sub_1B54

; ---------------------------------------------------------------------------
byte_1B6B	db 0			; DATA XREF: sub_1B54+1r sub_1B54+7w ...
		db    0
		db    0
		db    0
unk_1B6F	db    0			; DATA XREF: sub_1C54+70o
unk_1B70	db    0			; DATA XREF: sub_1BB2+1o
		db    0
		db    0
		db    0
		db    0
		db    0
unk_1B76	db    0			; DATA XREF: sub_2BA0+Ao
word_1B77	dw 0			; DATA XREF: sub_1BB2+17r sub_1C54+7Ew ...
word_1B79	dw 0			; DATA XREF: sub_1BB2+22r sub_1C54+81w ...
word_1B7B	dw 0			; DATA XREF: sub_1BB2+2Dr sub_1C54+84w ...
byte_1B7D	db 4 dup(0)		; DATA XREF: sub_2387+14o sub_23CA+3o	...
byte_1B81	db 1			; DATA XREF: sub_2387+2r sub_2387+7w ...
byte_1B82	db 0			; DATA XREF: sub_1BB2:loc_1C06r
					; sub_1BB2+65r	...
byte_1B83	db 0			; DATA XREF: sub_1C54+ADw sub_217A+F6r ...
byte_1B84	db 0			; DATA XREF: sub_2943+2Ew
					; sub_2943+185o
byte_1B85	db 0			; DATA XREF: sub_2140r
					; sub_2296:loc_22A7r ...
byte_1B86	db 0			; DATA XREF: sub_1C54+99w
					; sub_217A:loc_21B7r ...
byte_1B87	db 0			; DATA XREF: sub_1C54+9Ew sub_217A+48r ...
byte_1B88	db 0			; DATA XREF: sub_2048+42r sub_2048+51r ...
byte_1B89	db 0			; DATA XREF: sub_1C54+A3w
					; sub_1EF1:loc_1F51r ...
byte_1B8A	db 0			; DATA XREF: sub_1C54+A8w sub_243Dr ...
		db 2 dup(0)
byte_1B8D	db 0			; DATA XREF: sub_1C54+B2w sub_24C1+2r	...
byte_1B8E	db 0			; DATA XREF: sub_1C54+AEEw
					; sub_1C54:loc_2807r ...
byte_1B8F	db 0			; DATA XREF: sub_1C54+BAw
					; sub_2048:loc_2070r ...
byte_1B90	db 0			; DATA XREF: sub_1C54+BDw seg000:18B2r ...
byte_1B91	db 0			; DATA XREF: sub_1EF1o	sub_243D+22r ...
byte_1B92	db 0			; DATA XREF: sub_1EF1+6r sub_243D+17r	...
byte_1B93	db 0			; DATA XREF: sub_1EE5o
					; sub_243D:loc_2474r ...
byte_1B94	db 0			; DATA XREF: sub_1EE5+6r
					; sub_243D:loc_2467r ...
byte_1B95	db 0			; DATA XREF: sub_1EF1:loc_1FC6r
					; sub_1EF1+E6r	...
byte_1B96	db 0			; DATA XREF: sub_1EF1:loc_1F9Fr
					; sub_1EF1+BFr	...
byte_1B97	db 0			; DATA XREF: sub_1C54+AF1w
byte_1B98	db 0			; DATA XREF: sub_2048+2r
					; sub_2048:loc_2054r ...
byte_1B99	db 0			; DATA XREF: sub_20E7+52w sub_2140+14w ...
byte_1B9A	db 0			; DATA XREF: sub_20E7+55w
					; sub_2140:loc_2165w ...
byte_1B9B	db 0			; DATA XREF: sub_1C54+C0w
					; sub_217A+116w ...
byte_1B9C	db 1			; DATA XREF: sub_22BA+2r sub_22BA+7w ...
byte_1B9D	db 0			; DATA XREF: sub_1C54+C3w
					; sub_217A+10Ew ...
byte_1B9E	db 0			; DATA XREF: sub_1C54+C6w sub_217A+9Cr ...
byte_1B9F	db 0			; DATA XREF: sub_2C3D+7w sub_2C3D+6Dr	...
byte_1BA0	db 1			; DATA XREF: sub_2C3D+Cw
					; sub_2C3D:loc_2CCBr ...
byte_1BA1	db 0			; DATA XREF: sub_1C54+B7w sub_217A+B7w ...
unk_1BA2	db    4			; DATA XREF: sub_2C3D+22o sub_2C3D+76o ...
		db    3
		db    2
		db    1
		db    0
		db    0
		db    1
		db    2
		db    3
		db    4
byte_1BAC	db 0			; DATA XREF: sub_2C3D+42w sub_2D0D+7o
byte_1BAD	db 0			; DATA XREF: sub_2C3D+47w sub_2D0D+14o ...
byte_1BAE	db 0			; DATA XREF: sub_2C3D+4Cw sub_2D0D+5Cr ...
byte_1BAF	db 0			; DATA XREF: sub_243D+42w
					; sub_1C54+B8Aw ...
word_1BB0	dw 0			; DATA XREF: sub_1BB2+3Dr sub_1BB2+7Aw ...

; =============== S U B	R O U T	I N E =======================================


proc		sub_1BB2 near		; CODE XREF: sub_1C54+FFp
					; sub_2048:loc_20B4j ...
		push	ds
		mov	si, offset unk_1B70
		mov	di, 0C4D0h
		call	sub_190F	; Call Procedure

		mov	bh, 7


loc_1BBE:				; CODE XREF: sub_1BB2+15j
		mov	al, [cs:si]
		call	sub_193B	; Call Procedure

		inc	si		; Increment by 1
		dec	bh		; Decrement by 1
		jnz	short loc_1BBE	; Jump if Not Zero (ZF=0)

		mov	bx, [cs:word_1B77]
		mov	di, 0C4F8h
		call	sub_1C3E	; Call Procedure

		mov	bx, [cs:word_1B79]
		mov	di, 0C578h
		call	sub_1C3E	; Call Procedure

		mov	bx, [cs:word_1B7B]
		mov	di, 0C5F8h
		call	sub_1C3E	; Call Procedure

		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	di, [cs:word_1BB0]
		cmp	di, 0		; Compare Two Operands
		jz	short loc_1C06	; Jump if Zero (ZF=1)

		mov	bh, 6


loc_1BFB:				; CODE XREF: sub_1BB2+52j
		mov	[word ptr di], 0
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_1BFB	; Jump if Not Zero (ZF=0)


loc_1C06:				; CODE XREF: sub_1BB2+45j
		mov	al, [cs:byte_1B82]
		ror	al, 1		; Rotate Right
		and	ax, 3		; Logical AND
		mov	si, offset byte_1C50
		add	si, ax		; Add
		mov	cl, [cs:si]
		mov	al, [cs:byte_1B82]
		ror	al, 1		; Rotate Right
		ror	al, 1		; Rotate Right
		ror	al, 1		; Rotate Right
		and	ax, 1Fh		; Logical AND
		mov	di, 0CD40h
		add	di, ax		; Add
		call	sub_190F	; Call Procedure

		mov	[cs:word_1BB0],	di
		mov	bh, 6


loc_1C33:				; CODE XREF: sub_1BB2+88j
		mov	[di], cl
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_1C33	; Jump if Not Zero (ZF=0)

		pop	ds
		assume ds:seg000
		retn			; Return Near from Procedure

endp		sub_1BB2


; =============== S U B	R O U T	I N E =======================================


proc		sub_1C3E near		; CODE XREF: sub_1BB2+1Fp sub_1BB2+2Ap ...
		push	bx
		call	sub_190F	; Call Procedure

		pop	bx
		mov	al, bl
		push	bx
		call	sub_193B	; Call Procedure

		pop	bx
		mov	al, bh
		call	sub_193B	; Call Procedure

		retn			; Return Near from Procedure

endp		sub_1C3E

; ---------------------------------------------------------------------------
byte_1C50	db 80h,	20h, 8,	2	; DATA XREF: sub_1BB2+5Do

; =============== S U B	R O U T	I N E =======================================


proc		sub_1C54 near		; CODE XREF: start+2Ep	sub_2643-8B1j ...

; FUNCTION CHUNK AT 170E SIZE 00000142 BYTES
; FUNCTION CHUNK AT 1BF0 SIZE 00000018 BYTES

		call	sub_189E	; Call Procedure

		call	sub_19CD	; Call Procedure

		call	sub_19A0	; Call Procedure

		call	sub_1888	; Call Procedure

		mov	si, offset unk_1DF5
		call	sub_1888	; Call Procedure

		mov	di, 0C112h
		call	sub_1979	; Call Procedure

		call	sub_1874	; Call Procedure

		mov	di, 0C198h
		call	sub_1979	; Call Procedure

		call	sub_1888	; Call Procedure

		mov	di, 0C24Dh
		call	sub_1979	; Call Procedure

		call	sub_1874	; Call Procedure

		mov	di, 0C2D0h
		call	sub_1979	; Call Procedure

		call	sub_1888	; Call Procedure

		mov	di, 0C399h
		call	sub_1979	; Call Procedure

		call	sub_1874	; Call Procedure

		mov	di, 0C44Ch
		call	sub_1979	; Call Procedure

		mov	di, 0C4CCh
		call	sub_1979	; Call Procedure


loc_1C9F:				; CODE XREF: sub_1C54:loc_1CB4j
		push	cs
		pop	ds
		mov	si, offset unk_1700
		cmp	[byte ptr si+2], 0 ; Compare Two Operands
		jz	short loc_1CAD	; Jump if Zero (ZF=1)

		jmp	loc_1CB6	; Jump

; ---------------------------------------------------------------------------

loc_1CAD:				; CODE XREF: sub_1C54+54j
		cmp	[byte ptr si+3], 0 ; Compare Two Operands
		jz	short loc_1CB4	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1CB4:				; CODE XREF: sub_1C54+5Dj
		jmp	short loc_1C9F	; Jump

; ---------------------------------------------------------------------------

loc_1CB6:				; CODE XREF: sub_1C54+56j
		call	sub_19CD	; Call Procedure

		push	cs
		pop	ds
		mov	ax, 0
		mov	[word_1BB0], ax
		mov	ax, 3030h
		mov	si, offset unk_1B6F
		mov	[si], ax
		mov	[si+2],	ax
		mov	[si+4],	ax
		mov	[si+6],	ax
		mov	[word_1B77], ax
		mov	[word_1B79], ax
		mov	[word_1B7B], ax
		mov	si, 0B7Dh
		mov	[si+2],	ax
		mov	ax, 3032h
		mov	[si], ax
		mov	al, 0FFh
		mov	[byte_1B82], al
		mov	al, 0Fh
		mov	[byte_1B86], al
		mov	al, 3
		mov	[byte_1B87], al
		mov	al, 80h
		mov	[byte_1B89], al
		mov	al, 20h
		mov	[byte_1B8A], al
		mov	al, 14h
		mov	[byte_1B83], al
		mov	al, 1
		mov	[byte_1B8D], al
		mov	al, 0
		mov	[byte_1BA1], al
		mov	[byte_1B8F], al
		mov	[byte_1B90], al
		mov	[byte_1B9B], al
		mov	[byte_1B9D], al
		mov	[byte_1B9E], al
		call	sub_1888	; Call Procedure

		call	sub_19A0	; Call Procedure

		mov	si, offset unk_1DB5
		mov	di, 0C4C2h
		call	sub_1979	; Call Procedure

		mov	di, 0C5C2h
		call	sub_1979	; Call Procedure

		mov	di, 0C4E6h
		call	sub_1979	; Call Procedure

		mov	di, 0C56Ch
		call	sub_1979	; Call Procedure

		mov	di, 0C5ECh
		call	sub_1979	; Call Procedure

		mov	di, 0C540h
		call	sub_1DA0	; Call Procedure

		mov	di, 0FD40h
		call	sub_1DA0	; Call Procedure

		call	sub_1874	; Call Procedure

		call	sub_1BB2	; Call Procedure

		call	sub_23CA	; Call Procedure

		mov	ds, [cs:word_11DE]
		mov	es, [cs:word_11DE]
		mov	si, 0
		mov	di, 64h
		mov	bx, 5
		call	sub_1D95	; Call Procedure

		mov	si, 5
		mov	di, 0
		mov	bx, 69h
		call	sub_1D95	; Call Procedure

		mov	si, 0
		mov	di, 2416h
		mov	es, [cs:word_11C8]
		mov	bx, 80h
		call	sub_1D95	; Call Procedure

		jmp	loc_270E	; Jump

endp		sub_1C54

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2643

loc_1D8F:				; CODE XREF: sub_2643+47j
		call	sub_24E2	; Call Procedure

		jmp	sub_1C54	; Jump

; END OF FUNCTION CHUNK	FOR sub_2643

; =============== S U B	R O U T	I N E =======================================


proc		sub_1D95 near		; CODE XREF: sub_1C54+118p
					; sub_1C54+124p ...
		mov	al, [si]
		mov	[es:di], al
		inc	si		; Increment by 1
		inc	di		; Increment by 1
		dec	bx		; Decrement by 1
		jnz	short sub_1D95	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1D95


; =============== S U B	R O U T	I N E =======================================


proc		sub_1DA0 near		; CODE XREF: sub_1C54+F3p sub_1C54+F9p
		call	sub_190F	; Call Procedure

		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	cl, 10h


loc_1DAA:				; CODE XREF: sub_1DA0+12j
		mov	[word ptr di], 0FFFFh
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		dec	cl		; Decrement by 1
		jnz	short loc_1DAA	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1DA0

; ---------------------------------------------------------------------------
unk_1DB5	db    0			; DATA XREF: sub_1C54+CFo
		db    0
		db    1
		db    1
		db  53h	; S
		db  43h	; C
		db  4Fh	; O
		db  52h	; R
		db  45h	; E
		db  20h
		db  20h
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db 0FFh
		db  54h	; T
		db  49h	; I
		db  4Dh	; M
		db  45h	; E
		db  52h	; R
		db  20h
		db  20h
		db  20h
		db  20h
		db  32h	; 2
		db  30h	; 0
		db  2Eh	; .
		db  30h	; 0
		db  30h	; 0
		db 0FFh
		db  48h	; H
		db  4Fh	; O
		db  53h	; S
		db  54h	; T
		db  41h	; A
		db  47h	; G
		db  45h	; E
		db  53h	; S
		db  20h
		db  30h	; 0
		db  30h	; 0
		db 0FFh
		db  4Bh	; K
		db  45h	; E
		db  59h	; Y
		db  53h	; S
		db  20h
		db  20h
		db  30h	; 0
		db  30h	; 0
		db 0FFh
		db  42h	; B
		db  4Fh	; O
		db  4Dh	; M
		db  42h	; B
		db  53h	; S
		db  20h
		db  30h	; 0
		db  30h	; 0
		db 0FFh
unk_1DF5	db    0			; DATA XREF: sub_1C54+Co
		db    0
		db    1
		db    1
		db  50h	; P
		db  52h	; R
		db  4Fh	; O
		db  47h	; G
		db  52h	; R
		db  41h	; A
		db  4Dh	; M
		db  20h
		db  43h	; C
		db  4Fh	; O
		db  44h	; D
		db  49h	; I
		db  4Eh	; N
		db  47h	; G
		db 0FFh
		db  42h	; B
		db  49h	; I
		db  5Ah	; Z
		db  5Ah	; Z
		db  41h	; A
		db  52h	; R
		db  45h	; E
		db  21h	; !
		db 0FFh
		db  47h	; G
		db  52h	; R
		db  41h	; A
		db  50h	; P
		db  48h	; H
		db  49h	; I
		db  43h	; C
		db  53h	; S
		db  20h
		db  41h	; A
		db  4Eh	; N
		db  44h	; D
		db  20h
		db  44h	; D
		db  45h	; E
		db  53h	; S
		db  49h	; I
		db  47h	; G
		db  4Eh	; N
		db 0FFh
		db  43h	; C
		db  4Fh	; O
		db  4Ch	; L
		db  49h	; I
		db  4Eh	; N
		db  20h
		db  53h	; S
		db  57h	; W
		db  49h	; I
		db  4Eh	; N
		db  42h	; B
		db  4Fh	; O
		db  55h	; U
		db  52h	; R
		db  4Eh	; N
		db  45h	; E
		db 0FFh
		db    0
		db    0
		db    1
		db    1
		db  20h
		db  50h	; P
		db  52h	; R
		db  45h	; E
		db  53h	; S
		db  53h	; S
		db  20h
		db 0FFh
		db  22h	; "
		db  31h	; 1
		db  22h	; "
		db  20h
		db  2Eh	; .
		db  2Eh	; .
		db  20h
		db  50h	; P
		db  4Ch	; L
		db  41h	; A
		db  59h	; Y
		db  20h
		db  54h	; T
		db  48h	; H
		db  45h	; E
		db  20h
		db  47h	; G
		db  41h	; A
		db  4Dh	; M
		db  45h	; E
		db 0FFh
		db  22h	; "
		db  32h	; 2
		db  22h	; "
		db  20h
		db  2Eh	; .
		db  2Eh	; .
		db  2Eh	; .
		db  2Eh	; .
		db  20h
		db  45h	; E
		db  58h	; X
		db  49h	; I
		db  54h	; T
		db  20h
		db  54h	; T
		db  4Fh	; O
		db  20h
		db  44h	; D
		db  4Fh	; O
		db  53h	; S
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


proc		sub_1E6C near		; CODE XREF: sub_2527+83j
					; sub_1C54+BE8p
		mov	si, 0
		mov	di, 0A08h
		mov	bh, 40h


loc_1E74:				; CODE XREF: sub_25AD+45j sub_25F5+4Bj
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	ds, [cs:word_11CE]
		assume ds:seg000
		cld			; Clear	Direction Flag


loc_1E7F:				; CODE XREF: sub_1E6C+3Cj
		push	di
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		movsw			; Move Byte(s) from String to String
		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jz	short loc_1EAA	; Jump if Zero (ZF=1)

		jmp	short loc_1E7F	; Jump

; ---------------------------------------------------------------------------

loc_1EAA:				; CODE XREF: sub_1E6C+3Aj
		push	cs
		pop	ds
		retn			; Return Near from Procedure

endp		sub_1E6C


; =============== S U B	R O U T	I N E =======================================


proc		sub_1EAD near		; CODE XREF: sub_2527+42p sub_2527+77p ...
		mov	ds, [cs:word_11CE]
		mov	bh, 20h


loc_1EB4:				; CODE XREF: sub_1EAD+35j
		mov	al, [es:si]
		call	sub_1990	; Call Procedure

		mov	[di], ax
		mov	al, [es:si+1]
		call	sub_1990	; Call Procedure

		mov	[di+2],	ax
		mov	al, [es:si+2]
		call	sub_1990	; Call Procedure

		mov	[di+4],	ax
		mov	al, [es:si+3]
		call	sub_1990	; Call Procedure

		mov	[di+6],	ax
		add	di, 40h		; Add
		add	si, 4		; Add
		dec	bh		; Decrement by 1
		jnz	short loc_1EB4	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_1EAD


; =============== S U B	R O U T	I N E =======================================


proc		sub_1EE5 near		; CODE XREF: sub_1C54+B94p
		mov	di, offset byte_1B93
		mov	bp, offset unk_1B3C
		mov	al, [byte_1B94]
		jmp	loc_1EFA	; Jump

endp		sub_1EE5


; =============== S U B	R O U T	I N E =======================================


proc		sub_1EF1 near		; CODE XREF: sub_1C54+B91p
		mov	di, offset byte_1B91
		mov	bp, offset unk_1B44
		mov	al, [byte_1B92]


loc_1EFA:				; CODE XREF: sub_1EE5+9j
		push	cs
		pop	ds
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_1F01	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1F01:				; CODE XREF: sub_1EF1+Dj
		cmp	al, 1		; Compare Two Operands
		jnz	short loc_1F08	; Jump if Not Zero (ZF=0)

		jmp	loc_1F51	; Jump

; ---------------------------------------------------------------------------

loc_1F08:				; CODE XREF: sub_1EF1+12j
		cmp	al, 2		; Compare Two Operands
		jnz	short loc_1F0F	; Jump if Not Zero (ZF=0)

		jmp	loc_1F9F	; Jump

; ---------------------------------------------------------------------------

loc_1F0F:				; CODE XREF: sub_1EF1+19j
		cmp	al, 3		; Compare Two Operands
		jnz	short loc_1F16	; Jump if Not Zero (ZF=0)

		jmp	loc_1FC6	; Jump

; ---------------------------------------------------------------------------

loc_1F16:				; CODE XREF: sub_1EF1+20j
		cmp	al, 4		; Compare Two Operands
		jnz	short loc_1F1D	; Jump if Not Zero (ZF=0)

		jmp	loc_1FEE	; Jump

; ---------------------------------------------------------------------------

loc_1F1D:				; CODE XREF: sub_1EF1+27j
		cmp	al, 5		; Compare Two Operands
		jnz	short loc_1F24	; Jump if Not Zero (ZF=0)

		jmp	loc_2007	; Jump

; ---------------------------------------------------------------------------

loc_1F24:				; CODE XREF: sub_1EF1+2Ej
		cmp	al, 6		; Compare Two Operands
		jnz	short loc_1F2B	; Jump if Not Zero (ZF=0)

		jmp	loc_2020	; Jump

; ---------------------------------------------------------------------------

loc_1F2B:				; CODE XREF: sub_1EF1+35j
		and	al, 80h		; Logical AND
		jnz	short loc_1F41	; Jump if Not Zero (ZF=0)


loc_1F2F:				; CODE XREF: sub_1EF1+5Bj
		mov	al, 0
		mov	[di+1],	al
		mov	[bp+4],	al
		mov	[bp+5],	al
		mov	ax, 8496h
		mov	[bp+0],	ax
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1F41:				; CODE XREF: sub_1EF1+3Cj
		dec	[byte ptr di+1]	; Decrement by 1
		dec	al		; Decrement by 1
		cmp	[byte ptr di+1], 7Fh ; Compare Two Operands
		jnz	short loc_1F4E	; Jump if Not Zero (ZF=0)

		jmp	short loc_1F2F	; Jump

; ---------------------------------------------------------------------------

loc_1F4E:				; CODE XREF: sub_1EF1+59j
		jmp	loc_1F67	; Jump

; ---------------------------------------------------------------------------

loc_1F51:				; CODE XREF: sub_1EF1+14j
		mov	al, [byte_1B89]
		sub	al, [di]	; Integer Subtraction
		jz	short loc_1F5C	; Jump if Zero (ZF=1)

		jb	short loc_1F62	; Jump if Below	(CF=1)

		inc	[byte ptr di]	; Increment by 1


loc_1F5C:				; CODE XREF: sub_1EF1+65j
		mov	si, 5C96h
		jmp	loc_1F67	; Jump

; ---------------------------------------------------------------------------

loc_1F62:				; CODE XREF: sub_1EF1+67j
		dec	[byte ptr di]	; Decrement by 1
		mov	si, 5496h


loc_1F67:				; CODE XREF: sub_1EF1:loc_1F4Ej
					; sub_1EF1+6Ej	...
		mov	cl, [di]
		ror	cl, 1		; Rotate Right
		ror	cl, 1		; Rotate Right
		and	cl, 3Eh		; Logical AND
		mov	[bp+4],	cl
		mov	al, 20h
		mov	[bp+5],	al
		mov	ch, [di]
		and	cx, 600h	; Logical AND
		add	si, cx		; Add
		mov	[bp+0],	si
		mov	al, [di+1]
		and	al, 80h		; Logical AND
		jnz	short loc_1F8B	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1F8B:				; CODE XREF: sub_1EF1+97j
		mov	ah, [di]
		and	ax, 600h	; Logical AND
		add	ax, 8496h	; Add
		mov	bl, [di+1]
		and	bl, 8		; Logical AND
		add	ah, bl		; Add
		mov	[bp+0],	ax
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_1F9F:				; CODE XREF: sub_1EF1+1Bj
		mov	al, [byte_1B96]
		add	al, [di]	; Add
		mov	[di], al
		cmp	al, 3		; Compare Two Operands
		jb	short loc_1FAE	; Jump if Below	(CF=1)

		cmp	al, 0DEh	; Compare Two Operands
		jb	short loc_1FB7	; Jump if Below	(CF=1)


loc_1FAE:				; CODE XREF: sub_1EF1+B7j
		mov	al, 0
		sub	al, [byte_1B96]	; Integer Subtraction
		mov	[byte_1B96], al


loc_1FB7:				; CODE XREF: sub_1EF1+BBj
		mov	al, [byte_1B96]
		and	al, 80h		; Logical AND
		mov	si, 5C96h
		jz	short loc_1FC4	; Jump if Zero (ZF=1)

		mov	si, 5496h


loc_1FC4:				; CODE XREF: sub_1EF1+CEj
		jmp	short loc_1F67	; Jump

; ---------------------------------------------------------------------------

loc_1FC6:				; CODE XREF: sub_1EF1+22j
		mov	al, [byte_1B95]
		add	al, [di]	; Add
		mov	[di], al
		cmp	al, 3		; Compare Two Operands
		jb	short loc_1FD5	; Jump if Below	(CF=1)

		cmp	al, 0DEh	; Compare Two Operands
		jb	short loc_1FDE	; Jump if Below	(CF=1)


loc_1FD5:				; CODE XREF: sub_1EF1+DEj
		mov	al, 0
		sub	al, [byte_1B95]	; Integer Subtraction
		mov	[byte_1B95], al


loc_1FDE:				; CODE XREF: sub_1EF1+E2j
		mov	al, [byte_1B95]
		and	al, 80h		; Logical AND
		mov	si, 5C96h
		jz	short loc_1FEB	; Jump if Zero (ZF=1)

		mov	si, 5496h


loc_1FEB:				; CODE XREF: sub_1EF1+F5j
		jmp	loc_1F67	; Jump

; ---------------------------------------------------------------------------

loc_1FEE:				; CODE XREF: sub_1EF1+29j
		mov	al, [byte_1B89]
		sub	al, [di]	; Integer Subtraction
		jz	short loc_1FF9	; Jump if Zero (ZF=1)

		jb	short loc_1FFF	; Jump if Below	(CF=1)

		inc	[byte ptr di]	; Increment by 1


loc_1FF9:				; CODE XREF: sub_1EF1+102j
		mov	si, 6C96h
		jmp	loc_2004	; Jump

; ---------------------------------------------------------------------------

loc_1FFF:				; CODE XREF: sub_1EF1+104j
		dec	[byte ptr di]	; Decrement by 1
		mov	si, 6496h


loc_2004:				; CODE XREF: sub_1EF1+10Bj
		jmp	loc_1F67	; Jump

; ---------------------------------------------------------------------------

loc_2007:				; CODE XREF: sub_1EF1+30j
		mov	al, [byte_1B89]
		sub	al, [di]	; Integer Subtraction
		jz	short loc_2012	; Jump if Zero (ZF=1)

		jb	short loc_2018	; Jump if Below	(CF=1)

		inc	[byte ptr di]	; Increment by 1


loc_2012:				; CODE XREF: sub_1EF1+11Bj
		mov	si, 4C96h
		jmp	loc_201D	; Jump

; ---------------------------------------------------------------------------

loc_2018:				; CODE XREF: sub_1EF1+11Dj
		dec	[byte ptr di]	; Decrement by 1
		mov	si, 4496h


loc_201D:				; CODE XREF: sub_1EF1+124j
		jmp	loc_1F67	; Jump

; ---------------------------------------------------------------------------

loc_2020:				; CODE XREF: sub_1EF1+37j
		mov	al, [byte_1B95]
		add	al, [di]	; Add
		mov	[di], al
		cmp	al, 3		; Compare Two Operands
		jb	short loc_202F	; Jump if Below	(CF=1)

		cmp	al, 0DEh	; Compare Two Operands
		jb	short loc_2038	; Jump if Below	(CF=1)


loc_202F:				; CODE XREF: sub_1EF1+138j
		mov	al, 0
		sub	al, [byte_1B95]	; Integer Subtraction
		mov	[byte_1B95], al


loc_2038:				; CODE XREF: sub_1EF1+13Cj
		mov	al, [byte_1B95]
		and	al, 80h		; Logical AND
		mov	si, 6C96h
		jz	short loc_2045	; Jump if Zero (ZF=1)

		mov	si, 6496h


loc_2045:				; CODE XREF: sub_1EF1+14Fj
		jmp	loc_1F67	; Jump

endp		sub_1EF1


; =============== S U B	R O U T	I N E =======================================


proc		sub_2048 near		; CODE XREF: sub_1C54+B8Ep
		push	cs
		pop	ds
		mov	al, [byte_1B98]
		and	al, 4		; Logical AND
		jz	short loc_2054	; Jump if Zero (ZF=1)

		call	nullsub_1	; Call Procedure


loc_2054:				; CODE XREF: sub_2048+7j
		mov	al, [byte_1B98]
		and	al, 8		; Logical AND
		jz	short loc_205E	; Jump if Zero (ZF=1)

		call	nullsub_2	; Call Procedure


loc_205E:				; CODE XREF: sub_2048+11j
		mov	al, [byte_1B98]
		and	al, 10h		; Logical AND
		jz	short loc_2068	; Jump if Zero (ZF=1)

		call	nullsub_3	; Call Procedure


loc_2068:				; CODE XREF: sub_2048+1Bj
		mov	al, [byte_1B98]
		and	al, 20h		; Logical AND
		jnz	short loc_2070	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2070:				; CODE XREF: sub_2048+25j
		mov	al, [byte_1B8F]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2078	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2078:				; CODE XREF: sub_2048+2Dj
		mov	al, [byte_16FF]
		and	al, 1		; Logical AND
		jz	short loc_20B7	; Jump if Zero (ZF=1)

		mov	al, [byte_1B89]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		cmp	al, 20h		; Compare Two Operands
		jnz	short loc_20B7	; Jump if Not Zero (ZF=0)

		mov	al, [byte_1B88]
		and	al, 10h		; Logical AND
		jz	short loc_20B7	; Jump if Zero (ZF=1)

		mov	ax, [word_1B79]
		cmp	ax, 3030h	; Compare Two Operands
		jnz	short loc_20A4	; Jump if Not Zero (ZF=0)

		mov	al, [byte_1B88]
		and	al, 0EFh	; Logical AND
		mov	[byte_1B88], al
		jmp	loc_20B7	; Jump

; ---------------------------------------------------------------------------

loc_20A4:				; CODE XREF: sub_2048+4Fj sub_2048+91j
		mov	si, (offset word_1B79+1)
		dec	[byte ptr si]	; Decrement by 1
		cmp	[byte ptr si], 2Fh ; Compare Two Operands
		jnz	short loc_20B4	; Jump if Not Zero (ZF=0)

		mov	[byte ptr si], 39h
		dec	si		; Decrement by 1
		dec	[byte ptr si]	; Decrement by 1


loc_20B4:				; CODE XREF: sub_2048+64j
		jmp	sub_1BB2	; Jump

; ---------------------------------------------------------------------------

loc_20B7:				; CODE XREF: sub_2048+35j sub_2048+40j ...
		mov	al, [byte_16FF]
		and	al, 1		; Logical AND
		jnz	short loc_20BF	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_20BF:				; CODE XREF: sub_2048+74j
		mov	al, [byte_1B89]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		cmp	al, 0C0h	; Compare Two Operands
		jz	short loc_20CB	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_20CB:				; CODE XREF: sub_2048+80j
		mov	al, [byte_1B88]
		and	al, 4		; Logical AND
		jnz	short loc_20D3	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_20D3:				; CODE XREF: sub_2048+88j
		mov	ax, [word_1B79]
		cmp	ax, 3030h	; Compare Two Operands
		jnz	short loc_20A4	; Jump if Not Zero (ZF=0)

		mov	al, [byte_1B88]
		and	al, 0FBh	; Logical AND
		mov	[byte_1B88], al
		retn			; Return Near from Procedure

endp		sub_2048


; =============== S U B	R O U T	I N E =======================================


proc		nullsub_1 near		; CODE XREF: sub_2048+9p
		retn			; Return Near from Procedure

endp		nullsub_1


; =============== S U B	R O U T	I N E =======================================


proc		nullsub_2 near		; CODE XREF: sub_2048+13p
		retn			; Return Near from Procedure

endp		nullsub_2


; =============== S U B	R O U T	I N E =======================================


proc		nullsub_3 near		; CODE XREF: sub_2048+1Dp
		retn			; Return Near from Procedure

endp		nullsub_3


; =============== S U B	R O U T	I N E =======================================


proc		sub_20E7 near		; CODE XREF: sub_1C54+B44p
		push	cs
		pop	ds
		mov	si, 2416h
		mov	dx, 9496h
		mov	bh, 0Fh
		mov	bl, 1
		call	sub_2140	; Call Procedure

		mov	si, 2425h
		mov	dx, 9696h
		mov	bh, 6
		mov	bl, 2
		call	sub_2140	; Call Procedure

		mov	si, 242Eh
		mov	dx, 9896h
		mov	bh, 6
		mov	bl, 3
		call	sub_2140	; Call Procedure

		mov	si, 243Ah
		mov	dx, 9A96h
		mov	bh, 6
		mov	bl, 4
		call	sub_2140	; Call Procedure

		mov	si, 2436h
		mov	dx, 9C96h
		mov	bh, 2
		mov	bl, 5
		call	sub_2140	; Call Procedure

		mov	si, 2441h
		mov	dx, 9E96h
		mov	bh, 2
		mov	bl, 6
		call	sub_2140	; Call Procedure

		mov	al, 0
		mov	[byte_1B99], al
		mov	[byte_1B9A], al
		retn			; Return Near from Procedure

endp		sub_20E7


; =============== S U B	R O U T	I N E =======================================


proc		sub_2140 near		; CODE XREF: sub_20E7+Cp sub_20E7+19p	...
		mov	al, [byte_1B85]
		cmp	al, [si]	; Compare Two Operands
		jnz	short loc_214B	; Jump if Not Zero (ZF=0)

		pop	si
		jmp	loc_2151	; Jump

; ---------------------------------------------------------------------------

loc_214B:				; CODE XREF: sub_2140+5j
		inc	si		; Increment by 1
		dec	bh		; Decrement by 1
		jnz	short sub_2140	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2151:				; CODE XREF: sub_2140+8j
		mov	bp, offset unk_1B34
		mov	[byte_1B99], bl
		mov	ch, 20h
		mov	cl, 20h
		mov	al, [byte_1B88]
		and	al, 30h		; Logical AND
		jz	short loc_2165	; Jump if Zero (ZF=1)

		mov	cl, 0C0h


loc_2165:				; CODE XREF: sub_2140+21j
		mov	[byte_1B9A], cl
		ror	cl, 1		; Rotate Right
		ror	cl, 1		; Rotate Right
		and	cl, 3Eh		; Logical AND
		mov	[bp+4],	cl
		mov	[bp+5],	ch
		mov	[bp+0],	dx
		retn			; Return Near from Procedure

endp		sub_2140 ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


proc		sub_217A near		; CODE XREF: sub_1C54+BD4p
		push	cs
		pop	ds
		mov	al, [byte_1B8F]
		and	al, 83h		; Logical AND
		jz	short loc_2184	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2184:				; CODE XREF: sub_217A+7j
		mov	al, [byte_1B99]
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_218C	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_218C:				; CODE XREF: sub_217A+Fj
		cmp	al, 1		; Compare Two Operands
		jnz	short loc_2193	; Jump if Not Zero (ZF=0)

		jmp	loc_21B7	; Jump

; ---------------------------------------------------------------------------

loc_2193:				; CODE XREF: sub_217A+14j
		cmp	al, 2		; Compare Two Operands
		jnz	short loc_219A	; Jump if Not Zero (ZF=0)

		jmp	loc_21F3	; Jump

; ---------------------------------------------------------------------------

loc_219A:				; CODE XREF: sub_217A+1Bj
		cmp	al, 3		; Compare Two Operands
		jnz	short loc_21A1	; Jump if Not Zero (ZF=0)

		jmp	loc_2206	; Jump

; ---------------------------------------------------------------------------

loc_21A1:				; CODE XREF: sub_217A+22j
		cmp	al, 4		; Compare Two Operands
		jnz	short loc_21A8	; Jump if Not Zero (ZF=0)

		jmp	loc_2246	; Jump

; ---------------------------------------------------------------------------

loc_21A8:				; CODE XREF: sub_217A+29j
		cmp	al, 5		; Compare Two Operands
		jnz	short loc_21AF	; Jump if Not Zero (ZF=0)

		jmp	loc_2268	; Jump

; ---------------------------------------------------------------------------

loc_21AF:				; CODE XREF: sub_217A+30j
		cmp	al, 6		; Compare Two Operands
		jnz	short locret_21B6 ; Jump if Not	Zero (ZF=0)

		jmp	loc_227E	; Jump

; ---------------------------------------------------------------------------

locret_21B6:				; CODE XREF: sub_217A+37j
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_21B7:				; CODE XREF: sub_217A+16j
		mov	al, [byte_1B86]
		rol	al, 1		; Rotate Left
		rol	al, 1		; Rotate Left
		rol	al, 1		; Rotate Left
		mov	bl, al
		mov	al, [byte_1B87]
		add	al, bl		; Add
		mov	ah, 0
		mov	si, ax
		mov	es, [word_11E0]
		assume es:nothing
		mov	al, [es:si]
		mov	[byte_1B88], al
		mov	si, 2416h
		mov	bh, 0Fh
		call	sub_2296	; Call Procedure

		mov	si, 0B7Ah


loc_21E0:				; CODE XREF: sub_217A+D7j
		inc	[byte ptr si]	; Increment by 1
		cmp	[byte ptr si], 3Ah ; Compare Two Operands
		jnz	short loc_21ED	; Jump if Not Zero (ZF=0)

		mov	[byte ptr si], 30h
		dec	si		; Decrement by 1
		inc	[byte ptr si]	; Increment by 1


loc_21ED:				; CODE XREF: sub_217A+6Bj
		call	sub_22DF	; Call Procedure

		jmp	loc_2530	; Jump

; ---------------------------------------------------------------------------

loc_21F3:				; CODE XREF: sub_217A+1Dj
		mov	si, 2425h
		mov	bh, 6
		call	sub_2296	; Call Procedure

		mov	al, 0FFh
		mov	[byte_1B82], al
		call	sub_22DF	; Call Procedure

		jmp	loc_2530	; Jump

; ---------------------------------------------------------------------------

loc_2206:				; CODE XREF: sub_217A+24j
		mov	si, 242Eh
		mov	bh, 6
		call	sub_2296	; Call Procedure

		call	sub_2C3D	; Call Procedure

		call	sub_2527	; Call Procedure

		push	cs
		pop	ds
		mov	al, [byte_1B9E]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_221E	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_221E:				; CODE XREF: sub_217A+A1j
		call	sub_2B67	; Call Procedure

		mov	si, offset unk_2253
		mov	di, 0C2CCh
		call	sub_1979	; Call Procedure

		mov	si, (offset word_1B7B+1)
		inc	[byte ptr si]	; Increment by 1
		mov	al, 1
		mov	[byte_1BA1], al
		call	sub_2B99	; Call Procedure

		call	sub_1BB2	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_28FF	; Call Procedure

		jmp	loc_2530	; Jump

; ---------------------------------------------------------------------------

loc_2246:				; CODE XREF: sub_217A+2Bj
		mov	si, 243Ah
		mov	bh, 6
		call	sub_2296	; Call Procedure

		mov	si, (offset word_1B77+1)
		jmp	short loc_21E0	; Jump

; ---------------------------------------------------------------------------
unk_2253	db  45h	; E		; DATA XREF: sub_217A+A7o
		db  58h	; X
		db  50h	; P
		db  4Ch	; L
		db  4Fh	; O
		db  53h	; S
		db  49h	; I
		db  56h	; V
		db  45h	; E
		db  53h	; S
		db  20h
		db  41h	; A
		db  43h	; C
		db  54h	; T
		db  49h	; I
		db  56h	; V
		db  41h	; A
		db  54h	; T
		db  45h	; E
		db  44h	; D
		db 0FFh
; ---------------------------------------------------------------------------

loc_2268:				; CODE XREF: sub_217A+32j
		mov	si, 2436h
		mov	bh, 2
		call	sub_2296	; Call Procedure

		mov	al, [byte_1B83]
		add	al, 19h		; Add
		mov	[byte_1B83], al
		call	sub_22DF	; Call Procedure

		jmp	loc_2530	; Jump

; ---------------------------------------------------------------------------

loc_227E:				; CODE XREF: sub_217A+39j
		mov	si, 2441h
		mov	bh, 2
		call	sub_2296	; Call Procedure

		mov	al, 1
		mov	[byte_1B9D], al
		call	sub_22DF	; Call Procedure

		mov	al, 0FFh
		mov	[byte_1B9B], al
		jmp	loc_2530	; Jump

endp		sub_217A


; =============== S U B	R O U T	I N E =======================================


proc		sub_2296 near		; CODE XREF: sub_217A+60p sub_217A+7Ep ...

; FUNCTION CHUNK AT 1B92 SIZE 00000007 BYTES

		mov	al, 0FFh
		mov	[byte_1B9A], al
		mov	bp, offset unk_1B34
		mov	ax, 0
		mov	[bp+0],	ax
		mov	[bp+4],	ax


loc_22A7:				; CODE XREF: sub_2296+21j
		mov	al, [byte_1B85]
		cmp	al, [si]	; Compare Two Operands
		jnz	short loc_22B4	; Jump if Not Zero (ZF=0)

		mov	[byte ptr si], 0FFh
		jmp	loc_2B92	; Jump

; ---------------------------------------------------------------------------

loc_22B4:				; CODE XREF: sub_2296+16j
		inc	si		; Increment by 1
		dec	bh		; Decrement by 1
		jnz	short loc_22A7	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_2296


; =============== S U B	R O U T	I N E =======================================


proc		sub_22BA near		; CODE XREF: sub_1C54+BDFp
		push	cs
		pop	ds
		mov	al, [byte_1B9C]
		dec	al		; Decrement by 1
		mov	[byte_1B9C], al
		cmp	al, 0		; Compare Two Operands
		jz	short loc_22C9	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_22C9:				; CODE XREF: sub_22BA+Cj
		mov	al, 9
		mov	[byte_1B9C], al
		mov	al, [byte_1B9B]
		dec	al		; Decrement by 1
		mov	[byte_1B9B], al
		cmp	al, 0		; Compare Two Operands
		jz	short loc_22DB	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_22DB:				; CODE XREF: sub_22BA+1Ej
		mov	[byte_1B9D], al
		retn			; Return Near from Procedure

endp		sub_22BA


; =============== S U B	R O U T	I N E =======================================


proc		sub_22DF near		; CODE XREF: sub_217A:loc_21EDp
					; sub_217A+86p	...
		call	sub_2B67	; Call Procedure

		mov	si, offset unk_232C
		mov	di, 0C2D2h
		call	sub_1979	; Call Procedure

		mov	al, [byte_1B99]
		cmp	al, 1		; Compare Two Operands
		jnz	short loc_22F8	; Jump if Not Zero (ZF=0)

		mov	si, offset unk_233B
		jmp	loc_231D	; Jump

; ---------------------------------------------------------------------------

loc_22F8:				; CODE XREF: sub_22DF+11j
		cmp	al, 2		; Compare Two Operands
		jnz	short loc_2302	; Jump if Not Zero (ZF=0)

		mov	si, offset unk_2349
		jmp	loc_231D	; Jump

; ---------------------------------------------------------------------------

loc_2302:				; CODE XREF: sub_22DF+1Bj
		cmp	al, 4		; Compare Two Operands
		jnz	short loc_230C	; Jump if Not Zero (ZF=0)

		mov	si, offset unk_2357
		jmp	loc_231D	; Jump

; ---------------------------------------------------------------------------

loc_230C:				; CODE XREF: sub_22DF+25j
		cmp	al, 5		; Compare Two Operands
		jnz	short loc_2316	; Jump if Not Zero (ZF=0)

		mov	si, offset unk_2365
		jmp	loc_231D	; Jump

; ---------------------------------------------------------------------------

loc_2316:				; CODE XREF: sub_22DF+2Fj
		cmp	al, 6		; Compare Two Operands
		jnz	short loc_231D	; Jump if Not Zero (ZF=0)

		mov	si, offset unk_2376


loc_231D:				; CODE XREF: sub_22DF+16j sub_22DF+20j ...
		mov	di, 0C310h
		call	sub_1979	; Call Procedure

		call	sub_1BB2	; Call Procedure

		call	sub_28FF	; Call Procedure

		jmp	sub_28FF	; Jump

endp		sub_22DF

; ---------------------------------------------------------------------------
unk_232C	db  59h	; Y		; DATA XREF: sub_22DF+3o
		db  4Fh	; O
		db  55h	; U
		db  20h
		db  48h	; H
		db  41h	; A
		db  56h	; V
		db  45h	; E
		db  20h
		db  46h	; F
		db  4Fh	; O
		db  55h	; U
		db  4Eh	; N
		db  44h	; D
		db 0FFh
unk_233B	db  20h			; DATA XREF: sub_22DF+13o
		db  20h
		db  20h
		db  41h	; A
		db  20h
		db  43h	; C
		db  45h	; E
		db  4Ch	; L
		db  4Ch	; L
		db  20h
		db  4Bh	; K
		db  45h	; E
		db  59h	; Y
		db 0FFh
unk_2349	db  20h			; DATA XREF: sub_22DF+1Do
		db  20h
		db  20h
		db  53h	; S
		db  4Fh	; O
		db  4Dh	; M
		db  45h	; E
		db  20h
		db  20h
		db  46h	; F
		db  4Fh	; O
		db  4Fh	; O
		db  44h	; D
		db 0FFh
unk_2357	db  20h			; DATA XREF: sub_22DF+27o
		db  20h
		db  20h
		db  41h	; A
		db  20h
		db  20h
		db  48h	; H
		db  4Fh	; O
		db  53h	; S
		db  54h	; T
		db  41h	; A
		db  47h	; G
		db  45h	; E
		db 0FFh
unk_2365	db  53h	; S		; DATA XREF: sub_22DF+31o
		db  4Fh	; O
		db  4Dh	; M
		db  45h	; E
		db  20h
		db  20h
		db  41h	; A
		db  4Dh	; M
		db  4Dh	; M
		db  55h	; U
		db  4Eh	; N
		db  49h	; I
		db  54h	; T
		db  49h	; I
		db  4Fh	; O
		db  4Eh	; N
		db 0FFh
unk_2376	db  41h	; A		; DATA XREF: sub_22DF+3Bo
		db  4Eh	; N
		db  20h
		db  45h	; E
		db  4Eh	; N
		db  45h	; E
		db  4Dh	; M
		db  59h	; Y
		db  20h
		db  55h	; U
		db  4Eh	; N
		db  49h	; I
		db  46h	; F
		db  4Fh	; O
		db  52h	; R
		db  4Dh	; M
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


proc		sub_2387 near		; CODE XREF: sub_1C54+B63p

; FUNCTION CHUNK AT 13EC SIZE 0000001E BYTES

		push	cs
		pop	ds
		mov	al, [byte_1B81]
		dec	al		; Decrement by 1
		mov	[byte_1B81], al
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2396	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2396:				; CODE XREF: sub_2387+Cj
		mov	al, 19h
		mov	[byte_1B81], al
		mov	si, offset byte_1B7D
		mov	bl, 4


loc_23A0:				; CODE XREF: sub_2387+21j
		cmp	[byte ptr si], 30h ; Compare Two Operands
		jnz	short loc_23AD	; Jump if Not Zero (ZF=0)

		inc	si		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_23A0	; Jump if Not Zero (ZF=0)

		jmp	loc_23EC	; Jump

; ---------------------------------------------------------------------------

loc_23AD:				; CODE XREF: sub_2387+1Cj
		mov	si, (offset byte_1B7D+3)
		mov	di, offset unk_23E8
		mov	bl, 4


loc_23B5:				; CODE XREF: sub_2387+3Cj
		mov	al, [si]
		cmp	al, 30h		; Compare Two Operands
		jnz	short loc_23C8	; Jump if Not Zero (ZF=0)

		mov	al, [di]
		mov	[si], al
		dec	si		; Decrement by 1
		inc	di		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_23B5	; Jump if Not Zero (ZF=0)

		jmp	sub_23CA	; Jump

; ---------------------------------------------------------------------------

loc_23C8:				; CODE XREF: sub_2387+32j
		dec	[byte ptr si]	; Decrement by 1

endp		sub_2387 ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


proc		sub_23CA near		; CODE XREF: sub_1C54+102p
					; sub_2387+3Ej
		mov	di, 0C5D4h
		mov	si, offset byte_1B7D
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	bx, [cs:si]
		push	di
		call	sub_1C3E	; Call Procedure

		pop	di
		add	di, 6		; Add
		mov	bx, [cs:si+2]
		call	sub_1C3E	; Call Procedure

		retn			; Return Near from Procedure

endp		sub_23CA

; ---------------------------------------------------------------------------
unk_23E8	db  39h	; 9		; DATA XREF: sub_2387+29o
		db  35h	; 5
		db  39h	; 9
		db  32h	; 2
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2387

loc_23EC:				; CODE XREF: sub_2387+23j
		call	sub_2B67	; Call Procedure

		mov	di, 0C2CDh
		mov	si, offset unk_240A
		call	sub_1979	; Call Procedure

		mov	di, 0C314h
		call	sub_1979	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_24E2	; Call Procedure

		jmp	sub_1C54	; Jump

; END OF FUNCTION CHUNK	FOR sub_2387
; ---------------------------------------------------------------------------
unk_240A	db  59h	; Y		; DATA XREF: sub_2387+6Bo
		db  4Fh	; O
		db  55h	; U
		db  20h
		db  52h	; R
		db  41h	; A
		db  4Eh	; N
		db  20h
		db  4Fh	; O
		db  55h	; U
		db  54h	; T
		db  20h
		db  4Fh	; O
		db  46h	; F
		db  20h
		db  54h	; T
		db  49h	; I
		db  4Dh	; M
		db  45h	; E
		db 0FFh
		db  59h	; Y
		db  4Fh	; O
		db  55h	; U
		db  20h
		db  41h	; A
		db  52h	; R
		db  45h	; E
		db  20h
		db  44h	; D
		db  45h	; E
		db  41h	; A
		db  44h	; D
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


proc		sub_242B near		; CODE XREF: sub_1C54+BA5p
		push	cs
		pop	ds
		assume ds:seg000
		mov	al, [byte_1B82]
		cmp	al, 2		; Compare Two Operands
		jnb	short loc_2435	; Jump if Not Below (CF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2435:				; CODE XREF: sub_242B+7j
		sub	al, 1		; Integer Subtraction
		mov	[byte_1B82], al
		jmp	sub_1BB2	; Jump

endp		sub_242B


; =============== S U B	R O U T	I N E =======================================


proc		sub_243D near		; CODE XREF: sub_1C54+B9Ap
		mov	al, [byte_1B8A]
		cmp	al, 10h		; Compare Two Operands
		jnb	short loc_2445	; Jump if Not Below (CF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2445:				; CODE XREF: sub_243D+5j
		mov	al, [byte_1B9D]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_244D	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_244D:				; CODE XREF: sub_243D+Dj
		mov	al, [byte_1B89]
		sub	al, 18h		; Integer Subtraction
		mov	cl, al
		mov	al, [byte_1B92]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2467	; Jump if Zero (ZF=1)

		cmp	al, 7		; Compare Two Operands
		jnb	short loc_2467	; Jump if Not Below (CF=0)

		mov	al, [byte_1B91]
		call	sub_2483	; Call Procedure

		jb	short loc_247D	; Jump if Below	(CF=1)


loc_2467:				; CODE XREF: sub_243D+1Cj sub_243D+20j
		mov	al, [byte_1B94]
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_246F	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_246F:				; CODE XREF: sub_243D+2Fj
		cmp	al, 7		; Compare Two Operands
		jb	short loc_2474	; Jump if Below	(CF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2474:				; CODE XREF: sub_243D+34j
		mov	al, [byte_1B93]
		call	sub_2483	; Call Procedure

		jb	short loc_247D	; Jump if Below	(CF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_247D:				; CODE XREF: sub_243D+28j sub_243D+3Dj
		mov	al, 1
		mov	[byte_1BAF], al
		retn			; Return Near from Procedure

endp		sub_243D


; =============== S U B	R O U T	I N E =======================================


proc		sub_2483 near		; CODE XREF: sub_243D+25p sub_243D+3Ap
		sub	al, cl		; Integer Subtraction
		jb	short loc_248A	; Jump if Below	(CF=1)

		cmp	al, 30h		; Compare Two Operands
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_248A:				; CODE XREF: sub_2483+2j
		clc			; Clear	Carry Flag
		retn			; Return Near from Procedure

endp		sub_2483


; =============== S U B	R O U T	I N E =======================================


proc		sub_248C near		; CODE XREF: sub_2943+19Cp
		mov	cl, [byte_1B89]
		mov	al, [byte_1B92]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_24A7	; Jump if Zero (ZF=1)

		cmp	al, 7		; Compare Two Operands
		jnb	short loc_24A7	; Jump if Not Below (CF=0)

		mov	dl, al
		mov	al, [byte_1B91]
		call	sub_24C1	; Call Procedure

		mov	[byte_1B92], dl


loc_24A7:				; CODE XREF: sub_248C+9j sub_248C+Dj
		mov	al, [byte_1B94]
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_24AF	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_24AF:				; CODE XREF: sub_248C+20j
		cmp	al, 7		; Compare Two Operands
		jb	short loc_24B4	; Jump if Below	(CF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_24B4:				; CODE XREF: sub_248C+25j
		mov	dl, al
		mov	al, [byte_1B93]
		call	sub_24C1	; Call Procedure

		mov	[byte_1B94], dl
		retn			; Return Near from Procedure

endp		sub_248C


; =============== S U B	R O U T	I N E =======================================


proc		sub_24C1 near		; CODE XREF: sub_248C+14p sub_248C+2Dp
		mov	dh, al
		mov	al, [byte_1B8D]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_24D9	; Jump if Zero (ZF=1)

		mov	al, dh
		cmp	al, cl		; Compare Two Operands
		jb	short loc_24D1	; Jump if Below	(CF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_24D1:				; CODE XREF: sub_24C1+Dj
					; sub_24C1:loc_24E0j
		push	bx
		call	sub_2BA0	; Call Procedure

		pop	bx
		mov	dl, 0FFh
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_24D9:				; CODE XREF: sub_24C1+7j
		mov	al, dh
		cmp	al, cl		; Compare Two Operands
		jnb	short loc_24E0	; Jump if Not Below (CF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_24E0:				; CODE XREF: sub_24C1+1Cj
		jmp	short loc_24D1	; Jump

endp		sub_24C1


; =============== S U B	R O U T	I N E =======================================


proc		sub_24E2 near		; CODE XREF: sub_2643:loc_1D8Fp
					; sub_2387+7Dp	...
		push	cs
		pop	ds
		retn			; Return Near from Procedure

endp		sub_24E2

; ---------------------------------------------------------------------------
		retn			; Return Near from Procedure


; =============== S U B	R O U T	I N E =======================================


proc		sub_24E6 near		; CODE XREF: sub_1C54+B23p
		mov	al, [byte_1B89]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		mov	cl, al
		mov	al, [byte_1B91]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		cmp	al, cl		; Compare Two Operands
		jnz	short loc_250A	; Jump if Not Zero (ZF=0)

		mov	al, [byte_1B91]
		mov	bl, 0D0h
		cmp	al, 80h		; Compare Two Operands
		jnb	short loc_2505	; Jump if Not Below (CF=0)

		mov	bl, 30h


loc_2505:				; CODE XREF: sub_24E6+1Bj
		add	al, bl		; Add
		mov	[byte_1B91], al


loc_250A:				; CODE XREF: sub_24E6+12j
		mov	al, [byte_1B93]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		cmp	al, cl		; Compare Two Operands
		jz	short loc_2516	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2516:				; CODE XREF: sub_24E6+2Dj
		mov	al, [byte_1B93]
		mov	bl, 0D0h
		cmp	al, 80h		; Compare Two Operands
		jnb	short loc_2521	; Jump if Not Below (CF=0)

		mov	bl, 30h


loc_2521:				; CODE XREF: sub_24E6+37j
		add	al, bl		; Add
		mov	[byte_1B93], al
		retn			; Return Near from Procedure

endp		sub_24E6


; =============== S U B	R O U T	I N E =======================================


proc		sub_2527 near		; CODE XREF: sub_217A+97p
					; sub_1C54+AE7p
		call	sub_1874	; Call Procedure

		call	sub_25F5	; Call Procedure

		call	sub_25AD	; Call Procedure


loc_2530:				; CODE XREF: sub_217A+76j sub_217A+89j ...
		mov	al, [cs:byte_1B85]
		mov	ah, 0
		add	ax, ax		; Add
		add	ax, ax		; Add
		add	ax, ax		; Add
		add	ax, ax		; Add
		mov	bp, ax
		mov	di, 0
		mov	bh, 8


loc_2545:				; CODE XREF: sub_2527+4Cj
		push	bx
		push	di
		mov	es, [cs:word_11DC]
		mov	al, [es:bp+0]
		inc	bp		; Increment by 1
		and	ax, 3Fh		; Logical AND
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		mov	si, ax
		mov	es, [cs:word_11D0]
		call	sub_1EAD	; Call Procedure

		pop	di
		add	di, 8		; Add
		pop	bx
		dec	bh		; Decrement by 1
		jnz	short loc_2545	; Jump if Not Zero (ZF=0)

		mov	di, 800h
		mov	bh, 8


loc_257A:				; CODE XREF: sub_2527+81j
		push	bx
		push	di
		mov	es, [cs:word_11DC]
		mov	al, [es:bp+0]
		inc	bp		; Increment by 1
		and	ax, 3Fh		; Logical AND
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		mov	si, ax
		mov	es, [cs:word_11D0]
		call	sub_1EAD	; Call Procedure

		pop	di
		add	di, 8		; Add
		pop	bx
		dec	bh		; Decrement by 1
		jnz	short loc_257A	; Jump if Not Zero (ZF=0)

		jmp	sub_1E6C	; Jump

endp		sub_2527


; =============== S U B	R O U T	I N E =======================================


proc		sub_25AD near		; CODE XREF: sub_2527+6p
		mov	es, [cs:word_11D4]
		mov	bh, 8
		mov	di, 0


loc_25B7:				; CODE XREF: sub_25AD+19j
		push	bx
		push	di
		mov	si, 0
		call	sub_1EAD	; Call Procedure

		pop	di
		pop	bx
		add	di, 8		; Add
		dec	bh		; Decrement by 1
		jnz	short loc_25B7	; Jump if Not Zero (ZF=0)

		mov	al, [cs:byte_1B88]
		and	al, 20h		; Logical AND
		jz	short loc_25D9	; Jump if Zero (ZF=1)

		mov	si, 40h
		mov	di, 8
		call	sub_1EAD	; Call Procedure


loc_25D9:				; CODE XREF: sub_25AD+21j
		mov	al, [cs:byte_1B88]
		and	al, 8		; Logical AND
		jz	short loc_25EA	; Jump if Zero (ZF=1)

		mov	si, 40h
		mov	di, 30h
		call	sub_1EAD	; Call Procedure


loc_25EA:				; CODE XREF: sub_25AD+32j
		mov	bh, 10h
		mov	si, 0
		mov	di, 1408h
		jmp	loc_1E74	; Jump

endp		sub_25AD


; =============== S U B	R O U T	I N E =======================================


proc		sub_25F5 near		; CODE XREF: sub_2527+3p
		mov	al, [cs:byte_1B85]
		mov	ah, 0
		add	ax, ax		; Add
		add	ax, ax		; Add
		add	ax, ax		; Add
		mov	bp, ax
		mov	di, 0
		mov	bh, 8


loc_2608:				; CODE XREF: sub_25F5+41j
		push	bx
		push	di
		mov	es, [cs:word_11E2]

loc_260F:
		mov	al, [es:bp+0]
		inc	bp		; Increment by 1
		and	ax, 3Fh		; Logical AND
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		mov	si, ax
		mov	es, [cs:word_11D0]
		call	sub_1EAD	; Call Procedure

		pop	di
		add	di, 8		; Add
		pop	bx
		dec	bh		; Decrement by 1
		jnz	short loc_2608	; Jump if Not Zero (ZF=0)

		mov	di, 508h
		mov	si, 0
		mov	bh, 20h
		jmp	loc_1E74	; Jump

endp		sub_25F5


; =============== S U B	R O U T	I N E =======================================


proc		sub_2643 near		; CODE XREF: sub_1C54+AC3p

; FUNCTION CHUNK AT 0D8F SIZE 00000006 BYTES

		push	cs
		pop	ds
		mov	al, [byte_1B87]
		cmp	al, 3		; Compare Two Operands
		jz	short loc_264D	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_264D:				; CODE XREF: sub_2643+7j
		mov	ax, [word_1B77]
		cmp	ax, 3630h	; Compare Two Operands
		jz	short loc_2656	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2656:				; CODE XREF: sub_2643+10j
		mov	ax, [word_1B7B]
		cmp	ax, 3630h	; Compare Two Operands
		jz	short loc_265F	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_265F:				; CODE XREF: sub_2643+19j
		call	sub_19EF	; Call Procedure

		mov	si, offset unk_268D
		mov	di, 0C200h
		call	sub_1979	; Call Procedure

		mov	di, 0C280h
		call	sub_1979	; Call Procedure

		mov	di, 0C300h
		call	sub_1979	; Call Procedure

		mov	di, 0C380h
		call	sub_1979	; Call Procedure

		mov	di, 0C400h
		call	sub_1979	; Call Procedure

		call	sub_2B8B	; Call Procedure

		call	sub_1832	; Call Procedure

		pop	si
		jmp	loc_1D8F	; Jump

endp		sub_2643 ; sp-analysis failed

; ---------------------------------------------------------------------------
unk_268D	db  20h			; DATA XREF: sub_2643+1Fo
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  43h	; C
		db  4Fh	; O
		db  4Eh	; N
		db  47h	; G
		db  52h	; R
		db  41h	; A
		db  54h	; T
		db  55h	; U
		db  4Ch	; L
		db  41h	; A
		db  54h	; T
		db  49h	; I
		db  4Fh	; O
		db  4Eh	; N
		db  53h	; S
		db  20h
		db  21h	; !
		db 0FFh
		db  20h
		db  20h
		db  20h
		db  20h
		db  59h	; Y
		db  4Fh	; O
		db  55h	; U
		db  20h
		db  48h	; H
		db  41h	; A
		db  56h	; V
		db  45h	; E
		db  20h
		db  43h	; C
		db  4Fh	; O
		db  4Dh	; M
		db  50h	; P
		db  4Ch	; L
		db  45h	; E
		db  54h	; T
		db  45h	; E
		db  44h	; D
		db  20h
		db  59h	; Y
		db  4Fh	; O
		db  55h	; U
		db  52h	; R
		db 0FFh
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  4Dh	; M
		db  49h	; I
		db  53h	; S
		db  53h	; S
		db  49h	; I
		db  4Fh	; O
		db  4Eh	; N
		db  20h
		db  41h	; A
		db  4Eh	; N
		db  44h	; D
		db  20h
		db  48h	; H
		db  41h	; A
		db  56h	; V
		db  45h	; E
		db  20h
		db  42h	; B
		db  45h	; E
		db  45h	; E
		db  4Eh	; N
		db 0FFh
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  41h	; A
		db  57h	; W
		db  41h	; A
		db  52h	; R
		db  44h	; D
		db  45h	; E
		db  44h	; D
		db  20h
		db  41h	; A
		db  20h
		db  20h
		db  42h	; B
		db  4Fh	; O
		db  4Eh	; N
		db  55h	; U
		db  53h	; S
		db  20h
		db  4Fh	; O
		db  46h	; F
		db 0FFh
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  31h	; 1
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  20h
		db  50h	; P
		db  4Fh	; O
		db  49h	; I
		db  4Eh	; N
		db  54h	; T
		db  53h	; S
		db 0FFh
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1C54

loc_270E:				; CODE XREF: sub_1C54+138j
					; sub_1C54+BBBj
		push	cs
		pop	ds
		mov	al, [byte_1B86]
		cmp	al, 0Fh		; Compare Two Operands
		jnz	short loc_271A	; Jump if Not Zero (ZF=0)

		call	sub_2643	; Call Procedure


loc_271A:				; CODE XREF: sub_1C54+AC1j
		mov	al, [byte_1B86]
		rol	al, 1		; Rotate Left
		rol	al, 1		; Rotate Left
		rol	al, 1		; Rotate Left
		mov	bl, al
		mov	al, [byte_1B87]
		add	al, bl		; Add
		mov	[byte_1B85], al
		mov	ah, 0
		mov	si, ax
		mov	es, [word_11E0]
		mov	al, [es:si]
		mov	[byte_1B88], al
		call	sub_2527	; Call Procedure

		push	cs
		pop	ds
		mov	al, 0
		mov	[byte_1B8E], al
		mov	[byte_1B97], al
		mov	al, [byte_1B85]
		mov	ah, 0
		add	ax, ax		; Add
		mov	si, ax
		mov	es, [word_11D6]
		mov	al, [es:si]
		mov	[byte_1B92], al
		mov	al, [es:si+1]
		and	al, 0FEh	; Logical AND
		mov	[byte_1B91], al
		add	si, 100h	; Add
		mov	al, [es:si]
		mov	[byte_1B94], al
		mov	al, [es:si+1]
		and	al, 0FEh	; Logical AND
		mov	[byte_1B93], al
		call	sub_24E6	; Call Procedure

		mov	al, 1
		mov	[byte_1B95], al
		mov	al, 0FFh
		mov	[byte_1B96], al
		mov	al, [byte_1B85]
		mov	ah, 0
		mov	si, ax
		mov	es, [word_11D8]
		mov	al, [es:si]
		mov	[byte_1B98], al
		call	sub_1A11	; Call Procedure

		call	sub_20E7	; Call Procedure


loc_279B:				; CODE XREF: sub_1C54:loc_284Dj
		push	cs
		pop	ds
		mov	ax, [word_1141]
		cmp	ax, 0		; Compare Two Operands
		jnz	short loc_27A8	; Jump if Not Zero (ZF=0)

		call	sub_16F1	; Call Procedure


loc_27A8:				; CODE XREF: sub_1C54+B4Fj
		mov	al, [byte_1B6B]
		inc	al		; Increment by 1
		mov	[byte_1B6B], al
		mov	al, [byte_1BA1]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_27BA	; Jump if Zero (ZF=1)

		call	sub_2387	; Call Procedure


loc_27BA:				; CODE XREF: sub_1C54+B61j
		call	nullsub_4	; Call Procedure

		mov	si, offset unk_1700
		mov	al, [cs:si+1]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_27CB	; Jump if Zero (ZF=1)

		jmp	sub_1C54	; Jump

; ---------------------------------------------------------------------------

loc_27CB:				; CODE XREF: sub_1C54+B72j
		call	sub_17FB	; Call Procedure

		mov	si, offset unk_1700
		mov	al, [cs:si+3Bh]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_27DC	; Jump if Zero (ZF=1)

		call	sub_2850	; Call Procedure


loc_27DC:				; CODE XREF: sub_1C54+B83j
		mov	al, 0
		mov	[cs:byte_1BAF],	al
		call	sub_2048	; Call Procedure

		call	sub_1EF1	; Call Procedure

		call	sub_1EE5	; Call Procedure

		call	sub_2943	; Call Procedure

		call	sub_243D	; Call Procedure

		mov	al, [cs:byte_1BAF]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_27FC	; Jump if Zero (ZF=1)

		call	sub_242B	; Call Procedure


loc_27FC:				; CODE XREF: sub_1C54+BA3j
		mov	al, [cs:byte_1B82]
		cmp	al, 2		; Compare Two Operands
		jnb	short loc_2807	; Jump if Not Below (CF=0)

		jmp	loc_2BF0	; Jump

; ---------------------------------------------------------------------------

loc_2807:				; CODE XREF: sub_1C54+BAEj
		mov	al, [cs:byte_1B8E]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2812	; Jump if Zero (ZF=1)

		jmp	loc_270E	; Jump

; ---------------------------------------------------------------------------

loc_2812:				; CODE XREF: sub_1C54+BB9j
		mov	cl, [cs:byte_1B89]
		mov	al, [cs:byte_1B9A]
		cmp	al, cl		; Compare Two Operands
		jnb	short loc_2822	; Jump if Not Below (CF=0)

		jmp	loc_282B	; Jump

; ---------------------------------------------------------------------------

loc_2822:				; CODE XREF: sub_1C54+BC9j
		sub	al, 3		; Integer Subtraction
		cmp	al, cl		; Compare Two Operands
		jnb	short loc_282B	; Jump if Not Below (CF=0)

		call	sub_217A	; Call Procedure


loc_282B:				; CODE XREF: sub_1C54+BCBj
					; sub_1C54+BD2j
		mov	al, [cs:byte_1B9D]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2836	; Jump if Zero (ZF=1)

		call	sub_22BA	; Call Procedure


loc_2836:				; CODE XREF: sub_1C54+BDDj
		call	sub_1A35	; Call Procedure

		call	sub_16F1	; Call Procedure

		call	sub_1E6C	; Call Procedure

		call	sub_1AE0	; Call Procedure

		mov	al, [cs:byte_1B9E]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_284D	; Jump if Zero (ZF=1)

		jmp	loc_2BF0	; Jump

; ---------------------------------------------------------------------------

loc_284D:				; CODE XREF: sub_1C54+BF4j
		jmp	loc_279B	; Jump

; END OF FUNCTION CHUNK	FOR sub_1C54

; =============== S U B	R O U T	I N E =======================================


proc		sub_2850 near		; CODE XREF: sub_1C54+B85p
		mov	si, offset unk_2866
		mov	di, 0E090h
		call	sub_1979	; Call Procedure

		call	sub_1832	; Call Procedure

		mov	si, offset unk_2877
		mov	di, 0E090h
		call	sub_1979	; Call Procedure

		retn			; Return Near from Procedure

endp		sub_2850

; ---------------------------------------------------------------------------
unk_2866	db  2Dh	; -		; DATA XREF: sub_2850o
		db  2Dh	; -
		db  2Dh	; -
		db  20h
		db  50h	; P
		db  41h	; A
		db  55h	; U
		db  53h	; S
		db  49h	; I
		db  4Eh	; N
		db  47h	; G
		db  2Eh	; .
		db  20h
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db 0FFh
unk_2877	db  20h			; DATA XREF: sub_2850+Co
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


proc		nullsub_4 near		; CODE XREF: sub_1C54:loc_27BAp
					; sub_2C3D+52p
		retn			; Return Near from Procedure

endp		nullsub_4

; ---------------------------------------------------------------------------
		mov	di, 50h
		mov	al, [cs:byte_16FF]
		call	sub_28D2	; Call Procedure

		mov	al, [cs:byte_1780]
		call	sub_28D2	; Call Procedure

		mov	di, 64h
		mov	al, [cs:byte_1B89]
		call	sub_28D2	; Call Procedure

		mov	al, [cs:byte_1B8A]
		call	sub_28D2	; Call Procedure

		mov	al, [cs:byte_1B8F]
		call	sub_28D2	; Call Procedure

		mov	al, [cs:byte_1B90]
		call	sub_28D2	; Call Procedure

		add	di, 4		; Add
		mov	al, [cs:byte_1B9A]
		call	sub_28D2	; Call Procedure

		mov	al, [cs:byte_1B99]
		call	sub_28D2	; Call Procedure

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------
		push	ax
		mov	al, ah
		call	sub_28D2	; Call Procedure

		pop	ax


; =============== S U B	R O U T	I N E =======================================


proc		sub_28D2 near		; CODE XREF: seg000:1890p seg000:1897p ...
		push	ax
		ror	al, 1		; Rotate Right
		ror	al, 1		; Rotate Right
		ror	al, 1		; Rotate Right
		ror	al, 1		; Rotate Right
		call	sub_28DF	; Call Procedure

		pop	ax

endp		sub_28D2 ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


proc		sub_28DF near		; CODE XREF: sub_28D2+9p
		and	ax, 0Fh		; Logical AND
		mov	si, offset unk_28EF
		add	si, ax		; Add
		push	cs
		pop	ds
		mov	al, [cs:si]
		jmp	sub_193B	; Jump

endp		sub_28DF

; ---------------------------------------------------------------------------
unk_28EF	db  30h	; 0		; DATA XREF: sub_28DF+3o
		db  31h	; 1
		db  32h	; 2
		db  33h	; 3
		db  34h	; 4
		db  35h	; 5
		db  36h	; 6
		db  37h	; 7
		db  38h	; 8
		db  39h	; 9
		db  41h	; A
		db  42h	; B
		db  43h	; C
		db  44h	; D
		db  45h	; E
		db  46h	; F

; =============== S U B	R O U T	I N E =======================================


proc		sub_28FF near		; CODE XREF: sub_217A+C0p sub_217A+C3p ...
		mov	bh, 50h


loc_2901:				; CODE XREF: sub_28FF+7j
		call	sub_16F1	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_2901	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_28FF

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2943

loc_2909:				; CODE XREF: sub_2943+15j
		call	sub_2915	; Call Procedure

		jmp	loc_29A2	; Jump

; ---------------------------------------------------------------------------

loc_290F:				; CODE XREF: sub_2943+Cj
		call	sub_2915	; Call Procedure

		jmp	loc_29DB	; Jump

; END OF FUNCTION CHUNK	FOR sub_2943

; =============== S U B	R O U T	I N E =======================================


proc		sub_2915 near		; CODE XREF: sub_2943:loc_2909p
					; sub_2943:loc_290Fp ...
		mov	al, [byte_1B90]
		inc	al		; Increment by 1
		mov	[byte_1B90], al
		cmp	al, 18h		; Compare Two Operands
		jz	short loc_2933	; Jump if Zero (ZF=1)

		mov	si, offset unk_2AE5
		and	ax, 1Fh		; Logical AND
		add	si, ax		; Add
		mov	al, [si]
		and	al, 1Fh		; Logical AND
		mov	[byte_1B8A], al
		jmp	loc_2B01	; Jump

; ---------------------------------------------------------------------------

loc_2933:				; CODE XREF: sub_2915+Aj
		mov	al, 0
		mov	[byte_1B90], al
		mov	[byte_1B8F], al
		mov	al, 20h
		mov	[byte_1B8A], al
		jmp	loc_2B01	; Jump

endp		sub_2915


; =============== S U B	R O U T	I N E =======================================


proc		sub_2943 near		; CODE XREF: sub_1C54+B97p

; FUNCTION CHUNK AT 1909 SIZE 0000000C BYTES
; FUNCTION CHUNK AT 1AA0 SIZE 00000015 BYTES
; FUNCTION CHUNK AT 1AC1 SIZE 00000024 BYTES

		push	cs
		pop	ds
		mov	al, [byte_1B8F]
		mov	ah, al
		and	ah, 1		; Logical AND
		jz	short loc_2951	; Jump if Zero (ZF=1)

		jmp	short loc_290F	; Jump

; ---------------------------------------------------------------------------

loc_2951:				; CODE XREF: sub_2943+Aj
		mov	ah, al
		and	ah, 2		; Logical AND
		jz	short loc_295A	; Jump if Zero (ZF=1)

		jmp	short loc_2909	; Jump

; ---------------------------------------------------------------------------

loc_295A:				; CODE XREF: sub_2943+13j
		mov	ah, al
		and	ah, 80h		; Logical AND
		jz	short loc_2963	; Jump if Zero (ZF=1)

		jmp	short sub_2915	; Jump

; ---------------------------------------------------------------------------

loc_2963:				; CODE XREF: sub_2943+1Cj
		mov	al, [byte_16FF]
		mov	cl, al
		and	al, 10h		; Logical AND
		jz	short loc_296F	; Jump if Zero (ZF=1)

		jmp	loc_2AC1	; Jump

; ---------------------------------------------------------------------------

loc_296F:				; CODE XREF: sub_2943+27j
		mov	al, 0
		mov	[byte_1B84], al
		mov	al, cl
		and	al, 4		; Logical AND
		jz	short loc_297D	; Jump if Zero (ZF=1)

		call	sub_299B	; Call Procedure


loc_297D:				; CODE XREF: sub_2943+35j
		mov	al, cl
		and	al, 8		; Logical AND
		jz	short loc_2986	; Jump if Zero (ZF=1)

		call	sub_29D4	; Call Procedure


loc_2986:				; CODE XREF: sub_2943+3Ej
		mov	al, cl
		and	al, 1		; Logical AND
		jz	short loc_298F	; Jump if Zero (ZF=1)

		call	sub_2A0D	; Call Procedure


loc_298F:				; CODE XREF: sub_2943+47j
		mov	al, cl
		and	al, 2		; Logical AND
		jz	short loc_2998	; Jump if Zero (ZF=1)

		call	sub_2A67	; Call Procedure


loc_2998:				; CODE XREF: sub_2943+50j
		jmp	loc_2B01	; Jump

endp		sub_2943


; =============== S U B	R O U T	I N E =======================================


proc		sub_299B near		; CODE XREF: sub_2943+37p
		mov	al, cl
		and	al, 8		; Logical AND
		jz	short loc_29A2	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_29A2:				; CODE XREF: sub_2943-37j sub_299B+4j
		mov	al, 1
		mov	[byte_1B8D], al
		mov	al, [byte_1B89]
		cmp	al, 3		; Compare Two Operands
		jb	short loc_29B1	; Jump if Below	(CF=1)

		jmp	loc_29CE	; Jump

; ---------------------------------------------------------------------------

loc_29B1:				; CODE XREF: sub_299B+11j
		mov	al, [byte_1B88]
		and	al, 2		; Logical AND
		jz	short loc_29B9	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_29B9:				; CODE XREF: sub_299B+1Bj
		mov	al, 0E6h
		mov	[byte_1B89], al
		mov	al, [byte_1B87]
		dec	al		; Decrement by 1
		and	al, 7		; Logical AND
		mov	[byte_1B87], al
		mov	al, 1
		mov	[byte_1B8E], al
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_29CE:				; CODE XREF: sub_299B+13j
		sub	al, 2		; Integer Subtraction
		mov	[byte_1B89], al
		retn			; Return Near from Procedure

endp		sub_299B


; =============== S U B	R O U T	I N E =======================================


proc		sub_29D4 near		; CODE XREF: sub_2943+40p
		mov	al, cl
		and	al, 4		; Logical AND
		jz	short loc_29DB	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_29DB:				; CODE XREF: sub_2943-31j sub_29D4+4j
		mov	al, 0
		mov	[byte_1B8D], al
		mov	al, [byte_1B89]
		cmp	al, 0E3h	; Compare Two Operands
		jnb	short loc_29EA	; Jump if Not Below (CF=0)

		jmp	loc_2A07	; Jump

; ---------------------------------------------------------------------------

loc_29EA:				; CODE XREF: sub_29D4+11j
		mov	al, [byte_1B88]
		and	al, 1		; Logical AND
		jz	short loc_29F2	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_29F2:				; CODE XREF: sub_29D4+1Bj
		mov	al, 0
		mov	[byte_1B89], al
		mov	al, [byte_1B87]
		inc	al		; Increment by 1
		and	al, 7		; Logical AND
		mov	[byte_1B87], al
		mov	al, 1
		mov	[byte_1B8E], al
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A07:				; CODE XREF: sub_29D4+13j
		add	al, 2		; Add
		mov	[byte_1B89], al
		retn			; Return Near from Procedure

endp		sub_29D4


; =============== S U B	R O U T	I N E =======================================


proc		sub_2A0D near		; CODE XREF: sub_2943+49p

; FUNCTION CHUNK AT 1B01 SIZE 00000066 BYTES

		mov	al, cl
		and	al, 2		; Logical AND
		jz	short loc_2A14	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A14:				; CODE XREF: sub_2A0D+4j
		mov	al, [byte_1B89]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		cmp	al, 20h		; Compare Two Operands
		jz	short loc_2A3A	; Jump if Zero (ZF=1)

		cmp	al, 0C0h	; Compare Two Operands
		jnz	short loc_2A43	; Jump if Not Zero (ZF=0)

		mov	al, [byte_1B88]
		and	al, 4		; Logical AND
		jz	short loc_2A43	; Jump if Zero (ZF=1)


loc_2A2A:				; CODE XREF: sub_2A0D+34j
		mov	al, [byte_1B86]
		inc	al		; Increment by 1
		and	al, 0Fh		; Logical AND
		mov	[byte_1B86], al
		mov	al, 1
		mov	[byte_1B8E], al
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A3A:				; CODE XREF: sub_2A0D+10j
		mov	al, [byte_1B88]
		and	al, 10h		; Logical AND
		jz	short loc_2A43	; Jump if Zero (ZF=1)

		jmp	short loc_2A2A	; Jump

; ---------------------------------------------------------------------------

loc_2A43:				; CODE XREF: sub_2A0D+14j sub_2A0D+1Bj ...
		mov	al, cl
		and	al, 4		; Logical AND
		jz	short loc_2A51	; Jump if Zero (ZF=1)

		mov	al, 2
		mov	[byte_1B8F], al
		jmp	loc_2B01	; Jump

; ---------------------------------------------------------------------------

loc_2A51:				; CODE XREF: sub_2A0D+3Aj
		mov	al, cl
		and	al, 8		; Logical AND
		jz	short loc_2A5F	; Jump if Zero (ZF=1)

		mov	al, 1
		mov	[byte_1B8F], al
		jmp	loc_2B01	; Jump

; ---------------------------------------------------------------------------

loc_2A5F:				; CODE XREF: sub_2A0D+48j
		mov	al, 80h
		mov	[byte_1B8F], al
		jmp	loc_2B01	; Jump

endp		sub_2A0D


; =============== S U B	R O U T	I N E =======================================


proc		sub_2A67 near		; CODE XREF: sub_2943+52p
		mov	al, cl
		and	al, 1		; Logical AND
		jz	short loc_2A6E	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A6E:				; CODE XREF: sub_2A67+4j
		mov	al, [byte_1B89]
		add	al, 10h		; Add
		and	al, 0E0h	; Logical AND
		cmp	al, 20h		; Compare Two Operands
		jz	short loc_2A96	; Jump if Zero (ZF=1)

		cmp	al, 0C0h	; Compare Two Operands
		jz	short loc_2A7E	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A7E:				; CODE XREF: sub_2A67+14j
		mov	al, [byte_1B88]
		and	al, 8		; Logical AND
		jnz	short loc_2A86	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A86:				; CODE XREF: sub_2A67+1Cj
					; sub_2A67:loc_2A9Ej
		mov	al, [byte_1B86]
		dec	al		; Decrement by 1
		and	al, 0Fh		; Logical AND
		mov	[byte_1B86], al
		mov	al, 1
		mov	[byte_1B8E], al
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A96:				; CODE XREF: sub_2A67+10j
		mov	al, [byte_1B88]
		and	al, 20h		; Logical AND
		jnz	short loc_2A9E	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2A9E:				; CODE XREF: sub_2A67+34j
		jmp	short loc_2A86	; Jump

endp		sub_2A67

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2943

loc_2AA0:				; CODE XREF: sub_2943+183j
		call	sub_2B67	; Call Procedure

		mov	si, offset unk_2AB5
		mov	di, 0C2D5h
		call	sub_1979	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_28FF	; Call Procedure

		jmp	loc_2B01	; Jump

; END OF FUNCTION CHUNK	FOR sub_2943
; ---------------------------------------------------------------------------
unk_2AB5	db  4Fh	; O		; DATA XREF: sub_2943+160o
		db  55h	; U
		db  54h	; T
		db  20h
		db  4Fh	; O
		db  46h	; F
		db  20h
		db  41h	; A
		db  4Dh	; M
		db  4Dh	; M
		db  4Fh	; O
		db 0FFh
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2943

loc_2AC1:				; CODE XREF: sub_2943+29j
		mov	al, [byte_1B83]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2AA0	; Jump if Zero (ZF=1)

		mov	si, offset byte_1B84
		mov	al, [si]
		mov	[byte ptr si], 0FFh
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2AD7	; Jump if Zero (ZF=1)

		jmp	loc_2B01	; Jump

; ---------------------------------------------------------------------------

loc_2AD7:				; CODE XREF: sub_2943+18Fj
		mov	al, [byte_1B83]
		dec	al		; Decrement by 1
		mov	[byte_1B83], al
		call	sub_248C	; Call Procedure

		jmp	loc_2B01	; Jump

; END OF FUNCTION CHUNK	FOR sub_2943
; ---------------------------------------------------------------------------
unk_2AE5	db  20h			; DATA XREF: sub_2915+Co
		db  18h
		db  14h
		db  10h
		db  0Ch
		db    8
		db    6
		db    4
		db    3
		db    2
		db    2
		db    1
		db    1
		db    1
		db    1
		db    2
		db    3
		db    5
		db    7
		db    9
		db  0Bh
		db  0Eh
		db  12h
		db  16h
		db  1Ch
		db  20h
		db  20h
		db  20h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2A0D

loc_2B01:				; CODE XREF: sub_2915+1Bj sub_2915+2Bj ...
		mov	bp, offset unk_1B4C
		mov	al, [byte_1B89]
		ror	al, 1		; Rotate Right
		ror	al, 1		; Rotate Right
		and	al, 3Eh		; Logical AND
		mov	[bp+4],	al
		mov	al, [byte_1B8A]
		mov	[bp+5],	al
		mov	al, [byte_1B8F]
		and	al, 83h		; Logical AND
		jnz	short loc_2B42	; Jump if Not Zero (ZF=0)

		mov	si, 3496h
		mov	al, [byte_1B9D]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2B2A	; Jump if Zero (ZF=1)

		mov	si, 5496h


loc_2B2A:				; CODE XREF: sub_2A0D+118j
		mov	ah, [byte_1B89]
		and	ax, 600h	; Logical AND
		add	si, ax		; Add
		mov	al, [byte_1B8D]
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_2B3E	; Jump if Not Zero (ZF=0)

		add	si, 800h	; Add


loc_2B3E:				; CODE XREF: sub_2A0D+12Bj
		mov	[bp+0],	si
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2B42:				; CODE XREF: sub_2A0D+10Ej
		mov	si, 2496h
		mov	al, [byte_1B9D]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2B4F	; Jump if Zero (ZF=1)

		mov	si, 7496h


loc_2B4F:				; CODE XREF: sub_2A0D+13Dj
		mov	ah, [byte_1B89]
		and	ax, 600h	; Logical AND
		add	si, ax		; Add
		mov	al, [byte_1B8D]
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_2B63	; Jump if Not Zero (ZF=0)

		add	si, 800h	; Add


loc_2B63:				; CODE XREF: sub_2A0D+150j
		mov	[bp+0],	si
		retn			; Return Near from Procedure

; END OF FUNCTION CHUNK	FOR sub_2A0D

; =============== S U B	R O U T	I N E =======================================


proc		sub_2B67 near		; CODE XREF: sub_217A:loc_221Ep
					; sub_22DFp ...
		push	di
		push	ds
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	di, 0C92h
		mov	bh, 20h


loc_2B73:				; CODE XREF: sub_2B67+1Fj
		push	di
		mov	bl, 16h


loc_2B76:				; CODE XREF: sub_2B67+17j
		mov	[word ptr di], 0
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_2B76	; Jump if Not Zero (ZF=0)

		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_2B73	; Jump if Not Zero (ZF=0)

		pop	ds
		assume ds:seg000
		pop	di
		retn			; Return Near from Procedure

endp		sub_2B67


; =============== S U B	R O U T	I N E =======================================


proc		sub_2B8B near		; CODE XREF: sub_2643+40p
		push	si
		mov	si, offset unk_2BD0
		jmp	loc_2BA4	; Jump

endp		sub_2B8B

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2296

loc_2B92:				; CODE XREF: sub_2296+1Bj
		push	si
		mov	si, offset unk_2BD8
		jmp	loc_2BA4	; Jump

; END OF FUNCTION CHUNK	FOR sub_2296

; =============== S U B	R O U T	I N E =======================================


proc		sub_2B99 near		; CODE XREF: sub_217A+BAp
		push	si
		mov	si, offset unk_2BE0
		jmp	loc_2BA4	; Jump

endp		sub_2B99


; =============== S U B	R O U T	I N E =======================================


proc		sub_2BA0 near		; CODE XREF: sub_24C1+11p
		push	si
		mov	si, offset unk_2BE8


loc_2BA4:				; CODE XREF: sub_2B8B+4j sub_2296+900j ...
		push	di
		mov	bh, 8
		add	si, 7		; Add
		mov	di, offset unk_1B76


loc_2BAD:				; CODE XREF: sub_2BA0+28j
		mov	al, [cs:si]
		mov	ah, [cs:di]
		add	al, ah		; Add


loc_2BB5:				; CODE XREF: sub_2BA0+22j
		mov	[cs:di], al
		cmp	al, 3Ah		; Compare Two Operands
		jb	short loc_2BC4	; Jump if Below	(CF=1)

		sub	al, 0Ah		; Integer Subtraction
		dec	di		; Decrement by 1
		inc	[byte ptr di]	; Increment by 1
		inc	di		; Increment by 1
		jmp	short loc_2BB5	; Jump

; ---------------------------------------------------------------------------

loc_2BC4:				; CODE XREF: sub_2BA0+1Aj
		dec	si		; Decrement by 1
		dec	di		; Decrement by 1
		dec	bh		; Decrement by 1
		jnz	short loc_2BAD	; Jump if Not Zero (ZF=0)

		call	sub_1BB2	; Call Procedure

		pop	di
		pop	si
		retn			; Return Near from Procedure

endp		sub_2BA0

; ---------------------------------------------------------------------------
unk_2BD0	db    0			; DATA XREF: sub_2B8B+1o
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
unk_2BD8	db    0			; DATA XREF: sub_2296+8FDo
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
unk_2BE0	db    0			; DATA XREF: sub_2B99+1o
		db    0
		db    0
		db    0
		db    5
		db    0
		db    0
		db    0
unk_2BE8	db    0			; DATA XREF: sub_2BA0+1o
		db    0
		db    0
		db    0
		db    0
		db    2
		db    0
		db    0
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1C54

loc_2BF0:				; CODE XREF: sub_1C54+BB0j
					; sub_1C54+BF6j
		call	sub_2B67	; Call Procedure

		mov	si, offset unk_2C08
		mov	di, 0DAD4h
		call	sub_1979	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_28FF	; Call Procedure

		call	sub_24E2	; Call Procedure

		jmp	sub_1C54	; Jump

; END OF FUNCTION CHUNK	FOR sub_1C54
; ---------------------------------------------------------------------------
unk_2C08	db  59h	; Y		; DATA XREF: sub_1C54+F9Fo
		db  4Fh	; O
		db  55h	; U
		db  20h
		db  41h	; A
		db  52h	; R
		db  45h	; E
		db  20h
		db  44h	; D
		db  45h	; E
		db  41h	; A
		db  44h	; D
		db 0FFh
unk_2C15	db    1			; DATA XREF: sub_2C3D+1Do
		db    5
		db    2
		db    4
		db    3
		db    3
		db    4
		db    2
		db    5
		db    1
		db    4
		db    3
		db    5
		db    1
		db    2
		db    2
		db    1
		db    5
		db    3
		db    4
		db    3
		db    1
		db    2
		db    5
		db    4
		db    5
		db    4
		db    2
		db    1
		db    3
		db    4
		db    2
		db    3
		db    1
		db    5
		db    2
		db    3
		db    4
		db    5
		db    1

; =============== S U B	R O U T	I N E =======================================


proc		sub_2C3D near		; CODE XREF: sub_217A+94p
		call	sub_19EF	; Call Procedure

		push	cs
		pop	ds
		mov	al, 30h
		mov	[byte_1B9F], al
		mov	al, 32h
		mov	[byte_1BA0], al
		call	sub_1B54	; Call Procedure

		and	ax, 3		; Logical AND
		mov	bx, ax
		add	ax, ax		; Add
		add	ax, ax		; Add
		add	ax, bx		; Add
		mov	si, offset unk_2C15
		add	si, ax		; Add
		mov	di, offset unk_1BA2
		mov	bl, 5


loc_2C64:				; CODE XREF: sub_2C3D+2Fj
		mov	al, [si]
		mov	[di], al
		inc	si		; Increment by 1
		inc	di		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_2C64	; Jump if Not Zero (ZF=0)

		mov	si, offset unk_2CF1
		mov	di, 0C205h
		call	sub_1979	; Call Procedure

		call	sub_17FB	; Call Procedure

		push	cs
		pop	ds
		mov	al, [byte_16FF]
		mov	[byte_1BAC], al
		mov	al, 1
		mov	[byte_1BAD], al
		mov	al, 4
		mov	[byte_1BAE], al


loc_2C8C:				; CODE XREF: sub_2C3D+98j sub_2C3D+ACj
		call	sub_2D86	; Call Procedure

		call	nullsub_4	; Call Procedure

		call	sub_16F1	; Call Procedure

		mov	si, offset unk_1700
		mov	al, [cs:si+1]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2CA1	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2CA1:				; CODE XREF: sub_2C3D+61j
		call	sub_2D0D	; Call Procedure

		mov	di, 0C227h
		call	sub_190F	; Call Procedure

		mov	al, [cs:byte_1B9F]
		call	sub_28D2	; Call Procedure

		push	cs
		pop	ds
		mov	si, offset unk_1BA2
		mov	al, 1
		mov	bl, 5


loc_2CBA:				; CODE XREF: sub_2C3D+86j
		cmp	al, [si]	; Compare Two Operands
		jnz	short loc_2CCB	; Jump if Not Zero (ZF=0)

		inc	si		; Increment by 1
		inc	al		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_2CBA	; Jump if Not Zero (ZF=0)

		mov	al, 0
		mov	[byte_1B9E], al
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2CCB:				; CODE XREF: sub_2C3D+7Fj
		mov	al, [byte_1BA0]
		dec	al		; Decrement by 1
		mov	[byte_1BA0], al
		cmp	al, 0		; Compare Two Operands
		jnz	short loc_2C8C	; Jump if Not Zero (ZF=0)

		mov	al, 32h
		mov	[byte_1BA0], al
		mov	al, [byte_1B9F]
		cmp	al, 0		; Compare Two Operands
		jz	short loc_2CEB	; Jump if Zero (ZF=1)

		sub	al, 1		; Integer Subtraction
		das			; Decimal Adjust AL after Subtraction
		mov	[byte_1B9F], al
		jmp	short loc_2C8C	; Jump

; ---------------------------------------------------------------------------

loc_2CEB:				; CODE XREF: sub_2C3D+A4j
		mov	al, 1
		mov	[byte_1B9E], al
		retn			; Return Near from Procedure

endp		sub_2C3D

; ---------------------------------------------------------------------------
unk_2CF1	db  53h	; S		; DATA XREF: sub_2C3D+31o
		db  45h	; E
		db  4Ch	; L
		db  46h	; F
		db  20h
		db  44h	; D
		db  45h	; E
		db  53h	; S
		db  54h	; T
		db  52h	; R
		db  55h	; U
		db  43h	; C
		db  54h	; T
		db  20h
		db  49h	; I
		db  4Eh	; N
		db  20h
		db  33h	; 3
		db  30h	; 0
		db  20h
		db  53h	; S
		db  45h	; E
		db  43h	; C
		db  4Fh	; O
		db  4Eh	; N
		db  44h	; D
		db  53h	; S
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


proc		sub_2D0D near		; CODE XREF: sub_2C3D:loc_2CA1p
		push	cs
		pop	ds
		call	sub_17FB	; Call Procedure

		push	cs
		pop	ds
		mov	si, offset byte_1BAC
		mov	al, [byte_16FF]
		cmp	al, [si]	; Compare Two Operands
		jnz	short loc_2D1F	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2D1F:				; CODE XREF: sub_2D0D+Fj
		mov	[si], al
		mov	si, offset byte_1BAD
		mov	cl, al
		and	al, 8		; Logical AND
		jz	short loc_2D41	; Jump if Zero (ZF=1)

		inc	[byte ptr si]	; Increment by 1
		cmp	[byte ptr si], 6 ; Compare Two Operands
		jnz	short loc_2D34	; Jump if Not Zero (ZF=0)

		mov	[byte ptr si], 1


loc_2D34:				; CODE XREF: sub_2D0D+22j
		inc	si		; Increment by 1
		inc	[byte ptr si]	; Increment by 1
		cmp	[byte ptr si], 6 ; Compare Two Operands
		jz	short loc_2D3D	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2D3D:				; CODE XREF: sub_2D0D+2Dj
		mov	[byte ptr si], 1
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2D41:				; CODE XREF: sub_2D0D+1Bj
		mov	al, cl
		and	al, 4		; Logical AND
		jz	short loc_2D5E	; Jump if Zero (ZF=1)

		dec	[byte ptr si]	; Decrement by 1
		cmp	[byte ptr si], 0 ; Compare Two Operands
		jnz	short loc_2D51	; Jump if Not Zero (ZF=0)

		mov	[byte ptr si], 5


loc_2D51:				; CODE XREF: sub_2D0D+3Fj
		inc	si		; Increment by 1
		dec	[byte ptr si]	; Decrement by 1
		cmp	[byte ptr si], 0 ; Compare Two Operands
		jz	short loc_2D5A	; Jump if Zero (ZF=1)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2D5A:				; CODE XREF: sub_2D0D+4Aj
		mov	[byte ptr si], 5
		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2D5E:				; CODE XREF: sub_2D0D+38j
		mov	al, cl
		and	al, 13h		; Logical AND
		jnz	short loc_2D65	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

; ---------------------------------------------------------------------------

loc_2D65:				; CODE XREF: sub_2D0D+55j
		mov	bl, [byte_1BAD]
		mov	cl, [byte_1BAE]
		mov	bh, 0
		mov	ch, bh
		dec	bx		; Decrement by 1
		dec	cx		; Decrement by 1
		mov	si, offset unk_1BA2
		mov	di, offset unk_1BA2
		add	si, bx		; Add
		add	di, cx		; Add
		mov	al, [si]
		mov	ah, [di]
		mov	[si], ah
		mov	[di], al
		retn			; Return Near from Procedure

endp		sub_2D0D


; =============== S U B	R O U T	I N E =======================================


proc		sub_2D86 near		; CODE XREF: sub_2C3D:loc_2C8Cp
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	di, 0C305h
		call	sub_190F	; Call Procedure

		mov	si, offset unk_1BA2
		mov	bl, 5


loc_2D96:				; CODE XREF: sub_2D86+8Dj
		push	bx
		push	si
		push	di
		mov	al, [cs:si]
		mov	ah, 0
		dec	al		; Decrement by 1
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		mov	bx, ax
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		rol	ax, 1		; Rotate Left
		add	bx, ax		; Add
		mov	es, [cs:word_11D2]
		mov	al, [cs:si+5]
		inc	al		; Increment by 1
		cmp	al, [cs:byte_1BAD] ; Compare Two Operands
		jz	short loc_2DEA	; Jump if Zero (ZF=1)

		cmp	al, [cs:byte_1BAE] ; Compare Two Operands
		jz	short loc_2DEA	; Jump if Zero (ZF=1)

		mov	si, bx
		mov	bh, 18h


loc_2DCD:				; CODE XREF: sub_2D86+5Fj
		push	di
		mov	bl, 3


loc_2DD0:				; CODE XREF: sub_2D86+57j
		mov	al, [es:si]
		inc	si		; Increment by 1
		call	sub_18B8	; Call Procedure

		mov	[di], ax
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_2DD0	; Jump if Not Zero (ZF=0)

		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_2DCD	; Jump if Not Zero (ZF=0)

		jmp	loc_2E0A	; Jump

; ---------------------------------------------------------------------------

loc_2DEA:				; CODE XREF: sub_2D86+3Aj sub_2D86+41j
		mov	si, bx
		mov	bh, 18h


loc_2DEE:				; CODE XREF: sub_2D86+82j
		push	di
		mov	bl, 3


loc_2DF1:				; CODE XREF: sub_2D86+7Aj
		mov	al, [es:si]
		inc	si		; Increment by 1
		call	sub_18B8	; Call Procedure

		ror	ax, 1		; Rotate Right
		mov	[di], ax
		inc	di		; Increment by 1
		inc	di		; Increment by 1
		dec	bl		; Decrement by 1
		jnz	short loc_2DF1	; Jump if Not Zero (ZF=0)

		pop	di
		call	sub_1900	; Call Procedure

		dec	bh		; Decrement by 1
		jnz	short loc_2DEE	; Jump if Not Zero (ZF=0)


loc_2E0A:				; CODE XREF: sub_2D86+61j
		pop	di
		add	di, 0Ch		; Add
		pop	si
		inc	si		; Increment by 1
		pop	bx
		dec	bl		; Decrement by 1
		jnz	short loc_2D96	; Jump if Not Zero (ZF=0)

		retn			; Return Near from Procedure

endp		sub_2D86

ends		seg000


		end start
