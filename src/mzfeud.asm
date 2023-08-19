; -------------------------------------------
; Feud.
; Music.
; Disassembled by Franck "hitchhikr" Charlet.
; -------------------------------------------

                    section  music,code

; ------------------------------------------------------
; added for conveniency
replay:             bra.w    music_init
                    bra.w    music_stop
                    bra.w    music_play

; ------------------------------------------------------
music_play:         movem.l  d0-d3/a0-a3,-(sp)
                    clr.w    d0
                    lea      (replay,pc),a3
                    tst.b    (playing_flag-replay,a3)
                    beq.b    lbC000044
                    subq.b   #1,(speed_counter-replay,a3)
                    bne.b    lbC00002E
                    move.b   (default_speed,pc),(speed_counter-replay,a3)
                    lea      (channels,pc),a0
                    moveq    #3,d3
lbC000022:          bsr.w    lbC000108
                    adda.w   #28,a0
                    dbra     d3,lbC000022
lbC00002E:          lea      (channels,pc),a0
                    lea      (lbB00051C-1,pc),a1
                    moveq    #3,d3
lbC000038:          bsr.w    lbC0001B0
                    adda.w   #28,a0
                    dbra     d3,lbC000038
lbC000044:          moveq    #3,d3
                    lea      (channels,pc),a0
                    lea      ($DFF0A0),a1
set_channel_hw:     move.w   ($18,a0),(6,a1)
                    move.b   (13,a0),(9,a1)
                    clr.w    d0
                    move.b   ($15,a0),d0
                    asl.w    #7,d0
                    lea      (waveforms,pc),a2
                    adda.w   d0,a2
                    move.l   a2,(a1)
                    adda.w   #28,a0
                    adda.w   #$10,a1
                    dbra     d3,set_channel_hw
                    movem.l  (sp)+,d0-d3/a0-a3
                    rts

lbC00007E:          lea      (lbC000044,pc),a0
                    move.l   a0,(sp)

; ------------------------------------------------------
music_stop:         lea      (playing_flag,pc),a0
                    sf       (a0)
                    move.w   #15,($DFF096)
                    rts

lbC000094:          movea.l  a3,a2
                    move.b   (1,a0),d0
                    adda.w   (4,a0),a2
                    tst.w    (a2,d0.w)
                    bne.b    lbC0000A6
                    sf       d0
lbC0000A6:          movea.l  a3,a1
                    adda.w   (a2,d0.w),a1
                    addq.b   #2,d0
                    move.b   d0,(1,a0)
                    bra.b    lbC000118

lbC0000B4:          move.b   (a1)+,($14,a0)
                    bra.b    lbC000118

lbC0000BA:          move.b   (a1)+,(6,a0)
lbC0000BE:          clr.w    (8,a0)
                    bset     #2,(a0)
                    move.b   (a1)+,(7,a0)
                    bra.b    lbC000118

lbC0000CC:          move.b   (a1)+,($12,a0)
                    move.b   (a1)+,d0
                    move.b   #$40,(a0)
                    add.b    d0,d0
                    bcc.b    lbC0000DE
                    move.b   #$50,(a0)
lbC0000DE:          move.b   d0,($11,a0)
                    lsr.b    #1,d0
                    move.b   d0,($13,a0)
                    bra.b    lbC000118

lbC0000EA:          bset     #7,(a0)
lbC0000EE:          bset     #3,(a0)
                    bra.b    lbC000118

lbC0000F4:          sf       (a0)
                    bra.b    lbC000118

lbC0000F8:          move.b   (a1)+,d1
                    ext.w    d1
                    andi.w   #$800F,d1
                    move.w   d1,($DFF09E)
                    bra.b    lbC000118

lbC000108:          subq.b   #1,(10,a0)
                    bne.b    lbC00015E
                    andi.b   #$70,(a0)
                    movea.l  a3,a1
                    adda.w   (2,a0),a1
lbC000118:          move.b   (a1)+,d0
                    cmp.b    #$90,d0
                    bcs.b    lbC00014E
                    addi.b   #$20,d0
                    bcs.b    lbC00013A
                    addi.b   #$28,d0
                    bcs.b    lbC000142
                    addi.b   #$18,d0
                    bcs.b    lbC000148
                    move.b   (lbC0000BE,pc,d0.w),($16,a0)
                    bra.b    lbC000118

