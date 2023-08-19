; -------------------------------------------
; Feud.
; Game.
; Disassembled by Franck "hitchhikr" Charlet.
; -------------------------------------------
;
; graphics = 32x32xX objects & tiles
;            (compressed to only use the necessary amount of bitplanes
;             according to COMP_SPACE table).
; allch    = characters animations 48x40x5
;            (+ 1 bitplane inverted mask after each anmation position
;             used a cookie cutter).
; allhb    = 16x16x5 herbs data.
; MATRIX   = map data (100*60 .w offsets)
; mzfeud   = music for 50hz machines.
; mzfeud60 = music for 60hz machines.
; feud     = game program.
;
; IFF files :
; base.brush, compass.brush, grave.brush, leanoric.brush,
; learic.brush, page0.b, page1.b, page2.b, page3.b,
; page4.b, page5.b, page6.b, page7.b, scroll.brush, ts

                    section  prog,code_c

start:              bra.w    THISISIT

SET_OFFSETS:        lea      (OFFTAB),a0
                    lea      (COPPDAT),a1
S_O_LOOP:           move.l   (V),d0
                    cmpi.l   #-1,(a0)
                    beq.w    OFFSETS_SET
                    add.l    (a0)+,d0
                    move.l   d0,(a1)+
                    bra.w    S_O_LOOP

OFFSETS_SET:        rts

COPPDAT:            dc.l     0
SPRITE1:            dc.l     0
SPRITE2:            dc.l     0
SPRITE3:            dc.l     0
SPRITE4:            dc.l     0
SPRITE5:            dc.l     0
SPRITE6:            dc.l     0
SPRITE7:            dc.l     0
SPRITE8:            dc.l     0
MASK_BUFFER:        dc.l     0
SP_MASK_BUF:        dc.l     0
SP_BUFFER:          dc.l     0
BAD_JUNS:           dc.l     0
SCREEN:             dc.l     0
BITPLANE1:          dc.l     0
BITPLANE2:          dc.l     0
BITPLANE3:          dc.l     0
BITPLANE4:          dc.l     0
BITPLANE5:          dc.l     0
SCREENA:            dc.l     0
BITPLANE1A:         dc.l     0
BITPLANE2A:         dc.l     0
BITPLANE3A:         dc.l     0
BITPLANE4A:         dc.l     0
BITPLANE5A:         dc.l     0
SCREENB:            dc.l     0
BITPLANE1B:         dc.l     0
BITPLANE2B:         dc.l     0
BITPLANE3B:         dc.l     0
BITPLANE4B:         dc.l     0
BITPLANE5B:         dc.l     0
BITPLANE6:          dc.l     0
LEGAL_MAT:          dc.l     0
STACKPNT:           dc.l     0
DISC_BUFFER:        dc.l     0
MATRIX:             dc.l     0
PLAYFIELD:          dc.l     0
GRAPHIC:            dc.l     0
BACKGROUND:         dc.l     0
HERBS:              dc.l     0
PAGES:              dc.l     0
MEM16K1:            dc.l     0
MEM16K2:            dc.l     0
OFFTAB:             dc.l     0,$200,$300,$400,$500,$600,$700,$800,$900,$A00
                    dc.l     $AF0,$BE0,$CD0,$1000,$1000,$3000,$5000,$7000
                    dc.l     $9000,$1000,$1000,$3000,$5000,$7000,$9000,$B000
                    dc.l     $B000,$D000,$F000,$11000,$13000,$15000,$17000
                    dc.l     -1
MOVE2_TAB:          dc.w     -2,0,0,2,2,0,0,-2
MOVE4_TAB:          dc.w     -4,0,0,4,4,0,0,-4
crap:               dc.l     0
SEED:               dc.l     0
INTUITIONBASE:      dc.l     0
DISCBASE:           dc.l     0
FILE:               dc.l     0
NORMIRQ:            dc.l     0
NORMKEY:            dc.l     0
NORMINTENA:         dcb.w    2,0
LOCK:               dc.l     0
CHARACTERS:         dc.l     0
SCROLL:             dc.l     0
LEARIC:             dc.l     0
LEANORIC:           dc.l     0
COMPASS:            dc.l     0
BASE:               dc.l     0
GRAVE:              dc.l     0
OUTHANDLE:          dc.l     0
COLSETADDR:         dc.l     0
COLCOPADDR:         dc.l     0
BIG_BAD:            dc.l     0
BIG_STACK:          dc.l     0
V:                  dc.l     0
VBLFLAG:            dc.w     0
COPIRQ:             dc.w     0
keycode:            dcb.b    2,$FF
MOVE_STEP:          dc.w     0
FIRST_SRCH:         dc.w     0
LASTX:              dc.w     0
LASTY:              dc.w     0
XABS:               dc.w     0
YABS:               dc.w     0
XFLOW:              dc.w     0
YFLOW:              dc.w     0
LASTDXY:            dc.l     0
DIR:                dc.w     0
FAILURES:           dc.w     0
START:              dc.w     0
TARGET:             dc.w     0
PRINTX:             dc.w     0
PRINTY:             dc.w     0
GWIDTH:             dc.w     0
GDEPTH:             dc.w     0
PLAYFIELDX:         dc.w     0
PLAYFIELDY:         dc.w     0
LEFTBUTTON:         dc.w     0
RIGHTBUTTON:        dc.w     0
MAPXY:              dc.w     0
                    dc.w     0
BACK_FLAG:          dc.w     0
NUMFLAG:            dc.w     0
CURNUM:             dc.w     0
MYXPOS:             dc.w     0
MYYPOS:             dc.w     0
HISXPOS:            dc.w     0
HISYPOS:            dc.w     0
DOPPX:              dc.w     0
DOPPY:              dc.w     0
DOPPFLAG:           dc.w     0
ZOMBX:              dc.w     0
ZOMBY:              dc.w     0
ZOMBFLAG:           dc.w     0
COMDEL:             dc.w     0
HEIKEDEL:           dc.w     0
BITPLANE_FLAG:      dc.w     0
FUDLR:              dc.w     0
MAZEA4:             dc.l     0
MAZED5:             dc.l     0
MAZEBC:             dc.w     0
BAD_NUM:            dc.w     0
HISDIR:             dc.w     0
MYDIR:              dc.w     0
MAZE_BC:            dc.w     0
MYOLDXPOS:          dc.w     0
MYOLDYPOS:          dc.w     0
HISOLDXPOS:         dc.w     0
HISOLDYPOS:         dc.w     0
FIREFLAG:           dc.w     0
FIREXPOS:           dc.w     0
FIREYPOS:           dc.w     0
FIREXSPEED:         dc.w     0
FIREYSPEED:         dc.w     0
FIRE_TARGET:        dc.w     0
HLIGDIR:            dc.w     0
LIGHTFLAG:          dc.w     0
LIGXPOS:            dc.w     0
LIGYPOS:            dc.w     0
LIGXSPEED:          dc.w     0
LIGYSPEED:          dc.w     0
LIG_TARGET:         dc.w     0
NEWSCFLAG:          dcb.b    2,0
TEMPSPRITES:        dcb.l    8,0
HERB_SR_NO:         dc.w     0
TAR_OFFS:           dc.w     0
SRCH_AGAIN:         dc.w     0
LEAR_HEALTH:        dc.w     0
LEAN_HEALTH:        dc.w     0
GAME_OVER:          dc.w     0
SPRITE_TO_GO:       dc.w     0
SPRITE_GOING:       dc.w     0
SPRITE_TARGET:      dc.w     0
MEINVIS:            dc.w     0
HIMINVIS:           dc.w     0
SWIFTHIM:           dc.w     0
SWIFTME:            dc.w     0
FREEZEHIM:          dc.w     0
FREEZEME:           dc.w     0
PROTECTHIM:         dc.w     0
PROTECTME:          dc.w     0
REPELTIME:          dc.w     0
MIX_FLAG:           dc.w     0
HEALTH_CH:          dc.w     0
HIS_SPELL_DEL:      dc.w     0
SPRDEL:             dc.w     0
ANIDEL:             dc.w     0
ANINUM:             dc.w     0
SPRSHIF:            dc.w     0
FX_TIME:            dc.w     0
TARGETS:            dcb.b    64,0
                    dcb.b    56,0
YTAB:               dcb.l    3,0
UD_STOP:            dc.b     0
HSP_TOGGLE:         dc.b     0
SPRITE_SP_DAT:      dcb.l    $20,0
CHAR_POINTER:       dc.l     0
HERB_LIST:          dcb.l    6,0
HIS_HERB_LIST:      dcb.l    6,0
TEMP_H_L:           dcb.l    6,0
                    dc.w     0
SPELL_LIST:         dcb.l    3,0
HIS_SPELL_LIST:     dcb.b    12,0
TEMP_S_L:           dcb.l    3,0
SP_FX_TAB:          dcb.l    $30,0
PAGE:               dc.w     0
EXTRADTA:           dcb.w    52,0
MY_MOVEMAT:         dcb.l    $24,0
MY_TEMPMAT:         dcb.l    $24,0
SPRITES:            dc.w     0
                    dc.w     0
                    dc.w     0
                    dcb.w    46,0
CHRCOLTAB:          dc.w     15,$FFFF,0,0,0,13,14,15,0,$FF,0,0,$1377,$3FF3
                    dc.w     $1110,0,$333,0,0,0,0,$FF,0,$3333,$777,$3FF3,0,0
                    dc.w     $8484,$3F,$FFFF,$F100,0,0,$11,$FFFF,0,$FF,$7FFF
                    dc.w     $7FFF,0,0,0,$7777,0,$8CEF,$8E,$6F6,0,$1111,0,12
                    dc.w     15,$FFF,$1111,0,$EFFF,0,$F000,$FF,0,0,$137F,15,0
                    dc.w     $777,0,$FFFF,0,$6EFF,15,0,11,0,0,0,15,3,$FFFF,15
                    dc.w     0,$3333,0,$66,0,0,$6E,0,0,0,4,$17F,$3F,0,0,0
                    dc.w     $CFFC,0,$8880,0,$3030,$3300,$FF31,$67FE,0,$8F,0
                    dc.w     $6F8,$33,$7FFF,$FFF,0,0,0,0,$8CC8,$FF,0,$F800
                    dc.w     $F800,$6FF,0,0,$7700,15,$EFF0,$FFFF,$33FF,$7FFF
                    dc.w     $1111,0,$FFF,0,$84C4,$FF,0,$FFC8,0,$2E,0,0,3,0,0
                    dc.w     $FFFF,$7777,0,$FF,0,$F000,0,0,$FFF0,6,$FFFF,$CCC
                    dc.w     15,0,0,15,0,$FFFF,0,$FFFF,$FFFF,$C0

DEPTH_TAB:          dc.b     $FF,0,$60,$10,$48,$20,0,0,$60,0,$48,$48,0,0,0,$20
                    dc.b     0,$60,$60,$48,0,0,$48,0,0,0,$48,$20,$FF,0,0,$FF
                    dc.b     $48,$48,0,0,$20,0,0,0,$20,$60,$60,0,0,0,0,0,$48,0
                    dc.b     $20,$20,$20,0,0,$48,0,$48,$FF,0,$48,0,0,0,$20,0
                    dc.b     $60,0,$20,0,0,0,$FF,$48,$60,$10,$20,$20,0,0,$48,0
                    dc.b     0,0,$20,0,0,$60,$48,$48,0,0,0,$20,$60,$20,0,$20,0
                    dc.b     $48,$FF,0,0,0,$20,0,$60,0,0,0,0,$20,$60,$48,$48
                    dc.b     $FF,0,$60,0,$FF,0,$20,$60,0,0,0,0,0,0,0,$48,0,$20
                    dc.b     $FF,0,$20,0,$60,0,0,$48,0,$48,$60,0,0,$60,0,$48
                    dc.b     $FF,$20,$20,0,0,0,0,$20,$60,$20,0,$20,0,0,0
                    dc.b     0

; don't remove
HERBDEP:            dcb.b    $5B,0

HERB_DATA:          dc.b     $5C,$2D,$00
                    dc.B     $11,$16,$01
                    dc.b     $4E,$10,$02
                    dc.b     $21,$1F,$03
                    dc.b     $04,$31,$04
                    dc.b     $4A,$01,$05
                    dc.b     $59,$11,$06
                    dc.b     $03,$13,$07
                    dc.b     $28,$31,$08
                    dc.b     $22,$03,$09
                    dc.b     $05,$28,$0A
                    dc.b     $55,$25,$0B
                    dc.b     $05,$2E,$0C
                    dc.b     $40,$0A,$0D
                    dc.b     $0C,$2D,$0E
                    dc.b     $4D,$2B,$0F
                    dc.b     $0A,$35,$10
                    dc.b     $27,$0E,$11
                    dc.b     $2A,$35,$12
                    dc.b     $0D,$31,$13
                    dc.b     $12,$17,$14
                    dc.b     $09,$31,$15
                    dc.B     $51,$0A,$16
                    dc.b     $28,$1A,$17

HERB_CONV_TAB:      dc.b     $A,$12,$17,$2,$5,$8,$9,$6,$4,$C,$13,$1,$3,$16,$15,$E,$D
                    dc.b     $10,$0,$7,$B,$11,$14,$F

GR_ADDRESSES:       dc.w     0,$80,$120,$1A0,$220,$2C0,$360,$400,$480,$4C0
                    dc.w     $540,$5A0,$640,$6C0,$760,$800,$860,$8E0,$980,$9E0
                    dc.w     $A40,$AA0,$B20,$BA0,$C20,$C80,$D20,$DC0,$E60,$EE0
                    dc.w     $F60,$FE0,$1060,$10E0,$1140,$11E0,$1260,$1300
                    dc.w     $1380,$13E0,$1440,$14E0,$1560,$15C0,$1620,$16A0
                    dc.w     $1720,$17A0,$1840,$18C0,$1960,$19E0,$1A80,$1B20
                    dc.w     $1B80,$1C20,$1CA0,$1D00,$1D60,$1DE0,$1E80,$1F20
                    dc.w     $1FC0,$2040,$20C0,$2140,$21C0,$2240,$22E0,$2360
                    dc.w     $2400,$24A0,$2500,$2580,$2600,$2660,$26E0,$2760
                    dc.w     $2800,$2880,$2900,$2980,$2A00,$2A60,$2B00,$2B80
                    dc.w     $2C00,$2CA0,$2D40,$2DE0,$2E40,$2EE0,$2F80,$3020
                    dc.w     $30A0,$3100,$3160,$3200,$32A0,$3320,$33C0,$3440
                    dc.w     $34C0,$3540,$35E0,$3680,$3720,$37A0,$3840,$38C0
                    dc.w     $3920,$3980,$3A20,$3AA0,$3B20,$3B80,$3C00,$3CA0
                    dc.w     $3D40,$3DC0,$3E40,$3EC0,$3F60,$3FC0,$4020,$40C0
                    dc.w     $4140,$41E0,$4260,$42C0,$4360,$4400,$4460,$44C0
                    dc.w     $4540,$45E0,$4680,$4700,$4780,$4820,$48C0,$4920
                    dc.w     $4980,$4A20,$4AC0,$4B40,$4BA0,$4C20,$4CA0,$4D40
                    dc.w     $4DC0,$4E40,$4EC0,$4F40,$4FE0,$5080,$5100,$51A0
                    dc.w     $5200,$52A0,$5340,$53E0,$53E0,$53E0,$5460,$54E0
                    dc.w     $5560,$55E0,$5660,$56E0,$5700,$5780,$5800,$5880
                    dc.w     $5900,$5980,$5A00,$5AA0,$5B20,$5BA0,$5C20,$5CA0
                    dc.w     $5D20,$5D80,$5E00,$5E80,$5EA0,$5F20,$5FA0,$6040
                    dc.w     $60C0,$6140,$61C0,$6240,$62C0,$6360,$63E0,$6460
                    dc.w     $64E0,$6560,$65E0,$6660,$66E0,$6760,$67E0,$6860
                    dc.w     $68E0,$6960,$69E0,$6A60,$6B00,$6B80,$6C00,$6C80
                    dc.w     $6D20,$6DA0,$6E20,$6EA0,$6F20,$6FA0,$7020,$70A0
                    dc.w     $7120,$71A0,$7220,$72A0,$7320,$73A0,$7420,$74A0
                    dc.w     $7520,$75A0,$7620,$76A0,$7720,$77C0,$7840,$78C0
                    dc.w     $7940,$79C0,$7A40,$7AE0,$7B60,$7BE0,$7C60,$7CE0
                    dc.w     $7D60,$7DE0,$7E60,$7F00,$7F80,$8000,$8080,$8100
                    dc.w     $8180,$8200,$8280,$8300,$8380,$83A0,$8420,$84A0
                    dc.w     $8520,$85A0,$8620,$86A0,$8720,$87A0,$8840,$88C0
                    dc.w     $8940,$89C0,$8A40,$8AC0,$8B40,$8BC0,$8C60,$8CE0
                    dc.w     $8D60,$8E00,$8E80,$8F00,$8F80,$9000,$9080,$9100
                    dc.w     $9160,$91E0

COMP_SPACE:         dc.b     15,31,15,15,31,31,31,15,3,15,7,31,15,31,31
                    dc.b     7,15,31,7,7,11,15,15,15,7,31,31,31,15,15,15
                    dc.b     15,15,7,31,15,31,15,7,7,31,23,7,7,15,15,15
                    dc.b     31,15,31,15,31,31,7,31,23,7,7,15,31,31
                    dc.b     31,15,15,23,15,23,31,15,31,31,19,15,15,7
                    dc.b     15,15,31,15,15,23,15,11,31,15,15,31,31,31,7
                    dc.b     31,31,31,15,7,7,31,31,15,31,15,15,15,31
                    dc.b     31,31,15,31,15,7,7,31,15,23,7,15,31,31,15
                    dc.b     15,15,31,7,7,31,15,31,15,7,31,31,7,7,15,31
                    dc.b     31,15,15,31,31,7,7,31,31,15,7,15,15,31,15
                    dc.b     15,15,15,31,31,15,31,7,31,31,31,0,0,15,15
                    dc.b     15,15,15,15,2,15,15,15,15,15,15,31,15,15,15,15
                    dc.b     15,7,15,15,2,15,15,31,15,15,15,15,15,31,15,15
                    dc.b     15,15,15,15,15,15,15,15,15,15,15,15,31,15,15,15
                    dc.b     31,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
                    dc.b     15,15,15,15,15,31,15,15,15,15,15,31,15,15,15,15
                    dc.b     15,15,15,31,15,15,15,15,15,15,15,15,15,2,15,15
                    dc.b     15,15,15,15,15,15,31,15,15,15,15,15,15,15,31,15
                    dc.b     15,31,15,15,15,15,15,15,7,15,31

SPELL_LAST_TIME:    dc.b     $FF,3,1,2,3,3,4,3,3,2,4,3

PAGE_SCRIPT:        dc.b     'Teleport',$A,$A
                    dc.b     'Dandelion',$A
                    dc.b     'Burdock',0
SP2:                dc.b     'Protect',$A,$A
                    dc.b     'Piperwort',$A
                    dc.b     'Ragwort',0
SP3:                dc.b     'Sprites',$A,$A
                    dc.b     'Snapdragon',$A
                    dc.b     'Toadflax',0
SP4:                dc.b     'Zombie',$A,$A
                    dc.b     'Devilsbit',$A
                    dc.b     'Bones',0
SP5:                dc.b     'Swift',$A,$A
                    dc.b     'Speedwell',$A
                    dc.b     'Mad Sage',0
SP6:                dc.b     'Freeze',$A,$A
                    dc.b     'Bind Weed',$A
                    dc.b     'Bog Weed',0
SP7:                dc.b     'Doppleganger',$A,$A
                    dc.b     'Fox Glove',$A
                    dc.b     'Catsear',0
SP8:                dc.b     'Invisible',$A,$A
                    dc.b     'Chondrilla',$A
                    dc.b     'Hemlock',0
SP9:                dc.b     'Repel',$A,$A
                    dc.b     'Thistle',$A
                    dc.b     'Hemlock',0
SP10:               dc.b     'Heal',$A,$A
                    dc.b     'Balm',$A
                    dc.b     'Feverfew',0
SP11:               dc.b     'Fireball',$A,$A
                    dc.b     'Dragonsteeth',$A
                    dc.b     'Mousetail',0
SP12:               dc.b     'Lightning',$A,$A
                    dc.b     'Cud Weed',$A
                    dc.b     'Knap Weed',0,0
                    dcb.b    2,0

SPELL_JUMPS:        dc.l     Teleport
                    dc.l     Protect
                    dc.l     Sprites
                    dc.l     Zombie
                    dc.l     Swift
                    dc.l     Freeze
                    dc.l     Doppleganger
                    dc.l     Invisible
                    dc.l     Reduce
                    dc.l     Heal
                    dc.l     Fireball
                    dc.l     Lightning
SPELL_ADDS:         dc.l     PAGE_SCRIPT
                    dc.l     SP2
                    dc.l     SP3
                    dc.l     SP4
                    dc.l     SP5
                    dc.l     SP6
                    dc.l     SP7
                    dc.l     SP8
                    dc.l     SP9
                    dc.l     SP10
                    dc.l     SP11
                    dc.l     SP12

COPPERL2:           dc.w     $E0,$8038,$E2,$38
                    dc.w     $E4,$803C,$E6,$3C
                    dc.w     $E8,$8040,$EA,$40
                    dc.w     $EC,$8044,$EE,$44
                    dc.w     $F0,$8048,$F2,$48
COP_SPRITE:         dc.w     $120,$8004,$122,4,$124,$8008,$126,8,$128,$800C
                    dc.w     $12A,$C,$12C,$8010,$12E,$10,$130,$8014,$132,$14
                    dc.w     $134,$8018,$136,$18,$138,$801C,$13A,$1C,$13C
                    dc.w     $8020,$13E,$20,$FFFF
                    dc.w     $180,$000,$182,$FFF,$184,$140,$186,$260,$188,$491,$18A,$7C2,$18C,$AF3,$18E,$610
                    dc.w     $190,$720,$192,$930,$194,$A40,$196,$B50,$198,$D70,$19A,$666,$19C,$999,$19E,$CCC
                    dc.w     $1A0,$05B,$1A2,$08D,$1A4,$0CF,$1A6,$510,$1A8,$840,$1AA,$C91,$1AC,$FF2,$1AE,$C75
                    dc.w     $1B0,$FA7,$1B2,$A0E,$1B4,$E0A,$1B6,$00A,$1B8,$A00,$1BA,$C55,$1BC,$D77,$1BE,$444
                    dc.w     $AC01,$FF00,0
                    dc.w     $E0,$8050,$E2,$50
                    dc.w     $E4,$8054,$E6,$54
                    dc.w     $E8,$8058,$EA,$58
                    dc.w     $EC,$805C,$EE,$5C
                    dc.w     $F0,$8060,$F2,$60
                    dc.w     $FFFF
                    dc.W     $9C,$8010
                    dc.W     $184,$DDD,$186,$BBB,$188,$999,$18A,$777,$18C,$666,$18E,$333
                    dc.w     $190,$FD0,$192,$B70,$194,$A50,$196,$940,$198,$830,$19A,$720,$19C,$FB7,$19E,$C75
                    dc.w     $1A0,$008,$1A2,$13A,$1A4,$26C,$1A6,$49E,$1A8,$800,$1AA,$A22,$1AC,$C44,$1AE,$F88
                    dc.w     $FFFE
                    dc.w     $1B0,$FFF,$1B2,$FFF,$1B4,$FFF,$1B6,$FFF,$1B8,$CCC,$1BA,$DDD,$1BC,$EEE,$1BE,$FFF
                    dc.w     $FFFF,$FFFE

COPPERDAT2ND:       dc.w     $E0,$8068,$E2,$68
                    dc.w     $E4,$806C,$E6,$6C
                    dc.w     $E8,$8070,$EA,$70
                    dc.w     $EC,$8074,$EE,$74
                    dc.w     $F0,$8078,$F2,$78
                    dc.w     $120,$8004,$122,4,$124,$8008,$126,8,$128,$800C,$12A,12
                    dc.w     $12C,$8010,$12E,$10,$130,$8014,$132,$14,$134,$8018
                    dc.w     $136,$18,$138,$801C,$13A,$1C,$13C,$8020,$13E,$20,$FFFF
                    dc.w     $180,$000,$182,$FFF,$184,$DDD,$186,$CCC,$188,$AAA,$18A,$999,$18C,$777,$18E,$666
                    dc.w     $190,$444,$192,$333,$194,$FD0,$196,$E80,$198,$D40,$19A,$8AE,$19C,$57C,$19E,$24A
                    dc.w     $1A0,$027,$1A2,$B61,$1A4,$A51,$1A6,$941,$1A8,$831,$1AA,$730,$1AC,$620,$1AE,$510
                    dc.w     $1B0,$410,$1B2,$B88,$1B4,$966,$1B6,$644,$1B8,$422,$1BA,$280,$1BC,$3A0,$1BE,$D93
                    dc.w     $FFFF,$FFFE

COPPERDAT1ST:       dc.w     $E0,$8050,$E2,$50
                    dc.w     $E4,$8054,$E6,$54
                    dc.w     $E8,$8058,$EA,$58
                    dc.w     $EC,$805C,$EE,$5C
                    dc.w     $F0,$8060,$F2,$60
                    dc.w     $120,$8004,$122,4,$124,$8008,$126,8,$128,$800C,$12A,12
                    dc.w     $12C,$8010,$12E,$10,$130,$8014,$132,$14,$134,$8018
                    dc.w     $136,$18,$138,$801C,$13A,$1C,$13C,$8020,$13E,$20,$FFFF
                    dc.w     $180,$000,$182,$FFF,$184,$DDD,$186,$CCC,$188,$AAA,$18A,$999,$18C,$777,$18E,$666
                    dc.w     $190,$444,$192,$333,$194,$FD0,$196,$E80,$198,$D40,$19A,$8AE,$19C,$57C,$19E,$24A
                    dc.w     $1A0,$027,$1A2,$B61,$1A4,$A51,$1A6,$941,$1A8,$831,$1AA,$730,$1AC,$620,$1AE,$510
                    dc.w     $1B0,$410,$1B2,$B88,$1B4,$966,$1B6,$644,$1B8,$422,$1BA,$280,$1BC,$3A0,$1BE,$D93
                    dc.w     $FFFF,$FFFE

DosName:            dc.b     'dos.library',0
IntuitionName:      dc.b     'intuition.library',0
                    even

NOMEM_1:            move.l   a6,-(sp)
                    movea.l  (INTUITIONBASE),a6
                    jsr      (-$D2,a6)
                    movea.l  (sp)+,a6
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-$3C,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,d1
                    move.w   #$13,d3
                    move.l   #mem_error,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-$30,a6)
                    movea.l  (sp)+,a6
                    rts

OUT_MEM:            move.l   a6,-(sp)
                    movea.l  (INTUITIONBASE),a6
                    jsr      (-210,a6)
                    movea.l  (sp)+,a6
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-60,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,d1
                    move.w   #$20,d3
                    move.l   #GR_mem_error,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-48,a6)
                    movea.l  (sp)+,a6
EMEX:               rts

mem_error:          dc.b     'NOT ENOUGH MEMORY!',$A
GR_mem_error:       dc.b     'NOT ENOUGH MEMORY FOR GRAPHICS!',$A
                    even
hertz:              dc.w     1
THISISIT:           moveq    #0,d0
                    lea      ($DFF004),a0
vplop:              move.w   (a0),d2
                    move.w   (2,a0),d1
                    andi.w   #$FF00,d1
                    btst     #0,d2
                    beq.w    noset
                    ori.w    #1,d1
noset:              ror.w    #8,d1
                    cmp.w    d1,d0
                    bgt.w    vpfnd
                    move.w   d1,d0
                    bra.w    vplop

vpfnd:              moveq    #$3C,d1
                    cmp.w    #$130,d0
                    bcs.w    is60
                    moveq    #$32,d1
