PORTB = $6000					
PORTA = $6001
DDRB = $6002					
DDRA = $6003

VDP_REG = $4001        ;interface with registers of tms9918a
VDP_RAM = $4000		   ;interface with vram

Vdp_reg0 = %10000000
Vdp_reg1 = %10000001
Vdp_reg2 = %10000010
Vdp_reg3 = %10000011
Vdp_reg4 = %10000100
Vdp_reg5 = %10000101
Vdp_reg6 = %10000110	
Vdp_reg7 = %10000111


	.org $8000
  
reset:
    ldx #%11111111
	txs	                    ; start at top of stack
	lda #%11111111			;output for 6522
	sta DDRB
	sta DDRA

    lda #%00000000
    sta PORTA

    lda VDP_REG    ;clear any floating bits and start new


    lda #%00000000
    sta VDP_REG

    lda Vdp_reg0
    sta VDP_REG


    lda #%10010000
    sta VDP_REG

    lda Vdp_reg1
    sta VDP_REG


    lda #%00000000
    sta VDP_REG

    lda Vdp_reg2
    sta VDP_REG


    lda #%00000000
    sta VDP_REG

    lda Vdp_reg3
    sta VDP_REG


    lda #%00000001
    sta VDP_REG

    lda Vdp_reg4
    sta VDP_REG


    lda #%00000000
    sta VDP_REG

    lda Vdp_reg5
    sta VDP_REG



    lda #%00000000
    sta VDP_REG

    lda Vdp_reg6
    sta VDP_REG



    lda #%00000111
    sta VDP_REG

    lda Vdp_reg7
    sta VDP_REG


 
    lda #%00000001
    sta PORTA

    
    lda VDP_REG       ;reset address
    




  .org $fffc
  .word reset
  .word $0000