lbC00013A:          addq.b   #1,d0
                    move.b   d0,(11,a0)
                    bra.b    lbC000118

lbC000142:          move.b   d0,($10,a0)
                    bra.b    lbC000118

lbC000148:          move.b   d0,($15,a0)
                    bra.b    lbC000118

lbC00014E:          cmp.b    #$80,d0
                    bcs.b    lbC00017E
                    add.b    d0,d0
                    movea.l  a3,a2
                    adda.w   (lbW00019A,pc,d0.w),a2
                    jmp      (a2)

lbC00015E:          btst     #3,(a0)
                    beq.b    lbC000174
                    btst     #7,(a0)
                    bne.b    lbC000170
                    addq.b   #1,(12,a0)
                    rts

lbC000170:          subq.b   #1,(12,a0)
lbC000174:          rts

lbC000176:          move.b   #$C0,(15,a0)
                    bra.b    lbC00018C

lbC00017E:          move.b   d0,(12,a0)
                    clr.w    (14,a0)
                    move.b   ($16,a0),($17,a0)
lbC00018C:          move.b   (11,a0),(10,a0)
                    suba.l   a3,a1
                    move.w   a1,(2,a0)
                    rts

lbW00019A:          dc.w     lbC000176-replay,lbC0000F4-replay
                    dc.w     lbC0000BA-replay,lbC0000EA-replay
                    dc.w     lbC0000EE-replay,lbC000094-replay
                    dc.w     lbC0000CC-replay,lbC00007E-replay
                    dc.w     lbC0000B4-replay,lbC0000F8-replay
                    dc.w     replay-replay

lbC0001B0:          cmpi.b   #$C0,(15,a0)
                    bcc.b    lbC0001D6
                    subi.b   #$40,(15,a0)
                    bcc.b    lbC0001D6
                    move.b   ($10,a0),d0
                    move.b   (lbB00023E,pc,d0.w),d0
                    add.b    (14,a0),d0
                    addq.b   #1,(14,a0)
                    move.b   (2,a1,d0.w),(15,a0)
lbC0001D6:          move.b   (15,a0),d0
                    andi.b   #$3F,d0
                    move.b   d0,(13,a0)
                    clr.w    d1
                    move.b   ($17,a0),d1
                    addq.b   #1,d1
                    move.b   (a1,d1.w),d0
                    bpl.b    lbC0001F8
                    move.b   ($16,a0),d1
                    andi.b   #$7F,d0
lbC0001F8:          move.b   d1,($17,a0)
                    add.b    (12,a0),d0
                    add.b    ($14,a0),d0
                    add.b    d0,d0
                    move.w   (notes_table,pc,d0.w),d1
                    btst     #6,(a0)
                    beq.w    lbC0002DC
                    move.b   ($11,a0),d2
                    move.b   ($13,a0),d0
                    btst     #4,(a0)
                    beq.b    lbC000228
                    btst     #0,(a0)
                    beq.w    lbC0002D0
lbC000228:          btst     #5,(a0)
                    bne.w    lbC0002BE
                    sub.b    ($12,a0),d0
                    bcc.w    lbC0002CC
                    sf       d0
                    bra.w    lbC0002C8

lbB00023E:          dc.b     lbB00051C-lbB00051C,lbB000538-lbB00051C
                    dc.b     lbB000559-lbB00051C,lbB00055F-lbB00051C
                    dc.b     lbB000565-lbB00051C,lbB000572-lbB00051C

notes_table:        dc.w     $5D67,$EF8,$E10,$D60,$C80,$BD8,$B28,$A88,$9F0
                    dc.w     $960,$8E0,$858,$7E0,$77C,$708,$6B0,$640,$5EC,$594
                    dc.w     $544,$4F8,$4B0,$470,$42C,$3F0,$3BE,$384,$358,$320
                    dc.w     $2F6,$2CA,$2A2,$27C,$258,$238,$216,$1F8,$1DF,$1C2
                    dc.w     $1AC,$190,$17B,$165,$151,$13E,$12C,$11C,$10B,$FC
                    dc.w     $EF,$E1,$D6,$C8,$BD,$B2,$A8,$9F,$96,$8E,$85,$7E