is60:               move.w   d1,(hertz)
                    lea      (IntuitionName),a1
                    moveq    #0,d0
                    move.l   a6,-(sp)
                    movea.l  (4),a6
                    jsr      (-552,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(INTUITIONBASE)
                    lea      (DosName,pc),a1
                    moveq    #0,d0
                    move.l   a6,-(sp)
                    movea.l  (4),a6
                    jsr      (-552,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(DISCBASE)
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-60,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,d4
                    move.l   d0,(OUTHANDLE)
                    move.l   a6,-(sp)
                    movea.l  (INTUITIONBASE),a6
                    jsr      (-294,a6)
                    movea.l  (sp)+,a6
                    movea.l  (a0),a0
                    tst.l    (a0)
                    beq.w    NOPL1
                    movea.l  (a0),a1
                    movea.l  ($24,a1),a1
                    movea.l  (4,a1),a1
                    movea.l  (8,a1),a6
                    movea.l  (12,a1),a6
NOPL1:              movea.l  ($24,a0),a0
                    movea.l  (4,a0),a0
                    move.l   (8,a0),(MEM16K1)
                    move.l   (12,a0),(MEM16K2)
                    movea.l  (MEM16K1),a6
                    movea.l  (MEM16K2),a6
                    move.l   #2,d1
                    move.l   a6,-(sp)
                    movea.l  (4),a6
                    jsr      (-216,a6)
                    movea.l  (sp)+,a6
                    movea.l  d0,a6
                    move.l   (OUTHANDLE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    move.l   #ENDCLI,d1
                    moveq    #0,d2
                    moveq    #0,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-222,a6)
                    movea.l  (sp)+,a6
                    move.l   a6,-(sp)
                    movea.l  (INTUITIONBASE),a6
                    jsr      (-78,a6)
                    movea.l  (sp)+,a6
                    move.l   #102000,d0
                    moveq    #2,d1
                    move.l   a6,-(sp)
                    movea.l  (4),a6
                    jsr      (-198,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(V)
                    beq.w    NOMEM_1
                    bsr.w    SET_OFFSETS
                    move.l   (SCREENA),d0
                    subq.l   #2,d0
                    move.l   d0,(BIG_BAD)
                    move.l   (SCREENB),d0
                    move.l   d0,(DISC_BUFFER)
                    move.l   #235000,d0
                    moveq    #2,d1
                    move.l   a6,-(sp)
                    movea.l  (4).w,a6
                    jsr      (-198,a6)
                    movea.l  (sp)+,a6
                    tst.l    d0
                    beq.w    OUT_MEM
                    move.l   d0,(GRAPHIC)
                    addi.l   #150016,d0
                    move.l   d0,(crap)
                    addi.l   #$80,d0
                    move.l   d0,(BACKGROUND)
                    move.l   d0,(CHARACTERS)
                    movea.l  (SCREENA),a5
                    bsr.w    CLSALL
                    movea.l  (SCREENB),a5
                    bsr.w    CLSALL
                    clr.w    d7
TITLE_SCREEN:       move.w   d7,-(sp)
                    clr.w    (BITPLANE_FLAG)
                    bclr     #0,(BITPLANE_FLAG)
                    bsr.w    FLIP_BPL_PTR
                    tst.w    d7
                    bne.w    NOSTRT
                    bsr.w    SET_UP_SCREEN
NOSTRT:             clr.w    (VBLFLAG)
X_023:              tst.w    (VBLFLAG)
                    beq.w    X_023
                    bsr.w    SET_2ND_COPPER_L
                    bsr.w    IRQ_NORM
                    move.l   (DISC_BUFFER),-(sp)
                    movea.l  (SCREENA),a6
                    move.l   (GRAPHIC),(DISC_BUFFER)
                    bsr.w    OPEN_SCREEN
                    move.l   (sp)+,(DISC_BUFFER)
                    tst.w    (sp)
                    beq.w    JLDED1
                    move.w   #$96,d0
                    bsr.w    WAITD0FLY
JLDED1:             bsr.w    IRQ_INIT
                    tst.w    (sp)
                    beq.w    JLDED
WAIT_TITLE0:        move.w   (FUDLR),d0
                    btst     #4,d0
                    bne.w    WAIT_TITLE0
WAIT_TITLE1:        move.w   (FUDLR),d0
                    btst     #4,d0
                    beq.w    WAIT_TITLE1
JLDED:              clr.w    (VBLFLAG)
X_024:              tst.w    (VBLFLAG)
                    beq.w    X_024
                    bsr.w    SET_1ST_COPPER_L
                    bsr.w    IRQ_NORM
                    move.w   (sp)+,d7
                    tst.w    d7
                    bne.w    NOT_JUST_LOADED
                    movea.l  (CHARACTERS),a6
                    bsr.w    GET_CHARACTERS
                    move.l   a6,(PAGES)
                    bsr.w    OPEN_PAGES
                    movea.l  (MEM16K1),a6
                    move.l   a6,d0
                    beq.w    EMEX
                    move.l   a6,(HERBS)
                    bsr.w    GET_HERBS
                    move.l   a6,(SCROLL)
                    bsr.w    OPEN_SCROLL
                    move.l   a6,(LEARIC)
                    bsr.w    OPEN_LEARIC
                    move.l   a6,(LEANORIC)
                    bsr.w    OPEN_LEANORIC
                    move.l   a6,(BASE)
                    bsr.w    OPEN_BASE
                    move.l   a6,(GRAVE)
                    bsr.w    OPEN_GRAVE
                    move.l   a6,(STACKPNT)
                    move.l   a6,(DISC_BUFFER)
                    move.l   (STACKPNT),d0
                    addi.l   #8184,d0
                    move.l   d0,(BIG_STACK)
                    movea.l  (MEM16K2),a6
                    move.l   a6,(MATRIX)
                    move.l   a6,(PLAYFIELD)
                    adda.l   #12000,a6
                    move.l   a6,(COMPASS)
                    bsr.w    OPEN_COMPASS
                    bsr.w    OPEN_MATRIX
NOT_JUST_LOADED:    bsr.w    GET_GRBLOCK
                    bsr.w    GET_MUSIC
                    move.w   #$96,d0
                    bsr.w    WAITD0FLY

                    ; init the music replay
                    movea.l  (BITPLANE1B),a0
                    adda.w   #32,a0
                    ;adda.w   #$328,a0
                    jsr      (a0)

                    bsr.w    IRQ_INIT
                    clr.w    d6
TITLOOP:            clr.w    (VBLFLAG)
X_025:              tst.w    (VBLFLAG)
                    beq.w    X_025

                    ; play the music
                    movea.l  (BITPLANE1B),a0
                    adda.w   #32+8,a0
                    ;adda.w   #$20,a0
                    jsr      (a0)

                    move.w   (FUDLR),d0
                    btst     #4,d0
                    beq.w    TITLOOP
                    
                    ; shut the music down
                    movea.l  (BITPLANE1B),a0
                    adda.w   #32+4,a0
                    ;adda.w   #$A4,a0
                    jsr      (a0)

                    bsr.w    SET_UP_HERBS
                    lea      (VBLFLAG),a0
                    move.w   #1286-1,d0
CLV:                clr.b    (a0)+
                    dbra     d0,CLV
                    movea.l  (SCREENA),a5
                    bsr.w    CLSALL
                    movea.l  (SCREENB),a5
                    bsr.w    CLSALL
                    moveq    #0,d0
                    bsr.w    BLIT_PAGE
                    bsr.w    BLIT_SCROLL
                    bsr.w    BLIT_HEALTH
                    bsr.w    BLIT_BASE
                    bsr.w    BLIT_COMPASS
                    move.w   #2,(MYDIR)
                    move.w   #4,(HISDIR)
                    move.w   #$A0,(HISXPOS)
                    move.w   #$80,(HISYPOS)
                    move.w   #$BA0,(MYXPOS)
                    move.w   #$700,(MYYPOS)
                    lea      (EXTRADTA),a0
                    moveq    #3,d2
                    move.w   #$20,d0
                    move.w   #$80,d1
STXXY:              addi.w   #$220,d0
                    move.w   d0,(0,a0)
                    move.w   d1,(2,a0)
                    move.w   d0,(4,a0)
                    move.w   d1,(6,a0)
                    adda.w   #$1A,a0
                    dbra     d2,STXXY
                    move.w   #2,(MOVE_STEP)
                    move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
                    bsr.w    PLAYXY_FR_XY
                    move.w   d0,(PLAYFIELDX)
                    move.w   d0,(MAPXY)
                    move.w   d1,(PLAYFIELDY)
                    move.w   d1,(MAPXY+2)
                    lea      (SPRITES),a0
                    moveq    #8,d0
                    move.w   d0,(a0)
                    bset     #0,(NEWSCFLAG)
                    clr.w    (HEALTH_CH)
                    move.b   #$FF,(keycode)
                    clr.w    (COPIRQ)
                    move.w   #1,(FIRST_SRCH)
loop:               movea.l  (SCREEN),a5
                    bclr     #0,(NEWSCFLAG)
                    beq.w    NOTNEW
                    bsr.w    NEWSCREEN
                    bset     #1,(NEWSCFLAG)
                    clr.w    (VBLFLAG)
X_026:              tst.w    (VBLFLAG)
                    beq.w    X_026
NOTNEW:             move.w   (MYXPOS),(MYOLDXPOS)
                    move.w   (MYYPOS),(MYOLDYPOS)
                    move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
                    lea      (MY_MOVEMAT),a2
                    bsr.w    MOVE_MAP
                    move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
                    bsr.w    GET_SPRITEXY
                    bsr.w    MOVE_ME
                    move.w   (HISXPOS),(HISOLDXPOS)
                    move.w   (HISYPOS),(HISOLDYPOS)
                    bsr.w    MOVE_HIM
                    bsr.w    MOVE_OTHERS
                    bsr.w    TEST_PICK_MIX
                    bsr.w    AI
                    bsr.w    COMPASS_DO
                    bsr.w    MIX_SPELLS
                    bsr.w    SPELL_COUNTERS
                    bsr.w    HEIKE
                    bsr.w    GAME_OVER_TEST
                    beq.w    GAME_OVER_SEQUEN
                    tst.w    (HEALTH_CH)
                    beq.w    HEALTH_SAME
                    clr.w    (HEALTH_CH)
                    bsr.w    BLIT_HEALTH
HEALTH_SAME:        cmpi.w   #2,(COPIRQ)
                    bcs.w    HEALTH_SAME
                    clr.w    (COPIRQ)
                    bsr.w    FORCE_NEWSC
                    btst     #0,(NEWSCFLAG)
                    bne.w    newsc
                    bsr.w    FIREBALL
                    bsr.w    LIGHTNING
                    bsr.w    SPROUTS
                    bsr.w    DO_SPFX
                    bsr.w    SEE_TO_SPRITES
newsc:              clr.w    (VBLFLAG)
X_028:              tst.w    (VBLFLAG)
                    beq.w    X_028
                    bra.w    loop

GAME_OVER_SEQUEN:   clr.w    (VBLFLAG)
X_029:              tst.w    (VBLFLAG)
                    beq.w    X_029
                    bsr.w    COPY_SCREENS
                    bclr     #0,(BITPLANE_FLAG)
                    bsr.w    FLIP_BPL_PTR
                    clr.w    (VBLFLAG)
X_030:              tst.w    (VBLFLAG)
                    beq.w    X_030
                    bsr.w    SET_1ST_COPPER_L
                    bsr.w    CLEAR_HARD_SPRIT
                    clr.w    (SPRITES)
                    clr.w    (VBLFLAG)
X_031:              tst.w    (VBLFLAG)
                    beq.w    X_031
                    movea.l  (SCREENB),a5
                    bsr.w    CLSALL
                    cmpi.w   #47,(LEAR_HEALTH)
                    beq.w    HE_WINS
                    bsr.w    IWINMSG
                    bra.w    ALL_GVR

HE_WINS:            bsr.w    HEWINMSG
ALL_GVR:            clr.w    (VBLFLAG)
X_032:              tst.w    (VBLFLAG)
                    beq.w    X_032
                    bsr.w    SET_2ND_COPPER_L
                    moveq    #1,d7
                    bra.w    TITLE_SCREEN

                    clr.w    d0
GVER:               move.w   d0,($DFF180)
                    addq.w   #1,d0
                    bne.w    GVER
                    clr.w    (VBLFLAG)
X_033:              tst.w    (VBLFLAG)
                    beq.w    X_033
STOP_ALL:           bra.w    STOP_ALL

;                    rts

IWINMSG:            lea      (IWMSG),a0
                    bra.w    ALLMSG

HEWINMSG:           lea      (HWMSG),a0
ALLMSG:             clr.w    d0
                    move.b   (a0)+,d0
                    move.w   d0,(PRINTX)
                    move.b   (a0)+,d0
                    move.w   d0,(PRINTY)
                    bsr.w    SPRINT
                    tst.b    (a0)
                    bne.w    ALLMSG
                    rts

IWMSG:              dc.b     10,2,'YOU ARE VICTORIOUS!',0
                    dc.b     5,5,'YOU HAVE DISPOSED OF LEANORIC!',0
                    dc.b     2,10,'PRESS FIRE TO ALLOW HIM HIS REVENGE.',0
                    even
HWMSG:              dc.b     12,2,'THE FEUD IS OVER',0
                    dc.b     4,5,'YOUR LIFE ON EARTH IS TERMINATED.',0
                    dc.b     8,10,'PRESS FIRE TO PLAY AGAIN.',0
                    even

GAME_OVER_TEST:     tst.w    (GAME_OVER)
                    beq.w    CHK_HLTH
                    subq.w   #1,(GAME_OVER)
                    rts

CHK_HLTH:           cmpi.w   #47,(LEAN_HEALTH)
                    beq.w    ISGMVR
                    cmpi.w   #47,(LEAR_HEALTH)
                    bne.w    NOTGMVR
ISGMVR:             move.w   #200,(GAME_OVER)
                    moveq    #1,d0
NOTGMVR:            rts

FORCE_NEWSC:        move.b   (keycode),d0
                    cmp.b    #$40,d0
                    beq.w    TRYNEWSC
                    move.b   #$FF,(keycode)
                    rts

TRYNEWSC:           move.b   #$FF,(keycode)
                    move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
                    bsr.w    PLAYXY_FR_XY
                    cmp.w    (PLAYFIELDX),d0
                    bne.w    CHSC
                    cmp.w    (PLAYFIELDY),d1
                    beq.w    PLNOCH
CHSC:               move.w   d0,(PLAYFIELDX)
                    move.w   d1,(PLAYFIELDY)
                    move.w   d0,(MAPXY)
                    move.w   d1,(MAPXY+2)
                    bset     #0,(NEWSCFLAG)
PLNOCH:             rts

MCLOPM:             clr.l    d0
                    move.w   #11,d1
MCLOP:              tst.b    (a2)+
                    beq.w    MCLR
                    ori.w    #1,d0
MCLR:               rol.l    #1,d0
                    dbra     d1,MCLOP
                    ror.l    #1,d0
                    move.l   d0,(a0)
                    adda.w   #$28,a0
                    dbra     d2,MCLOPM
                    rts

GET_SPRITEXY:       move.w   (PLAYFIELDX),d2
                    lsl.w    #5,d2
                    sub.w    d2,d0
                    move.w   (PLAYFIELDY),d2
                    lsl.w    #5,d2
                    sub.w    d2,d1
                    rts

GET_HARDSPRITEXY:   move.w   (PLAYFIELDX),d2
                    lsl.w    #5,d2
                    sub.w    d2,d0
                    move.w   (PLAYFIELDY),d2
                    lsl.w    #5,d2
                    sub.w    d2,d1
                    addi.w   #$80,d0
                    addi.w   #$2C,d1
                    rts

PLAYXY_FR_XY:       lsr.w    #5,d0
                    lsr.w    #5,d1
                    subq.w   #4,d0
                    subq.w   #1,d1
                    tst.w    d0
                    bpl.w    PXY1
                    moveq    #0,d0
PXY1:               cmp.w    #$5B,d0
                    bcs.w    PXY2
                    moveq    #$5A,d0
PXY2:               tst.w    d1
                    bpl.w    PXY3
                    moveq    #0,d1
PXY3:               cmp.w    #$39,d1
                    bcs.w    PXY4
                    moveq    #$38,d1
PXY4:               rts

SEE_TO_SPRITES:     bclr     #1,(NEWSCFLAG)
                    bne.w    NOTERASE
                    move.w   (HISOLDXPOS),d0
                    move.w   (HISOLDYPOS),d1
                    subi.w   #$18,d1
                    bsr.w    GET_SPRITEXY
                    swap     d0
                    move.w   d1,d0
                    bsr.w    ERA_SPRITE
                    move.w   (MYOLDXPOS),d0
                    move.w   (MYOLDYPOS),d1
                    bsr.w    GET_SPRITEXY
                    swap     d0
                    move.w   d1,d0
                    bsr.w    ERA_SPRITE
                    lea      (EXTRADTA),a0
                    moveq    #4-1,d7
ERA_EXL:            move.w   (4,a0),d0
                    move.w   (6,a0),d1
                    bsr.w    GET_SPRITEXY
                    swap     d0
                    move.w   d1,d0
                    movem.l  d7/a0,-(sp)
                    bsr.w    ERA_SPRITE
                    movem.l  (sp)+,d7/a0
                    adda.w   #$1A,a0
                    dbra     d7,ERA_EXL
NOTERASE:           lea      (EXTRADTA),a0
                    moveq    #0,d0
                    moveq    #1,d1
                    moveq    #2,d2
                    moveq    #3,d3
                    moveq    #4,d4
                    moveq    #5,d5
                    swap     d0
                    swap     d1
                    swap     d2
                    swap     d3
                    swap     d4
                    swap     d5
                    move.w   (MYYPOS),d0
                    move.w   (HISYPOS),d1
                    move.w   (2,a0),d2
                    move.w   ($1C,a0),d3
                    move.w   ($36,a0),d4
                    move.w   ($50,a0),d5
                    subi.w   #$18,d1
SORT:               moveq    #0,d6
                    cmp.w    d0,d1
                    bcc.w    NOSWAP1
                    exg      d0,d1
                    moveq    #1,d6
NOSWAP1:            cmp.w    d1,d2
                    bcc.w    NOSWAP2
                    exg      d1,d2
                    moveq    #1,d6
NOSWAP2:            cmp.w    d2,d3
                    bcc.w    NOSWAP3
                    exg      d2,d3
                    moveq    #1,d6
NOSWAP3:            cmp.w    d3,d4
                    bcc.w    NOSWAP4
                    exg      d3,d4
                    moveq    #1,d6
NOSWAP4:            cmp.w    d4,d5
                    bcc.w    NOSWAP5
                    exg      d4,d5
                    bra.w    SORT

NOSWAP5:            tst.w    d6
                    bne.w    SORT
                    bsr.w    SPRITED0
                    move.l   d1,d0
                    bsr.w    SPRITED0
                    move.l   d2,d0
                    bsr.w    SPRITED0
                    move.l   d3,d0
                    bsr.w    SPRITED0
                    move.l   d4,d0
                    bsr.w    SPRITED0
                    move.l   d5,d0
SPRITED0:           swap     d0
                    tst.w    d0
                    beq.w    SPRITEME
                    cmp.w    #1,d0
                    beq.w    SPRITEHIM
                    subq.w   #2,d0
                    movem.l  d1-d5/a0,-(sp)
                    mulu.w   #26,d0
                    adda.w   d0,a0
                    move.w   (0,a0),d0
                    move.w   (2,a0),d1
                    bsr.w    GET_SPRITEXY
                    swap     d0
                    move.w   d1,d0
                    moveq    #2,d1
                    cmpa.l   #EXTRADTA,a0
                    beq.w    HEIKE_CHECKS_OUT
                    addq.w   #1,d1
HEIKE_CHECKS_OUT:   tst.w    ($18,a0)
                    beq.w    NOTADOP
                    moveq    #1,d1
NOTADOP:            move.w   (8,a0),d2
                    bsr.w    BLIT_SPRITE
                    movem.l  (sp)+,d1-d5/a0
                    rts

SPRITEME:           tst.w    (MEINVIS)
                    beq.w    IMVISIBLEa
                    subi.w   #1,(MEINVIS)
                    bra.w    NOTMEa

IMVISIBLEa:         movem.l  d1-d5/a0,-(sp)
                    move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
                    bsr.w    GET_SPRITEXY
                    swap     d0
                    move.w   d1,d0
                    moveq    #1,d1
                    move.w   (MYDIR),d2
                    bsr.w    BLIT_SPRITE
                    movem.l  (sp)+,d1-d5/a0
NOTMEa:             rts

SPRITEHIM:          tst.w    (HIMINVIS)
                    beq.w    HEVISIBLEa
                    subi.w   #1,(HIMINVIS)
                    bra.w    NOTHIMa

HEVISIBLEa:         movem.l  d1-d5/a0,-(sp)
                    swap     d0
                    move.w   d0,d1
                    move.w   (HISXPOS),d0
                    bsr.w    GET_SPRITEXY
                    swap     d0
                    move.w   d1,d0
                    moveq    #0,d1
                    move.w   (HISDIR),d2
                    cmp.w    #4,d2
                    bcs.w    NO_THINK1
                    moveq    #0,d2
NO_THINK1:          bsr.w    BLIT_SPRITE
                    movem.l  (sp)+,d1-d5/a0
NOTHIMa:            rts

GTERR:              bsr.w    GEN_MAZE
                    bra.w    PLOT_MAZE

PLAYADD:            move.l   (PLAYFIELDX),d0
plad:               move.w   d0,d2
                    mulu.w   #100,d2
                    swap     d0
                    add.w    d0,d2
                    asl.w    #1,d2
                    movea.l  (MATRIX),a1
                    adda.w   d2,a1
                    rts

; ------------------------------------------------------------------
; Map editor
; ------------------------------------------------------------------
;editor:             movea.l  (SCREEN),a5
;                    bsr.w    CLSALL
;                    clr.w    (PLAYFIELDX)
;                    clr.w    (PLAYFIELDY)
;                    clr.w    (BACK_FLAG)
;                    bsr.w    NEWSCREEN
;                    move.l   #$13,(PRINTX)
;                    lea      (NUMLIST),a0
;                    bsr.w    SPRINT
;                    bsr.w    PRINT_FORE_BACK
;                    clr.w    (VBLFLAG)
;X_034:              tst.w    (VBLFLAG)
;                    beq.w    X_034
;                    tst.w    (LEFTBUTTON)
;                    beq.w    WAITONMAP
;                    movea.l  (MATRIX),a0
;                    move.w   #6000-1,d0
;FREE0:              move.w   (a0),d1
;                    tst.b    d1
;                    bne.w    NXTERR
;                    move.b   #$A2,d1
;                    move.w   d1,(a0)
;NXTERR:             adda.w   #2,a0
;                    dbra     d0,FREE0
;WAITONMAP:          clr.w    (VBLFLAG)
;X_035:              tst.w    (VBLFLAG)
;                    beq.w    X_035
;                    bsr.w    GETMAPXY
;MAPMOVE:            andi.w   #1,(NUMFLAG)
;                    bne.w    NONUMP
;                    move.l   #$12,(PRINTX)
;                    lea      (BLANK5),a0
;                    bsr.w    SPRINT
;NONUMP:             move.l   #$14,(PRINTX)
;                    bsr.w    PRDEC
;                    move.w   #6,(PRINTX)
;                    swap     d0
;                    bsr.w    PRDEC
;                    swap     d0
;                    cmp.l    #-1,d0
;                    bne.w    ISONMAP
;                    move.w   #13,(PRINTX)
;                    lea      (BLANK5),a0
;                    bsr.w    SPRINT
;                    tst.w    (LEFTBUTTON)
;                    beq.w    SCRMAP
;                    tst.w    (RIGHTBUTTON)
;                    beq.w    SCRMAP
;                    movem.l  d0/d1/a0-a2/a5,-(sp)
;                    lea      (SAVMSG),a0
;                    move.l   #$16,(PRINTX)
;                    bsr.w    SPRINT
;                    bsr.w    IRQ_NORM
;                    bsr.w    WRITE_MATRIX
;                    move.w   #500,d0
;                    bsr.w    WAITD0FLY
;                    lea      (SAVDMSG),a0
;                    move.l   #$16,(PRINTX)
;                    bsr.w    SPRINT
;                    bsr.w    IRQ_INIT
;                    movem.l  (sp)+,d0/d1/a0-a2/a5
;                    bra.w    WAITONMAP
;
;SCRMAP:             bsr.w    SCROLLMAP
;                    bra.w    WAITONMAP
;
;ISONMAP:            move.l   d0,(MAPXY)
;                    bsr.w    MAPADD
;                    move.w   (a1),d0
;                    andi.w   #$FF,d0
;                    move.w   #13,(PRINTX)
;                    andi.w   #1,(BACK_FLAG)
;                    beq.w    NUM_FORE
;                    move.w   (a1),d0
;                    lsr.w    #8,d0
;NUM_FORE:           bsr.w    PRDEC
;another_loop:       move.l   (LASTDXY),d1
;                    bsr.w    DRAW_CURSOR
;THIS_LOOP:          tst.w    (LEFTBUTTON)
;                    beq.w    TRY_RBUT
;NOSAVE:             bsr.w    MAPADD
;                    move.w   (a1),d2
;                    andi.w   #1,(NUMFLAG)
;                    beq.w    ORD_L
;                    move.w   (CURNUM),d2
;                    andi.w   #1,(BACK_FLAG)
;                    beq.w    NUM_L_FORE
;                    lsl.w    #8,d2
;                    move.w   (a1),d3
;                    andi.w   #$FF,d3
;                    or.w     d3,d2
;                    bra.w    L_B_J
;
;NUM_L_FORE:         move.w   (a1),d3
;                    andi.w   #$FF00,d3
;                    or.w     d3,d2
;                    bra.w    L_B_J
;
;ORD_L:              andi.w   #1,(BACK_FLAG)
;                    beq.w    L_FORE
;                    addi.w   #$100,d2
;                    bra.w    L_B_J
;
;L_FORE:             addq.b   #1,d2
;L_B_J:              move.w   d2,(a1)
;                    movem.l  d0/d1,-(sp)
;                    bsr.w    NEWSCREEN
;                    bsr.w    DRAW_CURSOR
;                    movem.l  (sp)+,d0/d1
;RELEASE_LEFT:       clr.w    (VBLFLAG)
;X_036:              tst.w    (VBLFLAG)
;                    beq.w    X_036
;                    tst.w    (LEFTBUTTON)
;                    bne.w    RELEASE_LEFT
;                    bra.w    MAPMOVE
;
;TRY_RBUT:           tst.w    (RIGHTBUTTON)
;                    beq.w    NOMAPCH
;                    clr.w    (NUMFLAG)
;                    bsr.w    MAPADD
;                    move.w   (a1),d2
;                    andi.w   #1,(BACK_FLAG)
;                    beq.w    R_FORE
;                    subi.w   #$100,d2
;                    bra.w    R_B_J
;
;R_FORE:             subq.b   #1,d2
;R_B_J:              move.w   d2,(a1)
;                    movem.l  d0/d1,-(sp)
;                    bsr.w    NEWSCREEN
;                    bsr.w    DRAW_CURSOR
;                    movem.l  (sp)+,d0/d1
;RELEASE_RIGHT:      clr.w    (VBLFLAG)
;X_037:              tst.w    (VBLFLAG)
;                    beq.w    X_037
;                    tst.w    (RIGHTBUTTON)
;                    bne.w    RELEASE_RIGHT
;                    bra.w    MAPMOVE
;
;NOMAPCH:            clr.w    (VBLFLAG)
;X_038:              tst.w    (VBLFLAG)
;                    beq.w    X_038
;                    cmp.l    (LASTDXY),d1
;                    beq.w    THIS_LOOP
;                    bsr.w    GETMAPXY
;                    cmp.l    (MAPXY),d0
;                    beq.w    THIS_LOOP
;                    movem.l  d0/d1,-(sp)
;                    bsr.w    NEWSCREEN
;                    movem.l  (sp)+,d0/d1
;                    bra.w    MAPMOVE
;
;SCROLLMAP:          tst.w    (LEFTBUTTON)
;                    beq.w    SCRMAPX
;                    move.l   (PLAYFIELDX),d3
;                    move.w   (YABS),d2
;                    cmp.w    #$90,d2
;                    bcs.w    CLRNUM
;                    cmp.w    #$98,d2
;                    bcc.w    CLRNUM
;                    clr.w    (CURNUM)
;                    clr.w    (NUMFLAG)
;                    bra.w    SCRRELLEFT
;
;CLRNUM:             cmp.w    #$98,d2
;                    bcs.w    TRY_FB
;                    cmp.w    #$A0,d2
;                    bcc.w    TRY_FB
;                    move.w   (XABS),d2
;                    cmp.w    #$A0,d2
;                    bcc.w    TRY_FB
;                    lsr.w    #4,d2
;                    move.w   (CURNUM),d3
;                    mulu.w   #10,d3
;                    add.w    d2,d3
;                    cmp.w    #256,d3
;                    bcs.w    NUM_NOV
;                    subi.w   #256,d3
;                    andi.w   #$FF,d3
;NUM_NOV:            move.w   d3,(CURNUM)
;                    move.w   #1,(NUMFLAG)
;                    move.l   #$12,(PRINTX)
;                    exg      d3,d0
;                    bsr.w    PRDEC
;                    exg      d3,d0
;                    bsr.w    BLIT_CURRENT
;                    bra.w    SCRRELLEFT
;
;TRY_FB:             cmp.w    #168,d2
;                    bcs.w    SCM_NCF
;                    cmp.w    #176,d2
;                    bcc.w    SCM_NCF
;                    eori.w   #1,(BACK_FLAG)
;                    bsr.w    PRINT_FORE_BACK
;                    bra.w    SCRRELLEFT
;
;SCM_NCF:            cmp.w    #200,d2
;                    bcc.w    SCRUP
;                    cmp.w    #128,d2
;                    bcs.w    SCHORIZ
;                    cmp.w    #56,d3
;                    beq.w    SCRMAPX
;                    addq.w   #1,d3
;                    bra.w    SCMOV
;
;SCRUP:              tst.w    d3
;                    beq.w    SCRMAPX
;                    subq.w   #1,d3
;                    bra.w    SCMOV
;
;SCHORIZ:            swap     d3
;                    move.w   (XABS),d0
;                    cmp.w    #448,d0
;                    bcs.w    SCRIG
;                    tst.w    d3
;                    beq.w    SCRMAPX
;                    subq.w   #1,d3
;                    swap     d3
;                    bra.w    SCMOV
;
;SCRIG:              cmp.w    #90,d3
;                    beq.w    SCRMAPX
;                    addq.w   #1,d3
;                    swap     d3
;SCMOV:              move.l   d3,(PLAYFIELDX)
;                    bsr.w    NEWSCREEN
;                    bsr.w    DRAW_CURSOR
;SCRRELLEFT:         clr.w    (VBLFLAG)
;X_039:              tst.w    (VBLFLAG)
;                    beq.w    X_039
;                    tst.w    (LEFTBUTTON)
;                    bne.w    SCRRELLEFT
;SCRMAPX:            rts
;
;MAPADD:             move.l   (MAPXY),d0
;                    bra.w    plad
;
;GETMAPXY:           move.w   (XABS),d0
;                    cmp.w    #$140,d0
;                    bcc.w    MAPERROR
;                    lsr.w    #5,d0
;                    add.w    (PLAYFIELDX),d0
;                    swap     d0
;                    move.w   (YABS),d0
;                    cmp.w    #$80,d0
;                    bcc.w    MAPERROR
;                    lsr.w    #5,d0
;                    add.w    (PLAYFIELDY),d0
;                    rts
;
;MAPERROR:           move.l   #-1,d0
;                    rts
;
;DRAW_CURSOR:        movem.l  d0/a4/a5,-(sp)
;                    move.w   (XABS),d0
;                    cmp.w    #320,d0
;                    bcc.w    D_C_EXIT
;                    andi.w   #$FFE0,d0
;                    swap     d0
;                    move.w   (YABS),d0
;                    cmp.w    #$80,d0
;                    bcc.w    D_C_EXIT
;                    andi.w   #$FFE0,d0
;                    move.l   d0,d1
;                    addi.w   #$1F,d1
;                    movea.l  (SCREEN),a5
;                    bsr.w    DRAWLINE
;                    move.l   d0,d1
;                    addi.l   #$1F0000,d1
;                    bsr.w    DRAWLINE
;                    addi.l   #$1F001F,d0
;                    move.l   d0,d1
;                    subi.w   #$1F,d1
;                    bsr.w    DRAWLINE
;                    move.l   d0,d1
;                    swap     d1
;                    subi.w   #$1F,d1
;                    swap     d1
;                    bsr.w    DRAWLINE
;D_C_EXIT:           movem.l  (sp)+,d0/a4/a5
;                    rts
;
;PRINT_FORE_BACK:    move.l   #$15,(PRINTX)
;                    lea      (FORE_TEXT),a0
;                    andi.w   #1,(BACK_FLAG)
;                    beq.w    P_fb1
;                    lea      (BACK_TEXT),a0
;P_fb1:              bsr.w    SPRINT
;                    rts
;
;WRITE_MATRIX:       move.l   #MAT_NAME,d1
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-72,a6)
;                    movea.l  (sp)+,a6
;                    move.l   #MAT_NAME,d1
;                    move.l   #$3EE,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-30,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,(FILE)
;                    beq.w    W_ERROR
;                    move.l   d0,d1
;                    move.l   (MATRIX),d2
;                    move.l   #12000,d3
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-48,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,-(sp)
;                    move.l   (FILE),d1
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-36,a6)
;                    movea.l  (sp)+,a6
;                    move.l   (sp)+,d0
;                    cmp.l    #-1,d0
;                    beq.w    W_ERROR
;                    rts
;
;FORE_TEXT:          dc.b     'FOREGROUND',0
;BACK_TEXT:          dc.b     'BACKGROUND',0
;SAVMSG:             dc.b     'SAVING MAP...',0
;SAVDMSG:            dc.b     'SAVED        ',0
;NUMLIST:            dc.b     '0 1 2 3 4 5 6 7 8 9',0
;BLANK5:             dc.b     '     ',0,0
;                    dc.b     0
; ------------------------------------------------------------------
; End of map editor
; ------------------------------------------------------------------

WAITD0FLY:          move.w   d1,-(sp)
WFLY:               move.w   ($DFF01E),d1
                    andi.w   #$20,d1
                    beq.w    WFLY
                    move.w   d1,($DFF09C)
                    subq.w   #1,d0
                    bne.w    WFLY
                    move.w   (sp)+,d1
                    rts

;PAUSE:              move.l   d0,-(sp)
;                    move.l   #$8000,d0
;P1:                 subq.l   #1,d0
;                    bne.w    P1
;                    move.l   (sp)+,d0
;                    rts

SCRADD:             movem.l  d0/d2/d3,-(sp)
                    clr.l    d1
                    clr.l    d3
                    move.w   d0,d1
                    tst.w    d1
                    bpl.w    SC_YONSC
                    neg.w    d1
                    lsl.w    #3,d1
                    move.w   d1,d2
                    add.w    d1,d1
                    add.w    d1,d1
                    add.w    d2,d1
                    neg.w    d1
                    ext.l    d1
                    bra.w    SC_YNEG

SC_YONSC:           lsl.w    #3,d1
                    move.w   d1,d2
                    add.w    d1,d1
                    add.w    d1,d1
                    add.w    d2,d1
SC_YNEG:            add.l    a5,d1
                    swap     d0
                    asr.w    #3,d0
                    ext.l    d0
S_XOFF:             add.l    d0,d1
                    andi.b   #$FE,d1
                    movem.l  (sp)+,d0/d2/d3
                    rts

CHRADD:             move.l   d2,-(sp)
                    move.w   #320,d2
                    mulu.w   d1,d2
                    add.w    d0,d2
                    adda.w   d2,a5
                    move.l   (sp)+,d2
                    rts

SPRINT:             move.w   d0,-(sp)
Sploop:             move.b   (a0)+,d0
                    tst.b    d0
                    beq.w    Spend
                    bsr.w    PRINTCHR
                    bra.w    Sploop

Spend:              move.w   (sp)+,d0
                    rts

PRINTCHR:           movem.l  d0-d2/a0/a4/a5,-(sp)
                    move.w   d0,d2
                    movea.l  (SCREEN),a5
                    move.w   (PRINTX),d0
                    move.w   (PRINTY),d1
                    bsr.w    CHRADD
                    movea.l  a5,a0
                    cmp.b    #13,d2
                    bne.w    prch4
                    bsr.w    CR
prch4:              addq.b   #1,d0
                    cmp.b    #$28,d0
                    bcs.w    prch1
                    bsr.w    CR
prch1:              move.w   d0,(PRINTX)
                    move.w   d1,(PRINTY)
                    move.w   d2,d0
                    cmp.b    #10,d0
                    bne.w    prch6
                    bsr.w    CR
                    bra.w    prch5

prch6:              cmp.b    #$7F,d0
                    bcc.w    prch2
                    cmp.b    #' ',d0
                    bcc.w    prch3
prch2:              move.b   #'.',d0
prch3:              bsr.w    PRCHR
prch5:              movem.l  (sp)+,d0-d2/a0/a4/a5
                    rts

CR:                 clr.w    d0
                    addq.b   #1,d1
                    cmp.b    #$18,d1
                    bcs.w    cr1
                    bsr.w    SCROLLsc
                    move.b   #$17,d1
cr1:                rts

PRDEC:              movem.l  d0/d1,-(sp)
                    move.w   #10000,d1
                    bsr.w    DECP1
                    move.w   #1000,d1
                    bsr.w    DECP1
                    move.w   #100,d1
                    bsr.w    DECP1
                    move.w   #10,d1
                    bsr.w    DECP1
                    addi.w   #$30,d0
                    bsr.w    PRINTCHR
                    movem.l  (sp)+,d0/d1
                    rts

DECP1:              andi.l   #$FFFF,d0
                    cmp.w    d1,d0
                    bcs.w    PRAN0
                    divu.w   d1,d0
                    addi.w   #$30,d0
                    movem.l  d0,-(sp)
                    bra.w    PRALLDIG

PRAN0:              swap     d0
                    movem.l  d0,-(sp)
                    move.w   #$30,d0
PRALLDIG:           bsr.w    PRINTCHR
                    movem.l  (sp)+,d0
                    swap     d0
                    addq.l   #1,a0
                    rts

PRD0HEX32:          rol.l    #8,d0
                    bsr.w    PRD0HEX8
                    rol.l    #8,d0
                    bsr.w    PRD0HEX8
                    rol.l    #8,d0
                    bsr.w    PRD0HEX8
                    rol.l    #8,d0
PRD0HEX8:           move.w   d0,-(sp)
                    lsr.b    #4,d0
                    bsr.w    PRD0HEX4
                    move.w   (sp)+,d0
                    move.w   d0,-(sp)
                    andi.b   #$F,d0
                    bsr.w    PRD0HEX4
                    move.w   (sp)+,d0
                    rts

PRD0HEX4:           addi.b   #'0',d0
                    cmp.b    #'9'+1,d0
                    bcs.w    prdoh1
                    addq.b   #7,d0
prdoh1:             andi.w   #$FF,d0
                    bsr.w    PRCHR
                    addq.l   #1,a0
                    rts

PRCHR:              movem.l  d0/a0/a1,-(sp)
                    subi.w   #$20,d0
                    andi.w   #$FF,d0
                    lsl.w    #3,d0
                    lea      (CHRSET),a1
                    adda.w   d0,a1
                    moveq    #8-1,d0
PRCH2:              move.b   (a1)+,(a0)
                    adda.l   #40,a0
                    dbra     d0,PRCH2
                    movem.l  (sp)+,d0/a0/a1
                    rts

BINPRNT:            movem.l  d0/a0,-(sp)
                    movea.l  a5,a0
                    rol.b    #6,d0
                    bsr.w    BINDIG
                    addq.l   #1,a0
                    rol.b    #1,d0
                    bsr.w    BINDIG
                    addq.l   #1,a0
                    rol.b    #1,d0
                    bsr.w    BINDIG
                    movem.l  (sp)+,d0/a0
                    rts

BIND0D1:            movem.l  d0/d1/a0,-(sp)
                    movea.l  (SCREEN),a0
                    adda.w   #320,a0
                    bsr.w    BIND0
                    move.l   d1,d0
                    movea.l  (SCREEN),a0
                    adda.w   #640,a0
                    bsr.w    BIND0
                    movem.l  (sp)+,d0/d1/a0
                    rts

BIND0:              move.w   #32-1,d2
BIND0A:             rol.l    #1,d0
                    bsr.w    BINDIG
                    addq.l   #1,a0
                    dbra     d2,BIND0A
                    rts

BINDIG:             movem.l  d0/a0/a1,-(sp)
                    lea      (CHRSET+128),a1
                    bcc.w    BINDIG1
                    addq.w   #8,a1
BINDIG1:            moveq    #8-1,d0
BINDIG2:            move.b   (a1)+,(a0)
                    adda.w   #40,a0
                    dbra     d0,BINDIG2
                    movem.l  (sp)+,d0/a0/a1
                    rts

CLSALL:             movem.l  d0/d1/a0,-(sp)
                    movea.l  a5,a0
                    clr.l    d0
                    move.w   #10241-1,d1
CLSA1:              move.l   d0,(a0)+
                    dbra     d1,CLSA1
                    movem.l  (sp)+,d0/d1/a0
                    rts

CLS:                movem.l  d0/d1/a0,-(sp)
                    movea.l  a5,a0
                    clr.l    d0
                    move.w   #2049-1,d1
CLS1:               move.l   d0,(a0)+
                    dbra     d1,CLS1
                    movem.l  (sp)+,d0/d1/a0
                    rts

SCROLLsc:           movem.l  d0/a0/a1,-(sp)
                    movea.l  (SCREEN),a0
                    movea.l  a0,a1
                    adda.l   #320,a1
                    move.w   #1968-1,d0
SCR1:               move.l   (a1)+,(a0)+
                    dbra     d0,SCR1
                    movem.l  (sp)+,d0/a0/a1
                    rts

PLOT:               movem.l  d0-d2/a0,-(sp)
                    lsl.w    #3,d1
                    move.w   d1,d2
                    add.w    d1,d1
                    add.w    d1,d1
                    add.w    d2,d1
                    adda.w   d1,a0
                    move.b   d0,d1
                    lsr.w    #3,d0
                    adda.w   d0,a0
                    andi.b   #7,d1
                    move.b   #$80,d2
                    lsr.b    d1,d2
                    or.b     d2,(a0)
                    movem.l  (sp)+,d0-d2/a0
                    rts

UNPLOT:             movem.l  d0-d2/a0,-(sp)
                    lsl.w    #3,d1
                    move.w   d1,d2
                    add.w    d1,d1
                    add.w    d1,d1
                    add.w    d2,d1
                    adda.w   d1,a0
                    move.b   d0,d1
                    lsr.w    #3,d0
                    adda.w   d0,a0
                    andi.b   #7,d1
                    move.b   #$7F,d2
                    ror.b    d1,d2
                    and.b    d2,(a0)
                    movem.l  (sp)+,d0-d2/a0
                    rts

PLOT_TEST:          bra.w    this

                    movea.l  a5,a0
                    clr.w    d0
PLOP1:              movem.w  d0,-(sp)
                    bsr.w    GETSINCOS
                    lsr.b    #1,d1
                    movem.w  (sp)+,d0
                    bsr.w    PLOT
                    addq.w   #1,d0
                    cmp.w    #$100,d0
                    bne.w    PLOP1
                    rts

this:               movea.l  a5,a0
                    move.l   #$38000,d2
PLOOP:              andi.w   #$3F,d0
                    move.w   d0,d3
                    bsr.w    RND
                    andi.w   #$FF,d0
                    move.w   d0,d1
PLFUD:              bsr.w    RND
                    andi.w   #$7F,d0
                    exg      d0,d1
                    bsr.w    PLOT
                    subq.l   #1,d1
                    bne.w    PLOOP
                    rts

RND:                move.l   d1,-(sp)
                    move.l   (SEED),d0
                    move.l   d0,d1
                    swap     d1
                    muls.w   #3533,d1
                    add.w    d0,d1
                    swap     d1
                    move.w   #$29,d1
                    muls.w   #3533,d0
                    add.l    d1,d0
                    move.l   d0,(SEED)
                    swap     d0
                    move.l   (sp)+,d1
                    rts

GETSINCOS:          movem.l  d3/a0,-(sp)
                    clr.w    d4
                    move.b   d0,d3
                    swap     d3
                    andi.b   #$3F,d0
                    move.b   d0,d3
                    swap     d3
                    move.b   d3,d0
                    andi.b   #$C0,d0
                    bpl.w    TRYCOSNEG
                    ori.b    #1,d4
TRYCOSNEG:          cmp.w    #$40,d0
                    beq.w    SETCOSM
                    cmp.w    #$80,d0
                    bne.w    COSNOTNEG
SETCOSM:            ori.w    #$100,d4
COSNOTNEG:          swap     d3
                    andi.b   #$40,d0
                    cmp.b    #$40,d0
                    bne.w    NOTINV
                    move.b   #$3F,d0
                    sub.b    d3,d0
                    move.b   d0,d3
NOTINV:             movea.l  #SINTAB,a0
                    andi.w   #$FF,d3
                    move.b   (a0,d3.w),d0
                    move.b   #$3F,d1
                    sub.b    d3,d1
                    andi.w   #$FF,d1
                    move.b   (a0,d1.w),d1
                    andi.w   #$FF,d0
                    andi.w   #$FF,d1
                    movem.l  (sp)+,d3/a0
                    rts

SINTAB:             dc.b     0,9,12,$15,$19,$22,$25,$2E,$31,$3B,$3E,$47,$4A
                    dc.b     $53,$56,$5F,$61,$6A,$6D,$75,$78,$80,$83,$8B,$8E
                    dc.b     $95,$98,$9F,$A2,$A9,$AB,$B2,$B5,$BB,$BD,$C3,$C5
                    dc.b     $CB,$CD,$D3,$D4,$D9,$DB,$E0,$E1,$E6,$E7,$EB,$EC
                    dc.b     $EF,$F1,$F4,$F4,$F7,$F8,$FA,$FB,$FC,$FD,$FE,$FE
                    dc.b     $FF,$FF,$FF

SET_UP_SCREEN:      lea      ($DFF000),a6
                    movea.l  (SCREEN),a5
                    move.b   #0,(VBLFLAG)
                    move.w   #$3FF,($96,a6)
                    move.w   #$5200,($100,a6)
                    move.w   #0,($102,a6)
                    move.w   #$24,($104,a6)
                    move.w   #0,($108,a6)
                    move.w   #0,($10A,a6)
                    move.w   #$38,($92,a6)
                    move.w   #$D0,($94,a6)
                    move.w   #$2C81,($8E,a6)
                    move.w   #$F4C1,($90,a6)
                    move.w   #$c00,($106,a6)
                    clr.w    ($1FC,a6)
                    bsr.w    SET_COPPER_LIST
                    bsr.w    CLEAR_HARD_SPRIT
                    move.l   (COPPDAT),($80,a6)
                    move.w   ($88,a6),d0
                    move.w   #$3F,($96,a6)
                    bsr.w    IRQ_INIT
                    move.w   #$87F0,($96,a6)
                    clr.w    (VBLFLAG)
X_040:              tst.w    (VBLFLAG)
                    beq.w    X_040
                    rts

SET_1ST_COPPER_L:   moveq    #0,d0
                    moveq    #0,d1
                    moveq    #0,d4
                    lea      (COPPERDAT1ST),a2
                    bra.w    S_COP1

SET_2ND_COPPER_L:   moveq    #0,d0
                    moveq    #0,d1
                    moveq    #0,d4
                    lea      (COPPERDAT2ND),a2
                    bra.w    S_COP1

SET_COPPER_LIST:    moveq    #0,d0
                    moveq    #0,d1
                    moveq    #0,d4
                    lea      (COPPERL2),a2
S_COP1:             movea.l  (COPPDAT),a1
                    lea      (COPPDAT),a3
CLOOP1:             cmpi.l   #-2,(a2)
                    beq.w    CPEND
                    tst.w    (a2)
                    beq.w    COMOFF
                    cmpi.w   #-2,(a2)
                    bne.w    N_SCOLP
                    adda.l   #2,a2
                    move.l   a2,(COLSETADDR)
                    move.l   a1,(COLCOPADDR)
                    bra.w    NOTCOM

N_SCOLP:            cmpi.w   #-1,(a2)
                    bne.w    NOTCOM
COMOFF:             move.w   (a2)+,d1
NOTCOM:             move.w   (a2)+,d0
                    btst     #0,d0
                    beq.w    NOT_WAIT
                    move.w   d0,d4
                    lsr.w    #8,d4
                    subi.w   #$2C,d4
                    mulu.w   #$28,d4
NOT_WAIT:           move.w   d0,(a1)+
                    move.w   (a2)+,d0
                    tst.w    d1
                    bne.w    HICOP
                    bclr     #15,d0
                    beq.w    LOWCOP
                    move.l   (a3,d0.w),d3
                    add.l    d4,d3
                    move.l   d3,d0
                    swap     d0
                    bra.w    HICOP

LOWCOP:             move.w   d3,d0
HICOP:              move.w   d0,(a1)+
                    bra.w    CLOOP1

CPEND:              move.l   (a2),(a1)
                    rts

IRQ_NORM:           move.w   #$7FFF,($DFF09A)
                    move.l   (NORMIRQ),($6C).w
                    move.l   (NORMKEY),($68).w
                    move.w   (NORMINTENA),d0
                    ori.w    #$8000,d0
                    move.w   d0,($DFF09A)
                    rts

IRQ_INIT:           move.w   ($DFF01C),d0
                    move.w   d0,(NORMINTENA)
                    move.w   #$7FFF,($DFF09A)
                    lea      (IRQVECTOR),a0
                    lea      ($6C).w,a1
                    lea      (NORMIRQ),a2
                    move.l   (a1),(a2)
                    move.l   a0,(a1)
                    move.w   #$C030,d0
                    move.w   d0,($DFF09A)
                    bsr.w    keyenable
                    rts

keyenable:          lea      ($BFE001),a1
                    move.b   #0,($E00,a1)
                    move.b   #$88,($D00,a1)
                    lea      (int2,pc),a0
                    move.l   ($68).w,(NORMKEY)
                    move.l   a0,($68).w
                    move.w   #$8008,($DFF09A)
                    move.b   #$FF,(keycode)
                    rts

int2:               movem.l  d0/a0/a1,-(sp)
                    lea      ($DFF000),a0
                    move.w   ($1E,a0),d0
                    andi.w   #8,d0
                    move.w   d0,($9C,a0)
                    lea      ($BFE001),a1
                    move.b   ($D00,a1),d0
                    btst     #4,d0
                    bne.w    int2x
                    btst     #3,d0
                    bne.w    keys
int2x:              movem.l  (sp)+,d0/a0/a1
                    rte

keys:               move.w   d2,-(sp)
                    move.b   ($C00,a1),d2
                    move.b   #1,($C00,a1)
                    move.b   #$40,($E00,a1)
                    move.b   #$80,($400,a1)
                    move.b   #0,($500,a1)
                    bset     #0,($E00,a1)
                    not.b    d2
                    ror.b    #1,d2
                    move.b   d2,(keycode)
key1:               btst     #0,($D00,a1)
                    beq.w    key1
                    move.b   #0,($E00,a1)
                    move.w   (sp)+,d2
                    bra.w    int2x

IRQVECTOR:          btst     #4,($DFF01F)
                    beq.w    VBLANKIRQ
                    move.w   #$4010,($DFF09A)
                    bchg     #0,(HSP_TOGGLE)
                    beq.w    NOHSP
                    movem.l  d0-d7/a0-a6,-(sp)
                    bsr.w    HARD_SPRITES
                    movem.l  (sp)+,d0-d7/a0-a6
NOHSP:              addi.w   #1,(COPIRQ)
                    move.w   #$4010,($DFF09C)
                    move.w   #$C010,($DFF09A)
                    rte

VBLANKIRQ:          movem.l  d0-d7/a0-a6,-(sp)
                    move.w   #$4020,($DFF09A)
                    move.w   ($DFF00C),d0
                    move.w   d0,d2
                    lsr.w    #1,d2
                    eor.w    d0,d2
                    clr.w    d3
                    btst     #0,d2
                    beq.w    BSET
                    bset     #2,d3
BSET:               btst     #8,d2
                    beq.w    FSET
                    bset     #3,d3
FSET:               btst     #1,d0
                    beq.w    RSET
                    bset     #0,d3
RSET:               btst     #9,d0
                    beq.w    LSET
                    bset     #1,d3
LSET:               btst     #7,($BFE001)
                    bne.w    NOFIRE
                    bset     #4,d3
NOFIRE:             move.w   d3,(FUDLR)
                    move.w   ($DFF00A),d0
                    move.w   d0,-(sp)
                    andi.w   #$FF,d0
                    move.b   (LASTX),d3
                    move.b   d0,(LASTX)
                    sub.b    d0,d3
                    ext.w    d3
                    move.w   (sp)+,d0
                    lsr.w    #8,d0
                    move.b   (LASTY),d4
                    move.b   d0,(LASTY)
                    sub.b    d0,d4
                    ext.w    d4
                    move.w   (XABS),d0
                    move.w   (YABS),d1
                    add.w    (XFLOW),d3
                    move.w   d3,d2
                    andi.w   #3,d2
                    move.w   d2,(XFLOW)
                    add.w    (YFLOW),d4
                    move.w   d4,d2
                    andi.w   #3,d2
                    move.w   d2,(YFLOW)
                    asr.w    #2,d3
                    asr.w    #2,d4
                    sub.w    d3,d0
                    sub.w    d4,d1
                    andi.w   #$1FF,d0
                    move.w   d0,(XABS)
                    andi.w   #$FF,d1
                    move.w   d1,(YABS)
                    movem.l  d0/d1,-(sp)
                    andi.w   #$1FF,d0
                    andi.w   #$FF,d1
                    move.w   ($DFF012),d2
                    move.w   #$CC01,($DFF034)
                    clr.w    (RIGHTBUTTON)
                    clr.w    (LEFTBUTTON)
                    cmp.w    #$8000,d2
                    bcs.w    NORight
                    ori.w    #1,(RIGHTBUTTON)
NORight:            btst     #6,($BFE001)
                    bne.w    NOLeft
                    ori.w    #1,(LEFTBUTTON)
                    ori.w    #$10,(FUDLR)
NOLeft:             swap     d1
                    move.w   d0,d1
                    swap     d1
                    move.l   (LASTDXY),d0
                    move.l   d1,(LASTDXY)
                    moveq    #0,d2
                    move.w   d2,d3
                    sub.w    d1,d0
                    bcc.w    UDP
                    subq.w   #1,d2
                    neg.w    d0
UDP:                swap     d0
                    swap     d1
                    sub.w    d1,d0
                    bcc.w    LRP
                    subq.w   #1,d3
                    neg.w    d0
LRP:                move.w   d0,d1
                    swap     d0
                    cmp.w    d0,d1
                    bcs.w    ISUDM
                    tst.w    d1
                    beq.w    NOMVM
                    tst.w    d3
                    bpl.w    UPMM
                    ori.w    #1,(FUDLR)                 ; 4
                    bra.w    NOMVM

UPMM:               ori.w    #2,(FUDLR)                 ; 6
                    bra.w    NOMVM

ISUDM:              tst.w    d0
                    beq.w    NOMVM
                    tst.w    d2
                    bpl.w    LFMVM
                    ori.w    #4,(FUDLR)                 ; 1
                    bra.w    NOMVM

LFMVM:              ori.w    #8,(FUDLR)                 ; 2
NOMVM:              movem.l  (sp)+,d0/d1
                    addi.w   #$80,d0
                    addi.w   #$2C,d1
                    move.b   d1,d2
                    lsl.w    #8,d2
                    ror.w    #1,d0
                    move.b   d0,d2
                    rol.w    #1,d0
                    movea.l  (SPRITE1),a0
                    move.w   #6,d2
                    add.b    d1,d2
                    lsl.w    #8,d2
                    andi.b   #1,d0
                    or.b     d0,d2
                    btst     #8,d1
                    beq.w    VHINSET
                    ori.b    #6,d2
VHINSET:            bsr.w    DoFx
                    move.w   #$4020,($DFF09C)
                    move.w   #$C020,($DFF09A)
                    move.w   #-1,(VBLFLAG)
                    movem.l  (sp)+,d0-d7/a0-a6
                    rte

EXCEPTION:          movem.l  d0-d7/a0-a6,-(sp)
                    move.l   #$18,(PRINTX)
                    move.w   #-1,d0
                    bsr.w    PRDEC
                    movem.l  (sp)+,d0-d7/a0-a6
                    rte

WAITBLIT:           btst     #6,(2,a6)
                    bne.b    WAITBLIT
                    rts

BLIT_BIT_MASK:      lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE1),($50,a6)
                    move.l   (BITPLANE2),($4C,a6)
                    move.l   (BITPLANE3),($48,a6)
                    move.l   (BITPLANE6),($54,a6)
                    clr.w    ($64,a6)
                    clr.w    ($62,a6)
                    clr.w    ($60,a6)
                    clr.w    ($66,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$FFE,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #$2014,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE4),($50,a6)
                    move.l   (BITPLANE5),($4C,a6)
                    move.l   (BITPLANE6),($48,a6)
                    move.l   (BITPLANE6),($54,a6)
                    clr.w    ($64,a6)
                    clr.w    ($62,a6)
                    clr.w    ($60,a6)
                    clr.w    ($66,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$FFE,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #$2014,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE6),($50,a6)
                    move.l   (BITPLANE6),($54,a6)
                    clr.w    ($64,a6)
                    clr.w    ($66,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$90F,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #$2014,($58,a6)
                    rts

BLIT_PAGE:          movem.l  d0/d1/a6,-(sp)
                    mulu.w   #5120,d0
                    add.l    (PAGES),d0
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   d0,($50,a6)
                    move.l   #5120,d0
                    add.l    (BITPLANE1A),d0
                    move.l   d0,($54,a6)
                    move.w   #$18,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$1008,($58,a6)
                    moveq    #3,d1
OTHER4PAGES:        bsr.w    WAITBLIT
                    addi.l   #8192,d0
                    move.l   d0,($54,a6)
                    move.w   #$1008,($58,a6)
                    dbra     d1,OTHER4PAGES
                    movem.l  (sp)+,d0/d1/a6
                    rts

BLIT_SCROLL:        movem.l  d0/d1/a6,-(sp)
                    move.l   (SCROLL),d0
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   d0,($50,a6)
                    move.l   #$1413,d0
                    add.l    (BITPLANE1A),d0
                    move.l   d0,($54,a6)
                    move.w   #$1C,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$306,($58,a6)
                    moveq    #3,d1
OTHER4SCROLL:       bsr.w    WAITBLIT
                    addi.l   #$2000,d0
                    move.l   d0,($54,a6)
                    move.w   #$306,($58,a6)
                    dbra     d1,OTHER4SCROLL
                    movem.l  (sp)+,d0/d1/a6
                    rts

BLIT_COMPASS:       movem.l  d0/d1/a6,-(sp)
                    move.l   (COMPASS),d0
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   d0,($50,a6)
                    move.l   #$1420,d0
                    add.l    (BITPLANE1A),d0
                    move.l   d0,($54,a6)
                    move.w   #$20,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$FC4,($58,a6)
                    moveq    #3,d1
OTHER4COMP:         bsr.w    WAITBLIT
                    addi.l   #$2000,d0
                    move.l   d0,($54,a6)
                    move.w   #$FC4,($58,a6)
                    dbra     d1,OTHER4COMP
                    movem.l  (sp)+,d0/d1/a6
                    rts

BLIT_BASE:          movem.l  d0/d1/a6,-(sp)
                    move.l   (BASE),d0
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   d0,($50,a6)
                    move.l   #$1D4B,d0
                    add.l    (BITPLANE1A),d0
                    move.l   d0,($54,a6)
                    move.w   #$1C,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$146,($58,a6)
                    moveq    #3,d1
OTHER4bas:          bsr.w    WAITBLIT
                    addi.l   #8192,d0
                    move.l   d0,($54,a6)
                    move.w   #$146,($58,a6)
                    dbra     d1,OTHER4bas
                    movem.l  (sp)+,d0/d1/a6
                    rts

BLIT_HEALTH:        movem.l  d0-d5/a6,-(sp)
                    lea      ($DFF000),a6
                    move.w   (LEAR_HEALTH),d1
                    move.l   #$15F3,d3
                    move.l   (LEARIC),d4
                    bsr.w    SHOW_H
                    move.w   (LEAN_HEALTH),d1
                    move.l   #$15F9,d3
                    move.l   (LEANORIC),d4
                    bsr.w    SHOW_H
                    movem.l  (sp)+,d0-d5/a6
                    rts

SHOW_H:             tst.w    d1
                    beq.w    BLIT_FULL_LEAR
                    move.w   d1,-(sp)
                    move.l   d3,d0
                    add.l    (BITPLANE1A),d0
                    lsl.w    #6,d1
                    ori.w    #2,d1
                    bsr.w    WAITBLIT
                    move.l   d0,($54,a6)
                    move.w   #$24,($66,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   #$100,($40,a6)
                    clr.w    ($42,a6)
                    move.w   d1,($58,a6)
                    moveq    #3,d2
OTHER4CLR:          bsr.w    WAITBLIT
                    addi.l   #$2000,d0
                    move.l   d0,($54,a6)
                    move.w   d1,($58,a6)
                    dbra     d2,OTHER4CLR
                    move.w   (sp)+,d1
                    cmp.w    #$2F,d1
                    beq.w    BLIT_GRAVE
BLIT_FULL_LEAR:     move.l   d4,d0
                    bsr.w    WAITBLIT
                    move.l   d0,($50,a6)
                    move.l   d3,d0
                    add.l    (BITPLANE1A),d0
                    move.w   d1,d2
                    mulu.w   #$28,d2
                    add.w    d2,d0
                    move.l   d0,($54,a6)
                    move.w   #$2F,d2
                    sub.w    d1,d2
                    lsl.w    #6,d2
                    ori.w    #2,d2
                    move.w   d2,d1
                    move.w   #$24,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   d1,($58,a6)
                    moveq    #3,d2
OTHER4HL1:          bsr.w    WAITBLIT
                    addi.l   #8192,d0
                    addi.l   #$BC,d4
                    move.l   d4,($50,a6)
                    move.l   d0,($54,a6)
                    move.w   d1,($58,a6)
                    dbra     d2,OTHER4HL1
                    rts

BLIT_GRAVE:         movem.l  d0/d1/a6,-(sp)
                    move.l   (GRAVE),d0
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    addi.l   #$320,d3
                    move.l   d0,($50,a6)
                    add.l    (BITPLANE1A),d3
                    move.l   d3,($54,a6)
                    move.w   #$24,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$89F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #$FF00,($46,a6)
                    move.w   #$6C2,($58,a6)
                    moveq    #4-1,d1
OTHER4GRAVE:        bsr.w    WAITBLIT
                    addi.l   #8192,d3
                    move.l   d3,($54,a6)
                    move.w   #$6C2,($58,a6)
                    dbra     d1,OTHER4GRAVE
                    movem.l  (sp)+,d0/d1/a6
                    rts

CLEAR_5_PLANE:      lea      ($DFF000),a6
                    movea.l  a1,a5
                    move.l   d1,d2
                    bsr.w    SCRADD
                    bsr.w    WAITBLIT
                    move.l   d1,($54,a6)
                    move.l   d1,d3
                    move.l   d2,d1
                    swap     d1
                    move.w   #40,d0
                    sub.w    d1,d0
                    move.w   #$24,($66,a6)
                    move.w   #$1F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($46,a6)
                    lsl.w    #6,d2
                    lsr.w    #1,d1
                    or.w     d1,d2
                    move.w   d2,($58,a6)
                    moveq    #4-1,d5
CLOTHER4:           bsr.w    WAITBLIT
                    addi.l   #8192,d3
                    move.l   d3,($54,a6)
                    move.w   d2,($58,a6)
                    dbra     d5,CLOTHER4
                    rts

BLIT_5_PLANE:       lea      (COMP_SPACE),a6
                    move.b   (a6,d7.w),d7
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   d1,d4
                    swap     d4
                    mulu.w   d1,d4
                    move.l   a0,($50,a6)
                    movea.l  a1,a5
                    move.l   d1,d2
                    bsr.w    SCRADD
                    move.l   d1,($54,a6)
                    move.l   d1,d3
                    move.l   d2,d1
                    swap     d1
                    move.w   #$28,d0
                    sub.w    d1,d0
                    move.w   d0,($66,a6)
                    clr.w    ($64,a6)
                    move.w   #$1F0,d6
                    lsr.w    #1,d7
                    bcc.w    BLBLNK
                    ori.w    #$800,d6
                    adda.w   d4,a0
BLBLNK:             move.w   d6,($40,a6)
                    clr.w    ($42,a6)
                    clr.w    ($74,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    lsl.w    #6,d2
                    lsr.w    #1,d1
                    or.w     d1,d2
                    move.w   d2,($58,a6)
                    moveq    #4-1,d5
OTHER4:             bsr.w    WAITBLIT
                    addi.l   #8192,d3
                    move.l   a0,($50,a6)
                    lsr.w    #1,d7
                    bcs.w    O4BLNK
                    andi.w   #$F7FF,d6
                    bra.w    O4SET

O4BLNK:             ori.w    #$800,d6
                    adda.w   d4,a0
O4SET:              move.w   d6,($40,a6)
                    move.l   d3,($54,a6)
                    clr.w    ($74,a6)
                    move.w   d2,($58,a6)
                    dbra     d5,OTHER4
                    rts

BLIT_5_PLANE_MAS:   lea      (COMP_SPACE),a6
                    move.b   (a6,d7.w),d7
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   a0,($50,a6)
                    movea.l  a2,a5
                    move.l   d1,d2
                    bsr.w    SCRADD
                    move.l   d1,($4C,a6)
                    move.l   d1,d6
                    move.l   d2,d1
                    movea.l  a1,a5
                    bsr.w    SCRADD
                    move.l   d1,($54,a6)
                    move.l   d1,($48,a6)
                    move.l   d1,d3
                    move.l   d2,d1
                    swap     d1
                    move.w   #$28,d0
                    sub.w    d1,d0
                    move.w   d0,($66,a6)
                    move.w   d0,($62,a6)
                    move.w   d0,($60,a6)
                    clr.w    ($64,a6)
                    move.w   #$FEA,d0
                    lsr.w    #1,d7
                    bcs.w    BM_NP
                    move.l   (crap),($50,a6)
                    bra.w    BM_NP0

BM_NP:              adda.w   #$80,a0
BM_NP0:             move.w   d0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    lsl.w    #6,d2
                    lsr.w    #1,d1
                    or.w     d1,d2
                    clr.w    ($74,a6)
                    move.w   d2,($58,a6)
                    moveq    #4-1,d5
OTHER4_MASKED:      bsr.w    WAITBLIT
                    addi.l   #8192,d3
                    move.l   a0,($50,a6)
                    lsr.w    #1,d7
                    bcs.w    O4BLNKM
                    move.l   (crap),($50,a6)
                    bra.w    O4SETM

O4BLNKM:            adda.w   #$80,a0
O4SETM:             move.w   d0,($40,a6)
                    move.l   d3,($54,a6)
                    move.l   d3,($48,a6)
                    move.l   d6,($4C,a6)
                    clr.w    ($70,a6)
                    move.w   d2,($58,a6)
                    dbra     d5,OTHER4_MASKED
                    rts

CLRBLIT:            lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE1A),d0
                    btst     #0,(BITPLANE_FLAG)
                    beq.w    CLB_1
                    move.l   (BITPLANE1B),d0
CLB_1:              move.l   d0,($54,a6)
                    clr.w    ($66,a6)
                    clr.w    ($42,a6)
                    move.w   #$100,($40,a6)
                    move.w   #$3214,($58,a6)
                    rts

DRAWLINE:           movem.l  d0-d7/a6,-(sp)
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.l   d0,d2
                    swap     d2
                    ror.w    #4,d2
                    andi.w   #$F000,d2
                    ori.w    #$B4A,d2
                    move.w   d2,($40,a6)
                    move.l   d0,d2
                    move.l   d1,d3
                    clr.w    d4
                    sub.w    d2,d3
                    bcc.w    YTOGREATER
                    ori.w    #$100,d4
                    neg.w    d3
YTOGREATER:         swap     d2
                    swap     d3
                    move.w   d3,d5
                    sub.w    d2,d5
                    bcc.w    XTOGREATER
                    ori.w    #$200,d4
                    neg.w    d5
XTOGREATER:         swap     d3
                    cmp.w    d5,d3
                    bcc.w    YDIFGTR
                    move.b   #3,d4
YDIFGTR:            clr.w    d6
                    move.w   #$300,d2
                    and.w    d4,d2
                    beq.w    OCTFND
                    moveq    #3,d6
                    cmp.w    #$300,d2
                    beq.w    OCTFND
                    moveq    #1,d6
                    cmp.w    #$100,d2
                    beq.w    XORFLAG
                    moveq    #2,d6
XORFLAG:            eor.b    d4,d6
OCTFND:             cmp.b    #3,d4
                    bne.w    NORFLAG
                    ori.w    #4,d6
NORFLAG:            add.w    d6,d6
                    add.w    d6,d6
                    addq.w   #1,d6
                    move.w   d6,($42,a6)
                    move.w   #$8000,($74,a6)
                    move.w   #-1,($72,a6)
                    move.w   #$28,($60,a6)
                    move.w   #$28,($66,a6)
                    move.w   d3,d7
                    exg      d5,d3
                    cmp.b    #3,d4
                    bne.w    BOXY
                    exg      d5,d3
                    move.w   d5,d7
BOXY:               lsl.w    #6,d7
                    addq.b   #2,d7
                    add.w    d3,d3
                    move.w   d3,d2
                    sub.w    d5,d2
                    move.w   d2,($52,a6)
                    move.w   d3,d2
                    add.w    d2,d2
                    move.w   d2,($62,a6)
                    move.w   d5,d6
                    add.w    d6,d6
                    add.w    d6,d6
                    sub.w    d6,d2
                    move.w   d2,($64,a6)
                    bsr.w    SCRADD
                    move.l   d1,($48,a6)
                    move.l   d1,($54,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   d7,($58,a6)
                    movem.l  (sp)+,d0-d7/a6
                    rts

ANIM_TAB:           dc.b     0,1,2,1,3,4,5,4,6,7,8,7,10,11,10,9
ANIM3_TAB:          dc.b     0,1,2,1,3,4,5,6,7,8,9,8,13,12,11,10

BLIT_SPRITE:        clr.w    (SPRSHIF)
                    cmp.w    #3,d1
                    bne.w    NORM_SPR
                    lea      (ANIM3_TAB),a0
                    bra.w    THREE_SPR

NORM_SPR:           lea      (ANIM_TAB),a0
THREE_SPR:          move.w   d2,d4
                    add.w    d2,d2
                    add.w    d2,d2
                    adda.w   d2,a0
                    move.l   (CHARACTERS),d2
                    move.w   d1,d5
                    mulu.w   #$4380,d1
                    add.l    d1,d2
                    btst     #0,d4
                    bne.w    MOVINLR
                    move.l   d0,d1
                    lsr.w    #2,d1
                    andi.w   #3,d1
                    moveq    #0,d3
                    move.b   (a0,d1.w),d3
                    swap     d1
                    andi.w   #$F,d1
                    ror.w    #4,d1
                    move.w   d1,(SPRSHIF)
                    bra.w    NOSHIF

MOVINLR:            move.l   d0,d1
                    swap     d1
                    lsr.w    #2,d1
                    andi.w   #3,d1
                    moveq    #0,d3
                    move.b   (a0,d1.w),d3
                    cmp.w    #1,d4
                    beq.w    MVINR
                    cmp.w    #2,d1
                    bne.w    NOSHIF
                    bra.w    SHIF

MVINR:              cmp.w    #3,d1
                    bcs.w    NOSHIF
SHIF:               cmp.w    #3,d5
                    beq.w    NOSHIF
                    move.w   #$8000,(SPRSHIF)
NOSHIF:             move.w   d3,d1
                    mulu.w   #1440,d1
                    add.l    d1,d2
                    move.l   d2,(CHAR_POINTER)
                    move.l   d0,d1
                    tst.w    d1
                    bpl.w    YP_TS
                    cmp.w    #-39,d1
                    bcc.w    TST_XON
OFF_SC:             rts

YP_TS:              cmp.w    #128,d1
                    bcc.w    OFF_SC
TST_XON:            swap     d1
                    tst.w    d1
                    bpl.w    XP_TS
                    cmp.w    #-32,d1
                    bcc.w    SPR_OK
                    rts

XP_TS:              cmp.w    #$140,d1
                    bcc.w    OFF_SC
SPR_OK:             lea      ($DFF000),a6
                    move.l   d0,-(sp)
                    bsr.w    GENERATE_SPRITE_
                    bsr.w    WAITBLIT
                    move.l   (MASK_BUFFER),($50,a6)
                    move.l   (SP_MASK_BUF),($54,a6)
                    clr.w    ($64,a6)
                    clr.w    ($62,a6)
                    clr.w    ($60,a6)
                    clr.w    ($66,a6)
                    move.w   #$90F,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #$A03,($58,a6)
                    move.l   (sp)+,d0
                    tst.w    d0
                    bpl.w    NOT_TOO_HI
                    move.w   d0,d7
                    neg.w    d7
                    lsl.w    #6,d7
                    ori.w    #3,d7
                    bsr.w    WAITBLIT
                    move.l   (SP_MASK_BUF),($54,a6)
                    move.w   #$100,($40,a6)
                    move.w   d7,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (SP_MASK_BUF),($50,a6)
                    move.l   (MASK_BUFFER),($54,a6)
                    move.w   #$90F,($40,a6)
                    move.w   d7,($58,a6)
                    bra.w    ON_SCy

NOT_TOO_HI:         cmp.w    #$59,d0
                    bcs.w    ON_SCy
                    move.w   d0,d7
                    subi.w   #$58,d7
                    move.l   (SP_MASK_BUF),d1
                    addi.l   #$F0,d1
                    move.w   d7,d2
                    mulu.w   #6,d2
                    sub.l    d2,d1
                    lsl.w    #6,d7
                    ori.w    #3,d7
                    bsr.w    WAITBLIT
                    move.l   d1,($54,a6)
                    move.w   #$100,($40,a6)
                    move.w   d7,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   d1,($50,a6)
                    move.l   (MASK_BUFFER),d1
                    addi.l   #$F0,d1
                    sub.l    d2,d1
                    move.l   d1,($54,a6)
                    move.w   #$90F,($40,a6)
                    move.w   d7,($58,a6)
ON_SCy:             move.l   d0,d7
                    swap     d7
                    tst.w    d7
                    bpl.w    RIGHT_BLEED
                    cmp.w    #$FFF0,d7
                    bcs.w    BLL_2
                    bsr.w    WAITBLIT
                    move.l   (SP_MASK_BUF),($54,a6)
                    move.w   #$100,($40,a6)
                    move.w   #4,($66,a6)
                    move.w   #$A01,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (SP_MASK_BUF),($50,a6)
                    move.l   (MASK_BUFFER),($54,a6)
                    move.w   #$90F,($40,a6)
                    move.w   #4,($64,a6)
                    move.w   #$A01,($58,a6)
                    bra.w    ON_SC

BLL_2:              bsr.w    WAITBLIT
                    move.l   (SP_MASK_BUF),($54,a6)
                    move.w   #$100,($40,a6)
                    move.w   #2,($66,a6)
                    move.w   #$A02,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (SP_MASK_BUF),($50,a6)
                    move.l   (MASK_BUFFER),($54,a6)
                    move.w   #$90F,($40,a6)
                    move.w   #2,($64,a6)
                    move.w   #$A02,($58,a6)
                    bra.w    ON_SC

RIGHT_BLEED:        cmp.w    #$120,d7
                    bcs.w    ON_SC
                    cmp.w    #$130,d7
                    bcs.w    BLR_1
                    move.l   (SP_MASK_BUF),d1
                    addq.l   #2,d1
                    bsr.w    WAITBLIT
                    move.l   d1,($54,a6)
                    move.w   #$100,($40,a6)
                    move.w   #2,($66,a6)
                    move.w   #$A02,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   d1,($50,a6)
                    move.l   (MASK_BUFFER),d1
                    addq.l   #2,d1
                    move.l   d1,($54,a6)
                    move.w   #$90F,($40,a6)
                    move.w   #2,($64,a6)
                    move.w   #$A02,($58,a6)
                    bra.w    ON_SC

BLR_1:              move.l   (SP_MASK_BUF),d1
                    addq.l   #4,d1
                    bsr.w    WAITBLIT
                    move.l   d1,($54,a6)
                    move.w   #$100,($40,a6)
                    move.w   #4,($66,a6)
                    move.w   #$A01,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   d1,($50,a6)
                    move.l   (MASK_BUFFER),d1
                    addq.l   #4,d1
                    move.l   d1,($54,a6)
                    move.w   #$90F,($40,a6)
                    move.w   #4,($64,a6)
                    move.w   #$A01,($58,a6)
ON_SC:              movea.l  (SCREEN),a5
                    bsr.w    SCRADD
                    movea.l  d1,a5
                    move.l   (CHAR_POINTER),d2
                    moveq    #4,d5
ALL_SPRITES:        bsr.w    WAITBLIT
                    clr.w    ($42,a6)
                    clr.w    ($64,a6)
                    clr.w    ($62,a6)
                    clr.w    ($66,a6)
                    move.l   d2,($50,a6)
                    move.l   (SP_MASK_BUF),($4C,a6)
                    move.l   (SP_BUFFER),($54,a6)
                    move.w   (SPRSHIF),d0
                    ori.w    #$DC0,d0
                    move.w   d0,($40,a6)
                    move.w   #$A03,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   a5,($50,a6)
                    tst.w    (SPRSHIF)
                    beq.w    NOSH2
                    move.w   (a5),d1
NOSH2:              move.l   (MASK_BUFFER),($4C,a6)
                    move.l   (SP_BUFFER),($48,a6)
                    move.l   a5,($54,a6)
                    move.w   #$22,($64,a6)
                    move.w   #$22,($66,a6)
                    move.w   #$FEA,($40,a6)
                    move.w   #$A03,($58,a6)
                    addi.l   #$F0,d2
                    tst.w    (SPRSHIF)
                    beq.w    NOSH3
                    move.w   d1,(a5)
NOSH3:              adda.w   #8192,a5
                    dbra     d5,ALL_SPRITES
                    rts

GENERATE_SPRITE_:   bsr.w    WAITBLIT
                    move.l   (CHAR_POINTER),d7
                    addi.l   #$4B0,d7
                    move.l   d7,($50,a6)
                    move.l   (MASK_BUFFER),($54,a6)
                    move.w   #0,($64,a6)
                    move.w   #0,($66,a6)
                    clr.w    ($42,a6)
                    move.w   d0,-(sp)
                    move.w   (SPRSHIF),d0
                    ori.w    #$9F0,d0
                    move.w   d0,($40,a6)
                    move.w   (sp)+,d0
                    move.w   #$A03,($58,a6)
                    movea.l  (BITPLANE6),a5
                    move.l   d0,d7
                    bsr.w    PLAYADD
                    move.l   d7,d0
                    tst.w    d0
                    bpl.w    YM_ONSC
YM_NOS:             suba.w   #200,a1
                    addi.w   #32,d0
                    bmi.w    YM_NOS
YM_ONSC:            tst.l    d0
                    bpl.w    XM_ONSC
                    swap     d0
XM_NOS:             subq.l   #2,a1
                    addi.w   #32,d0
                    bmi.w    XM_NOS
                    swap     d0
XM_ONSC:            lsr.w    #5,d0
                    move.w   d0,d1
                    mulu.w   #200,d1
                    swap     d0
                    lsr.w    #4,d0
                    andi.w   #$FFFE,d0
                    add.w    d0,d1
                    move.w   d7,d0
                    andi.w   #$1F,d0
                    addi.w   #$28,d0
                    move.w   d0,d2
                    lea      (DEPTH_TAB),a2
                    move.w   d7,d0
                    andi.w   #$1F,d0
                    cmp.w    #$19,d0
                    bcs.w    DEEP_2
                    clr.w    d6
                    move.w   (a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S0_3D1
                    cmp.w    d3,d2
                    bcs.w    S0_3D
S0_3D1:             bset     #0,d6
S0_3D:              move.w   (2,a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S1_3D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S1_3D
S1_3D1:             bset     #1,d6
S1_3D:              addi.w   #$C8,d1
                    subi.w   #$20,d2
                    move.w   (a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S2_3D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S2_3D
S2_3D1:             bset     #2,d6
S2_3D:              move.w   (2,a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S3_3D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S3_3D
S3_3D1:             bset     #3,d6
S3_3D:              addi.w   #$C8,d1
                    subi.w   #$20,d2
                    move.w   (a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S4_3D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S4_3D
S4_3D1:             bset     #4,d6
S4_3D:              move.w   (2,a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S5_3D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S5_3D
S5_3D1:             bset     #5,d6
S5_3D:              move.l   d7,d0
                    bsr.w    SCRADD
                    andi.b   #$FE,d1
                    swap     d7
                    andi.w   #$10,d7
                    bne.w    ONE_TWO_TWO_3DEE
                    swap     d7
                    andi.w   #$1F,d7
                    move.w   #$20,d3
                    sub.w    d7,d3
                    movea.l  (MASK_BUFFER),a2
                    bsr.w    BLIT_TWO
                    movem.l  d1/a2,-(sp)
                    addq.l   #4,d1
                    addq.l   #4,a2
                    bsr.w    BLIT_ONE
                    movem.l  (sp)+,d1/a2
                    move.w   d3,d7
                    add.w    d3,d3
                    add.w    d7,d3
                    add.w    d3,d3
                    adda.w   d3,a2
                    move.w   d7,d3
                    add.w    d3,d3
                    add.w    d3,d3
                    add.w    d7,d3
                    lsl.w    #3,d3
                    ext.l    d3
                    add.l    d3,d1
                    move.w   #$20,d3
                    bsr.w    BLIT_TWO
                    movem.l  d1/a2,-(sp)
                    addq.l   #4,d1
                    addq.l   #4,a2
                    bsr.w    BLIT_ONE
                    movem.l  (sp)+,d1/a2
                    adda.w   #$C0,a2
                    addi.w   #$500,d1
                    move.w   #8,d3
                    sub.w    d7,d3
                    bsr.w    BLIT_TWO
                    addq.l   #4,d1
                    addq.l   #4,a2
                    bsr.w    BLIT_ONE
                    rts

ONE_TWO_TWO_3DEE:   swap     d7
                    andi.w   #$1F,d7
                    move.w   #$20,d3
                    sub.w    d7,d3
                    movea.l  (MASK_BUFFER),a2
                    bsr.w    BLIT_ONE
                    movem.l  d1/a2,-(sp)
                    addq.l   #2,d1
                    addq.l   #2,a2
                    bsr.w    BLIT_TWO
                    movem.l  (sp)+,d1/a2
                    move.w   d3,d7
                    add.w    d3,d3
                    add.w    d7,d3
                    add.w    d3,d3
                    adda.w   d3,a2
                    move.w   d7,d3
                    add.w    d3,d3
                    add.w    d3,d3
                    add.w    d7,d3
                    lsl.w    #3,d3
                    ext.l    d3
                    add.l    d3,d1
                    move.w   #$20,d3
                    bsr.w    BLIT_ONE
                    movem.l  d1/a2,-(sp)
                    addq.l   #2,d1
                    addq.l   #2,a2
                    bsr.w    BLIT_TWO
                    movem.l  (sp)+,d1/a2
                    adda.w   #$C0,a2
                    addi.w   #$500,d1
                    move.w   #8,d3
                    sub.w    d7,d3
                    bsr.w    BLIT_ONE
                    addq.l   #2,d1
                    adda.l   #2,a2
                    bsr.w    BLIT_TWO
                    rts

DEEP_2:             clr.w    d6
                    move.w   (a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S0_2D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S0_2D
S0_2D1:             bset     #0,d6
S0_2D:              move.w   (2,a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S1_2D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S1_2D
S1_2D1:             bset     #1,d6
S1_2D:              addi.w   #$C8,d1
                    subi.w   #$20,d2
                    move.w   (a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S2_2D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S2_2D
S2_2D1:             bset     #2,d6
S2_2D:              move.w   (2,a1,d1.w),d3
                    andi.w   #$FF,d3
                    move.b   (a2,d3.w),d3
                    bmi.w    S3_2D1
                    addi.w   #$20,d3
                    cmp.w    d3,d2
                    bcs.w    S3_2D
S3_2D1:             bset     #3,d6
S3_2D:              move.l   d7,d0
                    bsr.w    SCRADD
                    andi.b   #$FE,d1
                    swap     d7
                    andi.w   #$10,d7
                    bne.w    ONE_TWO_TWO_2DEE
                    swap     d7
                    andi.w   #$1F,d7
                    move.w   #$20,d3
                    sub.w    d7,d3
                    movea.l  (MASK_BUFFER),a2
                    bsr.w    BLIT_TWO
                    movem.l  d1/a2,-(sp)
                    addq.l   #4,d1
                    addq.l   #4,a2
                    bsr.w    BLIT_ONE
                    movem.l  (sp)+,d1/a2
                    move.w   d3,d7
                    add.w    d3,d3
                    add.w    d7,d3
                    add.w    d3,d3
                    adda.w   d3,a2
                    move.w   d7,d3
                    add.w    d3,d3
                    add.w    d3,d3
                    add.w    d7,d3
                    lsl.w    #3,d3
                    ext.l    d3
                    add.l    d3,d1
                    move.w   #$28,d3
                    sub.w    d7,d3
                    bsr.w    BLIT_TWO
                    movem.l  d1/a2,-(sp)
                    addq.l   #4,d1
                    addq.l   #4,a2
                    bsr.w    BLIT_ONE
                    movem.l  (sp)+,d1/a2
                    rts

ONE_TWO_TWO_2DEE:   swap     d7
                    andi.w   #$1F,d7
                    move.w   #$20,d3
                    sub.w    d7,d3
                    movea.l  (MASK_BUFFER),a2
                    bsr.w    BLIT_ONE
                    movem.l  d1/a2,-(sp)
                    addq.l   #2,d1
                    addq.l   #2,a2
                    bsr.w    BLIT_TWO
                    movem.l  (sp)+,d1/a2
                    move.w   d3,d7
                    add.w    d3,d3
                    add.w    d7,d3
                    add.w    d3,d3
                    adda.w   d3,a2
                    move.w   d7,d3
                    add.w    d3,d3
                    add.w    d3,d3
                    add.w    d7,d3
                    lsl.w    #3,d3
                    ext.l    d3
                    add.l    d3,d1
                    move.w   #$28,d3
                    sub.w    d7,d3
                    bsr.w    BLIT_ONE
                    movem.l  d1/a2,-(sp)
                    addq.l   #2,d1
                    addq.l   #2,a2
                    bsr.w    BLIT_TWO
                    movem.l  (sp)+,d1/a2
                    rts

BLIT_TWO:           lsr.w    #1,d6
                    bcc.w    BLIT_TWO_MASK
                    rts

BLIT_TWO_MASK:      bsr.w    WAITBLIT
                    move.w   #$DCF,($40,a6)
                    move.l   d1,($50,a6)
                    move.l   a2,($4C,a6)
                    move.l   a2,($54,a6)
                    move.w   #$24,($64,a6)
                    move.w   #2,($62,a6)
                    move.w   #2,($66,a6)
                    move.w   d3,d5
                    lsl.w    #6,d5
                    ori.w    #2,d5
                    move.w   d5,($58,a6)
                    rts

BLIT_ONE:           lsr.w    #1,d6
                    bcc.w    BLIT_ONE_MASK
                    rts

BLIT_ONE_MASK:      bsr.w    WAITBLIT
                    move.w   #$DCF,($40,a6)
                    move.l   d1,($50,a6)
                    move.l   a2,($4C,a6)
                    move.l   a2,($54,a6)
                    move.w   #$26,($64,a6)
                    move.w   #4,($62,a6)
                    move.w   #4,($66,a6)
                    move.w   d3,d5
                    lsl.w    #6,d5
                    ori.w    #1,d5
                    move.w   d5,($58,a6)
                    rts

ERA_SPRITE:         move.l   d0,d1
                    tst.w    d1
                    bpl.w    eYP_TS
                    cmp.w    #-39,d1
                    bcc.w    eTST_XON
eOFF_SC:            rts

eYP_TS:             cmp.w    #128,d1
                    bcc.w    eOFF_SC
eTST_XON:           swap     d1
                    tst.w    d1
                    bpl.w    eXP_TS
                    cmp.w    #-32,d1
                    bcc.w    eSPR_OK
                    rts

eXP_TS:             cmp.w    #320,d1
                    bcc.w    eOFF_SC
eSPR_OK:            move.w   #$22,d3
                    move.w   #$A03,d4
                    tst.w    d0
                    bpl.w    eNOT_TOO_HI
                    move.w   d0,d2
                    neg.w    d2
                    move.w   #40,d4
                    sub.w    d2,d4
                    lsl.w    #6,d4
                    ori.w    #3,d4
                    clr.w    d0
                    bra.w    eON_SCy

eNOT_TOO_HI:        cmp.w    #$59,d0
                    bcs.w    eON_SCy
                    move.w   d0,d2
                    subi.w   #$58,d2
                    move.w   #$28,d4
                    sub.w    d2,d4
                    lsl.w    #6,d4
                    ori.w    #3,d4
eON_SCy:            tst.w    d1
                    bpl.w    eRIGHT_BLEED
                    cmp.w    #$FFF0,d1
                    bcs.w    eBLL_2
                    andi.l   #$FFFF,d0
                    move.w   #$24,d3
                    andi.w   #$FFC0,d4
                    ori.w    #2,d4
                    bra.w    eON_SC

eBLL_2:             andi.l   #$FFFF,d0
                    move.w   #$26,d3
                    andi.w   #$FFC0,d4
                    ori.w    #1,d4
                    bra.w    eON_SC

eRIGHT_BLEED:       cmp.w    #$120,d1
                    bcs.w    eON_SC
                    cmp.w    #$130,d1
                    bcs.w    eBLR_1
                    move.w   #$26,d3
                    andi.w   #$FFC0,d4
                    ori.w    #1,d4
                    bra.w    eON_SC

eBLR_1:             move.w   #$24,d3
                    andi.w   #$FFC0,d4
                    ori.w    #2,d4
eON_SC:             movea.l  (SCREEN),a5
                    bsr.w    SCRADD
                    move.l   d1,d2
                    movea.l  (BITPLANE1A),a5
                    btst     #0,(BITPLANE_FLAG)
                    bne.w    ISADUM
                    movea.l  (BITPLANE1B),a5
ISADUM:             bsr.w    SCRADD
                    lea      ($DFF000),a6
                    bsr.w    WAITBLIT
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    move.w   d3,($64,a6)
                    move.w   d3,($66,a6)
                    move.l   d1,($50,a6)
                    move.l   d2,($54,a6)
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   d4,($58,a6)
                    moveq    #3,d3
ERA_LOOP:           bsr.w    WAITBLIT
                    addi.l   #8192,d1
                    addi.l   #8192,d2
                    move.l   d1,($50,a6)
                    move.l   d2,($54,a6)
                    move.w   d4,($58,a6)
                    dbra     d3,ERA_LOOP
                    rts

COPY_SCREENS:       bsr.w    WAITBLIT
                    lea      ($DFF000),a6
                    move.w   #$9F0,($40,a6)
                    clr.w    ($42,a6)
                    move.w   #-1,($44,a6)
                    move.w   #-1,($46,a6)
                    clr.w    ($64,a6)
                    clr.w    ($66,a6)
                    move.l   (BITPLANE1),($50,a6)
                    btst     #0,(BITPLANE_FLAG)
                    bne.w    MOVEATOB
                    move.l   (BITPLANE1B),($54,a6)
                    bra.w    MVSCALL

MOVEATOB:           move.l   (BITPLANE1A),($54,a6)
MVSCALL:            move.w   #$2014,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE2),($50,a6)
                    btst     #0,(BITPLANE_FLAG)
                    bne.w    MOVEATOB2
                    move.l   (BITPLANE2B),($54,a6)
                    bra.w    MVSCALL2

MOVEATOB2:          move.l   (BITPLANE2A),($54,a6)
MVSCALL2:           move.w   #$2014,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE3),($50,a6)
                    btst     #0,(BITPLANE_FLAG)
                    bne.w    MOVEATOB3
                    move.l   (BITPLANE3B),($54,a6)
                    bra.w    MVSCALL3

MOVEATOB3:          move.l   (BITPLANE3A),($54,a6)
MVSCALL3:           move.w   #$2014,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE4),($50,a6)
                    btst     #0,(BITPLANE_FLAG)
                    bne.w    MOVEATOB4
                    move.l   (BITPLANE4B),($54,a6)
                    bra.w    MVSCALL4

MOVEATOB4:          move.l   (BITPLANE4A),($54,a6)
MVSCALL4:           move.w   #$2014,($58,a6)
                    bsr.w    WAITBLIT
                    move.l   (BITPLANE5),($50,a6)
                    btst     #0,(BITPLANE_FLAG)
                    bne.w    MOVEATOB5
                    move.l   (BITPLANE5B),($54,a6)
                    bra.w    MVSCALL5

MOVEATOB5:          move.l   (BITPLANE5A),($54,a6)
MVSCALL5:           move.w   #$2014,($58,a6)
                    rts

SET_FUNNY_LINES:    lea      (LINEDAT),a0
                    lea      (LINESPEED),a2
                    lea      (START_PATTERN),a1
                    moveq    #2,d0
ST_SHAPE:           move.w   d0,(a0)+
                    clr.w    (a0)+
                    clr.w    (a2)+
                    addq.w   #1,d0
                    cmp.w    #$60,d0
                    bne.w    ST_SHAPE
                    move.l   #-1,(a0)+
                    move.l   #-1,(a0)
DRAW_FUNNY_LINES:   bsr.w    CLRBLIT
                    movea.l  (BITPLANE1A),a5
                    btst     #0,(BITPLANE_FLAG)
                    beq.w    D_SA
                    movea.l  (BITPLANE1B),a5
D_SA:               lea      (LINEDAT),a0
D_LINE_L:           move.w   (a0)+,d0
                    swap     d0
                    addq.w   #2,a0
                    move.w   (a0)+,d0
                    addq.w   #2,a0
                    cmpi.w   #-1,(a0)
                    beq.w    LASTLINE
                    move.w   (a0),d1
                    swap     d1
                    move.w   (4,a0),d1
                    cmp.l    d0,d1
                    beq.w    D_LINE_L
                    bsr.w    DRAWLINE
                    bra.w    D_LINE_L

LASTLINE:           move.w   (LINEDAT),d1
                    swap     d1
                    move.w   (LINEDAT+4),d1
                    cmp.l    d0,d1
                    beq.w    NODRAW_L
NODRAW_L:           clr.w    (VBLFLAG)
X_041:              tst.w    (VBLFLAG)
                    beq.w    X_041
                    bsr.w    FLIP_BPL_PTR
                    bsr.w    SET_COPPER_LIST
                    lea      (LINEDAT),a0
                    lea      (LINESPEED),a1
MOVE_POINTS:        cmpi.w   #-1,(a0)
                    beq.w    DRAW_FUNNY_LINES
                    cmpi.w   #$A0,(a0)
                    bcs.w    UPXSPEED
                    subi.w   #$10,(a1)
                    bra.w    XSPE

UPXSPEED:           addi.w   #$10,(a1)
XSPE:               move.w   (a1)+,d0
                    ext.l    d0
                    lsl.w    #4,d0
                    add.l    d0,(a0)+
                    cmpi.w   #$64,(a0)
                    bcs.w    UPYSPEED
                    subi.w   #$10,(a1)
                    bra.w    YSPE

UPYSPEED:           addi.w   #$10,(a1)
YSPE:               move.w   (a1)+,d0
                    ext.l    d0
                    lsl.w    #4,d0
                    add.l    d0,(a0)+
                    bra.w    MOVE_POINTS

START_PATTERN:      dc.w     20,20,100,20,100,160,20,160,-1
LINEDAT:            dcb.w    192,0
LINESPEED:          dcb.w    96,0

GEN_MAZE:           move.w   #$1E32,d2
                    move.w   d2,(START)
                    rts

                    bsr.w    PUSH_BC
                    bsr.w    PLOT_BC
GO_BACK:            bsr.w    POP_BC
                    move.l   (STACKPNT),d0
                    subq.l   #2,d0
                    cmp.l    a2,d0
                    bne.w    NEW_POS
                    rts

NEW_POS:            bsr.w    RND
                    andi.w   #3,d0
                    move.w   d0,(DIR)
                    clr.w    d0
NEW_DIR:            move.w   d0,(FAILURES)
                    move.w   #2,d1
SEARCHLP:           bsr.w    ALLCLEAR
                    tst.b    d0
                    bne.w    FAILURE
                    bsr.w    MOVE_ON
                    bsr.w    PLOT_BC
                    dbra     d1,SEARCHLP
                    bsr.w    PUSH_BC
                    bra.w    NEW_POS

FAILURE:            move.w   (DIR),d0
                    subq.w   #1,d0
                    andi.w   #3,d0
                    move.w   d0,(DIR)
                    move.w   (FAILURES),d0
                    addq.w   #1,d0
                    cmp.w    #4,d0
                    beq.w    GO_BACK
                    bra.w    NEW_DIR

ALLCLEAR:           move.w   (DIR),d0
                    asl.w    #1,d0
                    lea      (MOVE_TAB),a3
                    move.w   d2,d3
                    add.b    (1,a3,d0.w),d3
                    move.w   d3,d4
                    lsr.w    #8,d3
                    add.b    (a3,d0.w),d3
                    lsl.w    #8,d3
                    or.b     d4,d3
                    bra.w    POINT_D3

MOVE_ON:            move.w   (DIR),d0
                    asl.w    #1,d0
                    lea      (MOVE_TAB),a3
                    move.w   d2,d3
                    add.b    (1,a3,d0.w),d3
                    move.b   d3,d2
                    lsr.w    #8,d3
                    add.b    (a3,d0.w),d3
                    lsl.w    #8,d3
                    andi.w   #$FF,d2
                    or.w     d3,d2
                    rts

MOVE_TAB:           dc.b     -1,0,0,1,1,0,0,-1
MOVEL_TAB:          dc.w     -1,0,0,1,1,0,0,-1

PUSH_BC:            move.w   d2,(a2)+
                    rts

POP_BC:             move.w   -(a2),d2
                    rts

PLOT_BC:            bsr.w    MATRIXAD
                    move.b   #1,(1,a3)
                    movem.l  d0/d1/a0,-(sp)
                    movea.l  (SCREEN),a0
                    move.w   d2,d0
                    move.w   d0,d1
                    andi.w   #$FF,d0
                    lsr.w    #8,d1
                    bsr.w    PLOT
                    movem.l  (sp)+,d0/d1/a0
                    rts

POINT_D3:           move.w   d2,-(sp)
                    move.w   d3,d2
                    bsr.w    POINT_BC
                    move.w   (sp)+,d2
                    rts

POINT_BC:           bsr.w    MATRIXAD
POINT_MATRIX:       move.l   d1,-(sp)
                    move.w   #$FF,d0
                    clr.w    d1
                    move.b   (1,a3),d1
                    andi.w   #$FF,d1
                    cmp.w    #$C0,d1
                    bcs.w    PMT1
                    move.w   #$A5,d1
PMT1:               add.w    d1,d1
                    tst.w    (a5,d1.w)
                    bne.w    PMT2
                    addq.w   #1,d0
PMT2:               move.b   ($C9,a3),d1
                    andi.w   #$FF,d1
                    cmp.w    #$C0,d1
                    bcs.w    PMT3
                    move.w   #$A5,d1
PMT3:               add.w    d1,d1
                    tst.w    (a5,d1.w)
                    bne.w    PMT4
                    addq.w   #1,d0
PMT4:               move.b   (-$C7,a3),d1
                    andi.w   #$FF,d1
                    cmp.w    #$C0,d1
                    bcs.w    PMT5
                    move.w   #$A5,d1
PMT5:               add.w    d1,d1
                    tst.w    (a5,d1.w)
                    bne.w    PMT6
                    addq.w   #1,d0
PMT6:               move.b   (3,a3),d1
                    andi.w   #$FF,d1
                    cmp.w    #$C0,d1
                    bcs.w    PMT7
                    move.w   #$A5,d1
PMT7:               add.w    d1,d1
                    tst.w    (a5,d1.w)
                    bne.w    PMT8
                    addq.w   #1,d0
PMT8:               move.b   (-1,a3),d1
                    andi.w   #$FF,d1
                    cmp.w    #$C0,d1
                    bcs.w    PMT9
                    move.w   #$A5,d1
PMT9:               add.w    d1,d1
                    tst.w    (a5,d1.w)
                    bne.w    PMT10
                    addq.w   #1,d0
PMT10:              move.l   (sp)+,d1
                    rts

DO_BORDER:          movea.l  (MATRIX),a3
                    movea.l  a3,a4
                    adda.w   #1,a4
                    move.w   #$2EDF,d2
                    clr.b    (a3)
                    bsr.w    LDIR
                    movea.l  (MATRIX),a3
                    addq.w   #1,a3
                    movea.l  a3,a4
                    addq.w   #2,a4
                    move.w   #$63,d2
                    move.b   #1,(a3)
                    bsr.w    LDIR2
                    movea.l  (MATRIX),a3
                    adda.w   #$2E19,a3
                    movea.l  a3,a4
                    addq.w   #2,a4
                    move.w   #$63,d2
                    move.b   #1,(a3)
                    bsr.w    LDIR2
                    move.w   #$C8,d4
                    movea.l  (MATRIX),a3
                    adda.w   d4,a3
                    move.w   #$39,d3
LEFT_R:             move.b   #1,(1,a3)
                    move.b   #1,($C7,a3)
                    adda.w   d4,a3
                    dbra     d3,LEFT_R
                    rts

MATRIXAD:           move.w   d2,d4
                    lsr.w    #8,d4
                    mulu.w   #200,d4
                    move.w   d2,d5
                    andi.w   #$FF,d5
                    add.w    d5,d5
                    add.w    d5,d4
                    movea.l  (MATRIX),a3
                    adda.w   d4,a3
                    rts

LDIR:               move.b   (a3)+,(a4)+
                    subq.w   #1,d2
                    bne.b    LDIR
                    rts

LDIR2:              move.b   (a3)+,(a4)+
                    addq.w   #1,a3
                    addq.w   #1,a4
                    subq.w   #1,d2
                    bne.b    LDIR2
                    rts

PLOT_MAZE:          lea      (CHRCOLTAB),a5
                    movea.l  (SCREEN),a0
                    movea.l  (MATRIX),a1
                    moveq    #0,d1
PM_0:               moveq    #0,d0
PM_1:               move.w   (a1)+,d2
                    andi.w   #$FF,d2
                    cmp.w    #$C0,d2
                    bcs.w    PM_2
                    move.w   #$A5,d2
PM_2:               add.w    d2,d2
                    tst.w    (a5,d2.w)
                    beq.w    NOPL_MZ
                    bsr.w    PLOT
NOPL_MZ:            addq.w   #1,d0
                    cmp.w    #100,d0
                    bne.w    PM_1
                    addq.w   #1,d1
                    cmp.w    #60,d1
                    bne.b    PM_0
                    rts

FIND_ROUTE:         move.w   (START),d0
                    movea.l  (STACKPNT),a4
                    move.w   (TARGET),d1
                    cmp.w    d0,d1
                    beq.w    ROUTE_ERROR
                    clr.w    (BAD_NUM)
                    move.l   #$12340004,d5
                    move.w   d0,d2
SEARCH_LOOP:        move.l   d5,(a4)+
                    move.w   d2,(a4)+
                    cmpa.l   (BIG_STACK),a4
                    bcc.w    FOUND_ROUTEx
                    subq.w   #1,d3
                    bne.w    C_ON_MAZE
                    move.l   a4,(MAZEA4)
                    move.l   d5,(MAZED5)
                    move.w   d2,(MAZEBC)
                    rts

RE_ENT_MAZE:        movea.l  (MAZEA4),a4
                    move.l   (MAZED5),d5
                    move.w   (MAZEBC),d2
C_ON_MAZE:          move.l   d5,d6
                    swap     d6
                    andi.w   #3,d6
ROAD_LOOP:          bsr.w    MOVE_ROAD
                    cmp.w    (TARGET),d2
                    beq.w    FOUND_ROUTE
                    bsr.w    NEIGHBOURS
                    bsr.w    POINT_MATRIX
                    btst     #0,d4
                    beq.w    DEAD_END
                    cmp.w    #2,d0
                    bcs.w    DEAD_END
                    bne.w    JUNCTION
                    bsr.w    CALCDIR
                    bra.w    ROAD_LOOP

JUNCTION:           bsr.w    LOOP_SRCH
                    bcs.w    DEAD_END
                    move.w   d6,d5
                    eori.w   #2,d5
                    movem.l  d0/d1/d6,-(sp)
                    move.w   (TARGET),d0
                    move.w   d2,d1
                    lsr.w    #8,d0
                    lsr.w    #8,d1
                    sub.b    d0,d1
                    ext.w    d1
                    swap     d1
                    move.w   (TARGET),d0
                    move.w   d2,d1
                    sub.b    d0,d1
                    ext.w    d1
                    move.w   d1,d0
                    swap     d1
                    moveq    #0,d6
                    tst.w    d1
                    bpl.w    MD_D
                    neg.w    d1
                    eori.w   #2,d6
MD_D:               swap     d6
                    move.w   #3,d6
                    tst.w    d0
                    bpl.w    MD_R
                    neg.w    d0
                    eori.w   #2,d6
MD_R:               cmp.w    d1,d0
                    bcc.w    XISCHN
                    swap     d6
XISCHN:             move.w   d5,d0
                    cmp.w    d6,d0
                    beq.w    SETD1
                    move.w   d6,-(sp)
SETD1:              swap     d6
                    cmp.w    d6,d0
                    beq.w    SETD2
                    move.w   d6,-(sp)
SETD2:              swap     d6
                    eori.w   #2,d6
                    cmp.w    d6,d0
                    beq.w    SETD3
                    move.w   d6,-(sp)
SETD3:              swap     d6
                    eori.w   #2,d6
                    cmp.w    d6,d0
                    beq.w    SETD4
                    move.w   d6,-(sp)
SETD4:              moveq    #0,d5
                    move.w   (sp)+,d6
                    andi.w   #$F,d6
                    or.w     d6,d5
                    move.w   (sp)+,d6
                    andi.w   #$F,d6
                    lsl.w    #4,d5
                    or.w     d6,d5
                    move.w   (sp)+,d6
                    andi.w   #$F,d6
                    lsl.w    #4,d5
                    or.w     d6,d5
                    lsl.w    #4,d5
                    movem.l  (sp)+,d0/d1/d6
                    swap     d5
                    move.w   #4,d5
                    bra.w    NXTDIR

DEAD_END1:          movea.l  (SCREEN),a0
                    adda.w   #340,a0
                    move.w   #-1,d0
                    bsr.w    PRDEC
DEAD_END:           bsr.w    UNSTACK_POSN
                    beq.w    ROUTE_ERROR
NXTDIR:             swap     d5
                    lsr.w    #4,d5
                    swap     d5
                    subq.w   #1,d5
                    bne.w    SEARCH_LOOP
                    move.w   d0,-(sp)
                    move.w   (BAD_NUM),d0
                    movea.l  (BAD_JUNS),a3
                    tst.w    d0
                    beq.w    ADD_BAD
ST_JL:              cmp.w    (a3)+,d2
                    beq.w    NO_AD_BAD
                    subq.w   #1,d0
                    bne.w    ST_JL
ADD_BAD:            move.w   d2,(a3)
                    cmpa.l   (BIG_BAD),a3
                    bcc.w    FOUND_ROUTEy
                    addq.w   #1,(BAD_NUM)
NO_AD_BAD:          move.w   (sp)+,d0
                    bra.w    DEAD_END

FOUND_ROUTEy:       move.w   (sp)+,d0
FOUND_ROUTEx:       moveq    #7,d3
FOUND_ROUTE:        move.l   #$4FFFF,(a4)+
                    move.w   d2,(a4)+
                    rts

ROUTE_ERROR:        move.w   #10,d3
                    rts

CALCDIR:            lea      (LASTMASK),a3
                    and.b    (a3,d6.w),d4
                    moveq    #4,d6
                    ror.w    #1,d4
CDIR1:              subq.w   #1,d6
                    ror.w    #1,d4
                    bcc.w    CDIR1
                    rts

LASTMASK:           dc.b     $1A,$1C,$0E,$16

MOVE_ROAD:          move.w   d6,d0
                    asl.w    #1,d0
                    lea      (MOVE_TAB),a3
                    move.w   d2,d1
                    add.b    (1,a3,d0.w),d1
                    move.b   d1,d2
                    lsr.w    #8,d1
                    add.b    (a3,d0.w),d1
                    lsl.w    #8,d1
                    andi.w   #$FF,d2
                    or.w     d1,d2
                    rts

UNSTACK_POSN:       move.w   -(a4),d2
                    move.l   -(a4),d5
                    move.l   (STACKPNT),d7
                    subq.l   #6,d7
                    cmp.l    a4,d7
                    rts

LOOP_SRCH:          movea.l  (BAD_JUNS),a3
                    move.l   d0,-(sp)
                    move.w   (BAD_NUM),d0
                    beq.w    L_SH1
                    subq.w   #1,d0
L_SH0:              cmp.w    (a3)+,d2
                    dbeq     d0,L_SH0
                    beq.w    SR_ERR
L_SH1:              movea.l  (STACKPNT),a3
                    move.l   a4,d0
                    sub.l    a3,d0
                    beq.w    NO_LOOP
                    divu.w   #6,d0
                    subq.w   #1,d0
SRCH_LOOP:          addq.l   #4,a3
                    cmp.w    (a3)+,d2
                    dbeq     d0,SRCH_LOOP
                    bne.w    NO_LOOP
SR_ERR:             move.l   (sp)+,d0
                    ori.b    #1,ccr
                    rts

NO_LOOP:            move.l   (sp)+,d0
                    andi.b   #$FE,ccr
                    rts

NEIGHBOURS:         lea      (CHRCOLTAB),a5
                    move.w   d0,-(sp)
                    clr.w    d0
                    move.w   d5,-(sp)
                    bsr.w    MATRIXAD
                    move.w   (sp)+,d5
                    clr.w    d4
                    move.b   (1,a3),d0
                    cmp.w    #$C0,d0
                    bcs.w    NH1
                    move.w   #$A5,d0
NH1:                add.w    d0,d0
                    tst.w    (a5,d0.w)
                    bne.w    NEIG1
                    ori.b    #1,d4
NEIG1:              move.b   (-$C7,a3),d0
                    cmp.w    #$C0,d0
                    bcs.w    NH2
                    move.w   #$A5,d0
NH2:                add.w    d0,d0
                    tst.w    (a5,d0.w)
                    bne.w    NEIG2
                    ori.b    #$10,d4
NEIG2:              move.b   (3,a3),d0
                    cmp.w    #$C0,d0
                    bcs.w    NH3
                    move.w   #$A5,d0
NH3:                add.w    d0,d0
                    tst.w    (a5,d0.w)
                    bne.w    NEIG3
                    ori.b    #8,d4
NEIG3:              move.b   ($C9,a3),d0
                    cmp.w    #$C0,d0
                    bcs.w    NH4
                    move.w   #$A5,d0
NH4:                add.w    d0,d0
                    tst.w    (a5,d0.w)
                    bne.w    NEIG4
                    ori.b    #4,d4
NEIG4:              move.b   (-1,a3),d0
                    cmp.w    #$C0,d0
                    bcs.w    NH5
                    move.w   #$A5,d0
NH5:                add.w    d0,d0
                    tst.w    (a5,d0.w)
                    bne.w    NEIG5
                    ori.b    #2,d4
NEIG5:              move.w   (sp)+,d0
                    rts

SHOW_MOVE:          movem.l  d0/d1/a0,-(sp)
                    movea.l  (BITPLANE2),a0
                    move.w   d2,d0
                    move.w   d0,d1
                    andi.w   #$FF,d0
                    lsr.w    #8,d1
                    bsr.w    PLOT
                    movem.l  (sp)+,d0/d1/a0
                    rts

PLOT_RT:            movem.l  d0/d1/a0,-(sp)
                    movea.l  (BITPLANE4),a0
                    move.w   d2,d0
                    move.w   d0,d1
                    andi.w   #$FF,d0
                    lsr.w    #8,d1
                    bsr.w    PLOT
                    movea.l  (BITPLANE1),a0
                    bsr.w    UNPLOT
                    movem.l  (sp)+,d0/d1/a0
                    rts

DRAW_ROUTE:         move.w   (START),d2
                    movea.l  (STACKPNT),a4
D_R1:               move.l   (a4)+,d5
                    move.w   (a4)+,d2
                    move.l   d5,d6
                    swap     d6
                    andi.w   #3,d6
D_R2:               bsr.w    PLOT_RT
                    bsr.w    MOVE_ROAD
                    cmp.w    (TARGET),d2
                    beq.w    D_RX
                    bsr.w    NEIGHBOURS
                    bsr.w    POINT_MATRIX
                    cmp.w    #2,d0
                    bne.w    D_R1
                    bsr.w    CALCDIR
                    bra.w    D_R2

D_RX:               rts

                    dc.w     0
FILE_INFO_BLOCK:    dcb.l    2,0
BRUSH_NAME:         dcb.b    380,0
MAT_NAME:           dc.b     'MATRIX',0,0
;HERBNAME:           dc.b     'HERB',0,0
BRNAME:             dc.b     'BRUSH',0
;chr_NAME:           dc.b     'CHR',0
DISKNAME:           dc.b     'DF1:',0,0
hexbuf:             dc.b     '00000000',$A,0
FULL:               dc.b     'FULL',0,0
EMPTY:              dc.b     'EMPTY',0,0
                    dcb.b    3,0
GR_NAME:            dc.b     'GRAPHICS',0,0
PAGE_NAME:          dc.b     'PAGE'
PAGE_NUM:           dc.b     "X.B",0
;LR_NAME:            dc.b     'LEARX.CHR',0
;LN_NAME1:           dc.b     'LEANX.CHR',0
;HK_NAME:            dc.b     'HEIKX.CHR',0
;VG_NAME:            dc.b     'MANX.CHR',0,0
SCR_NAME:           dc.b     'SCROLL.BRUSH',0,0
LEA_NAME:           dc.b     'LEARIC.BRUSH',0,0
LEAN_NAME:          dc.b     'LEANORIC.BRUSH',0,0
COMP_NAME:          dc.b     'COMPASS.BRUSH',0
BASE_NAME:          dc.b     'BASE.BRUSH',0,0
GRAVE_NAME:         dc.b     'GRAVE.BRUSH',0
;BPL_NAME:           dc.b     'COMP',0,0
SCRN_NAME:          dc.b     'TS',0,0
MUS_NAME:           dc.b     'mzfeud',0,0
MUS_NAME2:          dc.b     'mzfeud60',0,0
ENDCLI:             dc.b     'EndCLI',0,0
allhb_name:         dc.b     'allhb',0
allch_name:         dc.b     'allch',0
                    even

PRD0HEX32a:         movem.l  d0-d7/a0-a6,-(sp)
                    lea      (hexbuf),a0
                    move.l   a6,d0
                    rol.l    #8,d0
                    bsr.w    PRD0HEX8a
                    rol.l    #8,d0
                    bsr.w    PRD0HEX8a
                    rol.l    #8,d0
                    bsr.w    PRD0HEX8a
                    rol.l    #8,d0
                    bsr.w    PRD0HEX8a
                    move.l   (OUTHANDLE),d1
                    move.l   #hexbuf,d2
                    move.l   #10,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-48,a6)
                    movea.l  (sp)+,a6
                    movem.l  (sp)+,d0-d7/a0-a6
                    rts

PRD0HEX8a:          move.w   d0,-(sp)
                    lsr.b    #4,d0
                    bsr.w    PRD0HEX4a
                    move.w   (sp)+,d0
                    move.w   d0,-(sp)
                    andi.b   #$F,d0
                    bsr.w    PRD0HEX4a
                    move.w   (sp)+,d0
                    rts

PRD0HEX4a:          addi.b   #'0',d0
                    cmp.b    #':',d0
                    bcs.w    prdoh1a
                    addq.b   #7,d0
prdoh1a:            andi.w   #$FF,d0
                    move.b   d0,(a0)+
                    rts

BACKLOAD:           dc.w     0

;COMP_FILE:          movea.l  (GRAPHIC),a1
;                    move.w   #$11F,d0
;TST_BPL0:           moveq    #4,d1
;TST_BPL1:           moveq    #$1F,d2
;                    moveq    #0,d5
;TST_BPL:            or.l     (a1)+,d5
;                    dbra     d2,TST_BPL
;                    tst.l    d5
;                    bne.w    BPL_USED
;                    movea.l  a1,a2
;                    suba.w   #$80,a1
;                    movea.l  a1,a3
;                    move.l   (CHARACTERS),d5
;SHRINK:             cmp.l    a2,d5
;                    beq.w    EDITEND
;                    move.l   (a2)+,(a1)+
;                    bra.w    SHRINK

;EDITEND:            subi.l   #$80,d5
;                    move.l   d5,(CHARACTERS)
;                    movea.l  a3,a1
;BPL_USED:           dbra     d1,TST_BPL1
;                    dbra     d0,TST_BPL0
;                    move.l   #GR_NAME,d1
;                    move.l   #$3EE,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-30,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,(FILE)
;                    beq.w    W_ERROR
;                    move.l   d0,d1
;                    move.l   (GRAPHIC),d2
;                    move.l   (CHARACTERS),d3
;                    sub.l    d2,d3
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-48,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,-(sp)
;                    move.l   (FILE),d1
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-36,a6)
;                    movea.l  (sp)+,a6
;                    move.l   (sp)+,d0
;                    cmp.l    #-1,d0
;                    beq.w    W_ERROR
;                    rts

GET_MUSIC:          move.l   #MUS_NAME,d1
                    cmpi.w   #50,(hertz)
                    beq.w    g_muz1
                    move.l   #MUS_NAME2,d1
g_muz1:             move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    move.l   d0,d1
                    move.l   (BITPLANE1B),d2
                    move.l   #2164,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    rts

;GET_GRAPHICS:       movea.l  (GRAPHIC),a6
;                    clr.w    (BACKLOAD)
BR_LOOP:            move.l   (OUTHANDLE),d0
                    move.l   (DISKNAME),d1
                    move.l   #-2,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-84,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(LOCK)
                    beq.w    LD_LEND
                    move.l   d0,d1
                    move.l   #FILE_INFO_BLOCK,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-102,a6)
                    movea.l  (sp)+,a6
IS_IT_BRUSH:        tst.l    d0
                    beq.w    LD_LEND
                    lea      (BRUSH_NAME),a0
                    clr.l    d3
BR_DOT:             move.b   (a0)+,d0
                    addq.w   #1,d3
                    tst.b    d0
                    beq.w    LD_BRUSH_NEXT
                    cmp.b    #".",d0
                    bne.w    BR_DOT
                    movea.l  a0,a1
                    suba.w   #1,a1
SRAGIN:             move.b   -(a1),d0
                    cmp.b    #'a',d0
                    bcs.w    ISNUM
                    cmp.b    #'z'+1,d0
                    bcs.w    SRAGIN
ISNUM:              cmp.b    #'0',d0
                    bcs.w    TRYLET
                    cmp.b    #'9'+1,d0
                    bcc.w    TRYLET
                    move.b   -(a1),d0
                    bra.w    ISNUM

TRYLET:             cmp.b    #$66,d0
                    bne.w    BACKTEST
                    tst.w    (BACKLOAD)
                    bne.w    LD_BRUSH_NEXT
                    bra.w    ALL_BR

BACKTEST:           tst.w    (BACKLOAD)
                    beq.w    LD_BRUSH_NEXT
ALL_BR:             lea      (BRNAME),a1
BR_T_LOOP:          move.b   (a0)+,d0
                    addq.w   #1,d3
                    andi.b   #$DF,d0
                    cmp.b    (a1)+,d0
                    bne.w    LD_BRUSH_NEXT
                    tst.b    d0
                    bne.w    BR_T_LOOP
                    move.b   #0,(a0)
                    subq.w   #1,a1
                    move.b   #10,(a0)
                    move.l   a0,-(sp)
                    addq.w   #1,d3
                    move.l   d4,d1
                    move.l   #BRUSH_NAME,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-48,a6)
                    movea.l  (sp)+,a6
                    bsr.w    PRD0HEX32a
                    movea.l  (sp)+,a0
                    move.b   #0,(a0)
                    lea      (BRUSH_NAME),a0
                    move.l   d4,-(sp)
                    bsr.w    LOAD_BRUSH
                    move.l   (sp)+,d4
LD_BRUSH_NEXT:      move.l   (LOCK),d1
                    move.l   #FILE_INFO_BLOCK,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-108,a6)
                    movea.l  (sp)+,a6
                    bra.w    IS_IT_BRUSH

LD_LEND:            move.l   (LOCK),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-90,a6)
                    movea.l  (sp)+,a6
                    tst.w    (BACKLOAD)
                    bne.w    LDBREX
                    lea      (FULL),a0
                    bsr.w    LOAD_BRUSH
                    lea      (EMPTY),a0
                    bsr.w    LOAD_BRUSH
                    move.l   a6,(BACKGROUND)
                    move.w   #-1,(BACKLOAD)
                    bra.w    BR_LOOP

LDBREX:             rts

OPEN_PAGES:         move.b   #'0',(PAGE_NUM)
PAGE_LOOP:          movea.l  #PAGE_NAME,a0
                    move.l   a6,-(sp)
                    bsr.w    LOAD_BRUSH
                    movea.l  (sp)+,a6
                    adda.l   #5120,a6
                    move.b   (PAGE_NUM),d0
                    addq.b   #2,d0
                    move.b   d0,(PAGE_NUM)
                    cmp.b    #'8',d0
                    bne.w    PAGE_LOOP
PAGNOTX:            rts

OPEN_SCROLL:        movea.l  #SCR_NAME,a0
                    bsr.w    LOAD_BRUSH
                    rts

OPEN_LEARIC:        movea.l  #LEA_NAME,a0
                    bsr.w    LOAD_BRUSH
                    rts

OPEN_LEANORIC:      movea.l  #LEAN_NAME,a0
                    bsr.w    LOAD_BRUSH
                    rts

OPEN_COMPASS:       movea.l  #COMP_NAME,a0
                    bsr.w    LOAD_BRUSH
                    rts

OPEN_BASE:          movea.l  #BASE_NAME,a0
                    bsr.w    LOAD_BRUSH
                    rts

OPEN_GRAVE:         movea.l  #GRAVE_NAME,a0
                    bsr.w    LOAD_BRUSH
                    rts

OPEN_SCREEN:        movea.l  #SCRN_NAME,a0
                    bsr.w    LOAD_SCREEN
                    rts

GET_CHARACTERS:     move.l   #allch_name,d1
                    move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    beq.w    W_ERROR
                    move.l   d0,d1
                    move.l   a6,d2
                    move.l   #$20000,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    adda.l   d0,a6
                    move.l   d0,-(sp)
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    move.l   (sp)+,d0
                    cmp.l    #-1,d0
                    beq.w    W_ERROR
                    rts

;                    movea.l  #LN_NAME1,a1
;                    bsr.w    CHR_ALL
;                    movea.l  #LR_NAME,a1
;                    bsr.w    CHR_ALL
;                    movea.l  #HK_NAME,a1
;                    bsr.w    CHR_ALL
;                    bra.w    VG_GET

;CHR_ALL:            move.b   #$31,d0
;MAN_LOOP:           move.b   d0,(4,a1)
;                    move.l   a1,-(sp)
;                    move.l   a6,-(sp)
;                    movea.l  a1,a0
;                    bsr.w    LOAD_BRUSH
;                    movea.l  (sp)+,a0
;                    bsr.w    CREATE_CHR_MASK
;                    movea.l  (sp)+,a1
;                    move.b   (4,a1),d0
;                    addq.b   #1,d0
;                    cmp.b    #'d',d0
;                    beq.w    MANNOTX
;                    cmp.b    #':',d0
;                    bne.w    MAN_LOOP
;                    move.b   #'a',d0
;                    bra.w    MAN_LOOP

;MANNOTX:            rts
;
;VG_GET:             movea.l  #VG_NAME,a1
;VG_ALL:             move.b   #$31,d0
;VG_LOOP:            move.b   d0,(3,a1)
;                    move.l   a1,-(sp)
;                    move.l   a6,-(sp)
;                    movea.l  a1,a0
;                    bsr.w    LOAD_BRUSH
;                    movea.l  (sp)+,a0
;                    bsr.w    CREATE_CHR_MASK
;                    movea.l  (sp)+,a1
;                    move.b   (3,a1),d0
;                    addq.b   #1,d0
;                    cmp.b    #$66,d0
;                    beq.w    VGNOTX
;                    cmp.b    #$3A,d0
;                    bne.w    VG_LOOP
;                    move.b   #$61,d0
;                    bra.w    VG_LOOP
;
;VGNOTX:             move.l   #allch_name,d1
;                    move.l   #$3EE,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-30,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,(FILE)
;                    beq.w    W_ERROR
;                    move.l   d0,d1
;                    move.l   (CHARACTERS),d2
;                    move.l   a6,d3
;                    sub.l    d2,d3
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-48,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,-(sp)
;                    move.l   (FILE),d1
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-36,a6)
;                    movea.l  (sp)+,a6
;                    move.l   (sp)+,d0
;                    cmp.l    #-1,d0
;                    beq.w    W_ERROR
;                    rts

;                    rts

GET_HERBS:          move.l   #allhb_name,d1
                    move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    beq.w    W_ERROR
                    move.l   d0,d1
                    move.l   a6,d2
                    move.l   #65536,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    adda.l   d0,a6
                    move.l   d0,-(sp)
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    move.l   (sp)+,d0
                    cmp.l    #-1,d0
                    beq.w    W_ERROR
                    rts

;                    move.l   (OUTHANDLE),d0
;                    move.l   (DISKNAME),d1
;                    move.l   #-2,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-84,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,(LOCK)
;                    beq.w    LD_HERBEND
;                    move.l   d0,d1
;                    move.l   #FILE_INFO_BLOCK,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-102,a6)
;                    movea.l  (sp)+,a6
;IS_IT_herb:         tst.l    d0
;                    beq.w    LD_HERBEND
;                    lea      (BRUSH_NAME),a0
;                    clr.l    d3
;HERB_DOT:           move.b   (a0)+,d0
;                    addq.w   #1,d3
;                    tst.b    d0
;                    beq.w    LD_HERB_NEXT
;                    cmp.b    #'.',d0
;                    bne.w    HERB_DOT
;                    lea      (HERBNAME),a1
;HERB_T_LOOP:        move.b   (a0)+,d0
;                    addq.w   #1,d3
;                    andi.b   #$DF,d0
;                    cmp.b    (a1)+,d0
;                    bne.w    LD_HERB_NEXT
;                    tst.b    d0
;                    bne.w    HERB_T_LOOP
;                    move.b   #0,(a0)
;                    suba.w   #1,a1
;                    move.b   #10,(a0)
;                    move.l   a0,-(sp)
;                    addq.w   #1,d3
;                    move.l   (OUTHANDLE),d1
;                    move.l   #BRUSH_NAME,d2
;                    movea.l  (sp)+,a0
;                    move.b   #0,(a0)
;                    lea      (BRUSH_NAME),a0
;                    move.l   d4,-(sp)
;                    bsr.w    LOAD_BRUSH
;                    move.l   (sp)+,d4
;LD_HERB_NEXT:       move.l   (LOCK),d1
;                    move.l   #FILE_INFO_BLOCK,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-108,a6)
;                    movea.l  (sp)+,a6
;                    bra.w    IS_IT_herb

;LD_HERBEND:         move.l   (LOCK),d1
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-90,a6)
;                    movea.l  (sp)+,a6
;                    move.l   #allhb_name,d1
;                    move.l   #$3EE,d2
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-30,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,(FILE)
;                    beq.w    W_ERROR
;                    move.l   d0,d1
;                    move.l   (HERBS),d2
;                    move.l   a6,d3
;                    sub.l    d2,d3
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-48,a6)
;                    movea.l  (sp)+,a6
;                    move.l   d0,-(sp)
;                    move.l   (FILE),d1
;                    move.l   a6,-(sp)
;                    movea.l  (DISCBASE),a6
;                    jsr      (-36,a6)
;                    movea.l  (sp)+,a6
;                    move.l   (sp)+,d0
;                    cmp.l    #-1,d0
;                    beq.w    W_ERROR
;                    rts

;                    rts

GET_GRBLOCK:        move.l   #GR_NAME,d1
                    move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    move.l   d0,d1
                    move.l   (GRAPHIC),d2
                    move.l   #150016,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    rts

OPEN_MATRIX:        move.l   #MAT_NAME,d1
                    move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    beq.w    MATNOTX
                    move.l   d0,d1
                    move.l   (MATRIX),d2
                    move.l   #12000,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    move.w   #1,d0
MATNOTX:            rts

W_ERROR:            lea      ($DFF000),a6
                    move.l   #$291,($180,a6)
                    rts

LOAD_SCREEN:        move.l   a0,d1
                    move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    beq.w    GTERR
                    move.l   d0,d1
                    move.l   (DISC_BUFFER),d2
                    move.l   #$8000,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
                    movea.l  (DISC_BUFFER),a1
                    bsr.w    WORD_TO_BUF
                    cmpi.l   #'FORM',(WORD_BUF)
                    bne.w    GTERR
                    adda.l   #2,a1
                    bsr.w    WORD_TO_BUF
                    move.w   (a1)+,d0
                    move.w   (a1)+,d1
                    move.w   (a1)+,d2
                    addq.w   #6,a1
                    move.w   (a1)+,d7
                    subq.w   #8,d0
                    adda.w   d0,a1
STEST1:             bsr.w    GET_AND_TEST
                    beq.w    CONVERT_SC
                    adda.w   (a1)+,a1
                    bra.w    STEST1

CONVERT_SC:         movea.l  a6,a0
                    move.w   d2,(GDEPTH)
                    adda.l   #2,a1
                    move.w   d1,d3
                    move.w   d3,d4
                    lsr.w    #3,d3
                    andi.w   #15,d4
                    bne.w    CS1
                    subq.w   #1,d3
CS1:                move.w   d3,d4
                    andi.w   #$FFFE,d4
                    addq.w   #2,d4
                    move.w   d4,(GWIDTH)
                    mulu.w   d2,d4
                    movea.l  a0,a2
                    adda.l   #8192,a2
                    movea.l  a2,a3
                    adda.l   #8192,a3
                    movea.l  a3,a4
                    adda.l   #8192,a4
                    movea.l  a4,a5
                    adda.l   #8192,a5
                    bra.w    SCREEN_FUDGE

LOAD_BRUSH:         move.l   a0,d1
                    move.l   #$3ED,d2
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-30,a6)
                    movea.l  (sp)+,a6
                    move.l   d0,(FILE)
                    beq.w    GTERR
                    move.l   d0,d1
                    move.l   (DISC_BUFFER),d2
                    move.l   #32768,d3
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-42,a6)
                    movea.l  (sp)+,a6
                    move.l   (FILE),d1
                    move.l   a6,-(sp)
                    movea.l  (DISCBASE),a6
                    jsr      (-36,a6)
                    movea.l  (sp)+,a6
BRUSH_TEST:         movea.l  (DISC_BUFFER),a1
                    bsr.w    WORD_TO_BUF
                    cmpi.l   #'FORM',(WORD_BUF)
                    bne.w    GTERR
                    addq.l   #2,a1
                    bsr.w    WORD_TO_BUF
                    move.w   (a1)+,d0
                    move.w   (a1)+,d1
                    move.w   (a1)+,d2
                    adda.w   #6,a1
                    move.w   (a1)+,d7
                    subq.w   #8,d0
                    adda.w   d0,a1
BTEST1:             bsr.w    GET_AND_TEST
                    beq.w    CONVERT_BRUSH
                    adda.w   (a1)+,a1
                    bra.w    BTEST1

CONVERT_BRUSH:      movea.l  a6,a0
                    move.w   d2,(GDEPTH)
                    adda.l   #2,a1
                    move.w   d1,d3
                    move.w   d3,d4
                    lsr.w    #3,d3
                    andi.w   #$F,d4
                    bne.w    CB1
                    subq.w   #1,d3
CB1:                move.w   d3,d4
                    andi.w   #$FFFE,d4
                    addq.w   #2,d4
                    move.w   d4,(GWIDTH)
                    mulu.w   d2,d4
                    movea.l  a0,a2
                    adda.l   d4,a2
                    movea.l  a2,a3
                    adda.l   d4,a3
                    movea.l  a3,a4
                    adda.l   d4,a4
                    movea.l  a4,a5
                    adda.l   d4,a5
SCREEN_FUDGE:       tst.w    d7
                    bne.w    COMPRESSED
                    lsr.w    #1,d3
                    move.w   d3,d5
NC20:               move.w   (a1)+,(a0)+
                    dbra     d3,NC20
                    move.w   d5,d3
NC21:               move.w   (a1)+,(a2)+
                    dbra     d3,NC21
                    move.w   d5,d3
NC22:               move.w   (a1)+,(a3)+
                    dbra     d3,NC22
                    move.w   d5,d3
NC23:               move.w   (a1)+,(a4)+
                    dbra     d3,NC23
                    move.w   d5,d3
NC24:               move.w   (a1)+,(a5)+
                    dbra     d3,NC24
                    move.w   d5,d3
                    subq.w   #1,d2
                    bne.w    NC20
                    movea.l  a5,a6
                    rts

COMPRESSED:         move.w   d3,d5
COMP1:              movea.l  a0,a6
                    bsr.w    DECOMP_LINE
                    movea.l  a6,a0
                    movea.l  a2,a6
                    bsr.w    DECOMP_LINE
                    movea.l  a6,a2
                    movea.l  a3,a6
                    bsr.w    DECOMP_LINE
                    movea.l  a6,a3
                    movea.l  a4,a6
                    bsr.w    DECOMP_LINE
                    movea.l  a6,a4
                    movea.l  a5,a6
                    bsr.w    DECOMP_LINE
                    movea.l  a6,a5
                    subq.w   #1,d2
                    bne.w    COMP1
                    rts

DECOMP_LINE:        move.b   (a1)+,d0
                    ext.w    d0
                    tst.w    d0
                    bmi.w    ISCOMP
L_NC:               move.b   (a1)+,(a6)+
                    subq.w   #1,d3
                    dbra     d0,L_NC
                    tst.w    d3
                    bpl.w    DECOMP_LINE
                    move.w   d5,d3
                    rts

ISCOMP:             neg.w    d0
L_ISC:              move.b   (a1),(a6)+
                    subq.w   #1,d3
                    dbra     d0,L_ISC
                    addq.w   #1,a1
                    tst.w    d3
                    bpl.w    DECOMP_LINE
                    move.w   d5,d3
                    rts

SET_COLOURS:        movea.l  (DISC_BUFFER),a1
                    bsr.w    WORD_TO_BUF
                    addq.w   #2,a1
                    lea      ($DFF180),a0
                    move.w   #32-1,d0
GET_CMAP:           bsr.w    WORD_TO_BUF
                    cmpi.l   #'CMAP',(WORD_BUF)
                    beq.w    START_LOAD
                    adda.w   (a1)+,a1
                    bra.w    GET_CMAP

START_LOAD:         addq.w   #2,a1
COL_LOOP:           clr.w    d1
                    move.b   (a1)+,d1
                    asl.w    #4,d1
                    or.b     (a1)+,d1
                    clr.w    d2
                    move.b   (a1)+,d2
                    lsr.w    #4,d2
                    or.w     d2,d1
                    move.w   d1,(a0)+
                    dbra     d0,COL_LOOP
                    rts

GET_AND_TEST:       bsr.w    WORD_TO_BUF
                    cmpi.l   #'BODY',(WORD_BUF)
                    rts

WORD_TO_BUF:        lea      (WORD_BUF),a2
WTB1:               move.b   (a1),(a2)+
                    tst.b    (a1)+
                    bne.w    WTB1
                    addq.l   #1,a1
                    rts

WORD_BUF:           dcb.l    3,0

CREATE_CHR_MASK:    move.w   #$F0,d0
                    movea.l  a0,a1
                    adda.w   d0,a1
                    movea.l  a1,a2
                    adda.w   d0,a2
                    movea.l  a2,a3
                    adda.w   d0,a3
                    movea.l  a3,a4
                    adda.w   d0,a4
                    subq.w   #1,d0
MASK_LOOP:          move.b   (a0)+,d1
                    or.b     (a1)+,d1
                    or.b     (a2)+,d1
                    or.b     (a3)+,d1
                    or.b     (a4)+,d1
                    not.b    d1
                    move.b   d1,(a6)+
                    dbra     d0,MASK_LOOP
                    rts

NEWSCREEN:          movea.l  (crap),a0
                    moveq    #0,d0
                    move.w   #32-1,d1
FILCR:              move.l   d0,(a0)+
                    dbra     d1,FILCR
                    bsr.w    FLIP_BPL_PTR
                    lea      (GR_ADDRESSES),a3
                    move.w   (PLAYFIELDY),d0
                    move.w   d0,d2
                    mulu.w   #200,d0
                    move.w   (PLAYFIELDX),d3
                    asl.w    #1,d3
                    add.w    d3,d0
                    movea.l  (PLAYFIELD),a2
                    adda.w   d0,a2
                    moveq    #0,d0
NS_L1:              swap     d0
NS_L2:              movea.l  (SCREEN),a1
                    movea.l  (GRAPHIC),a0
                    move.w   (a2)+,d4
                    andi.w   #$FF,d4
                    cmp.w    #192,d4
                    bcs.w    NOTHERB
                    movem.l  d0-d4/a0-a3,-(sp)
                    move.l   #$40020,d1
                    bsr.w    CLEAR_5_PLANE
                    movem.l  (sp)+,d0-d4/a0-a3
                    move.l   #$20010,d1
                    subi.w   #$C0,d4
                    lea      (HERB_CONV_TAB),a0
                    move.b   (a0,d4.w),d4
                    andi.w   #$FF,d4
                    mulu.w   #160,d4
                    add.l    (HERBS),d4
                    movea.l  d4,a0
                    movem.l  d0-d3/a0-a3,-(sp)
                    addi.l   #$80008,d0
                    moveq    #1,d7
                    bsr.w    BLIT_5_PLANE
                    movem.l  (sp)+,d0-d3/a0-a3
                    bra.w    HERBADD

NOTHERB:            move.l   #$40020,d1
                    cmp.w    #$A3,d4
                    bne.w    NH_1
                    move.w   #3,d4
                    bra.w    NH_2

NH_1:               cmp.w    #$A4,d4
                    bne.w    NH_2
                    move.w   #$4B,d4
NH_2:               move.w   d4,d7
                    add.w    d4,d4
                    move.w   (a3,d4.w),d4
                    andi.l   #$FFFF,d4
                    lsl.l    #2,d4
                    adda.l   d4,a0
                    movem.l  d0-d3/a0-a3,-(sp)
                    bsr.w    BLIT_5_PLANE
                    movem.l  (sp)+,d0-d3/a0-a3
HERBADD:            swap     d0
                    addi.w   #32,d0
                    cmp.w    #320,d0
                    bne.w    NS_L1
                    adda.w   #180,a2
                    clr.w    d0
                    swap     d0
                    addi.w   #32,d0
                    cmp.w    #128,d0
                    bne.w    NS_L2
                    bsr.w    BLIT_BIT_MASK
                    move.w   (PLAYFIELDY),d0
                    move.w   d0,d2
                    mulu.w   #200,d0
                    move.w   (PLAYFIELDX),d3
                    asl.w    #1,d3
                    add.w    d3,d0
                    movea.l  (PLAYFIELD),a2
                    adda.w   d0,a2
                    moveq    #0,d0
NS_L1_BAK:          swap     d0
NS_L2_BAK:          move.l   #$40020,d1
                    movea.l  (SCREEN),a1
                    movea.l  (GRAPHIC),a0
                    move.w   (a2)+,d4
                    lsr.w    #8,d4
                    addi.w   #$A3,d4
                    move.w   d4,d7
                    add.w    d4,d4
                    move.w   (a3,d4.w),d4
                    andi.l   #$FFFF,d4
                    lsl.l    #2,d4
                    adda.l   d4,a0
                    movem.l  d0-d3/a0-a3,-(sp)
                    movea.l  (BITPLANE6),a2
                    bsr.w    BLIT_5_PLANE_MAS
                    movem.l  (sp)+,d0-d3/a0-a3
                    swap     d0
                    addi.w   #32,d0
                    cmp.w    #320,d0
                    bne.w    NS_L1_BAK
                    adda.w   #180,a2
                    clr.w    d0
                    swap     d0
                    addi.w   #32,d0
                    cmp.w    #128,d0
                    bne.w    NS_L2_BAK
                    clr.w    (VBLFLAG)
X_088:              tst.w    (VBLFLAG)
                    beq.w    X_088
                    bsr.w    SET_COPPER_LIST
                    clr.w    (VBLFLAG)
X_089:              tst.w    (VBLFLAG)
                    beq.w    X_089
                    bra.w    COPY_SCREENS

BLIT_CURRENT:       movem.l  d0-d2/a0/a1/a5,-(sp)
                    move.w   (CURNUM),d0
                    mulu.w   #640,d0
                    move.l   #$40020,d1
                    movea.l  (SCREEN),a1
                    movea.l  (GRAPHIC),a0
                    tst.w    (BACK_FLAG)
                    beq.w    ISFORE
                    movea.l  (BACKGROUND),a0
ISFORE:             adda.l   d0,a0
                    move.l   #$F00084,d0
                    bsr.w    BLIT_5_PLANE
                    movem.l  (sp)+,d0-d2/a0/a1/a5
                    rts

FLIP_BPL_PTR:       bchg     #0,(BITPLANE_FLAG)
                    beq.w    SBL_0
                    move.l   (SCREENA),(SCREEN)
                    move.l   (BITPLANE1A),(BITPLANE1)
                    move.l   (BITPLANE2A),(BITPLANE2)
                    move.l   (BITPLANE3A),(BITPLANE3)
                    move.l   (BITPLANE4A),(BITPLANE4)
                    move.l   (BITPLANE5A),(BITPLANE5)
                    rts

SBL_0:              move.l   (SCREENB),(SCREEN)
                    move.l   (BITPLANE1B),(BITPLANE1)
                    move.l   (BITPLANE2B),(BITPLANE2)
                    move.l   (BITPLANE3B),(BITPLANE3)
                    move.l   (BITPLANE4B),(BITPLANE4)
                    move.l   (BITPLANE5B),(BITPLANE5)
                    rts

MOVE_MAP:           addi.w   #$18,d1
                    lsr.w    #5,d0
                    lsr.w    #5,d1
                    mulu.w   #200,d1
                    add.w    d0,d0
                    add.w    d1,d0
                    subi.w   #200+2,d0
                    movea.l  (MATRIX),a0
                    lea      (CHRCOLTAB),a1
                    bsr.w    MOVE_HLINE
                    addi.w   #200,d0
                    bsr.w    MOVE_HLINE
                    addi.w   #200,d0
MOVE_HLINE:         bsr.w    STCHR
                    addq.w   #2,d0
                    bsr.w    STCHR
                    addq.w   #2,d0
                    bsr.w    STCHR
                    subq.w   #4,d0
                    adda.w   #$24,a2
                    rts

STCHR:              clr.w    d1
                    move.b   (1,a0,d0.w),d1
                    cmp.w    #$C0,d1
                    bcs.w    NOTHERBCOL
                    move.w   #$A5,d1
NOTHERBCOL:         add.w    d1,d1
                    move.w   (a1,d1.w),d2
                    clr.w    d3
                    moveq    #3,d5
STHLOOP:            moveq    #3,d4
STLLOP:             clr.b    (a2,d3.w)
                    rol.w    #1,d2
                    scs      (a2,d3.w)
                    addq.w   #1,d3
                    dbra     d4,STLLOP
                    addq.w   #8,d3
                    dbra     d5,STHLOOP
                    addq.w   #4,a2
                    rts

HARD_SPRITES:       lea      (SPRITE1),a0
                    lea      (TEMPSPRITES),a1
                    moveq    #8-1,d2
SET_SPTR:           movea.l  (a0)+,a2
                    clr.l    (a2)
                    clr.l    (4,a2)
                    move.l   a2,(a1)+
                    dbra     d2,SET_SPTR
                    moveq    #0,d6
                    lea      (SPRITES),a0
                    lea      (YTAB),a1
                    clr.l    (a1)
                    clr.l    (4,a1)
                    move.w   (a0)+,d7
                    beq.w    NOSPRITES
SPYS:               move.w   (a0)+,d0
                    move.w   (a0)+,d1
                    beq.w    HS_OFFS
                    lsr.w    #5,d1
                    addq.b   #1,(a1,d1.w)
                    addq.w   #1,d6
HS_OFFS:            addq.w   #2,a0
                    subq.w   #1,d7
                    bne.w    SPYS
                    tst.w    d6
                    beq.w    NOSPRITES
ST_SP_LOOP:         move.b   (a1)+,d6
                    ext.w    d6
                    beq.w    NXTLINE
                    subq.w   #1,d6
                    cmp.w    #4,d6
                    bcs.w    NUF_ONLIN
                    moveq    #3,d6
NUF_ONLIN:          clr.w    d5
                    lea      (SPRITES+2),a0
                    lea      (TEMPSPRITES),a3
YAGIN:              move.w   (a0)+,d0
                    move.w   (a0),d1
                    andi.w   #$FFE0,d1
                    cmp.w    d1,d7
                    beq.w    SP_FOUND
                    addq.w   #4,a0
                    bra.w    YAGIN

SP_FOUND:           move.w   (a0)+,d1
                    move.w   (a0)+,d2
                    lea      (SPRADDS),a2
                    add.w    (ANINUM),d2
                    add.w    d2,d2
                    add.w    d2,d2
                    movea.l  (a2,d2.w),a2
SP_DIDNT_GO:        movea.l  (a3,d5.w),a4
                    movea.l  (4,a3,d5.w),a6
                    cmp.w    (4,a4),d1
                    bcc.w    SPONSC
                    addq.w   #8,d5
                    cmp.w    #$20,d5
                    bcc.w    CANT_FITTEMON
                    dbra     d6,SP_DIDNT_GO
                    bra.w    NXTLINE

CANT_FITTEMON:      addq.w   #1,d6
                    mulu.w   #6,d6
                    adda.w   d6,a0
                    bra.w    NXTLINE

SPONSC:             ror.w    #1,d0
                    move.w   d1,d2
                    lsl.w    #8,d2
                    move.b   d0,d2
                    move.w   d2,(a4)+
                    move.w   d2,(a6)+
                    movea.l  a4,a5
                    addq.w   #2,a5
                    move.l   a6,-(sp)
                    addq.w   #2,a6
                    move.w   d1,d2
                    addq.w   #4,d2
                    move.l   (a2)+,(a5)+
                    move.l   (a2)+,(a6)+
                    move.l   (a2)+,(a5)+
                    move.l   (a2)+,(a6)+
                    move.l   (a2)+,(a5)+
                    move.l   (a2)+,(a6)+
                    move.l   (a2)+,(a5)+
                    move.l   (a2)+,(a6)+
SPLOOP:             addq.w   #1,d2
                    move.l   (a2)+,(a5)+
                    move.l   (a2)+,(a6)+
                    bne.w    SPLOOP
                    move.w   d2,(a5)
                    move.w   d2,(a6)
                    subq.w   #1,d2
                    subq.w   #4,a5
                    move.l   a5,(a3,d5.w)
                    subq.w   #4,a6
                    move.l   a6,(4,a3,d5.w)
                    movea.l  (sp)+,a6
                    move.w   d2,d3
                    lsl.w    #8,d3
                    btst     #8,d2
                    beq.w    NSTOP
                    ori.w    #2,d3
NSTOP:              btst     #8,d1
                    beq.w    NSTART
                    ori.w    #4,d3
NSTART:             btst     #15,d0
                    beq.w    NHSTART
                    ori.w    #1,d3
NHSTART:            move.w   d3,(a4)
                    ori.w    #$80,d3
                    move.w   d3,(a6)
NX_SPRITE:          addi.w   #8,d5
                    dbra     d6,YAGIN
NXTLINE:            addi.w   #32,d7
                    cmp.w    #6*32,d7
                    bne.w    ST_SP_LOOP
NOSPRITES:          rts

CLEAR_HARD_SPRIT:   lea      (SPRITE1),a0
                    moveq    #8-1,d0
CHS_L:              movea.l  (a0)+,a1
                    clr.l    (a1)
                    dbra     d0,CHS_L
                    rts

MOVE_HIM:           cmpi.w   #$2F,(LEAN_HEALTH)
                    beq.w    NOHGO
                    tst.w    (FREEZEHIM)
                    beq.w    MH_1
NOHGO:              rts

MH_1:               move.w   (HISDIR),d3
                    cmp.w    #4,d3
                    bcs.w    H_CURR_DIR
                    beq.w    H_EXIT
                    cmp.w    #5,d3
                    bne.w    H_EXIT
                    movea.l  (STACKPNT),a4
                    move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    andi.w   #$FFE0,d0
                    andi.w   #$FFE0,d1
                    move.w   d0,(HISXPOS)
                    move.w   d1,(HISYPOS)
ROUTE_LOOP:         move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    lsr.w    #5,d0
                    lsr.w    #5,d1
                    move.w   d1,d2
                    move.w   d1,d3
                    move.w   d1,d4
                    move.w   d1,d5
                    subq.w   #1,d2
                    addq.w   #1,d5
                    lsl.w    #8,d2
                    lsl.w    #8,d3
                    lsl.w    #8,d4
                    lsl.w    #8,d5
                    move.b   d0,d2
                    move.b   d0,d3
                    move.b   d0,d4
                    move.b   d0,d5
                    subq.b   #1,d3
                    addq.b   #1,d4
                    suba.l   a6,a6
                    movea.l  a4,a5
                    move.l   (a5)+,d0
                    move.w   (a5)+,d1
                    cmp.w    #-1,d0
                    beq.w    NOSHORT
SH_TEST:            move.l   (a5)+,d0
                    move.w   (a5)+,d1
                    cmp.w    #-1,d0
                    beq.w    SH_CUT
                    cmp.w    d1,d2
                    beq.w    SH_N
                    cmp.w    d1,d4
                    beq.w    SH_E
                    cmp.w    d1,d5
                    beq.w    SH_S
                    cmp.w    d1,d3
                    bne.w    SH_TEST
                    moveq    #3,d6
                    move.w   d3,d7
                    movea.l  a5,a6
                    bra.w    SH_TEST

SH_S:               moveq    #2,d6
                    move.w   d5,d7
                    movea.l  a5,a6
                    bra.w    SH_TEST

SH_E:               moveq    #1,d6
                    move.w   d4,d7
                    movea.l  a5,a6
                    bra.w    SH_TEST

SH_N:               moveq    #0,d6
                    move.w   d2,d7
                    movea.l  a5,a6
                    bra.w    SH_TEST

SH_CUT:             cmpa.l   #0,a6
                    beq.w    NOSHORT
                    subq.l   #6,a6
                    movea.l  a6,a4
                    move.w   d6,d5
                    move.w   d7,d2
                    move.w   d6,d3
                    swap     d5
                    move.w   d6,(HISDIR)
                    move.w   d2,(MAZE_BC)
                    move.l   a4,(MAZEA4)
                    move.l   d5,(MAZED5)
                    rts

NOSHORT:            move.l   (a4)+,d5
                    move.w   (a4)+,d2
                    move.l   d5,d6
                    cmp.w    #-1,d5
                    bne.w    S_R_OK
                    move.w   #4,d6
                    bra.w    S_R_EX

S_R_OK:             swap     d6
S_RD_L:             andi.w   #3,d6
S_R_EX:             move.w   d6,(HISDIR)
                    cmp.w    #4,d6
                    beq.w    H_EXIT
                    bsr.w    MOVE_ROAD
                    move.w   d2,(MAZE_BC)
                    move.l   a4,(MAZEA4)
                    move.l   d5,(MAZED5)
                    rts

H_CURR_DIR:         tst.w    (LIGHTFLAG)
                    beq.w    HIM_NOLIGHT
                    tst.w    (LIG_TARGET)
                    bne.w    HIM_NOLIGHT
                    move.w   (LIGXPOS),d0
                    move.w   (LIGYPOS),d1
                    move.w   (MYXPOS),d2
                    addi.w   #12,d2
                    move.w   (MYYPOS),d3
                    addi.w   #$10,d3
                    moveq    #1,d4
                    sub.w    d0,d2
                    bcc.w    LGH_1
                    neg.w    d2
                    moveq    #3,d4
LGH_1:              moveq    #2,d5
                    sub.w    d1,d3
                    bcc.w    LGH_2
                    neg.w    d3
                    moveq    #0,d5
LGH_2:              cmp.w    d2,d3
                    bcs.w    LGH_3
                    move.w   d5,d4
LGH_3:              move.w   d4,(HLIGDIR)
                    rts

HIM_NOLIGHT:        move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    add.w    d3,d3
                    add.w    d3,d3
                    lea      (MOVE2_TAB),a1
                    tst.w    (SWIFTHIM)
                    beq.w    H_NO_SW
                    lea      (MOVE4_TAB),a1
H_NO_SW:            add.w    (a1,d3.w),d1
                    add.w    (2,a1,d3.w),d0
                    move.w   d0,(HISXPOS)
                    move.w   d1,(HISYPOS)
                    move.w   d0,d2
                    or.w     d1,d2
                    andi.w   #$1F,d2
                    bne.w    H_EXIT
                    move.w   (MAZE_BC),d2
                    movea.l  (MAZEA4),a4
                    move.l   (MAZED5),d5
                    bsr.w    NEIGHBOURS
                    bsr.w    POINT_MATRIX
                    cmp.w    #2,d0
                    bne.w    ROUTE_LOOP
                    move.w   (HISDIR),d6
                    bsr.w    CALCDIR
                    bra.w    S_RD_L

H_EXIT:             rts

MOVE_ME:            cmpi.w   #$2F,(LEAR_HEALTH)
                    beq.w    IM_FROZEN
                    tst.w    (MIX_FLAG)
                    bne.w    IM_FROZEN
                    lea      (MY_TEMPMAT),a0
                    move.w   #36-1,d2
ss:                 clr.l    (a0)+
                    dbra     d2,ss
                    lea      (MY_TEMPMAT),a4
                    move.w   (MYXPOS),d3
                    move.w   (MYYPOS),d4
                    addi.w   #$18,d4
                    andi.w   #$1F,d3
                    andi.w   #$1F,d4
                    ori.w    #$20,d3
                    ori.w    #$20,d4
                    move.w   d4,d5
                    lsr.w    #3,d3
                    lsr.w    #3,d4
                    lea      (MY_MOVEMAT),a0
                    mulu.w   #12,d4
                    add.w    d4,d3
                    not.b    (a0,d3.w)
                    not.b    (1,a0,d3.w)
                    not.b    (2,a0,d3.w)
                    not.b    (3,a0,d3.w)
                    addi.w   #12,d3
                    not.b    (a0,d3.w)
                    not.b    (1,a0,d3.w)
                    not.b    (2,a0,d3.w)
                    not.b    (3,a0,d3.w)
                    move.w   (FUDLR),d2
                    btst     #0,d2
                    beq.w    NOT_RIGHT
                    move.w   #1,(MYDIR)
                    tst.w    (FREEZEME)
                    bne.w    IM_FROZEN
                    move.w   d0,d3
                    andi.w   #7,d3
                    bne.w    NO_R_CTEST
                    move.w   (MYXPOS),d3
                    move.w   (MYYPOS),d4
                    addi.w   #$18,d4
                    andi.w   #$1F,d3
                    andi.w   #$1F,d4
                    ori.w    #$20,d3
                    ori.w    #$20,d4
                    move.w   d4,d5
                    lsr.w    #3,d3
                    lsr.w    #3,d4
                    lea      (MY_MOVEMAT),a0
                    mulu.w   #12,d4
                    add.w    d4,d3
                    addq.w   #4,d3
                    moveq    #1,d6
                    andi.w   #7,d5
                    beq.w    R_YNOTUP
                    addq.w   #1,d6
R_YNOTUP:           not.b    (a4,d3.w)
                    tst.b    (a0,d3.w)
                    bne.w    NOT_LEFT
                    addi.w   #12,d3
                    dbra     d6,R_YNOTUP
NO_R_CTEST:         add.w    (MOVE_STEP),d0
                    cmp.w    #$130,d0
                    bcs.w    RIGHT_MOVED
                    sub.w    (MOVE_STEP),d0
                    move.w   (PLAYFIELDX),d3
                    cmp.w    #$5A,d3
                    bcc.w    NOT_LEFT
                    bset     #0,(NEWSCFLAG)
                    subi.w   #$120,d0
                    add.w    (MOVE_STEP),d0
                    addi.w   #9,d3
                    move.w   d3,(PLAYFIELDX)
                    cmp.w    #$5A,d3
                    bcs.w    RIGHT_MOVED
                    move.w   (MOVE_STEP),d3
                    add.w    d3,(MYXPOS)
                    move.w   #$5A,d3
                    move.w   d3,(PLAYFIELDX)
                    bsr.w    GET_SPRITEXY
                    bra.w    NOT_LEFT

RIGHT_MOVED:        move.w   (MOVE_STEP),d3
                    add.w    d3,(MYXPOS)
                    rts

;                    bra.w    NOT_LEFT

NOT_RIGHT:          btst     #1,d2
                    beq.w    NOT_LEFT
                    move.w   #3,(MYDIR)
                    tst.w    (FREEZEME)
                    bne.w    IM_FROZEN
                    move.w   d0,d3
                    andi.w   #7,d3
                    bne.w    NO_L_CTEST
                    move.w   (MYXPOS),d3
                    move.w   (MYYPOS),d4
                    addi.w   #$18,d4
                    andi.w   #$1F,d3
                    andi.w   #$1F,d4
                    ori.w    #$20,d3
                    ori.w    #$20,d4
                    move.w   d4,d5
                    lsr.w    #3,d3
                    lsr.w    #3,d4
                    lea      (MY_MOVEMAT),a0
                    mulu.w   #12,d4
                    add.w    d4,d3
                    subq.w   #1,d3
                    moveq    #1,d6
                    andi.w   #7,d5
                    beq.w    L_YNOTUP
                    addq.w   #1,d6
L_YNOTUP:           not.b    (a4,d3.w)
                    tst.b    (a0,d3.w)
                    bne.w    NOT_LEFT
                    addi.w   #12,d3
                    dbra     d6,L_YNOTUP
NO_L_CTEST:         sub.w    (MOVE_STEP),d0
                    bne.w    LEFT_MOVED
                    add.w    (MOVE_STEP),d0
                    move.w   (PLAYFIELDX),d3
                    beq.w    NOT_LEFT
                    bset     #0,(NEWSCFLAG)
                    addi.w   #$120,d0
                    sub.w    (MOVE_STEP),d0
                    subi.w   #9,d3
                    move.w   d3,(PLAYFIELDX)
                    bpl.w    LEFT_MOVED
                    move.w   (MOVE_STEP),d3
                    sub.w    d3,(MYXPOS)
                    clr.w    d3
                    move.w   d3,(PLAYFIELDX)
                    bsr.w    GET_SPRITEXY
                    bra.w    NOT_LEFT

LEFT_MOVED:         move.w   (MOVE_STEP),d3
                    sub.w    d3,(MYXPOS)
                    rts

NOT_LEFT:           btst     #2,d2
                    beq.w    NOT_DOWN
                    move.w   #2,(MYDIR)
                    tst.w    (FREEZEME)
                    bne.w    IM_FROZEN
                    move.w   d1,d3
                    andi.w   #7,d3
                    bne.w    NO_D_CTEST
                    move.w   (MYXPOS),d3
                    move.w   (MYYPOS),d4
                    addi.w   #$18,d4
                    andi.w   #$1F,d3
                    andi.w   #$1F,d4
                    ori.w    #$20,d3
                    ori.w    #$20,d4
                    move.w   d3,d5
                    lsr.w    #3,d3
                    lsr.w    #3,d4
                    lea      (MY_MOVEMAT),a0
                    mulu.w   #12,d4
                    add.w    d4,d3
                    addi.w   #$18,d3
                    moveq    #3,d6
                    andi.w   #7,d5
                    beq.w    D_YNOTUP
                    addq.w   #1,d6
D_YNOTUP:           not.b    (a4,d3.w)
                    tst.b    (a0,d3.w)
                    bne.w    D_ERR
                    addq.w   #1,d3
                    dbra     d6,D_YNOTUP
                    bra.w    NO_D_CTEST

D_ERR:              bset     #0,(UD_STOP)
                    bra.w    IM_FROZEN

NO_D_CTEST:         cmp.w    #$58,d1
                    bcs.w    DOWN_MOVED
                    move.w   (PLAYFIELDY),d3
                    bne.w    DOWN_NOT_BOT
                    cmp.w    #$38,d3
                    bcc.w    IM_FROZEN
DOWN_NOT_BOT:       add.w    (MOVE_STEP),d1
                    cmp.w    #$60,d1
                    bcs.w    DOWN_MOVED
                    cmp.w    #$38,d3
                    bcc.w    IM_FROZEN
                    bset     #0,(NEWSCFLAG)
                    subi.w   #$60,d1
                    add.w    (MOVE_STEP),d1
                    addq.w   #3,d3
                    move.w   d3,(PLAYFIELDY)
                    cmp.w    #$38,d3
                    bcs.w    DOWN_MOVED
                    move.w   (MOVE_STEP),d3
                    add.w    d3,(MYYPOS)
                    move.w   #$38,d3
                    move.w   d3,(PLAYFIELDY)
                    bsr.w    GET_SPRITEXY
                    bra.w    IM_FROZEN

DOWN_MOVED:         move.w   (MOVE_STEP),d3
                    add.w    d3,(MYYPOS)
                    bra.w    IM_FROZEN

NOT_DOWN:           btst     #3,d2
                    beq.w    IM_FROZEN
                    move.w   #0,(MYDIR)
                    tst.w    (FREEZEME)
                    bne.w    IM_FROZEN
                    move.w   d1,d3
                    andi.w   #7,d3
                    bne.w    NO_U_CTEST
                    move.w   (MYXPOS),d3
                    move.w   (MYYPOS),d4
                    addi.w   #$18,d4
                    andi.w   #$1F,d3
                    andi.w   #$1F,d4
                    ori.w    #$20,d3
                    ori.w    #$20,d4
                    move.w   d3,d5
                    lsr.w    #3,d3
                    lsr.w    #3,d4
                    lea      (MY_MOVEMAT),a0
                    mulu.w   #12,d4
                    add.w    d4,d3
                    subi.w   #12,d3
                    moveq    #3,d6
                    andi.w   #7,d5
                    beq.w    U_YNOTUP
                    addq.w   #1,d6
U_YNOTUP:           not.b    (a4,d3.w)
                    tst.b    (a0,d3.w)
                    bne.w    UP_ERR
                    addq.w   #1,d3
                    dbra     d6,U_YNOTUP
                    bra.w    NO_U_CTEST

UP_ERR:             bset     #1,(UD_STOP)
                    bra.w    IM_FROZEN

NO_U_CTEST:         sub.w    (MOVE_STEP),d1
                    bcc.w    UP_MOVED
                    add.w    (MOVE_STEP),d1
                    move.w   (PLAYFIELDY),d3
                    beq.w    IM_FROZEN
                    bset     #0,(NEWSCFLAG)
                    subi.w   #$60,d1
                    add.w    (MOVE_STEP),d1
                    subi.w   #3,d3
                    move.w   d3,(PLAYFIELDY)
                    tst.w    d3
                    bpl.w    UP_MOVED
                    move.w   (MOVE_STEP),d3
                    sub.w    d3,(MYYPOS)
                    clr.w    d3
                    move.w   d3,(PLAYFIELDY)
                    bsr.w    GET_SPRITEXY
                    bra.w    IM_FROZEN

UP_MOVED:           move.w   (MOVE_STEP),d3
                    sub.w    d3,(MYYPOS)
IM_FROZEN:          rts

MATD2D3:            move.w   d3,d6
                    lsr.w    #5,d6
                    movea.l  (MATRIX),a2
                    mulu.w   #200,d6
                    adda.w   d6,a2
                    move.w   d2,d6
                    andi.w   #$FFE0,d6
                    lsr.w    #4,d6
                    adda.w   d6,a2
                    rts

MOVE_OTHERS:        lea      (EXTRADTA),a0
                    moveq    #3,d1
MOVE_OTHER_LOOP:    tst.w    ($18,a0)
                    beq.w    NODOPP
                    subq.w   #1,($18,a0)
                    bne.w    NODOPP
                    clr.w    (DOPPFLAG)
NODOPP:             move.w   (0,a0),d2
                    move.w   (2,a0),d3
                    move.w   d2,(4,a0)
                    move.w   d3,(6,a0)
                    tst.w    (12,a0)
                    bne.w    NEWDIR
                    tst.w    ($10,a0)
                    bne.w    DOFREEZE
                    tst.w    ($12,a0)
                    beq.w    NOTZOMBIE
DOZOMBIE:           subq.w   #1,($12,a0)
                    move.w   ($12,a0),(ZOMBFLAG)
                    move.w   ($14,a0),d0
                    beq.w    MYZOM
                    move.w   (HISDIR),(8,a0)
                    bra.w    ALLZOM

MYZOM:              move.w   (MYDIR),(8,a0)
ALLZOM:             clr.w    (12,a0)
                    move.w   (0,a0),(ZOMBX)
                    move.w   (2,a0),(ZOMBY)
                    move.w   #$20,(10,a0)
                    bra.w    OLDDIR

NOTZOMBIE:          tst.w    (10,a0)
                    beq.w    NEWDIR
OLDDIR:             subq.w   #1,(10,a0)
                    move.w   (8,a0),d0
                    add.w    d0,d0
                    add.w    d0,d0
                    lea      (MOVEL_TAB),a1
                    move.w   (a1,d0.w),d5
                    move.w   (2,a1,d0.w),d4
                    lsr.w    #2,d0
                    bsr.w    VIABLE
                    tst.w    d7
                    bne.w    MOVE_OK
CANT_MOVE:          bra.w    NEWDIR

MOVE_OK:            lea      (EXTRADTA),a2
                    moveq    #3,d7
M_ERR_CH:           moveq    #4,d0
                    cmp.w    d1,d7
                    beq.w    NXTCHECK
                    clr.l    d6
                    move.w   (0,a2),d6
                    sub.w    d2,d6
                    bcs.w    OTHERLEFT
                    cmp.w    #320,d6
                    bcc.w    NXTCHECK
                    swap     d6
                    moveq    #3,d0
                    bra.w    MVXOK

OTHERLEFT:          neg.w    d6
                    cmp.w    #320,d6
                    bcc.w    NXTCHECK
                    swap     d6
                    moveq    #1,d0
MVXOK:              move.w   (2,a2),d6
                    sub.w    d3,d6
                    bcs.w    OTHERUP
                    cmp.w    #320,d6
                    bcc.w    NXTCHECK
                    swap     d0
                    move.w   d6,d0
                    swap     d6
                    cmp.w    d6,d0
                    bcs.w    SIMER1a
                    clr.w    d0
                    swap     d0
                    bra.w    ERRORDIR

SIMER1a:            move.w   #0,d0
                    bra.w    ERRORDIR

OTHERUP:            neg.w    d6
                    cmp.w    #$140,d6
                    bcc.w    NXTCHECK
                    swap     d0
                    move.w   d6,d0
                    swap     d6
                    cmp.w    d6,d0
                    bcs.w    SIMER2a
                    move.w   #2,d0
                    swap     d0
                    bra.w    ERRORDIR

SIMER2a:            move.w   #2,d0
ERRORDIR:           move.w   #1,(12,a0)
                    move.w   #1,(12,a2)
                    move.w   d0,(14,a0)
                    eori.w   #2,d0
                    move.w   d0,(14,a2)
                    swap     d0
                    move.w   d0,($16,a0)
                    eori.w   #2,d0
                    move.w   d0,($16,a2)
NXTCHECK:           adda.w   #$1A,a2
                    dbra     d7,M_ERR_CH
                    bra.w    SAMESQ

NEWDIR:             tst.w    (12,a0)
                    beq.w    NOHASSLE
                    clr.w    (12,a0)
                    move.w   (14,a0),d0
                    bsr.w    VIABLE
                    tst.w    d7
                    bne.w    THISDIR
                    move.w   ($16,a0),d0
                    bsr.w    VIABLE
                    tst.w    d7
                    bne.w    THISDIR
                    eori.w   #2,d0
                    bsr.w    VIABLE
                    tst.w    d7
                    bne.w    THISDIR
                    bra.w    NEXT_OTHER

THISDIR:            move.w   d0,(8,a0)
                    clr.w    (12,a0)
                    add.w    d0,d0
                    add.w    d0,d0
                    lea      (MOVEL_TAB),a1
                    move.w   (a1,d0.w),d5
                    move.w   (2,a1,d0.w),d4
SAMESQ:             add.w    d4,d2
                    add.w    d5,d3
                    move.w   d2,(0,a0)
                    move.w   d3,(2,a0)
                    bra.w    NEXT_OTHER

NOHASSLE:           move.w   #$A0,(10,a0)
                    cmp.w    #3,d1
                    bne.w    TRAVELLER
                    move.w   (4,a0),d2
                    move.w   (6,a0),d3
                    andi.w   #$FFE0,d2
                    andi.w   #$FFE0,d3
                    cmpi.w   #544,(MYXPOS)
                    bcc.w    MVHEIRND
                    cmpi.w   #96,(MYXPOS)
                    bcs.w    MVHEIRND
                    cmpi.w   #1760,(MYYPOS)
                    bcc.w    MVHEIRND
                    cmpi.w   #1216,(MYYPOS)
                    bcs.w    MVHEIRND
                    cmp.w    #640,d2
                    bne.w    H_INOUT
                    cmp.w    #1376,d3
                    bne.w    H_INOUT
                    move.w   #3,(8,a0)
                    bra.w    NEXT_OTHER

H_INOUT:            cmp.w    #544,d2
                    bcc.w    H_OUTGARD
                    cmp.w    #96,d2
                    bcs.w    H_OUTGARD
                    cmp.w    #1760,d3
                    bcc.w    H_OUTGARD
                    cmp.w    #1216,d3
                    bcs.w    H_OUTGARD
                    sub.w    (MYXPOS),d2
                    bcs.w    Ha_RI
                    moveq    #3,d4
                    bra.w    Ha_ALL

Ha_RI:              neg.w    d2
                    moveq    #1,d4
Ha_ALL:             sub.w    (MYYPOS),d3
                    bcs.w    Ha_DN
                    moveq    #0,d5
                    bra.w    Ha_ALL1

Ha_DN:              neg.w    d3
                    moveq    #2,d5
Ha_ALL1:            cmp.w    d3,d2
                    bcc.w    Ha_ALL2
                    exg      d4,d5
Ha_ALL2:            bsr.w    RND
                    andi.w   #7,d0
                    cmp.w    #2,d0
                    bcs.w    Ha_nex
                    exg      d4,d5
Ha_nex:             move.w   d4,(8,a0)
                    bra.w    NEXT_OTHER

H_OUTGARD:          subi.w   #640,d2
                    bcs.w    H_RI
                    moveq    #3,d4
                    bra.w    H_ALL

H_RI:               neg.w    d2
                    moveq    #1,d4
H_ALL:              subi.w   #$560,d3
                    bcs.w    H_DN
                    moveq    #0,d5
                    bra.w    H_ALL1

H_DN:               neg.w    d3
                    moveq    #2,d5
H_ALL1:             cmp.w    d3,d2
                    bcc.w    H_ALL2
                    move.w   d3,d2
                    exg      d4,d5
H_ALL2:             bsr.w    RND
                    andi.w   #15,d0
                    cmp.w    #3,d0
                    bcs.w    VILLAGER
                    cmp.w    #12,d0
                    bcs.w    H_NOEXG
                    exg      d4,d5
H_NOEXG:            move.w   d4,(8,a0)
                    cmp.w    #128,d2
                    bcc.w    NEXT_OTHER
                    move.w   d2,(10,a0)
                    bra.w    NEXT_OTHER

MVHEIRND:           moveq    #0,d6
                    cmp.w    #960,d3
                    bcc.w    HEIRL
                    moveq    #2,d6
                    swap     d6
HEIRL:              cmp.w    #896,d2
                    bcs.w    HEIRND
                    move.w   #3,d6
HEIRND:             tst.l    d6
                    beq.w    VILLAGER
                    bsr.w    RND
                    andi.w   #7,d0
                    cmp.w    #3,d0
                    bcs.w    VILLAGER
                    tst.w    d6
                    beq.w    H_MUSWAP
                    andi.w   #1,d0
                    beq.w    H_NOSWAP
                    swap     d6
                    tst.w    d6
                    bne.w    H_NOSWAP
H_MUSWAP:           swap     d6
H_NOSWAP:           move.w   d6,(8,a0)
                    bra.w    NEXT_OTHER

TRAVELLER:          cmp.w    #2,d1
                    bne.w    VILLAGER
                    bsr.w    RND
                    lea      (TRAVTAB),a1
                    andi.w   #7,d0
                    move.b   (a1,d0.w),d0
                    move.w   d0,(8,a0)
                    move.w   #320,(10,a0)
                    bra.w    NEXT_OTHER

VILLAGER:           move.w   d1,-(sp)
                    move.w   #4,d1
WRONGDIR:           subq.w   #1,d1
                    bsr.w    RND
                    andi.w   #3,d0
                    tst.w    d1
                    beq.w    DIRANYWAY
                    cmp.w    (8,a0),d0
                    bne.w    DIRANYWAY
                    addq.w   #1,d0
                    andi.w   #3,d0
DIRANYWAY:          eori.w   #2,d0
                    move.w   d0,(8,a0)
                    move.w   (sp)+,d1
                    bra.w    NEXT_OTHER

DOFREEZE:           subq.w   #1,($10,a0)
NEXT_OTHER:         tst.w    ($18,a0)
                    beq.w    NOT_SPEC
                    move.w   (0,a0),(DOPPX)
                    move.w   (2,a0),(DOPPY)
                    move.w   ($18,a0),(DOPPFLAG)
NOT_SPEC:           adda.w   #$1A,a0
                    dbra     d1,MOVE_OTHER_LOOP
                    rts

TRAVTAB:            dc.b     1,3,1,3,1,3,0,2

VIABLE:             btst     #0,d0
                    bne.w    TSTX
                    tst.w    d0
                    bne.b    V_DOWN
                    move.w   d3,d6
                    addi.w   #$18,d6
                    andi.w   #$1F,d6
                    bne.w    ISVIABLE
                    addi.w   #$18,d3
                    bsr.w    MATD2D3
                    subi.w   #$18,d3
                    suba.w   #$C8,a2
                    bra.b    V_HOZTST

V_DOWN:             move.w   d3,d6
                    addi.w   #$18,d6
                    andi.w   #$1F,d6
                    bne.w    ISVIABLE
                    addi.w   #$18,d3
                    bsr.w    MATD2D3
                    subi.w   #$18,d3
V_HOZTST:           move.w   d2,d6
                    clr.w    d7
                    andi.w   #$1F,d6
                    beq.w    VA_1
                    addq.w   #1,d7
VA_1:               lea      (CHRCOLTAB),a3
V_A2:               clr.w    d6
                    move.b   (1,a2),d6
                    cmp.w    #$C0,d6
                    bcs.w    V_NHERB
                    move.w   #$A5,d6
V_NHERB:            add.w    d6,d6
                    tst.w    (a3,d6.w)
                    bne.w    NOT_VIABLE
                    addq.w   #2,a2
                    dbra     d7,V_A2
                    bra.w    ISVIABLE

TSTX:               cmp.w    #1,d0
                    bne.b    H_LEFT
                    move.w   d2,d6
                    andi.w   #$1F,d6
                    bne.w    ISVIABLE
                    addi.w   #$18,d3
                    bsr.w    MATD2D3
                    subi.w   #$18,d3
                    addq.w   #2,a2
                    bra.b    H_HOZTST

H_LEFT:             move.w   d2,d6
                    andi.w   #$1F,d6
                    bne.w    ISVIABLE
                    addi.w   #$18,d3
                    bsr.w    MATD2D3
                    subi.w   #$18,d3
                    subq.w   #2,a2
H_HOZTST:           move.w   d3,d6
                    clr.w    d7
                    addi.w   #$18,d6
                    andi.w   #$1F,d6
                    cmp.w    #$18,d6
                    bcs.w    HA_1
                    addq.w   #1,d7
HA_1:               lea      (CHRCOLTAB),a3
H_A2:               clr.w    d6
                    move.b   (1,a2),d6
                    cmp.w    #$C0,d6
                    bcs.w    H_NHERB
                    move.w   #$A5,d6
H_NHERB:            add.w    d6,d6
                    tst.w    (a3,d6.w)
                    bne.w    NOT_VIABLE
                    adda.w   #200,a2
                    dbra     d7,H_A2
ISVIABLE:           moveq    #1,d7
                    rts

NOT_VIABLE:         clr.w    d7
                    rts

TEST_PICK_MIX:      tst.w    (MIX_FLAG)
                    bne.w    COLX
                    bclr     #1,(UD_STOP)
                    beq.w    NOT_UP_COL
                    move.w   (MYXPOS),d0
                    move.w   d0,d2
                    lsr.w    #5,d0
                    andi.w   #$1F,d2
                    cmp.w    #$10,d2
                    bcs.w    TP_1
                    addq.w   #1,d0
TP_1:               move.w   (MYYPOS),d1
                    addi.w   #$18,d1
                    move.w   d1,d2
                    lsr.w    #5,d1
                    andi.w   #$1F,d2
                    bne.b    OBS_FND
                    subq.w   #1,d1
OBS_FND:            mulu.w   #200,d1
                    add.w    d0,d0
                    add.w    d0,d1
                    movea.l  (MATRIX),a0
                    move.w   (a0,d1.w),d0
                    andi.w   #$FF,d0
                    subi.w   #$C0,d0
                    bcs.w    NO_COL_ATALL
COL_HERB:           lea      (HERB_LIST),a0
                    tst.b    (a0,d0.w)
                    bne.w    G_H_NOW
                    move.b   #1,(a0,d0.w)
                    lsr.w    #1,d0
                    subq.w   #1,d0
                    move.w   d0,(PAGE)
                    bsr.w    TURN_PAGE
G_H_NOW:            rts

NOT_UP_COL:         bclr     #0,(UD_STOP)
                    beq.w    NO_COL_ATALL
                    move.w   (MYXPOS),d0
                    move.w   d0,d2
                    lsr.w    #5,d0
                    andi.w   #$1F,d2
                    cmp.w    #$10,d2
                    bcs.w    TP_2
                    addq.w   #1,d0
TP_2:               move.w   (MYYPOS),d1
                    addi.w   #$28,d1
                    move.w   d1,d2
                    lsr.w    #5,d1
                    andi.w   #$1F,d2
                    bne.b    OBb_FND
                    addq.w   #1,d1
OBb_FND:            mulu.w   #200,d1
                    add.w    d0,d0
                    add.w    d0,d1
                    movea.l  (MATRIX),a0
                    move.w   (a0,d1.w),d0
                    andi.w   #$FF,d0
                    cmp.w    #$93,d0
                    beq.w    FOUND_CAULDRON
                    subi.w   #$C0,d0
                    bcs.w    NO_COL_ATALL
                    bra.w    COL_HERB

NO_COL_ATALL:       move.w   (FUDLR),d0
                    btst     #4,d0
                    beq.w    COLX
                    move.w   #2,(MIX_FLAG)
COLX:               rts

FOUND_CAULDRON:     cmpi.w   #$A00,(MYXPOS)
                    bcs.w    NO_COL_ATALL
                    lea      (HERB_LIST),a0
                    move.w   #$17,d0
                    clr.w    d1
FC_1:               add.b    (a0)+,d1
                    dbra     d0,FC_1
                    cmp.w    #2,d1
                    bcs.w    NOT_ENOUGH_HERB
                    move.w   (FUDLR),d0
                    btst     #4,d0
                    beq.w    NO_COL_ATALL
                    move.w   #1,(MIX_FLAG)
NOT_ENOUGH_HERB:    rts

MIX_SPELLS:         cmpi.w   #$2F,(LEAR_HEALTH)
                    beq.w    NOMIX
                    tst.w    (MIX_FLAG)
                    beq.w    NOMIX
                    move.w   (FUDLR),d0
                    btst     #4,d0
                    beq.w    MIXEND
                    btst     #0,d0
                    beq.w    MIX_LEF
                    bsr.w    TURN_PAGE_RIGHT
                    bra.w    NOMIX

MIX_LEF:            btst     #1,d0
                    beq.w    NOMIX
                    bsr.w    TURN_PAGE
                    bra.w    NOMIX

MIXEND:             cmpi.w   #2,(MIX_FLAG)
                    beq.w    CAST_SPELL
                    clr.w    (MIX_FLAG)
                    move.w   (PAGE),d0
                    lea      (HERB_LIST),a0
                    lea      (SPELL_LIST),a1
                    lea      (SPELL_LAST_TIME),a2
                    tst.b    (a1,d0.w)
                    bne.w    NOMIX
                    move.w   d0,d1
                    add.w    d1,d1
                    tst.b    (a0,d1.w)
                    beq.w    NOMIX
                    tst.b    (1,a0,d1.w)
                    beq.w    NOMIX
                    clr.w    (a0,d1.w)
                    move.b   (a2,d0.w),(a1,d0.w)
                    moveq    #9,d0
                    sf       d1
                    bsr.w    ModuleStart
                    move.w   (PAGE),d0
                    bsr.w    TP_L1
                    bra.w    NOMIX

CAST_SPELL:         clr.w    (MIX_FLAG)
                    moveq    #0,d7
                    move.w   (PAGE),d0
                    lea      (SPELL_LIST),a0
                    bra.w    SPALL

HIS_SPELL_ENT:      lea      (HIS_SPELL_LIST),a0
                    moveq    #1,d7
SPALL:              tst.b    (a0,d0.w)
                    beq.w    NOMIX
                    cmpi.b   #$FF,(a0,d0.w)
                    beq.w    NODECS
                    subq.b   #1,(a0,d0.w)
NODECS:             tst.w    d7
                    bne.w    NOPRSP
                    move.w   d7,-(sp)
                    bsr.w    TP_L1
                    move.w   (sp)+,d7
                    move.w   (PAGE),d0
NOPRSP:             add.w    d0,d0
                    add.w    d0,d0
                    lea      (SPELL_JUMPS),a0
                    movea.l  (a0,d0.w),a0
                    jmp      (a0)

NOMIX:              rts

SET_UP_HERBS:       movea.l  (MATRIX),a0
                    move.w   #6000-1,d0
SH_0:               move.w   (a0)+,d1
                    cmp.b    #192,d1
                    bcs.w    SH_1
                    move.b   #162,(-1,a0)
SH_1:               dbra     d0,SH_0
                    lea      (HERB_DATA),a0
                    moveq    #24-1,d6
S_H_L:              moveq    #0,d0
                    move.b   (a0)+,d0
                    swap     d0
                    move.b   (a0)+,d0
                    bsr.w    plad
                    move.b   (a0)+,d0
                    addi.b   #$C0,d0
                    move.b   d0,(1,a1)
                    dbra     d6,S_H_L
                    rts

TURN_PAGE_RIGHT:    moveq    #3,d0
                    sf       d1
                    bsr.w    ModuleStart
                    clr.l    d0
TP_Lr:              bsr.w    BLIT_PAGE
                    clr.w    (VBLFLAG)
X_090:              tst.w    (VBLFLAG)
                    beq.w    X_090
                    clr.w    (VBLFLAG)
X_091:              tst.w    (VBLFLAG)
                    beq.w    X_091
                    clr.w    (VBLFLAG)
X_092:              tst.w    (VBLFLAG)
                    beq.w    X_092
                    clr.w    (VBLFLAG)
X_093:              tst.w    (VBLFLAG)
                    beq.w    X_093
                    subq.w   #1,d0
                    andi.w   #3,d0
                    bne.w    TP_Lr
                    bsr.w    BLIT_PAGE
                    move.w   (PAGE),d0
                    subq.w   #1,d0
                    cmp.b    #$FF,d0
                    bne.w    TP_L1
                    moveq    #11,d0
                    bra.w    TP_L1

TURN_PAGE:          moveq    #3,d0
                    sf       d1
                    bsr.w    ModuleStart
                    clr.l    d0
TP_L:               bsr.w    BLIT_PAGE
                    clr.w    (VBLFLAG)
X_094:              tst.w    (VBLFLAG)
                    beq.w    X_094
                    clr.w    (VBLFLAG)
X_095:              tst.w    (VBLFLAG)
                    beq.w    X_095
                    clr.w    (VBLFLAG)
X_096:              tst.w    (VBLFLAG)
                    beq.w    X_096
                    clr.w    (VBLFLAG)
X_097:              tst.w    (VBLFLAG)
                    beq.w    X_097
                    addq.w   #1,d0
                    andi.w   #3,d0
                    bne.w    TP_L
                    bsr.w    BLIT_PAGE
                    move.w   (PAGE),d0
                    addq.w   #1,d0
                    cmp.w    #12,d0
                    bne.w    TP_L1
                    clr.w    d0
TP_L1:              move.w   d0,(PAGE)
TP_L2:              add.w    d0,d0
                    add.w    d0,d0
                    lea      (SPELL_ADDS),a2
                    movea.l  (a2,d0.w),a2
                    lsr.w    #1,d0
                    move.w   d0,d3
                    subq.w   #2,d3
                    lea      (HERB_LIST),a3
                    lea      (SPELL_LIST),a5
                    clr.w    d2
                    movea.l  (BITPLANE1A),a0
                    adda.l   #$1682,a0
NXCR:               move.l   a0,-(sp)
NXSCH:              clr.w    d0
                    move.b   (a2)+,d0
                    beq.w    PAGEND
                    cmp.b    #10,d0
                    beq.w    NEXLIN
                    andi.w   #$DF,d0
                    clr.w    d4
                    tst.w    d2
                    bne.w    PRSC0
                    move.w   (PAGE),d5
                    tst.b    (a5,d5.w)
                    beq.w    PRSC1
                    move.w   #5,d4
                    bra.w    PRSC1

PRSC0:              move.w   #$16,d4
                    tst.b    (a3,d3.w)
                    beq.w    PRSC1
                    move.w   #1,d4
PRSC1:              bsr.w    PRSPLCHR
                    addq.w   #1,a0
                    bra.w    NXSCH

NEXLIN:             addq.w   #1,d2
                    addq.w   #1,d3
                    movea.l  (sp)+,a0
                    adda.l   #$140,a0
                    bra.w    NXCR

PAGEND:             movea.l  (sp)+,a0
                    rts

PRSPLCHR:           tst.w    d0
                    beq.w    PCSX
                    movem.l  d0-d5/a0-a5,-(sp)
                    movea.l  a0,a2
                    adda.w   #8192,a2
                    movea.l  a2,a3
                    adda.w   #8192,a3
                    movea.l  a3,a4
                    adda.w   #8192,a4
                    movea.l  a4,a5
                    adda.w   #8192,a5
                    subi.w   #$20,d0
                    andi.w   #$FF,d0
                    lsl.w    #3,d0
                    lea      (CHRSET),a1
                    adda.w   d0,a1
                    moveq    #8-1,d7
PRCHS2:             move.w   d4,d5
                    move.b   (a1)+,d0
                    move.b   d0,d2
                    not.b    d2
                    move.b   d0,d3
                    and.b    (a0),d2
                    ror.w    #1,d5
                    bcc.w    PRCHS3a
                    or.b     d3,d2
PRCHS3a:            move.b   d2,(a0)
                    move.b   d0,d2
                    not.b    d2
                    move.b   d0,d3
                    and.b    (a2),d2
                    ror.w    #1,d5
                    bcc.w    PRCHS3b
                    or.b     d3,d2
PRCHS3b:            move.b   d2,(a2)
                    move.b   d0,d2
                    not.b    d2
                    move.b   d0,d3
                    and.b    (a3),d2
                    ror.w    #1,d5
                    bcc.w    PRCHS3c
                    or.b     d3,d2
PRCHS3c:            move.b   d2,(a3)
                    move.b   d0,d2
                    not.b    d2
                    move.b   d0,d3
                    and.b    (a4),d2
                    ror.w    #1,d5
                    bcc.w    PRCHS3d
                    or.b     d3,d2
PRCHS3d:            move.b   d3,(a4)
                    move.b   d0,d2
                    not.b    d2
                    move.b   d0,d3
                    and.b    (a5),d2
                    ror.w    #1,d5
                    bcc.w    PRCHS3e
                    or.b     d3,d2
PRCHS3e:            move.b   d2,(a5)
                    adda.l   #40,a0
                    adda.l   #40,a2
                    adda.l   #40,a3
                    adda.l   #40,a4
                    adda.l   #40,a5
                    dbra     d7,PRCHS2
                    movem.l  (sp)+,d0-d5/a0-a5
PCSX:               rts

HIS_SPELL_ACTION:   tst.w    (HIS_SPELL_DEL)
                    beq.w    HSA_1
                    subq.w   #1,(HIS_SPELL_DEL)
                    rts

HSA_1:              move.w   #10,(HIS_SPELL_DEL)
                    lea      (HIS_SPELL_LIST),a0
                    tst.l    (a0)
                    bne.w    SPELLS_HE_GOTTEM
                    tst.l    (4,a0)
                    bne.w    SPELLS_HE_GOTTEM
                    tst.l    (8,a0)
                    beq.w    HSA_X
SPELLS_HE_GOTTEM:   move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    subi.w   #$18,d1
                    bsr.w    GET_SPRITEXY
                    tst.b    (9,a0)
                    beq.w    OH_DEAR
                    cmpi.w   #$18,(LEAN_HEALTH)
                    bcs.w    OH_DEAR
                    moveq    #9,d0
                    bra.w    HIS_SPELL_ENT

OH_DEAR:            bsr.w    ONSC
                    bne.w    HSA_X
                    tst.w    (SPRITE_TO_GO)
                    bne.w    DEF_TRYa
                    tst.w    (FIREFLAG)
                    bne.w    DEF_TRYb
                    tst.w    (LIGHTFLAG)
                    beq.w    ATT_TRY
                    tst.w    (LIG_TARGET)
                    bne.w    PROTECT_ME
                    rts

DEF_TRYa:           tst.w    (SPRITE_TARGET)
                    bne.w    PROTECT_ME
                    rts

DEF_TRYb:           tst.w    (LIG_TARGET)
                    bne.w    PROTECT_ME
                    rts

PROTECT_ME:         lea      (HIS_SPELL_LIST),a0
                    tst.b    (1,a0)
                    beq.w    CANT_PROTECT
                    moveq    #1,d0
                    bra.w    HIS_SPELL_ENT

CANT_PROTECT:       rts

ATT_TRY:            bsr.w    RND
                    lea      (HIS_SPELL_LIST),a0
                    andi.w   #$FF,d0
                    cmp.w    #$80,d0
                    bcc.w    NODISTR
                    andi.w   #7,d0
                    cmp.w    #4,d0
                    bcs.w    FRZ_1ST
                    moveq    #8,d0
                    moveq    #5,d1
                    bra.w    ALL_DIS

FRZ_1ST:            moveq    #7,d0
                    moveq    #4,d1
ALL_DIS:            tst.b    (a0,d0.w)
                    bne.w    GETTIM
                    move.w   d1,d0
                    tst.b    (a0,d0.w)
                    bne.w    GETTIM
NODISTR:            tst.w    (REPELTIME)
                    bne.w    HSA_X
                    bsr.w    RND
                    andi.w   #3,d0
                    lea      (RND3),a1
                    move.b   (a1,d0.w),d0
                    tst.b    (a0,d0.w)
                    beq.w    HSA_X
GETTIM:             bra.w    HIS_SPELL_ENT

HSA_X:              rts

RND3:               dc.l     $20A0B02

AI:                 cmpi.w   #$2F,(LEAN_HEALTH)
                    beq.w    AI_EX
                    bsr.w    HIS_SPELL_ACTION
                    cmpi.w   #4,(HISDIR)
                    bne.w    AI_EX
                    tst.w    (SRCH_AGAIN)
                    bne.w    CONT_SRCH
                    tst.w    (HERB_SR_NO)
                    bne.w    NOSTRAT
ISTRAT:             bsr.w    STRATEGY
                    bra.w    NEWSTRAT

NOSTRAT:            move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    lsr.w    #5,d0
                    lsr.w    #5,d1
                    subq.w   #1,d1
                    moveq    #$17,d2
                    lea      (HERB_DATA),a0
SH_H0:              cmp.b    (a0),d0
                    bne.w    SH_H1
                    cmp.b    (1,a0),d1
                    bne.w    SH_H1
                    lea      (HIS_HERB_LIST),a1
                    moveq    #0,d0
                    move.b   (2,a0),d0
                    move.b   #1,(a1,d0.w)
                    bra.w    NEWSTRAT

SH_H1:              addq.l   #3,a0
                    dbra     d2,SH_H0
NEWSTRAT:           subq.w   #1,(HERB_SR_NO)
                    move.w   (HISYPOS),d0
                    move.w   (HISXPOS),d1
                    lsr.w    #5,d1
                    lsl.w    #3,d0
                    andi.w   #$FF00,d0
                    or.w     d0,d1
                    move.w   d1,(START)
                    lea      (TARGETS),a0
                    move.w   (TAR_OFFS),d0
                    move.b   (1,a0,d0.w),d1
                    lsl.w    #8,d1
                    move.b   (a0,d0.w),d1
                    cmp.w    #$405,d1
                    bne.w    NOTEL
                    tst.b    (HIS_SPELL_LIST)
                    beq.w    NOTEL
                    move.w   #$A0,(HISXPOS)
                    move.w   #$80,(HISYPOS)
                    move.w   #4,(HISDIR)
                    clr.w    (SRCH_AGAIN)
                    clr.w    (HERB_SR_NO)
                    rts

NOTEL:              move.w   d1,(TARGET)
                    move.w   (START),d0
                    clr.w    d2
                    cmp.w    d1,d0
                    beq.w    AI_EX
                    addq.w   #2,(TAR_OFFS)
                    move.w   #1,d3
                    bsr.w    FIND_ROUTE
CONT_SRCH:          moveq    #2,d3
                    bsr.w    RE_ENT_MAZE
                    clr.w    (SRCH_AGAIN)
                    tst.w    d3
                    bne.w    AI_FND
                    move.w   #-1,(SRCH_AGAIN)
AI_EX:              rts

AI_FND:             move.w   #5,(HISDIR)
                    rts

STRATEGY:           move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    lsr.w    #5,d0
                    lsr.w    #5,d1
                    cmp.w    #5,d0
                    bne.w    NOCAUL
                    cmp.w    #4,d1
                    bne.w    NOCAUL
                    clr.w    d0
FLASH1:             move.w   d0,($DFF180)
                    addq.w   #1,d0
                    cmp.w    #$1000,d0
                    bne.w    FLASH1
                    bsr.w    HERB_TO_SPELL
NOCAUL:             bsr.w    SPELL_CHECK
                    lea      (HIS_SPELL_LIST),a0
                    tst.b    (2,a0)
                    bne.w    CHASE_ME
                    tst.b    (10,a0)
                    bne.w    CHASE_ME
                    tst.b    (11,a0)
                    beq.w    S_GET_HERBS
CHASE_ME:           tst.w    (DOPPFLAG)
                    beq.w    NOCHDOP
                    move.w   (DOPPX),d0
                    move.w   (DOPPY),d1
                    bra.w    CHDOP

NOCHDOP:            move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
CHDOP:              lsr.w    #5,d0
                    lsr.w    #5,d1
                    tst.w    (MEINVIS)
                    beq.w    CAN_SEE
                    move.w   d0,d4
                    bsr.w    RND
                    andi.w   #$F,d0
                    subq.w   #8,d0
                    add.w    d0,d1
                    bsr.w    RND
                    andi.w   #15,d0
                    subq.w   #8,d0
                    add.w    d4,d0
CAN_SEE:            moveq    #0,d4
                    move.w   d0,d2
                    move.w   d1,d3
                    mulu.w   #200,d3
                    add.w    d2,d2
                    movea.l  (MATRIX),a0
                    adda.w   d3,a0
                    adda.w   d2,a0
                    lea      (MATADTAB),a1
                    lea      (CORDADTAB),a2
                    lea      (CHRCOLTAB),a3
                    moveq    #0,d3
                    moveq    #0,d6
NXT_SPR_LOOP:       move.w   d6,d7
                    lsr.w    #1,d7
SPIRAL_LOOP:        tst.w    d0
                    bmi.w    OFF_MAT
                    cmp.w    #$64,d0
                    bcc.w    OFF_MAT
                    tst.w    d1
                    bmi.w    OFF_MAT
                    cmp.w    #$3C,d1
                    bcc.w    OFF_MAT
                    move.w   (a0),d2
                    andi.w   #$FF,d2
                    cmp.w    #$C0,d2
                    bcs.w    SPIRAL_1
                    move.w   #$A3,d2
SPIRAL_1:           add.w    d2,d2
                    tst.w    (a3,d2.w)
                    beq.w    GOHERE
OFF_MAT:            adda.l   (a1,d3.w),a0
                    add.w    (a2,d3.w),d0
                    add.w    (2,a2,d3.w),d1
                    dbra     d7,SPIRAL_LOOP
                    addq.w   #4,d3
                    andi.w   #12,d3
                    addq.w   #1,d6
                    bra.w    NXT_SPR_LOOP

GOHERE:             move.b   d0,(TARGETS)
                    move.b   d1,(TARGETS+1)
                    move.w   #1,(HERB_SR_NO)
                    clr.w    (TAR_OFFS)
                    rts

MATADTAB:           dc.l     -200,2,200,-2
CORDADTAB:          dc.w     0,-1,1,0,0,1,-1,0

S_GET_HERBS:        bsr.w    HERB_CHECK
                    move.w   d0,d6
                    tst.w    (FIRST_SRCH)
                    beq.w    NXTS
                    moveq    #4,d0
                    clr.w    (FIRST_SRCH)
                    bra.w    NXTS1

NXTS:               bsr.w    RND
                    andi.w   #3,d0
                    addq.w   #2,d0
NXTS1:              cmp.w    d0,d6
                    bcs.w    STOP___1
                    subq.w   #1,d6
                    move.w   d0,d7
                    move.w   d0,(HERB_SR_NO)
                    addq.w   #1,(HERB_SR_NO)
                    lea      (TEMP_H_L),a0
                    lea      (TARGETS),a1
                    lea      (HERB_DATA),a2
                    tst.b    (HIS_SPELL_LIST)
                    bne.w    TRY_HEL
                    move.w   d6,d0
SET_TEL_HERBS:      move.b   (a0,d0.w),d1
                    beq.w    GOTTEL
                    cmp.b    #1,d1
                    bne.w    NOTTEL
GOTTEL:             move.w   d0,-(sp)
                    bsr.w    SET_TARG
                    move.w   (sp)+,d0
                    subq.w   #1,d7
                    beq.w    BAK_HOME
NOTTEL:             dbra     d0,SET_TEL_HERBS
TRY_HEL:            cmpi.w   #$1E,(LEAN_HEALTH)
                    bcs.w    SET_AGG1
                    move.w   d6,d0
                    clr.w    (HERB_SR_NO)
SET_HEL_HERBS:      move.b   (a0,d0.w),d1
                    cmp.b    #$12,d1
                    beq.w    GOTH
                    cmp.b    #$13,d1
                    bne.w    NOTH
GOTH:               move.w   d0,-(sp)
                    addq.w   #1,(HERB_SR_NO)
                    bsr.w    SET_TARG
                    move.w   (sp)+,d0
                    subq.w   #1,d7
                    beq.w    BAK_HOME
NOTH:               dbra     d0,SET_HEL_HERBS
                    tst.w    (HERB_SR_NO)
                    bne.w    BAK_HOME
SET_AGG1:           move.w   d6,d0
SET_AGG_HERBS:      move.b   (a0,d0.w),d1
                    cmp.b    #4,d1
                    beq.w    GOT1
                    cmp.b    #5,d1
                    beq.w    GOT1
                    cmp.b    #$16,d1
                    beq.w    GOT1
                    cmp.b    #$17,d1
                    beq.w    GOT1
                    cmp.b    #$14,d1
                    beq.w    GOT1
                    cmp.b    #$15,d1
                    bne.w    NOT1
GOT1:               move.w   d0,-(sp)
                    bsr.w    SET_TARG
                    move.w   (sp)+,d0
                    subq.w   #1,d7
                    beq.w    BAK_HOME
NOT1:               dbra     d0,SET_AGG_HERBS
                    move.w   #$20,d3
H_TOO_HI:           subq.w   #1,d3
                    beq.w    STOP___
                    bsr.w    RND
                    andi.w   #$1F,d0
                    cmp.w    d6,d0
                    bcc.b    H_TOO_HI
                    move.b   (a0,d0.w),d1
                    cmp.b    #$FF,d1
                    beq.w    H_TOO_HI
                    bsr.w    SET_TARG
                    subq.w   #1,d7
                    bne.w    H_TOO_HI
BAK_HOME:           move.w   #$504,(a1)
                    clr.w    (TAR_OFFS)
                    lea      (TARGETS),a1
                    move.w   (HERB_SR_NO),d1
                    cmp.w    #3,d1
                    bcs.w    CANT_SORT
                    subq.w   #3,d1
SALLP:              move.w   d1,d2
                    movea.l  a1,a2
                    moveq    #0,d0
SLOOP:              move.b   (2,a2),d3
                    cmp.b    (a2),d3
                    bcc.w    NOSORT
                    moveq    #1,d0
                    move.w   (2,a2),d3
                    move.w   (a2),(2,a2)
                    move.w   d3,(a2)
NOSORT:             addq.w   #2,a2
                    dbra     d2,SLOOP
                    tst.w    d0
                    bne.w    SALLP
CANT_SORT:          rts

STOP___:            sub.w    d7,(HERB_SR_NO)
                    bra.w    BAK_HOME

STOP___1:           rts

SET_TARG:           move.b   #$FF,(a0,d0.w)
                    andi.w   #$FF,d1
                    move.w   d1,d0
                    add.w    d0,d0
                    add.w    d1,d0
                    moveq    #0,d1
                    move.b   (1,a2,d0.w),d1
                    addq.w   #1,d1
                    move.b   (a2,d0.w),d0
                    andi.l   #$FF,d0
                    move.b   d0,(a1)+
                    move.b   d1,(a1)+
                    rts

SPELL_CHECK:        lea      (TEMP_S_L),a0
                    clr.l    (a0)
                    clr.l    (4,a0)
                    clr.l    (8,a0)
                    lea      (HIS_SPELL_LIST),a1
                    clr.w    d0
                    clr.w    d1
H_CH_L:             move.b   (a1)+,(a0)
                    beq.w    NEX_HR
                    move.b   d1,(a0)+
                    addq.w   #1,d0
NEX_HR:             addq.w   #1,d1
                    cmp.w    #12,d1
                    bne.w    H_CH_L
                    rts

HERB_CHECK:         lea      (TEMP_H_L),a0
                    clr.l    (a0)
                    clr.l    (4,a0)
                    clr.l    (8,a0)
                    clr.l    (12,a0)
                    clr.l    ($10,a0)
                    clr.l    ($14,a0)
                    lea      (HIS_HERB_LIST),a1
                    lea      (HIS_SPELL_LIST),a2
                    clr.w    d0
                    clr.w    d1
S_CH_L:             move.w   d1,d2
                    lsr.w    #1,d2
                    tst.b    (a1)+
                    bne.w    NEX_SP
                    tst.b    (a2,d2.w)
                    bne.w    NEX_SP
                    move.b   d1,(a0)+
                    addq.w   #1,d0
NEX_SP:             addq.w   #1,d1
                    cmp.w    #$18,d1
                    bne.w    S_CH_L
                    rts

HERB_TO_SPELL:      moveq    #11,d0
                    lea      (HIS_HERB_LIST),a0
                    lea      (HIS_SPELL_LIST),a1
                    lea      (SPELL_LAST_TIME),a2
H_S_LOOP:           tst.b    (a0)
                    beq.w    NOSPELL
                    tst.b    (1,a0)
                    beq.w    NOSPELL
                    tst.b    (a1)
                    bne.w    NOSPELL
                    clr.b    (a0)
                    clr.b    (1,a0)
                    move.b   (a2),(a1)
NOSPELL:            addq.l   #2,a0
                    addq.l   #1,a1
                    addq.l   #1,a2
                    dbra     d0,H_S_LOOP
                    moveq    #9,d0
                    st       d1
                    bra.w    ModuleStart

COMPASS_DO:         tst.w    (COMDEL)
                    beq.w    COM_YES
                    subq.w   #1,(COMDEL)
                    rts

COM_YES:            move.w   #8,(COMDEL)
                    move.w   (MYXPOS),d0
                    move.w   (MYYPOS),d1
                    move.w   (HISXPOS),d2
                    move.w   (HISYPOS),d3
                    subi.w   #$18,d3
                    sub.w    d2,d0
                    bcs.w    C_EAST
                    moveq    #3,d4
                    bra.w    C_1A

C_EAST:             neg.w    d0
                    moveq    #1,d4
C_1A:               sub.w    d3,d1
                    bcs.w    C_SOUTH
                    moveq    #0,d5
                    bra.w    C_1B

C_SOUTH:            moveq    #2,d5
                    neg.w    d1
C_1B:               cmp.w    d1,d0
                    bcs.w    C_NS
                    move.w   d4,d5
C_NS:               movea.l  (COLSETADDR),a0
                    movea.l  (COLCOPADDR),a1
                    moveq    #4-1,d0
C_LOOP:             addq.w   #2,a0
                    addq.w   #2,a1
                    tst.w    d5
                    bne.w    C_NEXT
                    move.w   #$C0C,(a0)+
                    move.w   #$C0C,(a1)+
                    bra.w    C_NEXT1

C_NEXT:             move.w   #$FFF,(a0)+
                    move.w   #$FFF,(a1)+
C_NEXT1:            subq.w   #1,d5
                    dbra     d0,C_LOOP
                    rts

SPROUTS:            move.w   (SPRITE_TO_GO),d0
                    or.w     (SPRITE_GOING),d0
                    beq.w    SPROUTX
                    cmpi.w   #4,(SPRITE_GOING)
                    beq.w    ALL_GOING
                    tst.w    (SPRITE_TO_GO)
                    beq.w    ALL_GOING
                    tst.w    (SPRDEL)
                    beq.w    SPR_CANDO
                    subq.w   #1,(SPRDEL)
                    bra.w    ALL_GOING

SPR_CANDO:          move.w   #8,(SPRDEL)
                    lea      (SPRITE_SP_DAT),a0
                    moveq    #4-1,d3
SR_SPROUT:          tst.w    (10,a0)
                    bne.w    NXTSP
                    move.w   #$20,(10,a0)
                    tst.w    (SPRITE_TARGET)
                    beq.w    SP_FROM_HIM
                    tst.w    (DOPPFLAG)
                    beq.w    SPRNODOP
                    move.w   (DOPPX),d1
                    move.w   (DOPPY),d2
                    bra.w    SP_FRALL

SPRNODOP:           move.w   (MYXPOS),d1
                    move.w   (MYYPOS),d2
                    bra.w    SP_FRALL

SP_FROM_HIM:        move.w   (HISXPOS),d1
                    move.w   (HISYPOS),d2
SP_FRALL:           addi.w   #12,d1
                    subq.w   #8,d2
                    move.w   d1,(0,a0)
                    move.w   d2,(2,a0)
                    bsr.w    RND
                    andi.w   #7,d0
                    subq.w   #3,d0
                    move.w   d0,(4,a0)
                    bsr.w    RND
                    andi.w   #7,d0
                    subq.w   #3,d0
                    move.w   d0,(6,a0)
                    moveq    #7,d0
                    sf       d1
                    bsr.w    ModuleStart
                    addq.w   #1,(SPRITE_GOING)
                    subq.w   #1,(SPRITE_TO_GO)
                    beq.w    ALL_GOING
                    cmpi.w   #4,(SPRITE_GOING)
                    bra.w    ALL_GOING

NXTSP:              adda.w   #$10,a0
                    dbra     d3,SR_SPROUT
ALL_GOING:          lea      (SPRITE_SP_DAT),a0
                    moveq    #3,d7
SP_GOIN_L:          tst.w    (10,a0)
                    beq.w    N_SP_GOING
                    subq.w   #1,(10,a0)
                    bne.w    SP_GOIN1
                    clr.w    (2,a0)
                    subq.w   #1,(SPRITE_GOING)
                    move.w   #3,d3
                    sub.w    d7,d3
                    lea      (SPRITES+2),a1
                    move.w   d3,d4
                    add.w    d3,d3
                    add.w    d4,d3
                    add.w    d3,d3
                    clr.w    (2,a1,d3.w)
                    bra.w    N_SP_GOING

SP_GOIN1:           move.w   (0,a0),d0
                    move.w   (2,a0),d1
                    tst.w    (SPRITE_TARGET)
                    beq.w    MSPRCOL
                    move.w   (HISXPOS),d2
                    move.w   (HISYPOS),d3
                    subi.w   #$18,d3
                    bra.w    SPR_CALL

MSPRCOL:            move.w   (MYXPOS),d2
                    move.w   (MYYPOS),d3
SPR_CALL:           addq.w   #8,d2
                    addi.w   #$10,d3
                    sub.w    d0,d2
                    bcc.w    SCl_1
                    neg.w    d2
SCl_1:              sub.w    d1,d3
                    bcc.w    SCl_2
                    neg.w    d3
SCl_2:              add.w    d2,d3
                    cmp.w    #$10,d3
                    bcc.w    SPC_X
                    tst.w    (SPRITE_TARGET)
                    beq.w    MSPRKIL
                    tst.w    (REPELTIME)
                    bne.w    MSPRKIL1
MSPRKIL2:           tst.w    (PROTECTHIM)
                    bne.w    SPC_X
                    moveq    #2,d0
                    st       d1
                    bsr.w    ModuleStart
                    move.w   (LEAN_HEALTH),d0
                    addq.w   #2,d0
                    cmp.w    #47,d0
                    bcs.w    MSPK_1
                    moveq    #47,d0
MSPK_1:             move.w   d0,(LEAN_HEALTH)
                    bra.w    SPR_CALLa

MSPRKIL:            tst.w    (REPELTIME)
                    bne.w    MSPRKIL2
MSPRKIL1:           tst.w    (PROTECTME)
                    bne.w    SPC_X
                    moveq    #2,d0
                    sf       d1
                    bsr.w    ModuleStart
                    move.w   (LEAR_HEALTH),d0
                    addq.w   #2,d0
                    cmp.w    #47,d0
                    bcs.w    MSPK_2
                    moveq    #47,d0
MSPK_2:             move.w   d0,(LEAR_HEALTH)
SPR_CALLa:          move.w   #1,(HEALTH_CH)
SPR_PRT:            subq.w   #1,(SPRITE_GOING)
                    clr.w    (10,a0)
                    clr.w    (2,a0)
                    moveq    #3,d3
                    sub.w    d7,d3
                    lea      (SPRITES+2),a1
                    move.w   d3,d4
                    add.w    d3,d3
                    add.w    d4,d3
                    add.w    d3,d3
                    clr.w    (2,a1,d3.w)
                    bra.w    N_SP_GOING

SPC_X:              move.w   (0,a0),d0
                    subq.w   #8,d0
                    move.w   (4,a0),d1
                    tst.w    (SPRITE_TARGET)
                    bne.w    MSPRX1
                    tst.w    (REPELTIME)
                    bne.w    MSPRX
MSPRX2:             tst.w    (DOPPFLAG)
                    beq.w    SPNDPX
                    cmp.w    (DOPPX),d0
                    bra.w    SPRXALL

SPNDPX:             cmp.w    (MYXPOS),d0
                    bra.w    SPRXALL

MSPRX1:             tst.w    (REPELTIME)
                    bne.w    MSPRX2
MSPRX:              cmp.w    (HISXPOS),d0
SPRXALL:            bcs.w    UPSPXS
                    subq.w   #2,d1
                    bpl.w    SPXOK
                    cmp.w    #-6,d1
                    bcc.w    SPXOK
                    move.w   #-6,d1
                    bra.w    SPXOK

UPSPXS:             addq.w   #2,d1
                    bmi.w    SPXOK
                    cmp.w    #6,d1
                    bcs.w    SPXOK
                    move.w   #6,d1
SPXOK:              move.w   d1,(4,a0)
                    add.w    d1,d0
                    addq.w   #8,d0
                    move.w   d0,(0,a0)
                    move.w   d0,d2
                    move.w   (2,a0),d0
                    subi.w   #$10,d0
                    move.w   (6,a0),d1
                    tst.w    (SPRITE_TARGET)
                    bne.w    MSPRY
                    tst.w    (REPELTIME)
                    bne.w    MSPRY1
MSPRY2:             tst.w    (DOPPFLAG)
                    beq.w    SPNDPY
                    cmp.w    (DOPPY),d0
                    bra.w    SPRYALL

SPNDPY:             cmp.w    (MYYPOS),d0
                    bra.w    SPRYALL

MSPRY:              tst.w    (REPELTIME)
                    bne.w    MSPRY2
MSPRY1:             move.w   (HISYPOS),d3
                    subi.w   #$18,d3
                    cmp.w    d3,d0
SPRYALL:            bcs.w    UPSPYS
                    subq.w   #2,d1
                    bpl.w    SPYOK
                    cmp.w    #-6,d1
                    bcc.w    SPYOK
                    move.w   #-6,d1
                    bra.w    SPYOK

UPSPYS:             addq.w   #2,d1
                    bmi.w    SPYOK
                    cmp.w    #6,d1
                    bcs.w    SPYOK
                    move.w   #6,d1
SPYOK:              move.w   d1,(6,a0)
                    add.w    d1,d0
                    addi.w   #$10,d0
                    move.w   d0,(2,a0)
                    move.w   d0,d1
                    move.w   d2,d0
                    bsr.w    GET_HARDSPRITEXY
                    moveq    #3,d3
                    sub.w    d7,d3
                    lea      (SPRITES+2),a1
                    move.w   d3,d4
                    add.w    d3,d3
                    add.w    d4,d3
                    add.w    d3,d3
                    move.w   d0,(a1,d3.w)
                    clr.w    (2,a1,d3.w)
                    move.w   #4,(4,a1,d3.w)
                    cmp.w    #$3C,d0
                    bcs.w    N_SP_GOING
                    cmp.w    #$1E0,d0
                    bcc.w    N_SP_GOING
                    cmp.w    #12,d1
                    bcs.w    N_SP_GOING
                    cmp.w    #$AC,d1
                    bcc.w    N_SP_GOING
                    move.w   d1,(2,a1,d3.w)
N_SP_GOING:         adda.w   #$10,a0
                    dbra     d7,SP_GOIN_L
SPROUTX:            rts

FIREBALL:           tst.w    (ANIDEL)
                    bne.w    NOANI
                    move.w   #2,(ANIDEL)
                    addq.w   #1,(ANINUM)
                    andi.w   #3,(ANINUM)
NOANI:              subq.w   #1,(ANIDEL)
                    tst.w    (ZOMBFLAG)
                    beq.w    NOZOMTOHIT
                    tst.w    (PROTECTHIM)
                    bne.w    NZF6
NOZOMTOHIT:         move.w   (ZOMBX),d0
                    sub.w    (HISXPOS),d0
                    bcc.w    NZF1
                    neg.w    d0
NZF1:               move.w   (ZOMBY),d1
                    sub.w    (HISYPOS),d1
                    bcc.w    NZF2
                    neg.w    d1
NZF2:               add.w    d1,d0
                    cmp.w    #$18,d0
                    bcc.w    NZF6
                    moveq    #2,d0
                    st       d1
                    bsr.w    ModuleStart
                    move.w   (LEAN_HEALTH),d0
                    addi.w   #12,d0
                    cmp.w    #47,d0
                    bcs.w    NZF3
                    moveq    #47,d0
NZF3:               move.w   d0,(LEAN_HEALTH)
                    move.w   #1,(HEALTH_CH)
                    lea      (EXTRADTA),a0
                    moveq    #4-1,d0
                    moveq    #$1A,d1
NZF4:               clr.w    ($12,a0)
                    adda.w   d1,a0
                    dbra     d0,NZF4
NZF6:               move.w   (FIREFLAG),d0
                    beq.w    NOFIREBALL
                    subq.w   #1,d0
                    move.w   d0,(FIREFLAG)
                    beq.w    FIREND
                    move.w   (FIREXPOS),d0
                    move.w   (FIREYPOS),d1
                    tst.w    (FIRE_TARGET)
                    beq.w    MFIRCOL
                    move.w   (HISXPOS),d2
                    move.w   (HISYPOS),d3
                    subi.w   #$18,d3
                    bra.w    FIR_CALL

MFIRCOL:            move.w   (MYXPOS),d2
                    move.w   (MYYPOS),d3
FIR_CALL:           addq.w   #8,d2
                    addi.w   #$10,d3
                    sub.w    d0,d2
                    bcc.w    FCl_1
                    neg.w    d2
FCl_1:              sub.w    d1,d3
                    bcc.w    FCl_2
                    neg.w    d3
FCl_2:              add.w    d2,d3
                    cmp.w    #$10,d3
                    bcc.w    FC_X
                    tst.w    (FIRE_TARGET)
                    beq.w    MFIRKIL
                    tst.w    (REPELTIME)
                    bne.w    MFIRKIL1
MFRP:               tst.w    (PROTECTHIM)
                    bne.w    FC_X
                    moveq    #2,d0
                    st       d1
                    bsr.w    ModuleStart
                    move.w   (LEAN_HEALTH),d0
                    addq.w   #4,d0
                    cmp.w    #47,d0
                    bcs.w    MFK_1
                    moveq    #47,d0
MFK_1:              move.w   d0,(LEAN_HEALTH)
                    bra.w    FI_CALL

MFIRKIL:            tst.w    (REPELTIME)
                    bne.w    MFRP
MFIRKIL1:           tst.w    (PROTECTME)
                    bne.w    FC_X
                    moveq    #2,d0
                    sf       d1
                    bsr.w    ModuleStart
                    move.w   (LEAR_HEALTH),d0
                    addq.w   #4,d0
                    cmp.w    #47,d0
                    bcs.w    MFK_2
                    moveq    #47,d0
MFK_2:              move.w   d0,(LEAR_HEALTH)
FI_CALL:            clr.w    (FIREFLAG)
                    move.w   #1,(HEALTH_CH)
                    bra.w    FIREND

FC_X:               move.w   (FIREXPOS),d0
                    subq.w   #8,d0
                    move.w   (FIREXSPEED),d1
                    tst.w    (FIRE_TARGET)
                    bne.w    MFIRX1
                    tst.w    (REPELTIME)
                    bne.w    MFIRX
HFIRX:              tst.w    (DOPPFLAG)
                    beq.w    NODOPFX
                    cmp.w    (DOPPX),d0
                    bra.w    FIRXALL

NODOPFX:            cmp.w    (MYXPOS),d0
                    bra.w    FIRXALL

MFIRX1:             tst.w    (REPELTIME)
                    bne.w    HFIRX
MFIRX:              cmp.w    (HISXPOS),d0
FIRXALL:            bcs.w    UPFXS
                    subq.w   #2,d1
                    bpl.w    FXOK
                    cmp.w    #-6,d1
                    bcc.w    FXOK
                    move.w   #-6,d1
                    bra.w    FXOK

UPFXS:              addq.w   #2,d1
                    bmi.w    FXOK
                    cmp.w    #6,d1
                    bcs.w    FXOK
                    move.w   #6,d1
FXOK:               move.w   d1,(FIREXSPEED)
                    add.w    d1,d0
                    addq.w   #8,d0
                    move.w   d0,(FIREXPOS)
                    move.w   d0,d2
                    move.w   (FIREYPOS),d0
                    subi.w   #$10,d0
                    move.w   (FIREYSPEED),d1
                    tst.w    (FIRE_TARGET)
                    bne.w    MFIRY
                    tst.w    (REPELTIME)
                    bne.w    MFIRY1
MFIRY2:             tst.w    (DOPPFLAG)
                    beq.w    NODOPFY
                    cmp.w    (DOPPY),d0
                    bra.w    FIRYALL

NODOPFY:            cmp.w    (MYYPOS),d0
                    bra.w    FIRYALL

MFIRY:              tst.w    (REPELTIME)
                    bne.w    MFIRY2
MFIRY1:             move.w   (HISYPOS),d3
                    subi.w   #$18,d3
                    cmp.w    d3,d0
FIRYALL:            bcs.w    UPFYS
                    subq.w   #2,d1
                    bpl.w    FYOK
                    cmp.w    #-6,d1
                    bcc.w    FYOK
                    move.w   #-6,d1
                    bra.w    FYOK

UPFYS:              addq.w   #2,d1
                    bmi.w    FYOK
                    cmp.w    #6,d1
                    bcs.w    FYOK
                    move.w   #6,d1
FYOK:               move.w   d1,(FIREYSPEED)
                    add.w    d1,d0
                    addi.w   #$10,d0
                    move.w   d0,(FIREYPOS)
                    move.w   d0,d1
                    move.w   d2,d0
                    bsr.w    GET_HARDSPRITEXY
                    cmp.w    #$3C,d0
                    bcs.w    FIREOFFSC
                    cmp.w    #$1E0,d0
                    bcc.w    FIREOFFSC
                    cmp.w    #12,d1
                    bcs.w    FIREOFFSC
                    cmp.w    #$AC,d1
                    bcc.w    FIREOFFSC
                    move.w   d0,(SPRITES+2)
                    move.w   d1,(SPRITES+4)
                    move.w   #8,(SPRITES+6)
                    rts

FIREND:             clr.w    (FIREXPOS)
                    clr.w    (FIREYPOS)
FIREOFFSC:          clr.w    (SPRITES+2)
                    clr.w    (SPRITES+4)
NOFIREBALL:         rts

LIGHTNING:          move.w   (LIGHTFLAG),d0
                    beq.w    NOLIGHT
                    subq.w   #1,d0
                    move.w   d0,(LIGHTFLAG)
                    beq.w    LIGEND
                    move.w   (LIGXPOS),d0
                    move.w   (LIGYPOS),d1
                    tst.w    (LIG_TARGET)
                    beq.w    MLIGCOL
                    move.w   (HISXPOS),d2
                    move.w   (HISYPOS),d3
                    subi.w   #$18,d3
                    bra.w    LIG_CALL

MLIGCOL:            move.w   (MYXPOS),d2
                    move.w   (MYYPOS),d3
LIG_CALL:           addq.w   #8,d2
                    addi.w   #$10,d3
                    sub.w    d0,d2
                    bcc.w    LGCl_1
                    neg.w    d2
LGCl_1:             sub.w    d1,d3
                    bcc.w    LGCl_2
                    neg.w    d3
LGCl_2:             add.w    d2,d3
                    cmp.w    #$10,d3
                    bcc.w    LGC_X
                    tst.w    (LIG_TARGET)
                    beq.w    MLIGKIL
                    tst.w    (PROTECTHIM)
                    bne.w    LGC_X
                    moveq    #2,d0
                    st       d1
                    bsr.w    ModuleStart
                    move.w   (LEAN_HEALTH),d0
                    addi.w   #9,d0
                    cmp.w    #$2F,d0
                    bcs.w    MLK_1
                    moveq    #$2F,d0
MLK_1:              move.w   d0,(LEAN_HEALTH)
                    bra.w    LI_CALL

MLIGKIL:            tst.w    (PROTECTME)
                    bne.w    LGC_X
                    moveq    #2,d0
                    sf       d1
                    bsr.w    ModuleStart
                    move.w   (LEAR_HEALTH),d0
                    addi.w   #9,d0
                    cmp.w    #$2F,d0
                    bcs.w    MLK_2
                    moveq    #$2F,d0
MLK_2:              move.w   d0,(LEAR_HEALTH)
LI_CALL:            clr.w    (LIGHTFLAG)
                    move.w   #1,(HEALTH_CH)
                    bra.w    LIGEND

LGC_X:              move.w   (LIGXPOS),d0
                    move.w   (LIGXSPEED),d1
                    tst.w    (LIG_TARGET)
                    beq.w    MLIGX
                    move.w   (MYDIR),d0
                    bra.w    LIGXALL

MLIGX:              move.w   (HLIGDIR),d0
LIGXALL:            cmp.w    #1,d0
                    beq.w    UPLXS
                    cmp.w    #3,d0
                    bne.w    LXOK
                    subq.w   #1,d1
                    bpl.w    LXOK
                    cmp.w    #-4,d1
                    bcc.w    LXOK
                    move.w   #-4,d1
                    bra.w    LXOK

UPLXS:              addq.w   #1,d1
                    bmi.w    LXOK
                    cmp.w    #4,d1
                    bcs.w    LXOK
                    move.w   #4,d1
LXOK:               move.w   d1,(LIGXSPEED)
                    add.w    d1,(LIGXPOS)
                    move.w   (LIGXPOS),d2
                    move.w   (LIGYSPEED),d1
                    cmp.w    #2,d0
                    beq.w    UPLYS
                    tst.w    d0
                    bne.w    LYOK
                    subq.w   #1,d1
                    bpl.w    LYOK
                    cmp.w    #-4,d1
                    bcc.w    LYOK
                    move.w   #-4,d1
                    bra.w    LYOK

UPLYS:              addq.w   #1,d1
                    bmi.w    LYOK
                    cmp.w    #4,d1
                    bcs.w    LYOK
                    move.w   #4,d1
LYOK:               move.w   d1,(LIGYSPEED)
                    add.w    d1,(LIGYPOS)
                    move.w   (LIGYPOS),d1
                    move.w   d2,d0
                    bsr.w    GET_HARDSPRITEXY
                    cmp.w    #$3C,d0
                    bcs.w    LIGEND
                    cmp.w    #$1E0,d0
                    bcc.w    LIGEND
                    cmp.w    #12,d1
                    bcs.w    LIGEND
                    cmp.w    #$AC,d1
                    bcc.w    LIGEND
                    move.w   d0,(SPRITES+2)
                    move.w   d1,(SPRITES+4)
                    clr.w    (SPRITES+6)
                    rts

LIGEND:             clr.w    (LIGHTFLAG)
                    clr.w    (LIGXPOS)
                    clr.w    (LIGYPOS)
LIGOFFSC:           clr.w    (SPRITES+2)
                    clr.w    (SPRITES+4)
NOLIGHT:            rts

HEIKE:              tst.w    (HEIKEDEL)
                    beq.w    DOHEI
                    subq.w   #1,(HEIKEDEL)
                    rts

DOHEI:              move.w   #$24,(HEIKEDEL)
                    tst.w    (FIREFLAG)
                    bne.w    HEIEND
                    cmpi.w   #$220,(MYXPOS)
                    bcc.w    HEIEND
                    cmpi.w   #$60,(MYXPOS)
                    bcs.w    HEIEND
                    cmpi.w   #$6E0,(MYYPOS)
                    bcc.w    HEIEND
                    cmpi.w   #$4C0,(MYYPOS)
                    bcs.w    HEIEND
                    move.w   (EXTRADTA),d0
                    move.w   (EXTRADTA+2),d1
                    bsr.w    GET_SPRITEXY
                    bsr.w    ONSC
                    bne.w    HEIEND
                    bsr.w    Heikes_Fireball
HEIEND:             rts

GET_CHR_FOR_SPEL:   move.w   (HISXPOS),d0
                    move.w   (HISYPOS),d1
                    subi.w   #$18,d3
                    bsr.w    GET_SPRITEXY
                    bsr.w    ONSC
                    beq.w    FND_ENEMY
GET_STOOGE_FOR_S:   lea      (EXTRADTA),a0
                    moveq    #4-1,d3
G_CH_1:             move.w   (0,a0),d0
                    move.w   (2,a0),d1
                    bsr.w    GET_SPRITEXY
                    bsr.w    ONSC
                    beq.w    FND_STOOGE
                    adda.w   #$1A,a0
                    dbra     d3,G_CH_1
                    moveq    #0,d0
                    rts

FND_ENEMY:          moveq    #1,d0
                    rts

FND_STOOGE:         moveq    #2,d0
                    rts

ONSC:               cmp.w    #320,d0
                    bcs.w    C_XON
                    cmp.w    #-32,d0
                    bcc.w    C_XON
                    moveq    #1,d0
                    rts

C_XON:              cmp.w    #128,d1
                    bcs.w    C_YON
                    cmp.w    #-56,d1
                    bcc.w    C_YON
                    moveq    #1,d0
                    rts

C_YON:              moveq    #0,d0
                    rts

SPELL_COUNTERS:     tst.w    (SWIFTHIM)
                    beq.w    SC1
                    subq.w   #1,(SWIFTHIM)
SC1:                tst.w    (SWIFTME)
                    beq.w    SC2
                    subq.w   #1,(SWIFTME)
                    bne.w    SC2
                    move.w   #2,(MOVE_STEP)
SC2:                tst.w    (FREEZEHIM)
                    beq.w    SC3
                    subq.w   #1,(FREEZEHIM)
SC3:                tst.w    (FREEZEME)
                    beq.w    SC4
                    subq.w   #1,(FREEZEME)
SC4:                tst.w    (PROTECTHIM)
                    beq.w    SC5
                    subq.w   #1,(PROTECTHIM)
SC5:                tst.w    (PROTECTME)
                    beq.w    SC6
                    subq.w   #1,(PROTECTME)
SC6:                tst.w    (REPELTIME)
                    beq.w    SC7
                    subq.w   #1,(REPELTIME)
SC7:                rts

Teleport:           tst.w    d7
                    beq.w    MYTEL
                    move.w   #$A0,(HISXPOS)
                    move.w   #$80,(HISYPOS)
                    move.w   #4,(HISDIR)
                    moveq    #1,d0
                    st       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

MYTEL:              move.w   #$BA0,d0
                    move.w   #$700,d1
                    move.w   d0,(MYXPOS)
                    move.w   d1,(MYYPOS)
                    bsr.w    PLAYXY_FR_XY
                    move.w   d0,(PLAYFIELDX)
                    move.w   d1,(PLAYFIELDY)
                    move.w   d0,(MAPXY)
                    move.w   d1,(MAPXY+2)
                    bset     #0,(NEWSCFLAG)
                    moveq    #1,d0
                    sf       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

Protect:            tst.w    d7
                    beq.w    MYPROTECT
                    move.w   #$5DC,(PROTECTHIM)
                    moveq    #4,d0
                    st       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

MYPROTECT:          move.w   #$5DC,(PROTECTME)
                    moveq    #0,d0
                    sf       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

Sprites:            bsr.w    GET_CHR_FOR_SPEL
                    cmp.w    #1,d0
                    bne.w    SP_ERROR
                    move.w   #10,(SPRITE_TO_GO)
                    clr.w    (SPRITE_GOING)
                    eori.w   #1,d7
                    move.w   d7,(SPRITE_TARGET)
                    eori.w   #1,d7
                    lea      (SPRITE_SP_DAT),a0
                    move.w   #3,d3
CL_SPROUT:          clr.w    (10,a0)
                    adda.w   #$10,a0
                    dbra     d3,CL_SPROUT
                    move.w   #2,(SPRDEL)
                    bra.w    SPELL_FX

Zombie:             bsr.w    GET_STOOGE_FOR_S
                    beq.w    SP_ERROR
                    move.w   #$2FF,($12,a0)
                    clr.w    ($14,a0)
                    bra.w    SPELL_FXn

Swift:              tst.w    d7
                    beq.w    MYSWIFT
                    move.w   #$100,(SWIFTHIM)
                    andi.w   #$FFFC,(HISXPOS)
                    andi.w   #$FFFC,(HISYPOS)
                    bra.w    SPELL_FXn

MYSWIFT:            move.w   #$100,(SWIFTME)
                    andi.w   #$FFFC,(MYXPOS)
                    andi.w   #$FFFC,(MYYPOS)
                    move.w   #4,(MOVE_STEP)
                    bra.w    SPELL_FXn

Freeze:             tst.w    d7
                    beq.w    MYFREEZE
                    bsr.w    GET_CHR_FOR_SPEL
                    beq.w    SP_ERROR
                    cmp.w    #1,d0
                    bne.w    FREEZE_DUM
                    move.w   #$180,(FREEZEME)
                    bra.w    SPELL_FXn

MYFREEZE:           bsr.w    GET_CHR_FOR_SPEL
                    beq.w    SP_ERROR
                    cmp.w    #1,d0
                    bne.w    FREEZE_DUM
                    move.w   #$180,(FREEZEHIM)
                    bra.w    SPELL_FXn

FREEZE_DUM:         move.w   #$180,($10,a0)
                    bra.w    SPELL_FXn

Doppleganger:       bsr.w    GET_STOOGE_FOR_S
                    beq.w    SP_ERROR
                    move.w   #$2FF,($18,a0)
                    bra.w    SPELL_FXn

Invisible:          tst.w    d7
                    beq.w    ME_INV
                    move.w   #$2EE,(HIMINVIS)
                    bra.w    SPELL_FXn

ME_INV:             move.w   #$2EE,(MEINVIS)
                    bra.w    SPELL_FXn

Reduce:             move.w   #$800,(REPELTIME)
                    bra.w    SPELL_FXn

Heal:               tst.w    d7
                    beq.w    HL_ME
                    move.w   (LEAN_HEALTH),d0
                    subi.w   #$14,d0
                    bpl.w    HLN_OK
                    moveq    #0,d0
HLN_OK:             move.w   d0,(LEAN_HEALTH)
                    move.w   #1,(HEALTH_CH)
                    moveq    #11,d0
                    st       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

HL_ME:              move.w   (LEAR_HEALTH),d0
                    subi.w   #$14,d0
                    bpl.w    HL_OK
                    moveq    #0,d0
HL_OK:              move.w   d0,(LEAR_HEALTH)
                    move.w   #1,(HEALTH_CH)
                    moveq    #11,d0
                    sf       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

Heikes_Fireball:    clr.w    (FIREXSPEED)
                    clr.w    (FIREYSPEED)
                    move.w   #$80,(FIREFLAG)
                    moveq    #4,d0
                    st       d1
                    bsr.w    ModuleStart
                    move.w   (EXTRADTA),d1
                    move.w   (EXTRADTA+2),d2
                    move.w   d1,(FIREXPOS)
                    move.w   d2,(FIREYPOS)
                    clr.w    (FIRE_TARGET)
                    bra.w    SPFX_ALL

Fireball:           clr.w    (FIREXSPEED)
                    clr.w    (FIREYSPEED)
                    move.w   #$80,(FIREFLAG)
                    tst.w    d7
                    beq.w    MYFIR
                    move.w   (HISXPOS),(FIREXPOS)
                    move.w   (HISYPOS),(FIREYPOS)
                    subi.w   #$18,(FIREYPOS)
                    clr.w    (FIRE_TARGET)
                    moveq    #4,d0
                    st       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

MYFIR:              move.w   (MYXPOS),(FIREXPOS)
                    move.w   (MYYPOS),(FIREYPOS)
                    move.w   #1,(FIRE_TARGET)
                    moveq    #4,d0
                    sf       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

Lightning:          clr.w    (LIGXSPEED)
                    clr.w    (LIGYSPEED)
                    move.w   #$C0,(LIGHTFLAG)
                    tst.w    d7
                    beq.w    MYLIG
                    move.w   (HISXPOS),(LIGXPOS)
                    move.w   (HISYPOS),(LIGYPOS)
                    subi.w   #$18,(LIGYPOS)
                    clr.w    (LIG_TARGET)
                    moveq    #5,d0
                    st       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

MYLIG:              move.w   (MYXPOS),(LIGXPOS)
                    move.w   (MYYPOS),(LIGYPOS)
                    move.w   #1,(LIG_TARGET)
                    moveq    #5,d0
                    sf       d1
                    bsr.w    ModuleStart
                    bra.w    SPELL_FX

SPELL_FXn:          tst.w    d7
                    bne.w    SP_HIMn
                    sf       d0
                    moveq    #6,d1
                    bsr.w    ModuleStart
                    move.w   (MYXPOS),d1
                    move.w   (MYYPOS),d2
                    bra.w    SPFX_ALL

SP_HIMn:            st       d0
                    moveq    #6,d1
                    bsr.w    ModuleStart
                    move.w   (HISXPOS),d1
                    move.w   (HISYPOS),d2
                    bsr.w    SPFX_ALL
SPELL_FX:           tst.w    d7
                    bne.w    SP_HIM
                    move.w   (MYXPOS),d1
                    move.w   (MYYPOS),d2
                    bra.w    SPFX_ALL

SP_HIM:             move.w   (HISXPOS),d1
                    move.w   (HISYPOS),d2
SPFX_ALL:           lea      (SP_FX_TAB),a0
                    addq.w   #8,d1
                    addi.w   #$10,d2
                    moveq    #12-1,d3
                    move.w   #15,(SPRITES)
SPFX_DO:            move.w   d1,(a0)+
                    move.w   d2,(a0)+
                    bsr.w    RND
                    andi.w   #$F,d0
                    subq.w   #8,d0
                    move.w   d0,(a0)+
                    bmi.w    SPFX1
                    move.w   #-1,(2,a0)
                    bra.w    SPFX2

SPFX1:              move.w   #1,(2,a0)
SPFX2:              bsr.w    RND
                    andi.w   #$F,d0
                    subq.w   #8,d0
                    move.w   d0,(a0)+
                    bmi.w    SPFX3
                    move.w   #-1,(2,a0)
                    bra.w    SPFX4

SPFX3:              move.w   #1,(2,a0)
SPFX4:              addq.w   #4,a0
                    dbra     d3,SPFX_DO
                    move.w   #$64,(FX_TIME)
SP_ERROR:           rts

DO_SPFXn:           moveq    #6,d0
                    sf       d1
                    bsr.w    ModuleStart
DO_SPFX:            tst.w    (FX_TIME)
                    beq.w    F_EXIT
                    lea      (SPRITES),a0
                    subq.w   #1,(FX_TIME)
                    bne.w    DO_FX1
                    move.w   #8,(a0)+
                    addq.w   #2,a0
                    moveq    #7,d0
CL_FX:              clr.w    (a0)
                    addq.w   #4,a0
                    dbra     d0,CL_FX
                    rts

DO_FX1:             adda.w   #26,a0
                    moveq    #11,d4
                    lea      (SP_FX_TAB),a1
DO_FX2:             move.w   (a1),d0
                    move.w   (2,a1),d1
                    move.w   (4,a1),d3
                    asr.w    #2,d3
                    add.w    d3,(a1)
                    move.w   (6,a1),d3
                    asr.w    #2,d3
                    add.w    d3,(2,a1)
                    move.w   (8,a1),d3
                    add.w    d3,(4,a1)
                    move.w   (10,a1),d3
                    add.w    d3,(6,a1)
                    bsr.w    GET_HARDSPRITEXY
                    move.w   d0,(a0)+
                    clr.w    (a0)
                    cmp.w    #60,d0
                    bcs.w    N_FX_GOING
                    cmp.w    #480,d0
                    bcc.w    N_FX_GOING
                    cmp.w    #12,d1
                    bcs.w    N_FX_GOING
                    cmp.w    #172,d1
                    bcc.w    N_FX_GOING
                    move.w   d1,(a0)
N_FX_GOING:         addq.w   #2,a0
                    move.w   #12,(a0)+
                    adda.w   #12,a1
                    dbra     d4,DO_FX2
F_EXIT:             rts

ModuleStart:        movem.l  d0-d2/a0/a1,-(sp)
                    move.w   #$FF,($DFF09E)
                    mulu.w   #20,d0
                    lea      (FxYou,pc),a1
                    moveq    #1,d2
                    lea      ($DFF0A4),a0
                    tst.b    d1
                    beq.b    FxWhose
                    lea      (FxHim,pc),a1
                    moveq    #2,d2
                    lea      ($DFF0B4),a0
FxWhose:            move.w   d2,($DFF096)
                    move.w   #64,(a0)
                    lea      (FxTable,pc),a0
                    adda.w   d0,a0
                    moveq    #10-1,d0
                    sf       ($16,a1)
FxCopy:             move.w   (a0)+,(a1)+
                    dbra     d0,FxCopy
                    move.w   (-6,a1),(a1)
                    move.w   #768-1,d0
Delay:              dbra     d0,Delay
                    move.w   #-1,(2,a1)
                    movem.l  (sp)+,d0-d2/a0/a1
                    rts

DoFx:               movem.l  d0-d2/a0/a1,-(sp)
                    lea      (FxYou,pc),a1
                    tst.b    ($16,a1)
                    beq.b    FxMiss
                    lea      ($DFF0A0),a0
                    moveq    #1,d2
                    bsr.b    Effection
FxMiss:             lea      (FxHim,pc),a1
                    tst.b    ($16,a1)
                    beq.b    FxExit
                    lea      ($DFF0B0),a0
                    moveq    #2,d2
                    bsr.b    Effection
FxExit:             movem.l  (sp)+,d0-d2/a0/a1
                    rts

Effection:          subq.b   #1,($12,a1)
                    bne.b    NoShut
                    sf       ($16,a1)
                    move.w   d2,($DFF096)
                    rts

NoShut:             tst.b    (15,a1)
                    beq.b    Run
                    subq.b   #1,($15,a1)
                    bne.b    Run
                    move.b   (15,a1),($15,a1)
                    move.l   (4,a1),d0
                    move.b   ($10,a1),d1
                    ror.b    #1,d1
                    bcs.b    Water
                    swap     d0
Water:              move.b   d1,($10,a1)
                    add.w    d0,(8,a1)
Run:                move.w   (0,a1),d1
                    add.w    d1,(8,a1)
                    tst.b    (14,a1)
                    beq.b    FxEnd
                    subq.b   #1,($14,a1)
                    bne.b    FxEnd
                    move.b   (14,a1),($14,a1)
                    move.w   (2,a1),(8,a1)
FxEnd:              move.b   ($17,a1),d1
                    sub.b    ($13,a1),d1
                    move.b   d1,($17,a1)
                    lsr.b    #2,d1
                    move.b   d1,(9,a0)
                    move.w   (8,a1),d1
                    cmp.w    #$7C,d1
                    bcc.b    UsePeriod
                    moveq    #$7C,d1
UsePeriod:          move.w   d1,(6,a0)
                    move.l   (10,a1),d1
                    move.b   ($11,a1),d0
                    ror.b    #1,d0
                    bcs.b    SetWaveForm
                    swap     d1
SetWaveForm:        move.b   d0,($11,a1)
                    lea      (Waves,pc),a1
                    adda.w   d1,a1
                    move.l   a1,(a0)
                    ori.w    #$8200,d2
                    move.w   d2,($DFF096)
                    rts

FxYou:              dcb.l    6,0
FxHim:              dcb.l    6,0

Waves:              dc.b     $7A,$7D,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
                    dc.b     $7F,$7F,$7D,$7A,$86,$83,$81,$81,$81,$81,$81,$81
                    dc.b     $81,$81,$81,$81,$81,$81,$83,$86,$70,$73,$75,$75
                    dc.b     $75,$75,$75,$75,$75,$75,$75,$75,$75,$75,$73,$70
                    dc.b     $90,$8D,$8B,$8B,$8B,$8B,$8B,$8B,$8B,$8B,$8B,$8B
                    dc.b     $8B,$8B,$8D,$90,$7A,$7D,$7F,$7F,$7F,$7F,$7F,$7F
                    dc.b     $7F,$7F,$7F,$7F,$7F,$7F,$7D,$7A,$86,$83,$81,$81
                    dc.b     $81,$81,$81,$81,$81,$81,$81,$81,$81,$81,$83,$86
                    dc.b     $66,$69,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B
                    dc.b     $6B,$6B,$69,$66,$9A,$97,$95,$95,$95,$95,$95,$95
                    dc.b     $95,$95,$95,$95,$95,$95,$97,$9A,$24,$28,$2C,$30
                    dc.b     $34,$38,$3C,$40,$64,$68,$6C,$70,$74,$78,$7C,$7F
                    dc.b     $5C,$58,$54,$50,$4C,$48,$44,$40,$1C,$18,$14,$10
                    dc.b     12,8,4,0,$DC,$D8,$D4,$D0,$CC,$C8,$C4,$C0,$9C,$98
                    dc.b     $94,$90,$8C,$88,$84,$81,$A4,$A8,$AC,$B0,$B4,$B8
                    dc.b     $BC,$C0,$E4,$E8,$EC,$F0,$F4,$F8,$FC,0,$25,$29,$2D
                    dc.b     $30,$34,$38,$3C,$40,$64,$68,$6C,$70,$74,$78,$7C
                    dc.b     $7F,$5C,$58,$54,$50,$4C,$48,$44,$40,$1C,$18,$14
                    dc.b     $10,12,8,4,0,$DC,$D8,$D4,$D0,$CC,$C8,$C4,$C0,$9C
                    dc.b     $98,$94,$90,$8C,$88,$84,$81,$A4,$A8,$AC,$B0,$B4
                    dc.b     $B8,$BC,$C0,$E4,$E8,$EC,$F0,$F4,$F8,$FC,0,11,$3D
                    dc.b     $27,$3B,$7F,$2F,$5C,$3A,11,$3D,$27,$3B,$7F,$2F
                    dc.b     $5C,12,11,$3D,$27,$3B,$7F,$2F,$5C,$3A,11,$3D,$27
                    dc.b     $3B,$7F,$2F,$5C,$33,11,$3D,$27,$3B,$7F,$2F,$5C
                    dc.b     $3A,11,$3D,$27,$3B,$7F,$2F,$5C,$47,11,$3D,$27,$3B
                    dc.b     $7F,$2F,$5C,$3A,11,$3D,$27,$3B,$7F,$2F,$5C,$2A,11
                    dc.b     $3D,$27,$3B,$7F,$2F,$5C,$3A,11,$3D,$27,$3B,$7F
                    dc.b     $2F,$5C,1,11,$3D,$27,$3B,$7F,$2F,$5C,$3A,11,$3D
                    dc.b     $27,$3B,$7F,$2F,$5C,$2F,11,$3D,$27,$3B,$7F,$2F
                    dc.b     $5C,$3A,11,$3D,$27,$3B,$7F,$2F,$5C,$52,11,$3D,$27
                    dc.b     $3B,$7F,$2F,$5C,$3A,11,$3D,$27,$3B,$7F,$2F,$5C,0
                    dc.b     $7F,$70,$60,$50,$40,$30,$20,$10,$81,$90,$A0,$B0
                    dc.b     $C0,$D0,$E0,$F0,$7F,$70,$60,$50,$7F,$70,$60,$50
                    dc.b     $81,$90,$A0,$B0,$C0,$D0,$E0,$F0,$7F,$70,$60,$50
                    dc.b     $40,$30,$20,$10,$81,$90,$A0,$B0,$C0,$D0,$E0,$F0
                    dc.b     $40,$30,$20,$10,$40,$30,$20,$10,$81,$90,$A0,$B0
                    dc.b     $C0,$D0,$E0,$F0,$7F,$70,$60,$50,$40,$30,$20,$10
                    dc.b     $81,$90,$A0,$B0,$C0,$D0,$E0,$F0,$7F,$70,$60,$50
                    dc.b     $7F,$70,$60,$50,$81,$90,$A0,$B0,$C0,$D0,$E0,$F0
                    dc.b     $7F,$70,$60,$50,$40,$30,$20,$10,$81,$90,$A0,$B0
                    dc.b     $C0,$D0,$E0,$F0,$40,$30,$20,$10,$40,$30,$20,$10
                    dc.b     $81,$90,$A0,$B0,$C0,$D0,$E0,$F0,$7F,$5D,$F1,$D3
                    dc.b     $4B,$40,$F1,$30,$F3,$2D,$54,$8D,$5F,$9F,$2A,$F5
                    dc.b     $7F,$90,1,$2D,$41,$B8,$F1,$63,$A9,$29,$69,$9C,$AC
                    dc.b     12,5,$61,$81,15,$57,$4B,$D2,14,$D3,$F0,$90,$A0,8
                    dc.b     $4B,$10,$54,$4B,$10,$40,$7C,$CE,$29,$BD,0,$F0,$59
                    dc.b     $30,$5E,$BF,$84,$F0,9,$43,$FB,$7F,$5D,$F1,$D3,$4B
                    dc.b     $40,$F1,$30,$F3,$2D,$54,$8D,$5F,$9F,$2A,$F5,$7F
                    dc.b     $90,1,$2D,$41,$B8,$F1,$63,$A9,$29,$69,$9C,$AC,12
                    dc.b     5,$61,$81,15,$57,$4B,$D2,14,$D3,$F0,$90,$A0,8,$4B
                    dc.b     $10,$54,$4B,$10,$40,$7C,$CE,$29,$BD,0,$F0,$59,$30
                    dc.b     $5E,$BF,$84,$F0,9,$43,$FB

FxTable:            dc.w      -4, $96, -30, 30, $9B,$180,0, $401,$AAAA,$140B
                    dc.w      -6,$1C2,-100,100,$1C7,$180,0,$1001,$AA00,$3005
                    dc.w       4, $96, -20, 20, $96,$180,0,    1,$AA00,$1406
                    dc.w      -4,$7D0, -50, 15,$3E8,$200,0,    1,    0, $640
                    dc.w      -4,$FA0, -50, 15,$7D0,$200,0,    1,    0, $E0A
                    dc.w       4,$320, 100,-15,$190,$200,0, $A01,    0,$3005
                    dc.w      11, $78,  70,-71, $78,$180,0,    1,$AA00,$1010
                    dc.w      10, $6E,  30,-31, $5A,$180,0, $F01,$AA00,$2C05
                    dc.w      24,$12C,  10,-11,$12C, $80,0,    1,$AA00, $824
                    dc.w      -7,$1F4,  61,-34,$1F4,$100,0,    2,$8B22,$1E08
                    dc.w     -70,$708,  34,-34,$708,   0,0,    1,$AA00, $A20
                    dc.w      -9,$320,   3, -3,$320, $80,0,    1,$AA00,$3204

SPRADDS:            dc.l     LIGHT1,LIGHT2,LIGHT3,LIGHT4
                    dc.l     SPRIGHT1,SPRIGHT2,SPRIGHT3,SPRIGHT4
                    dc.l     FIRE1,FIRE2,FIRE3,FIRE4
                    dc.l     Sp1,Sp2,Sp3,Sp4

LIGHT1:             dc.w     0,$40,$40,0,$40,$80,$C0,0,$800,$480,$C80,0,$500
                    dc.w     $280,$780,0,$280,$100,$380,0,4,$102,$186,0,$88
                    dc.w     $104,$18C,0,$114,$88,$1BC,0,8,$F0,$1F8,0,$140,$80
                    dc.w     $1C0,0,$10,$1CC,$1FC,0,$204,$172,$3F6,0,$140,$220
                    dc.w     $760,0,$428,$210,$638,0,$204,$408,$60C,0,0,$402
                    dc.w     $602,0,$900,$600,$F00,0,$780,$800,$F80,0,0,0,0,0,0
                    dc.w     0,0,0,0

LIGHT2:             dc.w     0,0,0,0,8,$10,$18,0,$20,$810,$830,0,$10,$820,$830
                    dc.w     0,$820,$440,$C60,0,$280,$400,$680,0,$404,2,$406,0
                    dc.w     $90,12,$9C,0,$A8,$10,$B8,0,$10,$E0,$F0,0,$141,$82
                    dc.w     $1C3,0,$12,$1CC,$1DE,0,$130,$640,$FF0,0,$1420
                    dc.w     $840,$1E60,0,$840,$1020,$3860,0,$2800,$1020,$3820
                    dc.w     0,$10,$6420,$7C30,0,$200,$8410,$8610,0,$110,$208
                    dc.w     $718,0,4,0,4,0
                    dc.w     0,0,0,0

LIGHT3:             dc.w     0,0,0,0,$1400,$800,$1C00,0,$1010,$2008,$3018,0
                    dc.w     $20,$10,$30,0,$20,0,$20,0,0,0,0,0,0,$18,$18,0,$50
                    dc.w     $420,$470,0,$A0,$C440,$C4E0,0,$4480,$2840,$6DC0,0
                    dc.w     $2142,$1880,$3DC2,0,$808,$7C4,$FEC,0,$120,$40
                    dc.w     $1E0,0,0,$40,$40,0,$40,0,$40,0,0,0,0,0,8,0,8,0
                    dc.w     $210,8,$218,0,$200,$118,$318,0,$190,0,$190,0
                    dc.w     0,0,0,0

LIGHT4:             dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$600,0,$600,0
                    dc.w     $100,$280,$380,0,4,$102,$106,0,$90,$10C,$19C,0
                    dc.w     $28,$190,$1B8,0,$10,$E0,$1F0,0,$140,$80,$1C0,0
                    dc.w     $200,$1C0,$3C0,0,$880,$760,$FE0,0,$440,$1820
                    dc.w     $1C60,0,$2028,$1010,$3038,0,$1000,$2000,$3000,0,0
                    dc.w     $2000,$2000,0,0,$1800,$1800,0,$800,$400,$C00,0
                    dc.w     0,0,0,0

SPRIGHT1:           dc.w     $200,0,0,$200,$500,$200,0,$700,$200,0,0,$200,0,0
                    dc.w     0,0,0,0,$180,$180,$180,0,$7E0,$7E0,$3C0,0,$FF0
                    dc.w     $FF0,$7A0,$3C0,$C70,$FF0,$FD0,$440,$1838,$1C58
                    dc.w     $EF0,$540,$1838,$1C58,$7C0,$440,$830,$C50,$3C0
                    dc.w     $380,$C70,$FF0,$180,0,$7E0,$7E0,0,0,$180,$180,0,0
                    dc.w     0,0,0,0,0,0,$20,0,0,$20,$50,$20,0,$70,$20,0,0,$20
                    dc.w     0,0,0,0

SPRIGHT2:           dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$100,0,0,$100,$200,0,$180
                    dc.w     $380,$180,0,$7E0,$7E0,$3C0,0,$FF0,$FF0,$820,$3C0
                    dc.w     $1FF0,$3F0,$15B0,$BC0,$1FFC,$3F8,$9B4,$3C0,$1FFC
                    dc.w     $3F8,$428,$3C0,$FFC,$FF0,$3C0,0,$FF0,$FF0,$180,0
                    dc.w     $7E0,$7E0,$3840,$3800,$180,$39C0,$7CA0,$4440,0
                    dc.w     $44E0,$6C40,$5400,0,$4440,$7C00,$4400,0,$4400
                    dc.w     $3800,$3800,0,$3800,0,0,0,0
                    dc.w     0,0,0,0

SPRIGHT3:           dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$180,$180
                    dc.w     $180,0,$7E0,$7E0,$3C0,0,$FF0,$FF0,$4420,$3C0
                    dc.w     $EFF0,$FF0,$ADB2,$4340,$FF7F,$1FF8,$4D75,$282
                    dc.w     $FE3F,$1FF8,$4A2,$340,$F77,$FF0,$3C0,0,$FF0,$FF0
                    dc.w     $180,0,$7E0,$7E0,0,0,$180,$180,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0

SPRIGHT4:           dc.w     0,0,0,0,$1C,$1C,0,$1C,$3E,$22,0,$22,$136,$2A,0
                    dc.w     $122,$2BE,$122,0,$3A2,$19C,$1C,$6E0,$7FC,$3C0,0
                    dc.w     $FF0,$FF0,$1420,$3C0,$3FF0,$FF0,$2DA8,$3C0,$3FFC
                    dc.w     $1FE0,$DB4,$3C8,$3FFC,$1FE0,$428,$3C0,$FFC,$FE0
                    dc.w     $3C0,0,$FF0,$FF0,$180,0,$7E0,$7E0,$20,$40,$180
                    dc.w     $1E0,$40,0,0,$40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0

FIRE1:              dc.w     0,0,$60,$60,$C0,0,$F0,$F0,$1F0,$60,$1F8,$18,$F0
                    dc.w     $30,$F8,8,$70,$10,$78,8,$378,$B0,$3F8,8,$4E70
                    dc.w     $1A0,$4FF0,$10,$5CF0,$4328,$5FF8,$10,$78E0,$47D8
                    dc.w     $7FF8,$20,$7AC0,$65B8,$7FF8,$40,$3088,$2FF4,$3FFC
                    dc.w     8,$39BE,$758,$3FFE,$86,$351F,$2BE4,$3FFF,3,$1BA7
                    dc.w     $5DA,$1FFF,1,$1DF3,$20A,$1FFB,$41,$FF3,2,$FF3,$81
                    dc.w     $6F86,$6304,$6F86,$82,$7F0E,$3C00,$7F0E,$430E
                    dc.w     $3C00,0,$3C00,$3C00
                    dc.w     0,0,0,0

FIRE2:              dc.w     0,0,0,0,$C0,0,$1C0,$1C0,$1E0,$180,$3E0,$260,$1E0
                    dc.w     $140,$7E0,$220,$2E0,$200,$6E0,$420,$3E0,$20,$7E0
                    dc.w     $400,$34C0,$1330,$77F0,$6000,$3C8C,$1B70,$7FFC
                    dc.w     $6000,$FE98,$F60,$FFF8,$F000,$FD3E,$6AE0,$FFFE
                    dc.w     $9006,$BE8F,$A1FE,$BFFF,1,$A907,$96FC,$BFFF,$100
                    dc.w     $3522,$2ADC,$3FFE,$100,$1900,$6FC,$1FFC,$100
                    dc.w     $1BA8,$450,$1FF8,$80,$FD0,$120,$FF0,$80,$7C0,$300
                    dc.w     $7C0,$80,$700,$600,$1F80,$1980,$600,0,$F00,$F00,0
                    dc.w     0,$600,$600
                    dc.w     0,0,0,0

FIRE3:              dc.w     0,0,0,0,$140,0,$140,$100,$300,0,$300,$200,$200,0
                    dc.w     $600,$600,$600,0,$600,$400,$740,$80,$7C0,$400
                    dc.w     $6C0,$1B0,$7F0,$40,$3CCC,$1FB0,$3FFC,$2040,$FFC6
                    dc.w     $23E,$FFFE,$FDC0,$FF4,$8A8,$7FFC,$7744,$3FFC,$7C
                    dc.w     $FFFC,$FF80,$7FF4,$1C3C,$7FFC,$63C0,$B7FC,$2F6C
                    dc.w     $BFFC,$8090,$1F50,$66C,$1FFC,$190,$5FE8,$450
                    dc.w     $5FF8,$4180,$FF0,$100,$FF0,$6A0,$FE0,$480,$FE0
                    dc.w     $320,$120,$100,$320,$220,0,0,0,0
                    dc.w     0,0,0,0

FIRE4:              dc.w     0,0,0,0,0,0,0,0,$40,$40,$40,0,$1E0,$1C0,$1E0,$20
                    dc.w     $1E0,$120,$1E0,$C0,$3E0,$20,$3E0,$C0,$81E0,$8630
                    dc.w     $87F0,$C0,$E1CC,$DEB0,$FFFC,$40,$E8C6,$973E,$FFFE
                    dc.w     $6040,$75C4,$4A78,$7FFC,4,$2FCC,$15FC,$3FFC,0
                    dc.w     $3FFC,$1BE4,$3FFC,$2018,$33FC,$DA0,$3FFC,$5C
                    dc.w     $17FE,$870,$1FFE,$10E,$1BFE,$448,$1FFE,$186,$CB6
                    dc.w     $344,$FF6,$22,$F82,$840,$FC2,0,$C02,0,$C02,$800
                    dc.w     $E88,$400,$E88,$800,$700,0,$700,$600
                    dc.w     0,0,0,0

Sp1:                dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$20,0,0,0,$50,$20,0,0,$20
                    dc.w     0,0,0,0,$400,$400,$400,$400,$E00,$E00,$E00,0,$400
                    dc.w     $400,$400,0,0,0,$4000,0,0,0,$80,0,$80,$80,$140,0
                    dc.w     0,0,$80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0

Sp2:                dc.w     0,0,0,0,0,0,0,0,$10,0,0,0,$28,$10,0,0,$44,$838
                    dc.w     $800,$800,$828,$1C10,$1C00,$1C00,$1C10,$3E00
                    dc.w     $3E00,$3E00,$800,$1C00,$1C00,$1C00,0,$800,$800
                    dc.w     $800,0,0,0,$4000,0,0,0,$4000,0,0,0,$40,0,$40,$40
                    dc.w     $A0,0,$E0,$E0,$110,0,$40,$40,$A0,0,0,0,$40,0,0,0
                    dc.w     0,0,0,0,0
                    dc.w     0,0,0,0

Sp3:                dc.w     $40,0,0,0,$A8,$40,0,0,$54,8,0,0,$A8,$1040,$1000
                    dc.w     $1000,$1050,$3C00,$3C00,$3C00,$428,$3E10,$3E00
                    dc.w     $3E00,$2010,$7400,$7400,$7400,0,$2000,$2000,$2000
                    dc.w     0,$1000,$1000,$1000,$1000,$3800,$3800,$3800,0
                    dc.w     $1000,$1000,$1000,0,0,0,$40,0,$40,$40,$B0,0,$10
                    dc.w     $10,$268,0,$200,$200,$510,0,0,0,$200,0,0,0,$20,0
                    dc.w     $20,$20,$50,0,0,0,$20
                    dc.w     0,0,0,0

Sp4:                dc.w     $CC,$84,0,$84,$84,0,0,0,$1000,0,$3000,$3000,$2000
                    dc.w     0,$2000,$2000,$180,$80,0,$80,$288,0,$200,$200
                    dc.w     $8418,8,$8600,$8608,$4000,0,$C000,$C000,0,0,0,0
                    dc.w     $2000,0,$2000,$2000,$1000,0,$3000,$3080,$80,$80
                    dc.w     $80,$100,0,0,0,0,8,8,8,$10,0,0,0,8,$400,$400,$400
                    dc.w     $200,0,0,0,$400,0,0,0,$20,$20,$20,$20,$10
                    dc.w     0,0,0,0

CHRSET:             incbin   "charset_8x768.raw"

;SPRITEdef:          dc.w     $6D60,$7200
;SPRDAT:             dc.w     $990,$7E0,$13C8,$FF0,$23C4,$1FF8,$13C8,$FF0,$990
;                    dc.w     $7E0,0,0
;SPRITEX1:           dc.w     0,0,0

                    end