lbC0002BE:          add.b    ($12,a0),d0
                    cmp.b    d2,d0
                    bcs.b    lbC0002CC
                    move.b   d2,d0
lbC0002C8:          bchg     #5,(a0)
lbC0002CC:          move.b   d0,($13,a0)
lbC0002D0:          lsr.b    #1,d2
                    sub.b    d2,d0
                    bcc.b    lbC0002DA
                    subi.w   #$100,d1
lbC0002DA:          add.w    d0,d1
lbC0002DC:          bchg     #0,(a0)
                    btst     #2,(a0)
                    beq.b    lbC000302
                    tst.b    (7,a0)
                    bne.b    lbC0002FE
                    clr.w    d2
                    move.b   (6,a0),d2
                    ext.w    d2
                    add.w    d2,(8,a0)
                    add.w    (8,a0),d1
                    bra.b    lbC000302

lbC0002FE:          subq.b   #1,(7,a0)
lbC000302:          move.w   d1,($18,a0)
                    rts

; ------------------------------------------------------
music_init:         movem.l  d0-d2/a0-a2,-(sp)
                    move.w   #$FF,($DFF09E)
                    move.w   #15,($DFF096)
                    move.w   #$380,($DFF09A)
                    move.w   #768-1,d1
dma_init_delay:     dbra     d1,dma_init_delay
                    clr.w    d0
                    lea      (replay,pc),a1
                    sf       (playing_flag-replay,a1)
                    move.b   #1,(speed_counter-replay,a1)
                    moveq    #3,d1
                    move.b   (speeds_table,pc,d0.w),(default_speed-replay,a1)
                    lea      (channels,pc),a0
                    lea      ($DFF0A0),a2
init_channels:      move.w   (channels_dat_table,pc,d0.w),d2
                    addq.b   #2,d0
                    move.b   #1,(10,a0)
                    move.w   #2,(a0)
                    sf       ($14,a0)
                    move.w   d2,(4,a0)
                    move.w   (a1,d2.w),(2,a0)
                    move.w   #$40,(4,a2)
                    clr.w    (8,a2)
                    adda.w   #$10,a2
                    adda.w   #28,a0
                    dbra     d1,init_channels
                    move.w   #$820F,($DFF096)
                    st       (playing_flag-replay,a1)
                    movem.l  (sp)+,d0-d2/a0-a2
                    rts

                    dc.b     0
speeds_table:       dc.b     SPEED      ; 50hz = 6 / 60hz = 7
channels_dat_table: dc.w     channel1_table-replay,channel2_table-replay
                    dc.w     channel3_table-replay,channel4_table-replay
channels:           dcb.b    28*4,0
playing_flag:       dc.b     0
default_speed:      dc.b     0
speed_counter:      dc.b     0
                    even
channel1_table:     dc.w     lbB000734-replay,lbB000734-replay
                    dc.w     lbB000734-replay,lbB000734-replay
                    dc.w     lbB000734-replay,lbB000734-replay
                    dc.w     lbB0007F3-replay,lbB000734-replay
                    dc.w     lbB000734-replay,lbB0007F3-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB0007F3-replay,lbB000774-replay
                    dc.w     lbB000774-replay,lbB00075D-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB00075D-replay,lbB0007F3-replay
                    dc.w     lbB000774-replay,lbB000774-replay
                    dc.w     0
channel2_table:     dc.w     lbB0007E0-replay,lbB0007F2-replay
                    dc.w     lbB000734-replay,lbB000734-replay
                    dc.w     lbB0007F2-replay,lbB000734-replay
                    dc.w     lbB000734-replay,lbB0007F2-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB000839-replay,lbB0007F2-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB00075D-replay,lbB00075D-replay
                    dc.w     lbB000839-replay
                    dc.w     0
channel3_table:     dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000789-replay,lbB000789-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000789-replay,lbB00079E-replay
                    dc.w     0
channel4_table:     dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB0007B2-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB00070A-replay
                    dc.w     lbB00070A-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB000719-replay
                    dc.w     lbB000719-replay,lbB0007B2-replay
                    dc.w     0

lbB00051C:          dc.b     $80,$BF,$3D,$3A,$38,$35,$33,$30,$2E,$2B,$29,$27
                    dc.b     $25,$23,$21,$1F,$1D,$1B,$19,$16,$14,$11,15,12,10,8,6,4
lbB000538:          dc.b     $C0,$40,$3C,$38,$34,$30,$2C,$28,$24,$20,$1C,$18
                    dc.b     $14,$10,12,$20,$1E,$1C,$1A,$18,$16,$14,$12,$10,12
                    dc.b     $14,$12,$10,12,8,4,12,8
lbB000559:          dc.b     $C4,$40,$3F,$3B,$37,$33
lbB00055F:          dc.b     $31,$2F,$2B,$27,$23,$1F
lbB000565:          dc.b     $1B,$19,$17,$13,$11,15,13,11,9,7,5,3,1
lbB000572:          dc.b     $C0,$A8,$24,$20,$1C,$18,$14,$D0,$21,$1C,$17,$12
                    dc.b     14,10,6,3,1,$C0,$49,$48,$47,$46,$45,$C4

waveforms:          ; triangle
                    dc.b     0,4,8,12,$10,$14,$18,$1C,$20,$24,$28,$2C,$30,$34
                    dc.b     $38,$3C,$40,$44,$48,$4C,$50,$54,$58,$5C,$60,$64
                    dc.b     $68,$6C,$70,$75,$7C,$7F,$7C,$78,$6C,$60,$54,$48
                    dc.b     $3C,$30,$24,$18,12,0,$F6,$EC,$E2,$D8,$CE,$C4,$BA
                    dc.b     $B0,$A6,$9C,$92,$88,$81,$88,$90,$98,$A0,$A8,$B0
                    dc.b     $B8,$C0,$C8,$D0,$D8,$E0,$E8,$F0,$F8,0,6,12,$12
                    dc.b     $18,$1E,$24,$2A,$30,$36,$3C,$42,$48,$4E,$54,$5A
                    dc.b     $60,$66,$6C,$72,$76,$7A,$7D,$7F,$7D,$7B,$78,$74
                    dc.b     $70,$6C,$68,$64,$60,$5C,$58,$54,$50,$4C,$48,$44
                    dc.b     $40,$3C,$38,$34,$30,$2C,$28,$24,$20,$1C,$18,$14
                    dc.b     $10,12,8,4
                    
                    ; sin
                    dc.b     0,$1B,$32,$45,$55,$63,$6A,$78,$7F,$78
                    dc.b     $69,$62,$54,$44,$31,$1A,$FF,$E5,$CE,$BB,$AB,$9D
                    dc.b     $96,$88,$81,$88,$97,$9E,$AC,$BC,$CF,$E6,0,$1B,$32
                    dc.b     $45,$55,$63,$6A,$78,$7F,$78,$69,$62,$54,$44,$31
                    dc.b     $1A,$FF,$E5,$CE,$BB,$AB,$9D,$96,$88,$81,$88,$97
                    dc.b     $9E,$AC,$BC,$CF,$E6,0,$1B,$32,$45,$55,$63,$6A,$78
                    dc.b     $7F,$78,$69,$62,$54,$44,$31,$1A,$FF,$E5,$CE,$BB
                    dc.b     $AB,$9D,$96,$88,$81,$88,$97,$9E,$AC,$BC,$CF,$E6,0
                    dc.b     $1B,$32,$45,$55,$63,$6A,$78,$7F,$78,$69,$62,$54
                    dc.b     $44,$31,$1A,$FF,$E5,$CE,$BB,$AB,$9D,$96,$88,$81
                    dc.b     $88,$97,$9E,$AC,$BC,$CF,$E6
                    
                    ; saw
                    dc.b     0,$1B,$32,$45,$55,$63
                    dc.b     $6A,$78,$7F,$78,$70,$68,$60,$58,$50,$48,$40,$38
                    dc.b     $30,$28,$20,$18,$10,8,$FF,$CE,$AB,$96,$81,$97,$AC
                    dc.b     $CF,$FA,$1B,$32,$45,$55,$63,$6A,$78,$7F,$78,$70
                    dc.b     $68,$60,$58,$50,$48,$40,$38,$30,$28,$20,$18,$10,8
                    dc.b     $FF,$CE,$AB,$96,$81,$97,$AC,$CF,$FA,$1B,$32,$45
                    dc.b     $55,$63,$6A,$78,$7F,$78,$70,$68,$60,$58,$50,$48
                    dc.b     $40,$38,$30,$28,$20,$18,$10,8,$FF,$CE,$AB,$96,$81
                    dc.b     $97,$AC,$CF,$FA,$1B,$32,$45,$55,$63,$6A,$78,$7F
                    dc.b     $78,$70,$68,$60,$58,$50,$48,$40,$38,$30,$28,$20
                    dc.b     $18,$10,8,$FF,$CE,$AB,$96,$81,$97,$AC,$CF

lbB00070A:          dc.b     $A1,$BC,$90,$86,1,1,$E1,$28,$24,$28,$E3,$24,$E5
                    dc.b     $28,$85

lbB000719:          dc.b     $A1,$BC,$90,$86,1,1,$E1,$24,$26,$24,$E3,$26,$E1
                    dc.b     $BE,$A1,$86,2,3,$3C,$86,1,1,$A1,$BC,$24,$24,$85

lbB000734:          dc.b     $B8,$A0,$86,2,3,$E1,$90,$24,$24,$BE,$A1,$3C,$B8
                    dc.b     $A0,$24,$2B,$E3,$24,$E1,$BE,$A1,$3C,$B8,$A0,$E1
                    dc.b     $24,$24,$BE,$A1,$3C,$B8,$A0,$24,$E3,$2B,$E1,$24
                    dc.b     $BE,$A1,$3C,$85

lbB00075D:          dc.b     $86,2,3,$B8,$A0,$E1,$90,$29,$29,$BE,$A1,$3C,$B8
                    dc.b     $A0,$29,$E3,$30,$E1,$29,$BE,$A1,$3C,$85

lbB000774:          dc.b     $86,2,3,$E1,$B8,$A0,$24,$80,$24,$E3,$24,$E1,$80
                    dc.b     $21,$80,$24,$80,$24,$E9,$24,$85

lbB000789:          dc.b     $86,2,3,$E1,$B8,$A0,$24,$24,$80,$E3,$24,$E1,$21
                    dc.b     $80,$21,$24,$24,$80,$E9,$24,$85

lbB00079E:          dc.b     $E1,$24,$24,$80,$E3,$24,$E1,$21,$80,$21,$24,$24
                    dc.b     $80,$BD,$82,$FB,12,$E9,$24,$85

lbB0007B2:          dc.b     $86,1,1,$BF,$A1,$E3,$29,$E1,$28,$24,$28,$E3,$29
                    dc.b     $E1,$28,$E3,$29,$E1,$28,$24,$28,$E3,$29,$E1,$28
                    dc.b     $E3,$2D,$E1,$2B,$29,$2B,$E3,$2D,$E1,$2B,$E3,$2D
                    dc.b     $E1,$2B,$29,$2B,$E3,$29,$E1,$26,$85

lbB0007E0:          dc.b     $81,$90,$A1,$B9,$FF,$80,$80,$EF,$1F,$E7,$80,$E3
                    dc.b     $1F,$1F,$EF,$1C,$80,$85

lbB0007F2:          dc.b     $A2
lbB0007F3:          dc.b     $86,2,1,$E1,$90,$BA,$2B,$BB,$2B,$BC,$2B,$BA,$2B
                    dc.b     $BB,$2B,$BC,$2B,$BA,$2B,$BC,$2B,$BA,$2E,$BB,$2E
                    dc.b     $BC,$2E,$BA,$2E,$BB,$2E,$BC,$2E,$BA,$2E,$BC,$2E
                    dc.b     $BA,$2D,$BB,$2D,$BC,$2D,$BA,$2D,$BB,$2D,$BC,$2D
                    dc.b     $BA,$2D,$BC,$2D,$BA,$2B,$BB,$2B,$BC,$2B,$BA,$2B
                    dc.b     $BB,$2B,$BC,$2B,$BB,$2B,$BC,$2B,$85

lbB000839:          dc.b     $BD,$FF,$86,2,6,$30,$30,$85
                    
                    end
