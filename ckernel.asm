; Disassembly of file: ckernel.o
; Wed Nov 30 17:40:04 2016
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 52                                 ; 0004 _ 83. EC, 34
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000000(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000000(d)
        mov     dword [ebp-30H], eax                    ; 001C _ 89. 45, D0
        movzx   eax, word [?_160]                       ; 001F _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000138(d)
        movzx   eax, word [?_161]                       ; 002C _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 0000013C(d)
        mov     dword [ebp-2CH], 0                      ; 0039 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 0                      ; 0040 _ C7. 45, D8, 00000000
        call    init_pit                                ; 0047 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 004C _ 83. EC, 04
        push    timerbuf                                ; 004F _ 68, 00000128(d)
        push    8                                       ; 0054 _ 6A, 08
        push    timerinfo                               ; 0056 _ 68, 00000110(d)
        call    fifo8_init                              ; 005B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0060 _ 83. C4, 10
        sub     esp, 4                                  ; 0063 _ 83. EC, 04
        push    1                                       ; 0066 _ 6A, 01
        push    timerinfo                               ; 0068 _ 68, 00000110(d)
        push    500                                     ; 006D _ 68, 000001F4
        call    settimer                                ; 0072 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0077 _ 83. C4, 10
        sub     esp, 4                                  ; 007A _ 83. EC, 04
        push    keybuf                                  ; 007D _ 68, 00000040(d)
        push    32                                      ; 0082 _ 6A, 20
        push    keyinfo                                 ; 0084 _ 68, 00000008(d)
        call    fifo8_init                              ; 0089 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 008E _ 83. C4, 10
        sub     esp, 4                                  ; 0091 _ 83. EC, 04
        push    mousebuf                                ; 0094 _ 68, 00000080(d)
        push    128                                     ; 0099 _ 68, 00000080
        push    mouseinfo                               ; 009E _ 68, 00000020(d)
        call    fifo8_init                              ; 00A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A8 _ 83. C4, 10
        call    init_palette                            ; 00AB _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 00B0 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00BA _ 89. 45, DC
        call    get_adr_buffer                          ; 00BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 00C2 _ 89. 45, E0
        mov     eax, dword [memman]                     ; 00C5 _ A1, 00000000(d)
        sub     esp, 12                                 ; 00CA _ 83. EC, 0C
        push    eax                                     ; 00CD _ 50
        call    memman_init                             ; 00CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D3 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 00D6 _ A1, 00000000(d)
        sub     esp, 4                                  ; 00DB _ 83. EC, 04
        push    1072594944                              ; 00DE _ 68, 3FEE8000
        push    16809984                                ; 00E3 _ 68, 01008000
        push    eax                                     ; 00E8 _ 50
        call    memman_free                             ; 00E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EE _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 00F1 _ 8B. 0D, 0000013C(d)
        mov     edx, dword [xsize]                      ; 00F7 _ 8B. 15, 00000138(d)
        mov     eax, dword [memman]                     ; 00FD _ A1, 00000000(d)
        push    ecx                                     ; 0102 _ 51
        push    edx                                     ; 0103 _ 52
        push    dword [ebp-30H]                         ; 0104 _ FF. 75, D0
        push    eax                                     ; 0107 _ 50
        call    shtctl_init                             ; 0108 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 010D _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0110 _ 89. 45, E4
        sub     esp, 12                                 ; 0113 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 0116 _ FF. 75, E4
        call    sheet_alloc                             ; 0119 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 011E _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 0121 _ 89. 45, D4
        sub     esp, 12                                 ; 0124 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 0127 _ FF. 75, E4
        call    sheet_alloc                             ; 012A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 012F _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0132 _ 89. 45, D8
        mov     edx, dword [xsize]                      ; 0135 _ 8B. 15, 00000138(d)
        mov     eax, dword [ysize]                      ; 013B _ A1, 0000013C(d)
        imul    edx, eax                                ; 0140 _ 0F AF. D0
        mov     eax, dword [memman]                     ; 0143 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0148 _ 83. EC, 08
        push    edx                                     ; 014B _ 52
        push    eax                                     ; 014C _ 50
        call    memman_alloc_4k                         ; 014D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0152 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 0155 _ A3, 00000140(d)
        mov     ecx, dword [ysize]                      ; 015A _ 8B. 0D, 0000013C(d)
        mov     edx, dword [xsize]                      ; 0160 _ 8B. 15, 00000138(d)
        mov     eax, dword [buf_back]                   ; 0166 _ A1, 00000140(d)
        sub     esp, 12                                 ; 016B _ 83. EC, 0C
        push    99                                      ; 016E _ 6A, 63
        push    ecx                                     ; 0170 _ 51
        push    edx                                     ; 0171 _ 52
        push    eax                                     ; 0172 _ 50
        push    dword [ebp-2CH]                         ; 0173 _ FF. 75, D4
        call    sheet_setbuf                            ; 0176 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 017B _ 83. C4, 20
        sub     esp, 12                                 ; 017E _ 83. EC, 0C
        push    99                                      ; 0181 _ 6A, 63
        push    16                                      ; 0183 _ 6A, 10
        push    16                                      ; 0185 _ 6A, 10
        push    buf_mouse                               ; 0187 _ 68, 00000180(d)
        push    dword [ebp-28H]                         ; 018C _ FF. 75, D8
        call    sheet_setbuf                            ; 018F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0194 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0197 _ 8B. 0D, 0000013C(d)
        mov     edx, dword [xsize]                      ; 019D _ 8B. 15, 00000138(d)
        mov     eax, dword [buf_back]                   ; 01A3 _ A1, 00000140(d)
        sub     esp, 4                                  ; 01A8 _ 83. EC, 04
        push    ecx                                     ; 01AB _ 51
        push    edx                                     ; 01AC _ 52
        push    eax                                     ; 01AD _ 50
        call    init_screen8                            ; 01AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01B3 _ 83. C4, 10
        sub     esp, 8                                  ; 01B6 _ 83. EC, 08
        push    99                                      ; 01B9 _ 6A, 63
        push    buf_mouse                               ; 01BB _ 68, 00000180(d)
        call    init_mouse_cursor                       ; 01C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C5 _ 83. C4, 10
        push    0                                       ; 01C8 _ 6A, 00
        push    0                                       ; 01CA _ 6A, 00
        push    dword [ebp-2CH]                         ; 01CC _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 01CF _ FF. 75, E4
        call    sheet_slide                             ; 01D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01D7 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01DA _ A1, 00000138(d)
        sub     eax, 16                                 ; 01DF _ 83. E8, 10
        mov     edx, eax                                ; 01E2 _ 89. C2
        shr     edx, 31                                 ; 01E4 _ C1. EA, 1F
        add     eax, edx                                ; 01E7 _ 01. D0
        sar     eax, 1                                  ; 01E9 _ D1. F8
        mov     dword [mx], eax                         ; 01EB _ A3, 00000130(d)
        mov     eax, dword [ysize]                      ; 01F0 _ A1, 0000013C(d)
        sub     eax, 44                                 ; 01F5 _ 83. E8, 2C
        mov     edx, eax                                ; 01F8 _ 89. C2
        shr     edx, 31                                 ; 01FA _ C1. EA, 1F
        add     eax, edx                                ; 01FD _ 01. D0
        sar     eax, 1                                  ; 01FF _ D1. F8
        mov     dword [my], eax                         ; 0201 _ A3, 00000134(d)
        mov     edx, dword [my]                         ; 0206 _ 8B. 15, 00000134(d)
        mov     eax, dword [mx]                         ; 020C _ A1, 00000130(d)
        push    edx                                     ; 0211 _ 52
        push    eax                                     ; 0212 _ 50
        push    dword [ebp-28H]                         ; 0213 _ FF. 75, D8
        push    dword [ebp-1CH]                         ; 0216 _ FF. 75, E4
        call    sheet_slide                             ; 0219 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021E _ 83. C4, 10
        sub     esp, 8                                  ; 0221 _ 83. EC, 08
        push    ?_148                                   ; 0224 _ 68, 00000000(d)
        push    dword [ebp-1CH]                         ; 0229 _ FF. 75, E4
        call    message_box                             ; 022C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0231 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0234 _ 89. 45, E8
        sub     esp, 4                                  ; 0237 _ 83. EC, 04
        push    0                                       ; 023A _ 6A, 00
        push    dword [ebp-2CH]                         ; 023C _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 023F _ FF. 75, E4
        call    sheet_updown                            ; 0242 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0247 _ 83. C4, 10
        sub     esp, 4                                  ; 024A _ 83. EC, 04
        push    100                                     ; 024D _ 6A, 64
        push    dword [ebp-28H]                         ; 024F _ FF. 75, D8
        push    dword [ebp-1CH]                         ; 0252 _ FF. 75, E4
        call    sheet_updown                            ; 0255 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025A _ 83. C4, 10
        call    io_sti                                  ; 025D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0262 _ 83. EC, 0C
        push    mdec                                    ; 0265 _ 68, 00000100(d)
        call    enable_mouse                            ; 026A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026F _ 83. C4, 10
        mov     dword [ebp-14H], 0                      ; 0272 _ C7. 45, EC, 00000000
        mov     dword [ebp-34H], 0                      ; 0279 _ C7. 45, CC, 00000000
        call    getTimerController                      ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0285 _ 89. 45, F0
?_001:  mov     eax, dword [ebp-10H]                    ; 0288 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 028B _ 8B. 40, 04
        sub     esp, 12                                 ; 028E _ 83. EC, 0C
        push    eax                                     ; 0291 _ 50
        call    intToHexStr                             ; 0292 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0297 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 029A _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 029D _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 02A0 _ 8B. 00
        sub     esp, 4                                  ; 02A2 _ 83. EC, 04
        push    43                                      ; 02A5 _ 6A, 2B
        push    119                                     ; 02A7 _ 6A, 77
        push    28                                      ; 02A9 _ 6A, 1C
        push    40                                      ; 02AB _ 6A, 28
        push    8                                       ; 02AD _ 6A, 08
        push    160                                     ; 02AF _ 68, 000000A0
        push    eax                                     ; 02B4 _ 50
        call    boxfill8                                ; 02B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02BA _ 83. C4, 20
        sub     esp, 8                                  ; 02BD _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 02C0 _ FF. 75, F4
        push    0                                       ; 02C3 _ 6A, 00
        push    28                                      ; 02C5 _ 6A, 1C
        push    40                                      ; 02C7 _ 6A, 28
        push    dword [ebp-18H]                         ; 02C9 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 02CC _ FF. 75, E4
        call    showString                              ; 02CF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D4 _ 83. C4, 20
        call    io_cli                                  ; 02D7 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02DC _ 83. EC, 0C
        push    keyinfo                                 ; 02DF _ 68, 00000008(d)
        call    fifo8_status                            ; 02E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E9 _ 83. C4, 10
        mov     ebx, eax                                ; 02EC _ 89. C3
        sub     esp, 12                                 ; 02EE _ 83. EC, 0C
        push    mouseinfo                               ; 02F1 _ 68, 00000020(d)
        call    fifo8_status                            ; 02F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FB _ 83. C4, 10
        add     ebx, eax                                ; 02FE _ 01. C3
        sub     esp, 12                                 ; 0300 _ 83. EC, 0C
        push    timerinfo                               ; 0303 _ 68, 00000110(d)
        call    fifo8_status                            ; 0308 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030D _ 83. C4, 10
        add     eax, ebx                                ; 0310 _ 01. D8
        test    eax, eax                                ; 0312 _ 85. C0
        jnz near      ?_002                                   ; 0314 _ 75, 0a
        call    io_sti                                  ; 0316 _ E8, FFFFFFFC(rel)
        jmp     ?_005                                   ; 031B _ E9, 000000E6

?_002:  sub     esp, 12                                 ; 0320 _ 83. EC, 0C
        push    keyinfo                                 ; 0323 _ 68, 00000008(d)
        call    fifo8_status                            ; 0328 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032D _ 83. C4, 10
        test    eax, eax                                ; 0330 _ 85. C0
        jz near       ?_003                                   ; 0332 _ 74, 73
        call    io_sti                                  ; 0334 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0339 _ 83. EC, 0C
        push    keyinfo                                 ; 033C _ 68, 00000008(d)
        call    fifo8_get                               ; 0341 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0346 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 0349 _ 89. 45, EC
        cmp     dword [ebp-14H], 28                     ; 034C _ 83. 7D, EC, 1C
        jne near      ?_005                                   ; 0350 _ 0f 85, 000000b0
        mov     ebx, dword [xsize]                      ; 0356 _ 8B. 1D, 00000138(d)
        mov     ecx, dword [buf_back]                   ; 035C _ 8B. 0D, 00000140(d)
        mov     edx, dword [ebp-34H]                    ; 0362 _ 8B. 55, CC
        mov     eax, edx                                ; 0365 _ 89. D0
        shl     eax, 2                                  ; 0367 _ C1. E0, 02
        add     eax, edx                                ; 036A _ 01. D0
        shl     eax, 2                                  ; 036C _ C1. E0, 02
        mov     edx, eax                                ; 036F _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 0371 _ 8B. 45, E0
        add     eax, edx                                ; 0374 _ 01. D0
        sub     esp, 4                                  ; 0376 _ 83. EC, 04
        push    7                                       ; 0379 _ 6A, 07
        push    ebx                                     ; 037B _ 53
        push    dword [ebp-34H]                         ; 037C _ FF. 75, CC
        push    ecx                                     ; 037F _ 51
        push    eax                                     ; 0380 _ 50
        push    dword [ebp-2CH]                         ; 0381 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 0384 _ FF. 75, E4
        call    showMemoryInfo                          ; 0387 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 038C _ 83. C4, 20
        add     dword [ebp-34H], 1                      ; 038F _ 83. 45, CC, 01
        mov     eax, dword [ebp-34H]                    ; 0393 _ 8B. 45, CC
        cmp     eax, dword [ebp-24H]                    ; 0396 _ 3B. 45, DC
        jle near      ?_005                                   ; 0399 _ 7e, 6b
        mov     dword [ebp-34H], 0                      ; 039B _ C7. 45, CC, 00000000
        jmp     ?_001                                   ; 03A2 _ E9, FFFFFEE1

?_003:  sub     esp, 12                                 ; 03A7 _ 83. EC, 0C
        push    mouseinfo                               ; 03AA _ 68, 00000020(d)
        call    fifo8_status                            ; 03AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B4 _ 83. C4, 10
        test    eax, eax                                ; 03B7 _ 85. C0
        jz near       ?_004                                   ; 03b9 _ 74, 16
        sub     esp, 4                                  ; 03BB _ 83. EC, 04
        push    dword [ebp-28H]                         ; 03BE _ FF. 75, D8
        push    dword [ebp-2CH]                         ; 03C1 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 03C4 _ FF. 75, E4
        call    show_mouse_info                         ; 03C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03CC _ 83. C4, 10
        jmp     ?_005                                   ; 03CF _ EB, 35

?_004:  sub     esp, 12                                 ; 03D1 _ 83. EC, 0C
        push    timerinfo                               ; 03D4 _ 68, 00000110(d)
        call    fifo8_status                            ; 03D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DE _ 83. C4, 10
        test    eax, eax                                ; 03E1 _ 85. C0
        jz near       ?_005                                   ; 03e3 _ 74, 21
        call    io_sti                                  ; 03E5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03EA _ 83. EC, 08
        push    ?_149                                   ; 03ED _ 68, 00000008(d)
        push    7                                       ; 03F2 _ 6A, 07
        push    0                                       ; 03F4 _ 6A, 00
        push    0                                       ; 03F6 _ 6A, 00
        push    dword [ebp-2CH]                         ; 03F8 _ FF. 75, D4
        push    dword [ebp-1CH]                         ; 03FB _ FF. 75, E4
        call    showString                              ; 03FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0403 _ 83. C4, 20
?_005:  jmp     ?_001                                   ; 0406 _ E9, FFFFFE7D
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 040B _ 55
        mov     ebp, esp                                ; 040C _ 89. E5
        push    ebx                                     ; 040E _ 53
        sub     esp, 4                                  ; 040F _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0412 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0415 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0418 _ 8B. 45, 0C
        sub     eax, 1                                  ; 041B _ 83. E8, 01
        sub     esp, 4                                  ; 041E _ 83. EC, 04
        push    edx                                     ; 0421 _ 52
        push    eax                                     ; 0422 _ 50
        push    0                                       ; 0423 _ 6A, 00
        push    0                                       ; 0425 _ 6A, 00
        push    14                                      ; 0427 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0429 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 042C _ FF. 75, 08
        call    boxfill8                                ; 042F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0434 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0437 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 043A _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 043D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0440 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0443 _ 8B. 45, 10
        sub     eax, 28                                 ; 0446 _ 83. E8, 1C
        sub     esp, 4                                  ; 0449 _ 83. EC, 04
        push    ecx                                     ; 044C _ 51
        push    edx                                     ; 044D _ 52
        push    eax                                     ; 044E _ 50
        push    0                                       ; 044F _ 6A, 00
        push    8                                       ; 0451 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0453 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0456 _ FF. 75, 08
        call    boxfill8                                ; 0459 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 045E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0461 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0464 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0467 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 046A _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 046D _ 8B. 45, 10
        sub     eax, 27                                 ; 0470 _ 83. E8, 1B
        sub     esp, 4                                  ; 0473 _ 83. EC, 04
        push    ecx                                     ; 0476 _ 51
        push    edx                                     ; 0477 _ 52
        push    eax                                     ; 0478 _ 50
        push    0                                       ; 0479 _ 6A, 00
        push    7                                       ; 047B _ 6A, 07
        push    dword [ebp+0CH]                         ; 047D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0480 _ FF. 75, 08
        call    boxfill8                                ; 0483 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0488 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 048B _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 048E _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0491 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0494 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0497 _ 8B. 45, 10
        sub     eax, 26                                 ; 049A _ 83. E8, 1A
        sub     esp, 4                                  ; 049D _ 83. EC, 04
        push    ecx                                     ; 04A0 _ 51
        push    edx                                     ; 04A1 _ 52
        push    eax                                     ; 04A2 _ 50
        push    0                                       ; 04A3 _ 6A, 00
        push    8                                       ; 04A5 _ 6A, 08
        push    dword [ebp+0CH]                         ; 04A7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04AA _ FF. 75, 08
        call    boxfill8                                ; 04AD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04B2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04B5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04B8 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 04BB _ 8B. 45, 10
        sub     eax, 24                                 ; 04BE _ 83. E8, 18
        sub     esp, 4                                  ; 04C1 _ 83. EC, 04
        push    edx                                     ; 04C4 _ 52
        push    59                                      ; 04C5 _ 6A, 3B
        push    eax                                     ; 04C7 _ 50
        push    3                                       ; 04C8 _ 6A, 03
        push    7                                       ; 04CA _ 6A, 07
        push    dword [ebp+0CH]                         ; 04CC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04CF _ FF. 75, 08
        call    boxfill8                                ; 04D2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04DA _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04DD _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04E0 _ 8B. 45, 10
        sub     eax, 24                                 ; 04E3 _ 83. E8, 18
        sub     esp, 4                                  ; 04E6 _ 83. EC, 04
        push    edx                                     ; 04E9 _ 52
        push    2                                       ; 04EA _ 6A, 02
        push    eax                                     ; 04EC _ 50
        push    2                                       ; 04ED _ 6A, 02
        push    7                                       ; 04EF _ 6A, 07
        push    dword [ebp+0CH]                         ; 04F1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04F4 _ FF. 75, 08
        call    boxfill8                                ; 04F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04FC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04FF _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0502 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0505 _ 8B. 45, 10
        sub     eax, 4                                  ; 0508 _ 83. E8, 04
        sub     esp, 4                                  ; 050B _ 83. EC, 04
        push    edx                                     ; 050E _ 52
        push    59                                      ; 050F _ 6A, 3B
        push    eax                                     ; 0511 _ 50
        push    3                                       ; 0512 _ 6A, 03
        push    15                                      ; 0514 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0516 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0519 _ FF. 75, 08
        call    boxfill8                                ; 051C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0521 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0524 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0527 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 052A _ 8B. 45, 10
        sub     eax, 23                                 ; 052D _ 83. E8, 17
        sub     esp, 4                                  ; 0530 _ 83. EC, 04
        push    edx                                     ; 0533 _ 52
        push    59                                      ; 0534 _ 6A, 3B
        push    eax                                     ; 0536 _ 50
        push    59                                      ; 0537 _ 6A, 3B
        push    15                                      ; 0539 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 053B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 053E _ FF. 75, 08
        call    boxfill8                                ; 0541 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0546 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0549 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 054C _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 054F _ 8B. 45, 10
        sub     eax, 3                                  ; 0552 _ 83. E8, 03
        sub     esp, 4                                  ; 0555 _ 83. EC, 04
        push    edx                                     ; 0558 _ 52
        push    59                                      ; 0559 _ 6A, 3B
        push    eax                                     ; 055B _ 50
        push    2                                       ; 055C _ 6A, 02
        push    0                                       ; 055E _ 6A, 00
        push    dword [ebp+0CH]                         ; 0560 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0563 _ FF. 75, 08
        call    boxfill8                                ; 0566 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 056B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 056E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0571 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0574 _ 8B. 45, 10
        sub     eax, 24                                 ; 0577 _ 83. E8, 18
        sub     esp, 4                                  ; 057A _ 83. EC, 04
        push    edx                                     ; 057D _ 52
        push    60                                      ; 057E _ 6A, 3C
        push    eax                                     ; 0580 _ 50
        push    60                                      ; 0581 _ 6A, 3C
        push    0                                       ; 0583 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0585 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0588 _ FF. 75, 08
        call    boxfill8                                ; 058B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0590 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0593 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0596 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0599 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 059C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 059F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 05A2 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 05A5 _ 8B. 45, 0C
        sub     eax, 47                                 ; 05A8 _ 83. E8, 2F
        sub     esp, 4                                  ; 05AB _ 83. EC, 04
        push    ebx                                     ; 05AE _ 53
        push    ecx                                     ; 05AF _ 51
        push    edx                                     ; 05B0 _ 52
        push    eax                                     ; 05B1 _ 50
        push    15                                      ; 05B2 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 05B4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05B7 _ FF. 75, 08
        call    boxfill8                                ; 05BA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05BF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 05C2 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 05C5 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 05C8 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 05CB _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 05CE _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 05D1 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 05D4 _ 8B. 45, 0C
        sub     eax, 47                                 ; 05D7 _ 83. E8, 2F
        sub     esp, 4                                  ; 05DA _ 83. EC, 04
        push    ebx                                     ; 05DD _ 53
        push    ecx                                     ; 05DE _ 51
        push    edx                                     ; 05DF _ 52
        push    eax                                     ; 05E0 _ 50
        push    15                                      ; 05E1 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 05E3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05E6 _ FF. 75, 08
        call    boxfill8                                ; 05E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05EE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 05F1 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 05F4 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 05F7 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 05FA _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 05FD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0600 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0603 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0606 _ 83. E8, 2F
        sub     esp, 4                                  ; 0609 _ 83. EC, 04
        push    ebx                                     ; 060C _ 53
        push    ecx                                     ; 060D _ 51
        push    edx                                     ; 060E _ 52
        push    eax                                     ; 060F _ 50
        push    7                                       ; 0610 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0612 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0615 _ FF. 75, 08
        call    boxfill8                                ; 0618 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 061D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0620 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0623 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0626 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0629 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 062C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 062F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0632 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0635 _ 83. E8, 03
        sub     esp, 4                                  ; 0638 _ 83. EC, 04
        push    ebx                                     ; 063B _ 53
        push    ecx                                     ; 063C _ 51
        push    edx                                     ; 063D _ 52
        push    eax                                     ; 063E _ 50
        push    7                                       ; 063F _ 6A, 07
        push    dword [ebp+0CH]                         ; 0641 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0644 _ FF. 75, 08
        call    boxfill8                                ; 0647 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 064C _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 064F _ 8B. 5D, FC
        leave                                           ; 0652 _ C9
        ret                                             ; 0653 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0654 _ 55
        mov     ebp, esp                                ; 0655 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0657 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 065A _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 065D _ A1, 00000130(d)
        add     eax, edx                                ; 0662 _ 01. D0
        mov     dword [mx], eax                         ; 0664 _ A3, 00000130(d)
        mov     eax, dword [ebp+10H]                    ; 0669 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 066C _ 8B. 50, 08
        mov     eax, dword [my]                         ; 066F _ A1, 00000134(d)
        add     eax, edx                                ; 0674 _ 01. D0
        mov     dword [my], eax                         ; 0676 _ A3, 00000134(d)
        mov     eax, dword [mx]                         ; 067B _ A1, 00000130(d)
        test    eax, eax                                ; 0680 _ 85. C0
        jns     ?_006                                   ; 0682 _ 79, 0A
        mov     dword [mx], 0                           ; 0684 _ C7. 05, 00000130(d), 00000000
?_006:  mov     eax, dword [my]                         ; 068E _ A1, 00000134(d)
        test    eax, eax                                ; 0693 _ 85. C0
        jns     ?_007                                   ; 0695 _ 79, 0A
        mov     dword [my], 0                           ; 0697 _ C7. 05, 00000134(d), 00000000
?_007:  mov     eax, dword [xsize]                      ; 06A1 _ A1, 00000138(d)
        lea     edx, [eax-1H]                           ; 06A6 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 06A9 _ A1, 00000130(d)
        cmp     edx, eax                                ; 06AE _ 39. C2
        jge near      ?_008                                   ; 06b0 _ 7d, 0d
        mov     eax, dword [xsize]                      ; 06B2 _ A1, 00000138(d)
        sub     eax, 1                                  ; 06B7 _ 83. E8, 01
        mov     dword [mx], eax                         ; 06BA _ A3, 00000130(d)
?_008:  mov     eax, dword [ysize]                      ; 06BF _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 06C4 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 06C7 _ A1, 00000134(d)
        cmp     edx, eax                                ; 06CC _ 39. C2
        jge near      ?_009                                   ; 06ce _ 7d, 0d
        mov     eax, dword [ysize]                      ; 06D0 _ A1, 0000013C(d)
        sub     eax, 1                                  ; 06D5 _ 83. E8, 01
        mov     dword [my], eax                         ; 06D8 _ A3, 00000134(d)
?_009:  pop     ebp                                     ; 06DD _ 5D
        ret                                             ; 06DE _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 06DF _ 55
        mov     ebp, esp                                ; 06E0 _ 89. E5
        sub     esp, 24                                 ; 06E2 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 06E5 _ A1, 00000140(d)
        mov     dword [ebp-0CH], eax                    ; 06EA _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 06ED _ C6. 45, F3, 00
        call    io_sti                                  ; 06F1 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06F6 _ 83. EC, 0C
        push    mouseinfo                               ; 06F9 _ 68, 00000020(d)
        call    fifo8_get                               ; 06FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0703 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0706 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0709 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 070D _ 83. EC, 08
        push    eax                                     ; 0710 _ 50
        push    mdec                                    ; 0711 _ 68, 00000100(d)
        call    mouse_decode                            ; 0716 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 071B _ 83. C4, 10
        test    eax, eax                                ; 071E _ 85. C0
        jz near       ?_010                                   ; 0720 _ 74, 31
        sub     esp, 4                                  ; 0722 _ 83. EC, 04
        push    mdec                                    ; 0725 _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 072A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 072D _ FF. 75, 08
        call    computeMousePosition                    ; 0730 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0735 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0738 _ 8B. 15, 00000134(d)
        mov     eax, dword [mx]                         ; 073E _ A1, 00000130(d)
        push    edx                                     ; 0743 _ 52
        push    eax                                     ; 0744 _ 50
        push    dword [ebp+10H]                         ; 0745 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0748 _ FF. 75, 08
        call    sheet_slide                             ; 074B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0750 _ 83. C4, 10
?_010:  leave                                           ; 0753 _ C9
        ret                                             ; 0754 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0755 _ 55
        mov     ebp, esp                                ; 0756 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0758 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 075B _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0761 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0764 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 076A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 076D _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0773 _ 5D
        ret                                             ; 0774 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0775 _ 55
        mov     ebp, esp                                ; 0776 _ 89. E5
        push    ebx                                     ; 0778 _ 53
        sub     esp, 36                                 ; 0779 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 077C _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 077F _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0782 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0785 _ 89. 45, F4
        jmp     ?_012                                   ; 0788 _ EB, 3E

?_011:  mov     eax, dword [ebp+1CH]                    ; 078A _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 078D _ 0F B6. 00
        movzx   eax, al                                 ; 0790 _ 0F B6. C0
        shl     eax, 4                                  ; 0793 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0796 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 079C _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 07A0 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 07A3 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 07A6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 07A9 _ 8B. 00
        sub     esp, 8                                  ; 07AB _ 83. EC, 08
        push    ebx                                     ; 07AE _ 53
        push    ecx                                     ; 07AF _ 51
        push    dword [ebp+14H]                         ; 07B0 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 07B3 _ FF. 75, 10
        push    edx                                     ; 07B6 _ 52
        push    eax                                     ; 07B7 _ 50
        call    showFont8                               ; 07B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07BD _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 07C0 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 07C4 _ 83. 45, 1C, 01
?_012:  mov     eax, dword [ebp+1CH]                    ; 07C8 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 07CB _ 0F B6. 00
        test    al, al                                  ; 07CE _ 84. C0
        jnz near      ?_011                                   ; 07d0 _ 75, b8
        mov     eax, dword [ebp+14H]                    ; 07D2 _ 8B. 45, 14
        add     eax, 16                                 ; 07D5 _ 83. C0, 10
        sub     esp, 8                                  ; 07D8 _ 83. EC, 08
        push    eax                                     ; 07DB _ 50
        push    dword [ebp+10H]                         ; 07DC _ FF. 75, 10
        push    dword [ebp+14H]                         ; 07DF _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 07E2 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 07E5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 07E8 _ FF. 75, 08
        call    sheet_refresh                           ; 07EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07F0 _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 07F3 _ 8B. 5D, FC
        leave                                           ; 07F6 _ C9
        ret                                             ; 07F7 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 07F8 _ 55
        mov     ebp, esp                                ; 07F9 _ 89. E5
        sub     esp, 8                                  ; 07FB _ 83. EC, 08
        sub     esp, 4                                  ; 07FE _ 83. EC, 04
        push    table_rgb.1689                          ; 0801 _ 68, 00000020(d)
        push    15                                      ; 0806 _ 6A, 0F
        push    0                                       ; 0808 _ 6A, 00
        call    set_palette                             ; 080A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 080F _ 83. C4, 10
        nop                                             ; 0812 _ 90
        leave                                           ; 0813 _ C9
        ret                                             ; 0814 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0815 _ 55
        mov     ebp, esp                                ; 0816 _ 89. E5
        sub     esp, 24                                 ; 0818 _ 83. EC, 18
        call    io_load_eflags                          ; 081B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0820 _ 89. 45, F4
        call    io_cli                                  ; 0823 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0828 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 082B _ FF. 75, 08
        push    968                                     ; 082E _ 68, 000003C8
        call    io_out8                                 ; 0833 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0838 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 083B _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 083E _ 89. 45, F0
        jmp     ?_014                                   ; 0841 _ EB, 65

?_013:  mov     eax, dword [ebp+10H]                    ; 0843 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0846 _ 0F B6. 00
        shr     al, 2                                   ; 0849 _ C0. E8, 02
        movzx   eax, al                                 ; 084C _ 0F B6. C0
        sub     esp, 8                                  ; 084F _ 83. EC, 08
        push    eax                                     ; 0852 _ 50
        push    969                                     ; 0853 _ 68, 000003C9
        call    io_out8                                 ; 0858 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 085D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0860 _ 8B. 45, 10
        add     eax, 1                                  ; 0863 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0866 _ 0F B6. 00
        shr     al, 2                                   ; 0869 _ C0. E8, 02
        movzx   eax, al                                 ; 086C _ 0F B6. C0
        sub     esp, 8                                  ; 086F _ 83. EC, 08
        push    eax                                     ; 0872 _ 50
        push    969                                     ; 0873 _ 68, 000003C9
        call    io_out8                                 ; 0878 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 087D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0880 _ 8B. 45, 10
        add     eax, 2                                  ; 0883 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0886 _ 0F B6. 00
        shr     al, 2                                   ; 0889 _ C0. E8, 02
        movzx   eax, al                                 ; 088C _ 0F B6. C0
        sub     esp, 8                                  ; 088F _ 83. EC, 08
        push    eax                                     ; 0892 _ 50
        push    969                                     ; 0893 _ 68, 000003C9
        call    io_out8                                 ; 0898 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 089D _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 08A0 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 08A4 _ 83. 45, F0, 01
?_014:  mov     eax, dword [ebp-10H]                    ; 08A8 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 08AB _ 3B. 45, 0C
        jle near      ?_013                                   ; 08ae _ 7e, 93
        sub     esp, 12                                 ; 08B0 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 08B3 _ FF. 75, F4
        call    io_store_eflags                         ; 08B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08BB _ 83. C4, 10
        nop                                             ; 08BE _ 90
        leave                                           ; 08BF _ C9
        ret                                             ; 08C0 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 08C1 _ 55
        mov     ebp, esp                                ; 08C2 _ 89. E5
        sub     esp, 20                                 ; 08C4 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 08C7 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 08CA _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 08CD _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 08D0 _ 89. 45, FC
        jmp     ?_018                                   ; 08D3 _ EB, 33

?_015:  mov     eax, dword [ebp+14H]                    ; 08D5 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 08D8 _ 89. 45, F8
        jmp     ?_017                                   ; 08DB _ EB, 1F

?_016:  mov     eax, dword [ebp-4H]                     ; 08DD _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 08E0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 08E6 _ 8B. 45, F8
        add     eax, edx                                ; 08E9 _ 01. D0
        mov     edx, eax                                ; 08EB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08ED _ 8B. 45, 08
        add     edx, eax                                ; 08F0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08F2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08F6 _ 88. 02
        add     dword [ebp-8H], 1                       ; 08F8 _ 83. 45, F8, 01
?_017:  mov     eax, dword [ebp-8H]                     ; 08FC _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 08FF _ 3B. 45, 1C
        jle near      ?_016                                   ; 0902 _ 7e, d9
        add     dword [ebp-4H], 1                       ; 0904 _ 83. 45, FC, 01
?_018:  mov     eax, dword [ebp-4H]                     ; 0908 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 090B _ 3B. 45, 20
        jle near      ?_015                                   ; 090e _ 7e, c5
        leave                                           ; 0910 _ C9
        ret                                             ; 0911 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0912 _ 55
        mov     ebp, esp                                ; 0913 _ 89. E5
        sub     esp, 20                                 ; 0915 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0918 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 091B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 091E _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0925 _ E9, 0000016C

?_019:  mov     edx, dword [ebp-4H]                     ; 092A _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 092D _ 8B. 45, 1C
        add     eax, edx                                ; 0930 _ 01. D0
        movzx   eax, byte [eax]                         ; 0932 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0935 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0938 _ 80. 7D, FB, 00
        jns     ?_020                                   ; 093C _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 093E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0941 _ 8B. 45, FC
        add     eax, edx                                ; 0944 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0946 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 094A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 094C _ 8B. 45, 10
        add     eax, edx                                ; 094F _ 01. D0
        mov     edx, eax                                ; 0951 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0953 _ 8B. 45, 08
        add     edx, eax                                ; 0956 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0958 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 095C _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 095E _ 0F BE. 45, FB
        and     eax, 40H                                ; 0962 _ 83. E0, 40
        test    eax, eax                                ; 0965 _ 85. C0
        jz near       ?_021                                   ; 0967 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0969 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 096C _ 8B. 45, FC
        add     eax, edx                                ; 096F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0971 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0975 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0977 _ 8B. 45, 10
        add     eax, edx                                ; 097A _ 01. D0
        lea     edx, [eax+1H]                           ; 097C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 097F _ 8B. 45, 08
        add     edx, eax                                ; 0982 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0984 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0988 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 098A _ 0F BE. 45, FB
        and     eax, 20H                                ; 098E _ 83. E0, 20
        test    eax, eax                                ; 0991 _ 85. C0
        jz near       ?_022                                   ; 0993 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0995 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0998 _ 8B. 45, FC
        add     eax, edx                                ; 099B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 099D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09A1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09A3 _ 8B. 45, 10
        add     eax, edx                                ; 09A6 _ 01. D0
        lea     edx, [eax+2H]                           ; 09A8 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 09AB _ 8B. 45, 08
        add     edx, eax                                ; 09AE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09B0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09B4 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 09B6 _ 0F BE. 45, FB
        and     eax, 10H                                ; 09BA _ 83. E0, 10
        test    eax, eax                                ; 09BD _ 85. C0
        jz near       ?_023                                   ; 09bf _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 09C1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09C4 _ 8B. 45, FC
        add     eax, edx                                ; 09C7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09C9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09CD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09CF _ 8B. 45, 10
        add     eax, edx                                ; 09D2 _ 01. D0
        lea     edx, [eax+3H]                           ; 09D4 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 09D7 _ 8B. 45, 08
        add     edx, eax                                ; 09DA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 09DC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 09E0 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 09E2 _ 0F BE. 45, FB
        and     eax, 08H                                ; 09E6 _ 83. E0, 08
        test    eax, eax                                ; 09E9 _ 85. C0
        jz near       ?_024                                   ; 09eb _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 09ED _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09F0 _ 8B. 45, FC
        add     eax, edx                                ; 09F3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09F5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09F9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09FB _ 8B. 45, 10
        add     eax, edx                                ; 09FE _ 01. D0
        lea     edx, [eax+4H]                           ; 0A00 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A03 _ 8B. 45, 08
        add     edx, eax                                ; 0A06 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A08 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A0C _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0A0E _ 0F BE. 45, FB
        and     eax, 04H                                ; 0A12 _ 83. E0, 04
        test    eax, eax                                ; 0A15 _ 85. C0
        jz near       ?_025                                   ; 0a17 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A19 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A1C _ 8B. 45, FC
        add     eax, edx                                ; 0A1F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A21 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A25 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A27 _ 8B. 45, 10
        add     eax, edx                                ; 0A2A _ 01. D0
        lea     edx, [eax+5H]                           ; 0A2C _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0A2F _ 8B. 45, 08
        add     edx, eax                                ; 0A32 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A34 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A38 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0A3A _ 0F BE. 45, FB
        and     eax, 02H                                ; 0A3E _ 83. E0, 02
        test    eax, eax                                ; 0A41 _ 85. C0
        jz near       ?_026                                   ; 0a43 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A45 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A48 _ 8B. 45, FC
        add     eax, edx                                ; 0A4B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A4D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A51 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A53 _ 8B. 45, 10
        add     eax, edx                                ; 0A56 _ 01. D0
        lea     edx, [eax+6H]                           ; 0A58 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0A5B _ 8B. 45, 08
        add     edx, eax                                ; 0A5E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A60 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A64 _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0A66 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0A6A _ 83. E0, 01
        test    eax, eax                                ; 0A6D _ 85. C0
        jz near       ?_027                                   ; 0a6f _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0A71 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A74 _ 8B. 45, FC
        add     eax, edx                                ; 0A77 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A79 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A7D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A7F _ 8B. 45, 10
        add     eax, edx                                ; 0A82 _ 01. D0
        lea     edx, [eax+7H]                           ; 0A84 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0A87 _ 8B. 45, 08
        add     edx, eax                                ; 0A8A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A8C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A90 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0A92 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0A96 _ 83. 7D, FC, 0F
        jle near      ?_019                                   ; 0a9a _ 0f 8e, fffffe8a
        leave                                           ; 0AA0 _ C9
        ret                                             ; 0AA1 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0AA2 _ 55
        mov     ebp, esp                                ; 0AA3 _ 89. E5
        sub     esp, 20                                 ; 0AA5 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0AA8 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0AAB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0AAE _ C7. 45, FC, 00000000
        jmp     ?_035                                   ; 0AB5 _ E9, 000000B1

?_029:  mov     dword [ebp-8H], 0                       ; 0ABA _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 0AC1 _ E9, 00000097

?_030:  mov     eax, dword [ebp-4H]                     ; 0AC6 _ 8B. 45, FC
        shl     eax, 4                                  ; 0AC9 _ C1. E0, 04
        mov     edx, eax                                ; 0ACC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0ACE _ 8B. 45, F8
        add     eax, edx                                ; 0AD1 _ 01. D0
        add     eax, cursor.1736                        ; 0AD3 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AD8 _ 0F B6. 00
        cmp     al, 42                                  ; 0ADB _ 3C, 2A
        jnz near      ?_031                                   ; 0add _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0ADF _ 8B. 45, FC
        shl     eax, 4                                  ; 0AE2 _ C1. E0, 04
        mov     edx, eax                                ; 0AE5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0AE7 _ 8B. 45, F8
        add     eax, edx                                ; 0AEA _ 01. D0
        mov     edx, eax                                ; 0AEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AEE _ 8B. 45, 08
        add     eax, edx                                ; 0AF1 _ 01. D0
        mov     byte [eax], 0                           ; 0AF3 _ C6. 00, 00
?_031:  mov     eax, dword [ebp-4H]                     ; 0AF6 _ 8B. 45, FC
        shl     eax, 4                                  ; 0AF9 _ C1. E0, 04
        mov     edx, eax                                ; 0AFC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0AFE _ 8B. 45, F8
        add     eax, edx                                ; 0B01 _ 01. D0
        add     eax, cursor.1736                        ; 0B03 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B08 _ 0F B6. 00
        cmp     al, 79                                  ; 0B0B _ 3C, 4F
        jnz near      ?_032                                   ; 0b0d _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 0B0F _ 8B. 45, FC
        shl     eax, 4                                  ; 0B12 _ C1. E0, 04
        mov     edx, eax                                ; 0B15 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B17 _ 8B. 45, F8
        add     eax, edx                                ; 0B1A _ 01. D0
        mov     edx, eax                                ; 0B1C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B1E _ 8B. 45, 08
        add     eax, edx                                ; 0B21 _ 01. D0
        mov     byte [eax], 7                           ; 0B23 _ C6. 00, 07
?_032:  mov     eax, dword [ebp-4H]                     ; 0B26 _ 8B. 45, FC
        shl     eax, 4                                  ; 0B29 _ C1. E0, 04
        mov     edx, eax                                ; 0B2C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B2E _ 8B. 45, F8
        add     eax, edx                                ; 0B31 _ 01. D0
        add     eax, cursor.1736                        ; 0B33 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B38 _ 0F B6. 00
        cmp     al, 46                                  ; 0B3B _ 3C, 2E
        jnz near      ?_033                                   ; 0b3d _ 75, 1a
        mov     eax, dword [ebp-4H]                     ; 0B3F _ 8B. 45, FC
        shl     eax, 4                                  ; 0B42 _ C1. E0, 04
        mov     edx, eax                                ; 0B45 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B47 _ 8B. 45, F8
        add     eax, edx                                ; 0B4A _ 01. D0
        mov     edx, eax                                ; 0B4C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B4E _ 8B. 45, 08
        add     edx, eax                                ; 0B51 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B53 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B57 _ 88. 02
?_033:  add     dword [ebp-8H], 1                       ; 0B59 _ 83. 45, F8, 01
?_034:  cmp     dword [ebp-8H], 15                      ; 0B5D _ 83. 7D, F8, 0F
        jle near      ?_030                                   ; 0b61 _ 0f 8e, ffffff5f
        add     dword [ebp-4H], 1                       ; 0B67 _ 83. 45, FC, 01
?_035:  cmp     dword [ebp-4H], 15                      ; 0B6B _ 83. 7D, FC, 0F
        jle near      ?_029                                   ; 0b6f _ 0f 8e, ffffff45
        leave                                           ; 0B75 _ C9
        ret                                             ; 0B76 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0B77 _ 55
        mov     ebp, esp                                ; 0B78 _ 89. E5
        sub     esp, 16                                 ; 0B7A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0B7D _ C7. 45, FC, 00000000
        jmp     ?_039                                   ; 0B84 _ EB, 50

?_036:  mov     dword [ebp-8H], 0                       ; 0B86 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 0B8D _ EB, 3B

?_037:  mov     edx, dword [ebp+1CH]                    ; 0B8F _ 8B. 55, 1C
        mov     eax, dword [ebp-4H]                     ; 0B92 _ 8B. 45, FC
        add     eax, edx                                ; 0B95 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B97 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 0B9B _ 8B. 4D, 18
        mov     edx, dword [ebp-8H]                     ; 0B9E _ 8B. 55, F8
        add     edx, ecx                                ; 0BA1 _ 01. CA
        add     eax, edx                                ; 0BA3 _ 01. D0
        mov     edx, eax                                ; 0BA5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BA7 _ 8B. 45, 08
        add     edx, eax                                ; 0BAA _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0BAC _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0BAF _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0BB3 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0BB5 _ 8B. 45, F8
        add     eax, ecx                                ; 0BB8 _ 01. C8
        mov     ecx, eax                                ; 0BBA _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0BBC _ 8B. 45, 20
        add     eax, ecx                                ; 0BBF _ 01. C8
        movzx   eax, byte [eax]                         ; 0BC1 _ 0F B6. 00
        mov     byte [edx], al                          ; 0BC4 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0BC6 _ 83. 45, F8, 01
?_038:  mov     eax, dword [ebp-8H]                     ; 0BCA _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0BCD _ 3B. 45, 10
        jl      ?_037                                   ; 0BD0 _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0BD2 _ 83. 45, FC, 01
?_039:  mov     eax, dword [ebp-4H]                     ; 0BD6 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0BD9 _ 3B. 45, 14
        jl      ?_036                                   ; 0BDC _ 7C, A8
        leave                                           ; 0BDE _ C9
        ret                                             ; 0BDF _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0BE0 _ 55
        mov     ebp, esp                                ; 0BE1 _ 89. E5
        sub     esp, 24                                 ; 0BE3 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0BE6 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 0BEB _ 89. 45, EC
        movzx   eax, word [?_160]                       ; 0BEE _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BF5 _ 98
        mov     dword [ebp-10H], eax                    ; 0BF6 _ 89. 45, F0
        movzx   eax, word [?_161]                       ; 0BF9 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0C00 _ 98
        mov     dword [ebp-0CH], eax                    ; 0C01 _ 89. 45, F4
        sub     esp, 8                                  ; 0C04 _ 83. EC, 08
        push    32                                      ; 0C07 _ 6A, 20
        push    32                                      ; 0C09 _ 6A, 20
        call    io_out8                                 ; 0C0B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C10 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0C13 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0C17 _ 83. EC, 0C
        push    96                                      ; 0C1A _ 6A, 60
        call    io_in8                                  ; 0C1C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C21 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0C24 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0C27 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0C2B _ 83. EC, 08
        push    eax                                     ; 0C2E _ 50
        push    keyinfo                                 ; 0C2F _ 68, 00000008(d)
        call    fifo8_put                               ; 0C34 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C39 _ 83. C4, 10
        nop                                             ; 0C3C _ 90
        leave                                           ; 0C3D _ C9
        ret                                             ; 0C3E _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0C3F _ 55
        mov     ebp, esp                                ; 0C40 _ 89. E5
        sub     esp, 4                                  ; 0C42 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0C45 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0C48 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0C4B _ 80. 7D, FC, 09
        jle near      ?_040                                   ; 0c4f _ 7e, 09
        movzx   eax, byte [ebp-4H]                      ; 0C51 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0C55 _ 83. C0, 37
        jmp     ?_041                                   ; 0C58 _ EB, 07

?_040:  movzx   eax, byte [ebp-4H]                      ; 0C5A _ 0F B6. 45, FC
        add     eax, 48                                 ; 0C5E _ 83. C0, 30
?_041:  leave                                           ; 0C61 _ C9
        ret                                             ; 0C62 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0C63 _ 55
        mov     ebp, esp                                ; 0C64 _ 89. E5
        sub     esp, 20                                 ; 0C66 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0C69 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0C6C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0C6F _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0C76 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0C7A _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0C7D _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0C80 _ 0F BE. 45, FB
        push    eax                                     ; 0C84 _ 50
        call    charToHexVal                            ; 0C85 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0C8A _ 83. C4, 04
        mov     byte [?_159], al                        ; 0C8D _ A2, 00000007(d)
        movzx   eax, byte [ebp-14H]                     ; 0C92 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0C96 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0C99 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0C9C _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0CA0 _ 0F BE. C0
        push    eax                                     ; 0CA3 _ 50
        call    charToHexVal                            ; 0CA4 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0CA9 _ 83. C4, 04
        mov     byte [?_158], al                        ; 0CAC _ A2, 00000006(d)
        mov     eax, keyval                             ; 0CB1 _ B8, 00000004(d)
        leave                                           ; 0CB6 _ C9
        ret                                             ; 0CB7 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0CB8 _ 55
        mov     ebp, esp                                ; 0CB9 _ 89. E5
        sub     esp, 16                                 ; 0CBB _ 83. EC, 10
        mov     byte [str.1784], 48                     ; 0CBE _ C6. 05, 00000280(d), 30
        mov     byte [?_162], 88                        ; 0CC5 _ C6. 05, 00000281(d), 58
        mov     byte [?_163], 0                         ; 0CCC _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0CD3 _ C7. 45, F4, 00000002
        jmp     ?_043                                   ; 0CDA _ EB, 0F

?_042:  mov     eax, dword [ebp-0CH]                    ; 0CDC _ 8B. 45, F4
        add     eax, str.1784                           ; 0CDF _ 05, 00000280(d)
        mov     byte [eax], 48                          ; 0CE4 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0CE7 _ 83. 45, F4, 01
?_043:  cmp     dword [ebp-0CH], 9                      ; 0CEB _ 83. 7D, F4, 09
        jle near      ?_042                                   ; 0cef _ 7e, eb
        mov     dword [ebp-8H], 9                       ; 0CF1 _ C7. 45, F8, 00000009
        jmp     ?_047                                   ; 0CF8 _ EB, 42

?_044:  mov     eax, dword [ebp+8H]                     ; 0CFA _ 8B. 45, 08
        and     eax, 0FH                                ; 0CFD _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0D00 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D03 _ 8B. 45, 08
        shr     eax, 4                                  ; 0D06 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0D09 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0D0C _ 83. 7D, FC, 09
        jle near      ?_045                                   ; 0d10 _ 7e, 14
        mov     eax, dword [ebp-4H]                     ; 0D12 _ 8B. 45, FC
        add     eax, 55                                 ; 0D15 _ 83. C0, 37
        mov     edx, eax                                ; 0D18 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0D1A _ 8B. 45, F8
        add     eax, str.1784                           ; 0D1D _ 05, 00000280(d)
        mov     byte [eax], dl                          ; 0D22 _ 88. 10
        jmp     ?_046                                   ; 0D24 _ EB, 12

?_045:  mov     eax, dword [ebp-4H]                     ; 0D26 _ 8B. 45, FC
        add     eax, 48                                 ; 0D29 _ 83. C0, 30
        mov     edx, eax                                ; 0D2C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0D2E _ 8B. 45, F8
        add     eax, str.1784                           ; 0D31 _ 05, 00000280(d)
        mov     byte [eax], dl                          ; 0D36 _ 88. 10
?_046:  sub     dword [ebp-8H], 1                       ; 0D38 _ 83. 6D, F8, 01
?_047:  cmp     dword [ebp-8H], 1                       ; 0D3C _ 83. 7D, F8, 01
        jle near      ?_048                                   ; 0d40 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 0D42 _ 83. 7D, 08, 00
        jnz near      ?_044                                   ; 0d46 _ 75, b2
?_048:  mov     eax, str.1784                           ; 0D48 _ B8, 00000280(d)
        leave                                           ; 0D4D _ C9
        ret                                             ; 0D4E _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0D4F _ 55
        mov     ebp, esp                                ; 0D50 _ 89. E5
        sub     esp, 8                                  ; 0D52 _ 83. EC, 08
?_049:  sub     esp, 12                                 ; 0D55 _ 83. EC, 0C
        push    100                                     ; 0D58 _ 6A, 64
        call    io_in8                                  ; 0D5A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D5F _ 83. C4, 10
        and     eax, 02H                                ; 0D62 _ 83. E0, 02
        test    eax, eax                                ; 0D65 _ 85. C0
        jnz near      ?_050                                   ; 0d67 _ 75, 02
        jmp     ?_051                                   ; 0D69 _ EB, 02

?_050:  jmp     ?_049                                   ; 0D6B _ EB, E8

?_051:  leave                                           ; 0D6D _ C9
        ret                                             ; 0D6E _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0D6F _ 55
        mov     ebp, esp                                ; 0D70 _ 89. E5
        sub     esp, 8                                  ; 0D72 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0D75 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D7A _ 83. EC, 08
        push    96                                      ; 0D7D _ 6A, 60
        push    100                                     ; 0D7F _ 6A, 64
        call    io_out8                                 ; 0D81 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D86 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0D89 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D8E _ 83. EC, 08
        push    71                                      ; 0D91 _ 6A, 47
        push    96                                      ; 0D93 _ 6A, 60
        call    io_out8                                 ; 0D95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D9A _ 83. C4, 10
        nop                                             ; 0D9D _ 90
        leave                                           ; 0D9E _ C9
        ret                                             ; 0D9F _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0DA0 _ 55
        mov     ebp, esp                                ; 0DA1 _ 89. E5
        sub     esp, 8                                  ; 0DA3 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0DA6 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DAB _ 83. EC, 08
        push    212                                     ; 0DAE _ 68, 000000D4
        push    100                                     ; 0DB3 _ 6A, 64
        call    io_out8                                 ; 0DB5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DBA _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0DBD _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DC2 _ 83. EC, 08
        push    244                                     ; 0DC5 _ 68, 000000F4
        push    96                                      ; 0DCA _ 6A, 60
        call    io_out8                                 ; 0DCC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DD1 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0DD4 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0DD7 _ C6. 40, 03, 00
        nop                                             ; 0DDB _ 90
        leave                                           ; 0DDC _ C9
        ret                                             ; 0DDD _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0DDE _ 55
        mov     ebp, esp                                ; 0DDF _ 89. E5
        sub     esp, 24                                 ; 0DE1 _ 83. EC, 18
        sub     esp, 8                                  ; 0DE4 _ 83. EC, 08
        push    32                                      ; 0DE7 _ 6A, 20
        push    160                                     ; 0DE9 _ 68, 000000A0
        call    io_out8                                 ; 0DEE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF3 _ 83. C4, 10
        sub     esp, 8                                  ; 0DF6 _ 83. EC, 08
        push    32                                      ; 0DF9 _ 6A, 20
        push    32                                      ; 0DFB _ 6A, 20
        call    io_out8                                 ; 0DFD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E02 _ 83. C4, 10
        sub     esp, 12                                 ; 0E05 _ 83. EC, 0C
        push    96                                      ; 0E08 _ 6A, 60
        call    io_in8                                  ; 0E0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E0F _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0E12 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E15 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0E19 _ 83. EC, 08
        push    eax                                     ; 0E1C _ 50
        push    mouseinfo                               ; 0E1D _ 68, 00000020(d)
        call    fifo8_put                               ; 0E22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E27 _ 83. C4, 10
        leave                                           ; 0E2A _ C9
        ret                                             ; 0E2B _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E2C _ 55
        mov     ebp, esp                                ; 0E2D _ 89. E5
        sub     esp, 4                                  ; 0E2F _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E32 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E35 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E38 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E3B _ 0F B6. 40, 03
        test    al, al                                  ; 0E3F _ 84. C0
        jnz near      ?_053                                   ; 0e41 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E43 _ 80. 7D, FC, FA
        jnz near      ?_052                                   ; 0e47 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E49 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E4C _ C6. 40, 03, 01
?_052:  mov     eax, 0                                  ; 0E50 _ B8, 00000000
        jmp     ?_060                                   ; 0E55 _ E9, 0000010F

?_053:  mov     eax, dword [ebp+8H]                     ; 0E5A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E5D _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0E61 _ 3C, 01
        jnz near      ?_055                                   ; 0e63 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0E65 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0E69 _ 25, 000000C8
        cmp     eax, 8                                  ; 0E6E _ 83. F8, 08
        jnz near      ?_054                                   ; 0e71 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0E73 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0E76 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0E7A _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0E7C _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0E7F _ C6. 40, 03, 02
?_054:  mov     eax, 0                                  ; 0E83 _ B8, 00000000
        jmp     ?_060                                   ; 0E88 _ E9, 000000DC

?_055:  mov     eax, dword [ebp+8H]                     ; 0E8D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E90 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0E94 _ 3C, 02
        jnz near      ?_056                                   ; 0e96 _ 75, 1b
        mov     eax, dword [ebp+8H]                     ; 0E98 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0E9B _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0E9F _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EA2 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0EA5 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0EA9 _ B8, 00000000
        jmp     ?_060                                   ; 0EAE _ E9, 000000B6

?_056:  mov     eax, dword [ebp+8H]                     ; 0EB3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EB6 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0EBA _ 3C, 03
        jne near      ?_059                                   ; 0ebc _ 0f 85, 000000a2
        mov     eax, dword [ebp+8H]                     ; 0EC2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EC5 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0EC9 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0ECC _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0ECF _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0ED3 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0ED6 _ 0F B6. 00
        movzx   eax, al                                 ; 0ED9 _ 0F B6. C0
        and     eax, 07H                                ; 0EDC _ 83. E0, 07
        mov     edx, eax                                ; 0EDF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EE1 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0EE4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0EE7 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0EEA _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0EEE _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0EF1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0EF4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EF7 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0EFA _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0EFE _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F01 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F04 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F07 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F0A _ 0F B6. 00
        movzx   eax, al                                 ; 0F0D _ 0F B6. C0
        and     eax, 10H                                ; 0F10 _ 83. E0, 10
        test    eax, eax                                ; 0F13 _ 85. C0
        jz near       ?_057                                   ; 0f15 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F17 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F1A _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F1D _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F22 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F24 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F27 _ 89. 50, 04
?_057:  mov     eax, dword [ebp+8H]                     ; 0F2A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F2D _ 0F B6. 00
        movzx   eax, al                                 ; 0F30 _ 0F B6. C0
        and     eax, 20H                                ; 0F33 _ 83. E0, 20
        test    eax, eax                                ; 0F36 _ 85. C0
        jz near       ?_058                                   ; 0f38 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F3A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F3D _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F40 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F45 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F47 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F4A _ 89. 50, 08
?_058:  mov     eax, dword [ebp+8H]                     ; 0F4D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F50 _ 8B. 40, 08
        neg     eax                                     ; 0F53 _ F7. D8
        mov     edx, eax                                ; 0F55 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F57 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F5A _ 89. 50, 08
        mov     eax, 1                                  ; 0F5D _ B8, 00000001
        jmp     ?_060                                   ; 0F62 _ EB, 05

?_059:  mov     eax, 4294967295                         ; 0F64 _ B8, FFFFFFFF
?_060:  leave                                           ; 0F69 _ C9
        ret                                             ; 0F6A _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0F6B _ 55
        mov     ebp, esp                                ; 0F6C _ 89. E5
        sub     esp, 56                                 ; 0F6E _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0F71 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0F78 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0F7F _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0F86 _ C7. 45, DC, 00000050
        mov     edx, dword [ysize]                      ; 0F8D _ 8B. 15, 0000013C(d)
        mov     eax, dword [ebp+0CH]                    ; 0F93 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0F96 _ 8B. 00
        sub     esp, 4                                  ; 0F98 _ 83. EC, 04
        push    edx                                     ; 0F9B _ 52
        push    dword [ebp+1CH]                         ; 0F9C _ FF. 75, 1C
        push    eax                                     ; 0F9F _ 50
        call    init_screen8                            ; 0FA0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FA5 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0FA8 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FAB _ 0F BE. C0
        sub     esp, 8                                  ; 0FAE _ 83. EC, 08
        push    ?_150                                   ; 0FB1 _ 68, 0000000F(d)
        push    eax                                     ; 0FB6 _ 50
        push    dword [ebp-2CH]                         ; 0FB7 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FBA _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 0FBD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FC0 _ FF. 75, 08
        call    showString                              ; 0FC3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FC8 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0FCB _ 8B. 45, 18
        sub     esp, 12                                 ; 0FCE _ 83. EC, 0C
        push    eax                                     ; 0FD1 _ 50
        call    intToHexStr                             ; 0FD2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FD7 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0FDA _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 0FDD _ 8B. 45, 20
        movsx   eax, al                                 ; 0FE0 _ 0F BE. C0
        sub     esp, 8                                  ; 0FE3 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0FE6 _ FF. 75, E0
        push    eax                                     ; 0FE9 _ 50
        push    dword [ebp-2CH]                         ; 0FEA _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0FED _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 0FF0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF3 _ FF. 75, 08
        call    showString                              ; 0FF6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FFB _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 0FFE _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1002 _ 8B. 45, 20
        movsx   eax, al                                 ; 1005 _ 0F BE. C0
        sub     esp, 8                                  ; 1008 _ 83. EC, 08
        push    ?_151                                   ; 100B _ 68, 00000019(d)
        push    eax                                     ; 1010 _ 50
        push    dword [ebp-2CH]                         ; 1011 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1014 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1017 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 101A _ FF. 75, 08
        call    showString                              ; 101D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1022 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1025 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1028 _ 8B. 00
        sub     esp, 12                                 ; 102A _ 83. EC, 0C
        push    eax                                     ; 102D _ 50
        call    intToHexStr                             ; 102E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1033 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1036 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1039 _ 8B. 45, 20
        movsx   eax, al                                 ; 103C _ 0F BE. C0
        sub     esp, 8                                  ; 103F _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1042 _ FF. 75, E4
        push    eax                                     ; 1045 _ 50
        push    dword [ebp-2CH]                         ; 1046 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1049 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 104C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 104F _ FF. 75, 08
        call    showString                              ; 1052 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1057 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 105A _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 105E _ 8B. 45, 20
        movsx   eax, al                                 ; 1061 _ 0F BE. C0
        sub     esp, 8                                  ; 1064 _ 83. EC, 08
        push    ?_152                                   ; 1067 _ 68, 00000025(d)
        push    eax                                     ; 106C _ 50
        push    dword [ebp-2CH]                         ; 106D _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1070 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 1073 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1076 _ FF. 75, 08
        call    showString                              ; 1079 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 107E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1081 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1084 _ 8B. 40, 04
        sub     esp, 12                                 ; 1087 _ 83. EC, 0C
        push    eax                                     ; 108A _ 50
        call    intToHexStr                             ; 108B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1090 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 1093 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 1096 _ 8B. 45, 20
        movsx   eax, al                                 ; 1099 _ 0F BE. C0
        sub     esp, 8                                  ; 109C _ 83. EC, 08
        push    dword [ebp-18H]                         ; 109F _ FF. 75, E8
        push    eax                                     ; 10A2 _ 50
        push    dword [ebp-2CH]                         ; 10A3 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10A6 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 10A9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10AC _ FF. 75, 08
        call    showString                              ; 10AF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B4 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10B7 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 10BB _ 8B. 45, 20
        movsx   eax, al                                 ; 10BE _ 0F BE. C0
        sub     esp, 8                                  ; 10C1 _ 83. EC, 08
        push    ?_153                                   ; 10C4 _ 68, 00000031(d)
        push    eax                                     ; 10C9 _ 50
        push    dword [ebp-2CH]                         ; 10CA _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10CD _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 10D0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10D3 _ FF. 75, 08
        call    showString                              ; 10D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10DB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10DE _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 10E1 _ 8B. 40, 08
        sub     esp, 12                                 ; 10E4 _ 83. EC, 0C
        push    eax                                     ; 10E7 _ 50
        call    intToHexStr                             ; 10E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10ED _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 10F0 _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 10F3 _ 8B. 45, 20
        movsx   eax, al                                 ; 10F6 _ 0F BE. C0
        sub     esp, 8                                  ; 10F9 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 10FC _ FF. 75, EC
        push    eax                                     ; 10FF _ 50
        push    dword [ebp-2CH]                         ; 1100 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1103 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1106 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1109 _ FF. 75, 08
        call    showString                              ; 110C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1111 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1114 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1118 _ 8B. 45, 20
        movsx   eax, al                                 ; 111B _ 0F BE. C0
        sub     esp, 8                                  ; 111E _ 83. EC, 08
        push    ?_154                                   ; 1121 _ 68, 0000003D(d)
        push    eax                                     ; 1126 _ 50
        push    dword [ebp-2CH]                         ; 1127 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 112A _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 112D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1130 _ FF. 75, 08
        call    showString                              ; 1133 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1138 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 113B _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 113E _ 8B. 40, 0C
        sub     esp, 12                                 ; 1141 _ 83. EC, 0C
        push    eax                                     ; 1144 _ 50
        call    intToHexStr                             ; 1145 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 114A _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 114D _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 1150 _ 8B. 45, 20
        movsx   eax, al                                 ; 1153 _ 0F BE. C0
        sub     esp, 8                                  ; 1156 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1159 _ FF. 75, F0
        push    eax                                     ; 115C _ 50
        push    dword [ebp-2CH]                         ; 115D _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1160 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 1163 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1166 _ FF. 75, 08
        call    showString                              ; 1169 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 116E _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1171 _ 83. 45, D4, 10
        mov     eax, dword [ebp+20H]                    ; 1175 _ 8B. 45, 20
        movsx   eax, al                                 ; 1178 _ 0F BE. C0
        sub     esp, 8                                  ; 117B _ 83. EC, 08
        push    ?_155                                   ; 117E _ 68, 0000004A(d)
        push    eax                                     ; 1183 _ 50
        push    dword [ebp-2CH]                         ; 1184 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1187 _ FF. 75, D0
        push    dword [ebp+0CH]                         ; 118A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 118D _ FF. 75, 08
        call    showString                              ; 1190 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1195 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1198 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 119B _ 8B. 40, 10
        sub     esp, 12                                 ; 119E _ 83. EC, 0C
        push    eax                                     ; 11A1 _ 50
        call    intToHexStr                             ; 11A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11A7 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11AA _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 11AD _ 8B. 45, 20
        movsx   eax, al                                 ; 11B0 _ 0F BE. C0
        sub     esp, 8                                  ; 11B3 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 11B6 _ FF. 75, F4
        push    eax                                     ; 11B9 _ 50
        push    dword [ebp-2CH]                         ; 11BA _ FF. 75, D4
        push    dword [ebp-28H]                         ; 11BD _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 11C0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C3 _ FF. 75, 08
        call    showString                              ; 11C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11CB _ 83. C4, 20
        leave                                           ; 11CE _ C9
        ret                                             ; 11CF _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 11D0 _ 55
        mov     ebp, esp                                ; 11D1 _ 89. E5
        sub     esp, 24                                 ; 11D3 _ 83. EC, 18
        sub     esp, 12                                 ; 11D6 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 11D9 _ FF. 75, 08
        call    sheet_alloc                             ; 11DC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11E1 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 11E4 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 11E7 _ A1, 00000000(d)
        sub     esp, 8                                  ; 11EC _ 83. EC, 08
        push    10880                                   ; 11EF _ 68, 00002A80
        push    eax                                     ; 11F4 _ 50
        call    memman_alloc_4k                         ; 11F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11FA _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11FD _ 89. 45, F4
        sub     esp, 12                                 ; 1200 _ 83. EC, 0C
        push    -1                                      ; 1203 _ 6A, FF
        push    68                                      ; 1205 _ 6A, 44
        push    160                                     ; 1207 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 120C _ FF. 75, F4
        push    dword [ebp-10H]                         ; 120F _ FF. 75, F0
        call    sheet_setbuf                            ; 1212 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1217 _ 83. C4, 20
        sub     esp, 4                                  ; 121A _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 121D _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 1220 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1223 _ FF. 75, 08
        call    make_window8                            ; 1226 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 122B _ 83. C4, 10
        sub     esp, 8                                  ; 122E _ 83. EC, 08
        push    ?_156                                   ; 1231 _ 68, 00000051(d)
        push    0                                       ; 1236 _ 6A, 00
        push    28                                      ; 1238 _ 6A, 1C
        push    24                                      ; 123A _ 6A, 18
        push    dword [ebp-10H]                         ; 123C _ FF. 75, F0
        push    dword [ebp+8H]                          ; 123F _ FF. 75, 08
        call    showString                              ; 1242 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1247 _ 83. C4, 20
        sub     esp, 8                                  ; 124A _ 83. EC, 08
        push    ?_157                                   ; 124D _ 68, 0000005C(d)
        push    0                                       ; 1252 _ 6A, 00
        push    44                                      ; 1254 _ 6A, 2C
        push    24                                      ; 1256 _ 6A, 18
        push    dword [ebp-10H]                         ; 1258 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 125B _ FF. 75, 08
        call    showString                              ; 125E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1263 _ 83. C4, 20
        push    72                                      ; 1266 _ 6A, 48
        push    80                                      ; 1268 _ 6A, 50
        push    dword [ebp-10H]                         ; 126A _ FF. 75, F0
        push    dword [ebp+8H]                          ; 126D _ FF. 75, 08
        call    sheet_slide                             ; 1270 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1275 _ 83. C4, 10
        sub     esp, 4                                  ; 1278 _ 83. EC, 04
        push    2                                       ; 127B _ 6A, 02
        push    dword [ebp-10H]                         ; 127D _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1280 _ FF. 75, 08
        call    sheet_updown                            ; 1283 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1288 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 128B _ 8B. 45, F0
        leave                                           ; 128E _ C9
        ret                                             ; 128F _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1290 _ 55
        mov     ebp, esp                                ; 1291 _ 89. E5
        push    ebx                                     ; 1293 _ 53
        sub     esp, 36                                 ; 1294 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1297 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 129A _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 129D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 12A0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 12A3 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 12A6 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 12A9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 12AC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12AF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12B2 _ 8B. 00
        push    0                                       ; 12B4 _ 6A, 00
        push    edx                                     ; 12B6 _ 52
        push    0                                       ; 12B7 _ 6A, 00
        push    0                                       ; 12B9 _ 6A, 00
        push    8                                       ; 12BB _ 6A, 08
        push    dword [ebp-10H]                         ; 12BD _ FF. 75, F0
        push    eax                                     ; 12C0 _ 50
        call    boxfill8                                ; 12C1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12C6 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 12C9 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 12CC _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 12CF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12D2 _ 8B. 00
        push    1                                       ; 12D4 _ 6A, 01
        push    edx                                     ; 12D6 _ 52
        push    1                                       ; 12D7 _ 6A, 01
        push    1                                       ; 12D9 _ 6A, 01
        push    7                                       ; 12DB _ 6A, 07
        push    dword [ebp-10H]                         ; 12DD _ FF. 75, F0
        push    eax                                     ; 12E0 _ 50
        call    boxfill8                                ; 12E1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12E6 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 12E9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 12EC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12EF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12F2 _ 8B. 00
        push    edx                                     ; 12F4 _ 52
        push    0                                       ; 12F5 _ 6A, 00
        push    0                                       ; 12F7 _ 6A, 00
        push    0                                       ; 12F9 _ 6A, 00
        push    8                                       ; 12FB _ 6A, 08
        push    dword [ebp-10H]                         ; 12FD _ FF. 75, F0
        push    eax                                     ; 1300 _ 50
        call    boxfill8                                ; 1301 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1306 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1309 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 130C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 130F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1312 _ 8B. 00
        push    edx                                     ; 1314 _ 52
        push    1                                       ; 1315 _ 6A, 01
        push    1                                       ; 1317 _ 6A, 01
        push    1                                       ; 1319 _ 6A, 01
        push    7                                       ; 131B _ 6A, 07
        push    dword [ebp-10H]                         ; 131D _ FF. 75, F0
        push    eax                                     ; 1320 _ 50
        call    boxfill8                                ; 1321 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1326 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1329 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 132C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 132F _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1332 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1335 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1338 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 133B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 133E _ 8B. 00
        push    ebx                                     ; 1340 _ 53
        push    ecx                                     ; 1341 _ 51
        push    1                                       ; 1342 _ 6A, 01
        push    edx                                     ; 1344 _ 52
        push    15                                      ; 1345 _ 6A, 0F
        push    dword [ebp-10H]                         ; 1347 _ FF. 75, F0
        push    eax                                     ; 134A _ 50
        call    boxfill8                                ; 134B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1350 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1353 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1356 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1359 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 135C _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 135F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1362 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1365 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1368 _ 8B. 00
        push    ebx                                     ; 136A _ 53
        push    ecx                                     ; 136B _ 51
        push    0                                       ; 136C _ 6A, 00
        push    edx                                     ; 136E _ 52
        push    0                                       ; 136F _ 6A, 00
        push    dword [ebp-10H]                         ; 1371 _ FF. 75, F0
        push    eax                                     ; 1374 _ 50
        call    boxfill8                                ; 1375 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 137A _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 137D _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1380 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1383 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1386 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1389 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 138C _ 8B. 00
        push    ecx                                     ; 138E _ 51
        push    edx                                     ; 138F _ 52
        push    2                                       ; 1390 _ 6A, 02
        push    2                                       ; 1392 _ 6A, 02
        push    8                                       ; 1394 _ 6A, 08
        push    dword [ebp-10H]                         ; 1396 _ FF. 75, F0
        push    eax                                     ; 1399 _ 50
        call    boxfill8                                ; 139A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 139F _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 13A2 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 13A5 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 13A8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13AB _ 8B. 00
        push    20                                      ; 13AD _ 6A, 14
        push    edx                                     ; 13AF _ 52
        push    3                                       ; 13B0 _ 6A, 03
        push    3                                       ; 13B2 _ 6A, 03
        push    12                                      ; 13B4 _ 6A, 0C
        push    dword [ebp-10H]                         ; 13B6 _ FF. 75, F0
        push    eax                                     ; 13B9 _ 50
        call    boxfill8                                ; 13BA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13BF _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13C2 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 13C5 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 13C8 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 13CB _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 13CE _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 13D1 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 13D4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13D7 _ 8B. 00
        push    ebx                                     ; 13D9 _ 53
        push    ecx                                     ; 13DA _ 51
        push    edx                                     ; 13DB _ 52
        push    1                                       ; 13DC _ 6A, 01
        push    15                                      ; 13DE _ 6A, 0F
        push    dword [ebp-10H]                         ; 13E0 _ FF. 75, F0
        push    eax                                     ; 13E3 _ 50
        call    boxfill8                                ; 13E4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13E9 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 13EC _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 13EF _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 13F2 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 13F5 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 13F8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 13FB _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13FE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1401 _ 8B. 00
        push    ebx                                     ; 1403 _ 53
        push    ecx                                     ; 1404 _ 51
        push    edx                                     ; 1405 _ 52
        push    0                                       ; 1406 _ 6A, 00
        push    0                                       ; 1408 _ 6A, 00
        push    dword [ebp-10H]                         ; 140A _ FF. 75, F0
        push    eax                                     ; 140D _ 50
        call    boxfill8                                ; 140E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1413 _ 83. C4, 1C
        sub     esp, 8                                  ; 1416 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1419 _ FF. 75, 10
        push    7                                       ; 141C _ 6A, 07
        push    4                                       ; 141E _ 6A, 04
        push    24                                      ; 1420 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1422 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1425 _ FF. 75, 08
        call    showString                              ; 1428 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 142D _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 1430 _ C7. 45, EC, 00000000
        jmp     ?_068                                   ; 1437 _ E9, 00000083

?_061:  mov     dword [ebp-18H], 0                      ; 143C _ C7. 45, E8, 00000000
        jmp     ?_067                                   ; 1443 _ EB, 70

?_062:  mov     eax, dword [ebp-14H]                    ; 1445 _ 8B. 45, EC
        shl     eax, 4                                  ; 1448 _ C1. E0, 04
        mov     edx, eax                                ; 144B _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 144D _ 8B. 45, E8
        add     eax, edx                                ; 1450 _ 01. D0
        add     eax, closebtn.1848                      ; 1452 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 1457 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 145A _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 145D _ 80. 7D, E7, 40
        jnz near      ?_063                                   ; 1461 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1463 _ C6. 45, E7, 00
        jmp     ?_066                                   ; 1467 _ EB, 1C

?_063:  cmp     byte [ebp-19H], 36                      ; 1469 _ 80. 7D, E7, 24
        jnz near      ?_064                                   ; 146d _ 75, 06
        mov     byte [ebp-19H], 15                      ; 146F _ C6. 45, E7, 0F
        jmp     ?_066                                   ; 1473 _ EB, 10

?_064:  cmp     byte [ebp-19H], 81                      ; 1475 _ 80. 7D, E7, 51
        jnz near      ?_065                                   ; 1479 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 147B _ C6. 45, E7, 08
        jmp     ?_066                                   ; 147F _ EB, 04

?_065:  mov     byte [ebp-19H], 7                       ; 1481 _ C6. 45, E7, 07
?_066:  mov     eax, dword [ebp+0CH]                    ; 1485 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1488 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 148A _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 148D _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1490 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1493 _ 8B. 40, 04
        imul    ecx, eax                                ; 1496 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1499 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 149C _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 149F _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 14A2 _ 8B. 45, E8
        add     eax, ebx                                ; 14A5 _ 01. D8
        add     eax, ecx                                ; 14A7 _ 01. C8
        add     edx, eax                                ; 14A9 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 14AB _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 14AF _ 88. 02
        add     dword [ebp-18H], 1                      ; 14B1 _ 83. 45, E8, 01
?_067:  cmp     dword [ebp-18H], 15                     ; 14B5 _ 83. 7D, E8, 0F
        jle near      ?_062                                   ; 14b9 _ 7e, 8a
        add     dword [ebp-14H], 1                      ; 14BB _ 83. 45, EC, 01
?_068:  cmp     dword [ebp-14H], 13                     ; 14BF _ 83. 7D, EC, 0D
        jle near      ?_061                                   ; 14c3 _ 0f 8e, ffffff73
        nop                                             ; 14C9 _ 90
        mov     ebx, dword [ebp-4H]                     ; 14CA _ 8B. 5D, FC
        leave                                           ; 14CD _ C9
        ret                                             ; 14CE _ C3
; make_window8 End of function

memman_init:; Function begin
        push    ebp                                     ; 14CF _ 55
        mov     ebp, esp                                ; 14D0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 14D2 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 14D5 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 14DB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 14DE _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 14E5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 14E8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 14EF _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 14F2 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 14F9 _ 5D
        ret                                             ; 14FA _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 14FB _ 55
        mov     ebp, esp                                ; 14FC _ 89. E5
        sub     esp, 16                                 ; 14FE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1501 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1508 _ C7. 45, F8, 00000000
        jmp     ?_070                                   ; 150F _ EB, 14

?_069:  mov     eax, dword [ebp+8H]                     ; 1511 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1514 _ 8B. 55, F8
        add     edx, 2                                  ; 1517 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 151A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 151E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1521 _ 83. 45, F8, 01
?_070:  mov     eax, dword [ebp+8H]                     ; 1525 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1528 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 152A _ 3B. 45, F8
        ja      ?_069                                   ; 152D _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 152F _ 8B. 45, FC
        leave                                           ; 1532 _ C9
        ret                                             ; 1533 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1534 _ 55
        mov     ebp, esp                                ; 1535 _ 89. E5
        sub     esp, 16                                 ; 1537 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 153A _ C7. 45, F8, 00000000
        jmp     ?_074                                   ; 1541 _ E9, 00000085

?_071:  mov     eax, dword [ebp+8H]                     ; 1546 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1549 _ 8B. 55, F8
        add     edx, 2                                  ; 154C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 154F _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1553 _ 3B. 45, 0C
        jc near       ?_073                                   ; 1556 _ 72, 6f
        mov     eax, dword [ebp+8H]                     ; 1558 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 155B _ 8B. 55, F8
        add     edx, 2                                  ; 155E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1561 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1564 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1567 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 156A _ 8B. 55, F8
        add     edx, 2                                  ; 156D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1570 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1573 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1576 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1579 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 157C _ 8B. 55, F8
        add     edx, 2                                  ; 157F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1582 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1585 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1588 _ 8B. 55, F8
        add     edx, 2                                  ; 158B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 158E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1592 _ 2B. 45, 0C
        mov     edx, eax                                ; 1595 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1597 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 159A _ 8B. 4D, F8
        add     ecx, 2                                  ; 159D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 15A0 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 15A4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 15A7 _ 8B. 55, F8
        add     edx, 2                                  ; 15AA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15AD _ 8B. 44 D0, 04
        test    eax, eax                                ; 15B1 _ 85. C0
        jnz near      ?_072                                   ; 15b3 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 15B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15B8 _ 8B. 00
        lea     edx, [eax-1H]                           ; 15BA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15BD _ 8B. 45, 08
        mov     dword [eax], edx                        ; 15C0 _ 89. 10
?_072:  mov     eax, dword [ebp-4H]                     ; 15C2 _ 8B. 45, FC
        jmp     ?_075                                   ; 15C5 _ EB, 17

?_073:  add     dword [ebp-8H], 1                       ; 15C7 _ 83. 45, F8, 01
?_074:  mov     eax, dword [ebp+8H]                     ; 15CB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15CE _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 15D0 _ 3B. 45, F8
        ja      ?_071                                   ; 15D3 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 15D9 _ B8, 00000000
?_075:  leave                                           ; 15DE _ C9
        ret                                             ; 15DF _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 15E0 _ 55
        mov     ebp, esp                                ; 15E1 _ 89. E5
        push    ebx                                     ; 15E3 _ 53
        sub     esp, 16                                 ; 15E4 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 15E7 _ C7. 45, F4, 00000000
        jmp     ?_078                                   ; 15EE _ EB, 17

?_076:  mov     eax, dword [ebp+8H]                     ; 15F0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 15F3 _ 8B. 55, F4
        add     edx, 2                                  ; 15F6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 15F9 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 15FC _ 3B. 45, 0C
        jbe     ?_077                                   ; 15FF _ 76, 02
        jmp     ?_079                                   ; 1601 _ EB, 0E

?_077:  add     dword [ebp-0CH], 1                      ; 1603 _ 83. 45, F4, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 1607 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 160A _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 160C _ 3B. 45, F4
        jg  near      ?_076                                   ; 160f _ 7f, df
?_079:  cmp     dword [ebp-0CH], 0                      ; 1611 _ 83. 7D, F4, 00
        jle near      ?_081                                   ; 1615 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-0CH]                    ; 161B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 161E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1621 _ 8B. 45, 08
        add     edx, 2                                  ; 1624 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1627 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 162A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 162D _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1630 _ 8B. 45, 08
        add     ecx, 2                                  ; 1633 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1636 _ 8B. 44 C8, 04
        add     eax, edx                                ; 163A _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 163C _ 3B. 45, 0C
        jne near      ?_081                                   ; 163f _ 0f 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1645 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1648 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 164B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 164E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1651 _ 8B. 45, 08
        add     edx, 2                                  ; 1654 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1657 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 165B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 165E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1661 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1664 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1667 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 166B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 166E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1670 _ 3B. 45, F4
        jle near      ?_080                                   ; 1673 _ 7e, 56
        mov     edx, dword [ebp+0CH]                    ; 1675 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1678 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 167B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 167E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1681 _ 8B. 55, F4
        add     edx, 2                                  ; 1684 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1687 _ 8B. 04 D0
        cmp     ecx, eax                                ; 168A _ 39. C1
        jnz near      ?_080                                   ; 168c _ 75, 3d
        mov     eax, dword [ebp-0CH]                    ; 168E _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1691 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1694 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1697 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 169A _ 8B. 45, 08
        add     edx, 2                                  ; 169D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 16A0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 16A4 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 16A7 _ 8B. 4D, F4
        add     ecx, 2                                  ; 16AA _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 16AD _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 16B1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16B4 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 16B7 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 16BA _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 16BE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16C1 _ 8B. 00
        lea     edx, [eax-1H]                           ; 16C3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16C6 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 16C9 _ 89. 10
?_080:  mov     eax, 0                                  ; 16CB _ B8, 00000000
        jmp     ?_087                                   ; 16D0 _ E9, 0000011C

?_081:  mov     eax, dword [ebp+8H]                     ; 16D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16D8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 16DA _ 3B. 45, F4
        jle near      ?_082                                   ; 16dd _ 7e, 52
        mov     edx, dword [ebp+0CH]                    ; 16DF _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 16E2 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 16E5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16E8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 16EB _ 8B. 55, F4
        add     edx, 2                                  ; 16EE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16F1 _ 8B. 04 D0
        cmp     ecx, eax                                ; 16F4 _ 39. C1
        jnz near      ?_082                                   ; 16f6 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 16F8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 16FB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 16FE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1701 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1704 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1707 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 170A _ 8B. 55, F4
        add     edx, 2                                  ; 170D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1710 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1714 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1717 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 171A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 171D _ 8B. 55, F4
        add     edx, 2                                  ; 1720 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1723 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1727 _ B8, 00000000
        jmp     ?_087                                   ; 172C _ E9, 000000C0

?_082:  mov     eax, dword [ebp+8H]                     ; 1731 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1734 _ 8B. 00
        cmp     eax, 4095                               ; 1736 _ 3D, 00000FFF
        jg  near      ?_086                                   ; 173b _ 0f 8f, 00000087
        mov     eax, dword [ebp+8H]                     ; 1741 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1744 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1746 _ 89. 45, F8
        jmp     ?_084                                   ; 1749 _ EB, 28

?_083:  mov     eax, dword [ebp-8H]                     ; 174B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 174E _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1751 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1754 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1757 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 175A _ 8B. 45, 08
        add     edx, 2                                  ; 175D _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1760 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1763 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1765 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1768 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 176B _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 176F _ 83. 6D, F8, 01
?_084:  mov     eax, dword [ebp-8H]                     ; 1773 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1776 _ 3B. 45, F4
        jg  near      ?_083                                   ; 1779 _ 7f, d0
        mov     eax, dword [ebp+8H]                     ; 177B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 177E _ 8B. 00
        lea     edx, [eax+1H]                           ; 1780 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1783 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1786 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1788 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 178B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 178E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1791 _ 8B. 00
        cmp     edx, eax                                ; 1793 _ 39. C2
        jge near      ?_085                                   ; 1795 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 1797 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 179A _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 179C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 179F _ 89. 50, 04
?_085:  mov     eax, dword [ebp+8H]                     ; 17A2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17A5 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 17A8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 17AB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 17AE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 17B1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17B4 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 17B7 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 17BA _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 17BD _ 89. 54 C8, 04
        mov     eax, 0                                  ; 17C1 _ B8, 00000000
        jmp     ?_087                                   ; 17C6 _ EB, 29

?_086:  mov     eax, dword [ebp+8H]                     ; 17C8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17CB _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 17CE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17D1 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17D4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 17D7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 17DA _ 8B. 40, 08
        mov     edx, eax                                ; 17DD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 17DF _ 8B. 45, 10
        add     eax, edx                                ; 17E2 _ 01. D0
        mov     edx, eax                                ; 17E4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 17E6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 17E9 _ 89. 50, 08
        mov     eax, 4294967295                         ; 17EC _ B8, FFFFFFFF
?_087:  add     esp, 16                                 ; 17F1 _ 83. C4, 10
        pop     ebx                                     ; 17F4 _ 5B
        pop     ebp                                     ; 17F5 _ 5D
        ret                                             ; 17F6 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 17F7 _ 55
        mov     ebp, esp                                ; 17F8 _ 89. E5
        sub     esp, 16                                 ; 17FA _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 17FD _ 8B. 45, 0C
        add     eax, 4095                               ; 1800 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1805 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 180A _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 180D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1810 _ FF. 75, 08
        call    memman_alloc                            ; 1813 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1818 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 181B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 181E _ 8B. 45, FC
        leave                                           ; 1821 _ C9
        ret                                             ; 1822 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1823 _ 55
        mov     ebp, esp                                ; 1824 _ 89. E5
        sub     esp, 16                                 ; 1826 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1829 _ 8B. 45, 10
        add     eax, 4095                               ; 182C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1831 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1836 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1839 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 183C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 183F _ FF. 75, 08
        call    memman_free                             ; 1842 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1847 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 184A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 184D _ 8B. 45, FC
        leave                                           ; 1850 _ C9
        ret                                             ; 1851 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1852 _ 55
        mov     ebp, esp                                ; 1853 _ 89. E5
        sub     esp, 24                                 ; 1855 _ 83. EC, 18
        sub     esp, 8                                  ; 1858 _ 83. EC, 08
        push    9232                                    ; 185B _ 68, 00002410
        push    dword [ebp+8H]                          ; 1860 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1863 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1868 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 186B _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 186E _ 83. 7D, F4, 00
        jnz near      ?_088                                   ; 1872 _ 75, 0a
        mov     eax, 0                                  ; 1874 _ B8, 00000000
        jmp     ?_092                                   ; 1879 _ E9, 00000098

?_088:  mov     eax, dword [ebp+10H]                    ; 187E _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1881 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1885 _ 83. EC, 08
        push    eax                                     ; 1888 _ 50
        push    dword [ebp+8H]                          ; 1889 _ FF. 75, 08
        call    memman_alloc_4k                         ; 188C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1891 _ 83. C4, 10
        mov     edx, eax                                ; 1894 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1896 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 1899 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 189C _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 189F _ 8B. 40, 04
        test    eax, eax                                ; 18A2 _ 85. C0
        jnz near      ?_089                                   ; 18a4 _ 75, 1e
        mov     eax, dword [ebp-0CH]                    ; 18A6 _ 8B. 45, F4
        sub     esp, 4                                  ; 18A9 _ 83. EC, 04
        push    9232                                    ; 18AC _ 68, 00002410
        push    eax                                     ; 18B1 _ 50
        push    dword [ebp+8H]                          ; 18B2 _ FF. 75, 08
        call    memman_free_4k                          ; 18B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18BA _ 83. C4, 10
        mov     eax, 0                                  ; 18BD _ B8, 00000000
        jmp     ?_092                                   ; 18C2 _ EB, 52

?_089:  mov     eax, dword [ebp-0CH]                    ; 18C4 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 18C7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 18CA _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 18CC _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 18CF _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 18D2 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 18D5 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 18D8 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 18DB _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 18DE _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 18E1 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 18E8 _ C7. 45, F0, 00000000
        jmp     ?_091                                   ; 18EF _ EB, 19

?_090:  mov     eax, dword [ebp-0CH]                    ; 18F1 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 18F4 _ 8B. 55, F0
        add     edx, 33                                 ; 18F7 _ 83. C2, 21
        shl     edx, 5                                  ; 18FA _ C1. E2, 05
        add     eax, edx                                ; 18FD _ 01. D0
        mov     dword [eax+10H], 0                      ; 18FF _ C7. 40, 10, 00000000
        add     dword [ebp-10H], 1                      ; 1906 _ 83. 45, F0, 01
?_091:  cmp     dword [ebp-10H], 255                    ; 190A _ 81. 7D, F0, 000000FF
        jle near      ?_090                                   ; 1911 _ 7e, de
        mov     eax, dword [ebp-0CH]                    ; 1913 _ 8B. 45, F4
?_092:  leave                                           ; 1916 _ C9
        ret                                             ; 1917 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1918 _ 55
        mov     ebp, esp                                ; 1919 _ 89. E5
        sub     esp, 16                                 ; 191B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 191E _ C7. 45, F8, 00000000
        jmp     ?_095                                   ; 1925 _ EB, 59

?_093:  mov     eax, dword [ebp+8H]                     ; 1927 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 192A _ 8B. 55, F8
        add     edx, 33                                 ; 192D _ 83. C2, 21
        shl     edx, 5                                  ; 1930 _ C1. E2, 05
        add     eax, edx                                ; 1933 _ 01. D0
        mov     eax, dword [eax+10H]                    ; 1935 _ 8B. 40, 10
        test    eax, eax                                ; 1938 _ 85. C0
        jnz near      ?_094                                   ; 193a _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 193C _ 8B. 45, F8
        shl     eax, 5                                  ; 193F _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1942 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1948 _ 8B. 45, 08
        add     eax, edx                                ; 194B _ 01. D0
        add     eax, 4                                  ; 194D _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 1950 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1953 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1956 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 1959 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 195C _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 195F _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 1963 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 1966 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 196D _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 1970 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 1977 _ 8B. 45, FC
        jmp     ?_096                                   ; 197A _ EB, 12

?_094:  add     dword [ebp-8H], 1                       ; 197C _ 83. 45, F8, 01
?_095:  cmp     dword [ebp-8H], 255                     ; 1980 _ 81. 7D, F8, 000000FF
        jle near      ?_093                                   ; 1987 _ 7e, 9e
        mov     eax, 0                                  ; 1989 _ B8, 00000000
?_096:  leave                                           ; 198E _ C9
        ret                                             ; 198F _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1990 _ 55
        mov     ebp, esp                                ; 1991 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1993 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1996 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1999 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 199B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 199E _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 19A1 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19A4 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 19A7 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 19AA _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 19AD _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 19B0 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 19B3 _ 89. 50, 14
        nop                                             ; 19B6 _ 90
        pop     ebp                                     ; 19B7 _ 5D
        ret                                             ; 19B8 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 19B9 _ 55
        mov     ebp, esp                                ; 19BA _ 89. E5
        push    esi                                     ; 19BC _ 56
        push    ebx                                     ; 19BD _ 53
        sub     esp, 16                                 ; 19BE _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 19C1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 19C4 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 19C7 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 19CA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 19CD _ 8B. 40, 10
        add     eax, 1                                  ; 19D0 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 19D3 _ 3B. 45, 10
        jge near      ?_097                                   ; 19d6 _ 7d, 0c
        mov     eax, dword [ebp+8H]                     ; 19D8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 19DB _ 8B. 40, 10
        add     eax, 1                                  ; 19DE _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 19E1 _ 89. 45, 10
?_097:  cmp     dword [ebp+10H], -1                     ; 19E4 _ 83. 7D, 10, FF
        jge near      ?_098                                   ; 19e8 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 19EA _ C7. 45, 10, FFFFFFFF
?_098:  mov     eax, dword [ebp+0CH]                    ; 19F1 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 19F4 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 19F7 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 19FA _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 19FD _ 3B. 45, 10
        jle near      ?_105                                   ; 1a00 _ 0f 8e, 000001d5
        cmp     dword [ebp+10H], 0                      ; 1A06 _ 83. 7D, 10, 00
        js near       ?_101                                   ; 1a0a _ 0f 88, 000000e2
        mov     eax, dword [ebp-0CH]                    ; 1A10 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1A13 _ 89. 45, F0
        jmp     ?_100                                   ; 1A16 _ EB, 34

?_099:  mov     eax, dword [ebp-10H]                    ; 1A18 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1A1B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A1E _ 8B. 45, 08
        add     edx, 4                                  ; 1A21 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1A24 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1A28 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1A2B _ 8B. 4D, F0
        add     ecx, 4                                  ; 1A2E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1A31 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1A35 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1A38 _ 8B. 55, F0
        add     edx, 4                                  ; 1A3B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1A3E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1A42 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1A45 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1A48 _ 83. 6D, F0, 01
?_100:  mov     eax, dword [ebp-10H]                    ; 1A4C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1A4F _ 3B. 45, 10
        jg  near      ?_099                                   ; 1a52 _ 7f, c4
        mov     eax, dword [ebp+8H]                     ; 1A54 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A57 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1A5A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1A5D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1A60 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1A64 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1A67 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A6A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A6D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A70 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1A73 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1A76 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1A79 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1A7C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A7F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A82 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1A85 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1A88 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A8B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A8E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1A91 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1A94 _ 83. EC, 08
        push    esi                                     ; 1A97 _ 56
        push    ebx                                     ; 1A98 _ 53
        push    ecx                                     ; 1A99 _ 51
        push    edx                                     ; 1A9A _ 52
        push    eax                                     ; 1A9B _ 50
        push    dword [ebp+8H]                          ; 1A9C _ FF. 75, 08
        call    sheet_refreshmap                        ; 1A9F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AA4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1AA7 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1AAA _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1AAD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1AB0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1AB3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1AB6 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1AB9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1ABC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1ABF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1AC2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AC5 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1AC8 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1ACB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1ACE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1AD1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1AD4 _ 8B. 40, 0C
        sub     esp, 4                                  ; 1AD7 _ 83. EC, 04
        push    dword [ebp-0CH]                         ; 1ADA _ FF. 75, F4
        push    esi                                     ; 1ADD _ 56
        push    ebx                                     ; 1ADE _ 53
        push    ecx                                     ; 1ADF _ 51
        push    edx                                     ; 1AE0 _ 52
        push    eax                                     ; 1AE1 _ 50
        push    dword [ebp+8H]                          ; 1AE2 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1AE5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AEA _ 83. C4, 20
        jmp     ?_112                                   ; 1AED _ E9, 0000023E

?_101:  mov     eax, dword [ebp+8H]                     ; 1AF2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AF5 _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 1AF8 _ 3B. 45, F4
        jle near      ?_104                                   ; 1afb _ 7e, 47
        mov     eax, dword [ebp-0CH]                    ; 1AFD _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1B00 _ 89. 45, F0
        jmp     ?_103                                   ; 1B03 _ EB, 34

?_102:  mov     eax, dword [ebp-10H]                    ; 1B05 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1B08 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B0B _ 8B. 45, 08
        add     edx, 4                                  ; 1B0E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1B11 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1B15 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1B18 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1B1B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1B1E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1B22 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1B25 _ 8B. 55, F0
        add     edx, 4                                  ; 1B28 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1B2B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1B2F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1B32 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1B35 _ 83. 45, F0, 01
?_103:  mov     eax, dword [ebp+8H]                     ; 1B39 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B3C _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 1B3F _ 3B. 45, F0
        jg  near      ?_102                                   ; 1b42 _ 7f, c1
?_104:  mov     eax, dword [ebp+8H]                     ; 1B44 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B47 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1B4A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B4D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1B50 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B53 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B56 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B59 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B5C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B5F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B62 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B65 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B68 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B6B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B6E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B71 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B74 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B77 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B7A _ 8B. 40, 0C
        sub     esp, 8                                  ; 1B7D _ 83. EC, 08
        push    0                                       ; 1B80 _ 6A, 00
        push    ebx                                     ; 1B82 _ 53
        push    ecx                                     ; 1B83 _ 51
        push    edx                                     ; 1B84 _ 52
        push    eax                                     ; 1B85 _ 50
        push    dword [ebp+8H]                          ; 1B86 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1B89 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B8E _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 1B91 _ 8B. 45, F4
        lea     esi, [eax-1H]                           ; 1B94 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1B97 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B9A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B9D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1BA0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1BA3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1BA6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1BA9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BAC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BAF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1BB2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1BB5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BB8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BBB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1BBE _ 8B. 40, 0C
        sub     esp, 4                                  ; 1BC1 _ 83. EC, 04
        push    esi                                     ; 1BC4 _ 56
        push    0                                       ; 1BC5 _ 6A, 00
        push    ebx                                     ; 1BC7 _ 53
        push    ecx                                     ; 1BC8 _ 51
        push    edx                                     ; 1BC9 _ 52
        push    eax                                     ; 1BCA _ 50
        push    dword [ebp+8H]                          ; 1BCB _ FF. 75, 08
        call    sheet_refreshsub                        ; 1BCE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BD3 _ 83. C4, 20
        jmp     ?_112                                   ; 1BD6 _ E9, 00000155

?_105:  mov     eax, dword [ebp-0CH]                    ; 1BDB _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1BDE _ 3B. 45, 10
        jge near      ?_112                                   ; 1be1 _ 0f 8d, 00000149
        cmp     dword [ebp-0CH], 0                      ; 1BE7 _ 83. 7D, F4, 00
        js near       ?_108                                   ; 1beb _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 1BED _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 1BF0 _ 89. 45, F0
        jmp     ?_107                                   ; 1BF3 _ EB, 34

?_106:  mov     eax, dword [ebp-10H]                    ; 1BF5 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1BF8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BFB _ 8B. 45, 08
        add     edx, 4                                  ; 1BFE _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1C01 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1C05 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 1C08 _ 8B. 4D, F0
        add     ecx, 4                                  ; 1C0B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1C0E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1C12 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1C15 _ 8B. 55, F0
        add     edx, 4                                  ; 1C18 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1C1B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1C1F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 1C22 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 1C25 _ 83. 45, F0, 01
?_107:  mov     eax, dword [ebp-10H]                    ; 1C29 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1C2C _ 3B. 45, 10
        jl      ?_106                                   ; 1C2F _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 1C31 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C34 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C37 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C3A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1C3D _ 89. 54 88, 04
        jmp     ?_111                                   ; 1C41 _ EB, 6C

?_108:  mov     eax, dword [ebp+8H]                     ; 1C43 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1C46 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1C49 _ 89. 45, F0
        jmp     ?_110                                   ; 1C4C _ EB, 3A

?_109:  mov     eax, dword [ebp-10H]                    ; 1C4E _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1C51 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C54 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 1C57 _ 8B. 55, F0
        add     edx, 4                                  ; 1C5A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1C5D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1C61 _ 8B. 45, 08
        add     ecx, 4                                  ; 1C64 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1C67 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 1C6B _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 1C6E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C71 _ 8B. 45, 08
        add     edx, 4                                  ; 1C74 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1C77 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 1C7B _ 8B. 55, F0
        add     edx, 1                                  ; 1C7E _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 1C81 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 1C84 _ 83. 6D, F0, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 1C88 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1C8B _ 3B. 45, 10
        jge near      ?_109                                   ; 1c8e _ 7d, be
        mov     eax, dword [ebp+8H]                     ; 1C90 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C93 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C96 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C99 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1C9C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1CA0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1CA3 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1CA6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1CA9 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1CAC _ 89. 50, 10
?_111:  mov     eax, dword [ebp+0CH]                    ; 1CAF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CB2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CB5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1CB8 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1CBB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1CBE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1CC1 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CC4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CC7 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1CCA _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1CCD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CD0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CD3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1CD6 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1CD9 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1CDC _ FF. 75, 10
        push    ebx                                     ; 1CDF _ 53
        push    ecx                                     ; 1CE0 _ 51
        push    edx                                     ; 1CE1 _ 52
        push    eax                                     ; 1CE2 _ 50
        push    dword [ebp+8H]                          ; 1CE3 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1CE6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CEB _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1CEE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CF1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CF4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1CF7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1CFA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1CFD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1D00 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D03 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D06 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1D09 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1D0C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D0F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1D12 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D15 _ 8B. 40, 0C
        sub     esp, 4                                  ; 1D18 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 1D1B _ FF. 75, 10
        push    dword [ebp+10H]                         ; 1D1E _ FF. 75, 10
        push    ebx                                     ; 1D21 _ 53
        push    ecx                                     ; 1D22 _ 51
        push    edx                                     ; 1D23 _ 52
        push    eax                                     ; 1D24 _ 50
        push    dword [ebp+8H]                          ; 1D25 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D28 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D2D _ 83. C4, 20
?_112:  lea     esp, [ebp-8H]                           ; 1D30 _ 8D. 65, F8
        pop     ebx                                     ; 1D33 _ 5B
        pop     esi                                     ; 1D34 _ 5E
        pop     ebp                                     ; 1D35 _ 5D
        ret                                             ; 1D36 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1D37 _ 55
        mov     ebp, esp                                ; 1D38 _ 89. E5
        push    edi                                     ; 1D3A _ 57
        push    esi                                     ; 1D3B _ 56
        push    ebx                                     ; 1D3C _ 53
        sub     esp, 28                                 ; 1D3D _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 1D40 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D43 _ 8B. 40, 18
        test    eax, eax                                ; 1D46 _ 85. C0
        js near       ?_113                                   ; 1d48 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 1D4A _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 1D4D _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 1D50 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 1D53 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 1D56 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D59 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1D5C _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 1D5F _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 1D62 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1D65 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1D68 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 1D6B _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 1D6E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D71 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1D74 _ 8B. 45, 14
        add     edx, eax                                ; 1D77 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D79 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D7C _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 1D7F _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 1D82 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 1D85 _ 03. 45, E4
        sub     esp, 4                                  ; 1D88 _ 83. EC, 04
        push    ebx                                     ; 1D8B _ 53
        push    ecx                                     ; 1D8C _ 51
        push    edi                                     ; 1D8D _ 57
        push    esi                                     ; 1D8E _ 56
        push    edx                                     ; 1D8F _ 52
        push    eax                                     ; 1D90 _ 50
        push    dword [ebp+8H]                          ; 1D91 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D94 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D99 _ 83. C4, 20
?_113:  mov     eax, 0                                  ; 1D9C _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 1DA1 _ 8D. 65, F4
        pop     ebx                                     ; 1DA4 _ 5B
        pop     esi                                     ; 1DA5 _ 5E
        pop     edi                                     ; 1DA6 _ 5F
        pop     ebp                                     ; 1DA7 _ 5D
        ret                                             ; 1DA8 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1DA9 _ 55
        mov     ebp, esp                                ; 1DAA _ 89. E5
        push    esi                                     ; 1DAC _ 56
        push    ebx                                     ; 1DAD _ 53
        sub     esp, 16                                 ; 1DAE _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1DB1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1DB4 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 1DB7 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1DBA _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1DBD _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1DC0 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1DC3 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1DC6 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1DC9 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1DCC _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1DCF _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1DD2 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DD5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1DD8 _ 8B. 40, 18
        test    eax, eax                                ; 1DDB _ 85. C0
        js near       ?_114                                   ; 1ddd _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 1DE3 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1DE6 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1DE9 _ 8B. 45, F4
        add     edx, eax                                ; 1DEC _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1DEE _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1DF1 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 1DF4 _ 8B. 45, F0
        add     eax, ecx                                ; 1DF7 _ 01. C8
        sub     esp, 8                                  ; 1DF9 _ 83. EC, 08
        push    0                                       ; 1DFC _ 6A, 00
        push    edx                                     ; 1DFE _ 52
        push    eax                                     ; 1DFF _ 50
        push    dword [ebp-0CH]                         ; 1E00 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1E03 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1E06 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1E09 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E0E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E11 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E14 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1E17 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1E1A _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1E1D _ 8B. 55, 14
        add     ecx, edx                                ; 1E20 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1E22 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1E25 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1E28 _ 8B. 55, 10
        add     edx, ebx                                ; 1E2B _ 01. DA
        sub     esp, 8                                  ; 1E2D _ 83. EC, 08
        push    eax                                     ; 1E30 _ 50
        push    ecx                                     ; 1E31 _ 51
        push    edx                                     ; 1E32 _ 52
        push    dword [ebp+14H]                         ; 1E33 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1E36 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1E39 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1E3C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E41 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E44 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E47 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 1E4A _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1E4D _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1E50 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1E53 _ 8B. 45, F4
        add     edx, eax                                ; 1E56 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1E58 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 1E5B _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 1E5E _ 8B. 45, F0
        add     eax, ebx                                ; 1E61 _ 01. D8
        sub     esp, 4                                  ; 1E63 _ 83. EC, 04
        push    ecx                                     ; 1E66 _ 51
        push    0                                       ; 1E67 _ 6A, 00
        push    edx                                     ; 1E69 _ 52
        push    eax                                     ; 1E6A _ 50
        push    dword [ebp-0CH]                         ; 1E6B _ FF. 75, F4
        push    dword [ebp-10H]                         ; 1E6E _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1E71 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E74 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E79 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E7C _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 1E7F _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 1E82 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E85 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 1E88 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 1E8B _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 1E8E _ 8B. 4D, 14
        add     ebx, ecx                                ; 1E91 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 1E93 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 1E96 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 1E99 _ 8B. 4D, 10
        add     ecx, esi                                ; 1E9C _ 01. F1
        sub     esp, 4                                  ; 1E9E _ 83. EC, 04
        push    edx                                     ; 1EA1 _ 52
        push    eax                                     ; 1EA2 _ 50
        push    ebx                                     ; 1EA3 _ 53
        push    ecx                                     ; 1EA4 _ 51
        push    dword [ebp+14H]                         ; 1EA5 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1EA8 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1EAB _ FF. 75, 08
        call    sheet_refreshsub                        ; 1EAE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EB3 _ 83. C4, 20
?_114:  lea     esp, [ebp-8H]                           ; 1EB6 _ 8D. 65, F8
        pop     ebx                                     ; 1EB9 _ 5B
        pop     esi                                     ; 1EBA _ 5E
        pop     ebp                                     ; 1EBB _ 5D
        ret                                             ; 1EBC _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1EBD _ 55
        mov     ebp, esp                                ; 1EBE _ 89. E5
        sub     esp, 48                                 ; 1EC0 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1EC3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EC6 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 1EC8 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 1ECB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1ECE _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 1ED1 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 1ED4 _ 83. 7D, 0C, 00
        jns     ?_115                                   ; 1ED8 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 1EDA _ C7. 45, 0C, 00000000
?_115:  cmp     dword [ebp+10H], 8                      ; 1EE1 _ 83. 7D, 10, 08
        jg  near      ?_116                                   ; 1ee5 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 1EE7 _ C7. 45, 10, 00000000
?_116:  mov     eax, dword [ebp+8H]                     ; 1EEE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EF1 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 1EF4 _ 3B. 45, 14
        jge near      ?_117                                   ; 1ef7 _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 1EF9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EFC _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 1EFF _ 89. 45, 14
?_117:  mov     eax, dword [ebp+8H]                     ; 1F02 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F05 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 1F08 _ 3B. 45, 18
        jge near      ?_118                                   ; 1f0b _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 1F0D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F10 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 1F13 _ 89. 45, 18
?_118:  mov     eax, dword [ebp+1CH]                    ; 1F16 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 1F19 _ 89. 45, DC
        jmp     ?_125                                   ; 1F1C _ E9, 00000118

?_119:  mov     eax, dword [ebp+8H]                     ; 1F21 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 1F24 _ 8B. 55, DC
        add     edx, 4                                  ; 1F27 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1F2A _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 1F2E _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1F31 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1F34 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1F36 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1F39 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1F3C _ 8B. 55, 08
        add     edx, 1044                               ; 1F3F _ 81. C2, 00000414
        sub     eax, edx                                ; 1F45 _ 29. D0
        sar     eax, 5                                  ; 1F47 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 1F4A _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 1F4D _ C7. 45, E4, 00000000
        jmp     ?_124                                   ; 1F54 _ E9, 000000CD

?_120:  mov     eax, dword [ebp-10H]                    ; 1F59 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 1F5C _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 1F5F _ 8B. 45, E4
        add     eax, edx                                ; 1F62 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1F64 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 1F67 _ C7. 45, E0, 00000000
        jmp     ?_123                                   ; 1F6E _ E9, 000000A0

?_121:  mov     eax, dword [ebp-10H]                    ; 1F73 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 1F76 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 1F79 _ 8B. 45, E0
        add     eax, edx                                ; 1F7C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 1F7E _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 1F81 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 1F84 _ 3B. 45, FC
        jg  near      ?_122                                   ; 1f87 _ 0f 8f, 00000082
        mov     eax, dword [ebp-4H]                     ; 1F8D _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 1F90 _ 3B. 45, 14
        jge near      ?_122                                   ; 1f93 _ 7d, 7a
        mov     eax, dword [ebp+10H]                    ; 1F95 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 1F98 _ 3B. 45, F8
        jg  near      ?_122                                   ; 1f9b _ 7f, 72
        mov     eax, dword [ebp-8H]                     ; 1F9D _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 1FA0 _ 3B. 45, 18
        jge near      ?_122                                   ; 1fa3 _ 7d, 6a
        mov     eax, dword [ebp-10H]                    ; 1FA5 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1FA8 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 1FAB _ 0F AF. 45, E4
        mov     edx, eax                                ; 1FAF _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 1FB1 _ 8B. 45, E0
        add     eax, edx                                ; 1FB4 _ 01. D0
        mov     edx, eax                                ; 1FB6 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1FB8 _ 8B. 45, F4
        add     eax, edx                                ; 1FBB _ 01. D0
        movzx   eax, byte [eax]                         ; 1FBD _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 1FC0 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 1FC3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1FC6 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 1FC9 _ 0F AF. 45, F8
        mov     edx, eax                                ; 1FCD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1FCF _ 8B. 45, FC
        add     eax, edx                                ; 1FD2 _ 01. D0
        mov     edx, eax                                ; 1FD4 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1FD6 _ 8B. 45, EC
        add     eax, edx                                ; 1FD9 _ 01. D0
        movzx   eax, byte [eax]                         ; 1FDB _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 1FDE _ 3A. 45, DA
        jnz near      ?_122                                   ; 1fe1 _ 75, 2c
        movzx   edx, byte [ebp-25H]                     ; 1FE3 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 1FE7 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 1FEA _ 8B. 40, 14
        cmp     edx, eax                                ; 1FED _ 39. C2
        jz near       ?_122                                   ; 1fef _ 74, 1e
        mov     eax, dword [ebp+8H]                     ; 1FF1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1FF4 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 1FF7 _ 0F AF. 45, F8
        mov     edx, eax                                ; 1FFB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1FFD _ 8B. 45, FC
        add     eax, edx                                ; 2000 _ 01. D0
        mov     edx, eax                                ; 2002 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2004 _ 8B. 45, E8
        add     edx, eax                                ; 2007 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2009 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 200D _ 88. 02
?_122:  add     dword [ebp-20H], 1                      ; 200F _ 83. 45, E0, 01
?_123:  mov     eax, dword [ebp-10H]                    ; 2013 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2016 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2019 _ 3B. 45, E0
        jg  near      ?_121                                   ; 201c _ 0f 8f, ffffff51
        add     dword [ebp-1CH], 1                      ; 2022 _ 83. 45, E4, 01
?_124:  mov     eax, dword [ebp-10H]                    ; 2026 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2029 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 202C _ 3B. 45, E4
        jg  near      ?_120                                   ; 202f _ 0f 8f, ffffff24
        add     dword [ebp-24H], 1                      ; 2035 _ 83. 45, DC, 01
?_125:  mov     eax, dword [ebp-24H]                    ; 2039 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 203C _ 3B. 45, 20
        jle near      ?_119                                   ; 203f _ 0f 8e, fffffedc
        leave                                           ; 2045 _ C9
        ret                                             ; 2046 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2047 _ 55
        mov     ebp, esp                                ; 2048 _ 89. E5
        sub     esp, 64                                 ; 204A _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 204D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2050 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2053 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2056 _ 83. 7D, 0C, 00
        jns     ?_126                                   ; 205A _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 205C _ C7. 45, 0C, 00000000
?_126:  cmp     dword [ebp+10H], 0                      ; 2063 _ 83. 7D, 10, 00
        jns     ?_127                                   ; 2067 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2069 _ C7. 45, 10, 00000000
?_127:  mov     eax, dword [ebp+8H]                     ; 2070 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2073 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 2076 _ 3B. 45, 14
        jge near      ?_128                                   ; 2079 _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 207B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 207E _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2081 _ 89. 45, 14
?_128:  mov     eax, dword [ebp+8H]                     ; 2084 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2087 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 208A _ 3B. 45, 18
        jge near      ?_129                                   ; 208d _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 208F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2092 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2095 _ 89. 45, 18
?_129:  mov     eax, dword [ebp+1CH]                    ; 2098 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 209B _ 89. 45, D0
        jmp     ?_140                                   ; 209E _ E9, 00000140

?_130:  mov     eax, dword [ebp+8H]                     ; 20A3 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 20A6 _ 8B. 55, D0
        add     edx, 4                                  ; 20A9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 20AC _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 20B0 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 20B3 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 20B6 _ 8B. 55, 08
        add     edx, 1044                               ; 20B9 _ 81. C2, 00000414
        sub     eax, edx                                ; 20BF _ 29. D0
        sar     eax, 5                                  ; 20C1 _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 20C4 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 20C7 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 20CA _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 20CC _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 20CF _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 20D2 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 20D5 _ 8B. 55, 0C
        sub     edx, eax                                ; 20D8 _ 29. C2
        mov     eax, edx                                ; 20DA _ 89. D0
        mov     dword [ebp-24H], eax                    ; 20DC _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 20DF _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 20E2 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 20E5 _ 8B. 55, 10
        sub     edx, eax                                ; 20E8 _ 29. C2
        mov     eax, edx                                ; 20EA _ 89. D0
        mov     dword [ebp-20H], eax                    ; 20EC _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 20EF _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 20F2 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 20F5 _ 8B. 55, 14
        sub     edx, eax                                ; 20F8 _ 29. C2
        mov     eax, edx                                ; 20FA _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 20FC _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 20FF _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2102 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2105 _ 8B. 55, 18
        sub     edx, eax                                ; 2108 _ 29. C2
        mov     eax, edx                                ; 210A _ 89. D0
        mov     dword [ebp-18H], eax                    ; 210C _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 210F _ 83. 7D, DC, 00
        jns     ?_131                                   ; 2113 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 2115 _ C7. 45, DC, 00000000
?_131:  cmp     dword [ebp-20H], 0                      ; 211C _ 83. 7D, E0, 00
        jns     ?_132                                   ; 2120 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 2122 _ C7. 45, E0, 00000000
?_132:  mov     eax, dword [ebp-10H]                    ; 2129 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 212C _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 212F _ 3B. 45, E4
        jge near      ?_133                                   ; 2132 _ 7d, 09
        mov     eax, dword [ebp-10H]                    ; 2134 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2137 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 213A _ 89. 45, E4
?_133:  mov     eax, dword [ebp-10H]                    ; 213D _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2140 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 2143 _ 3B. 45, E8
        jge near      ?_134                                   ; 2146 _ 7d, 09
        mov     eax, dword [ebp-10H]                    ; 2148 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 214B _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 214E _ 89. 45, E8
?_134:  mov     eax, dword [ebp-20H]                    ; 2151 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 2154 _ 89. 45, D8
        jmp     ?_139                                   ; 2157 _ EB, 7A

?_135:  mov     eax, dword [ebp-10H]                    ; 2159 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 215C _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 215F _ 8B. 45, D8
        add     eax, edx                                ; 2162 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2164 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 2167 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 216A _ 89. 45, D4
        jmp     ?_138                                   ; 216D _ EB, 58

?_136:  mov     eax, dword [ebp-10H]                    ; 216F _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2172 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 2175 _ 8B. 45, D4
        add     eax, edx                                ; 2178 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 217A _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 217D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2180 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 2183 _ 0F AF. 45, D8
        mov     edx, eax                                ; 2187 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2189 _ 8B. 45, D4
        add     eax, edx                                ; 218C _ 01. D0
        mov     edx, eax                                ; 218E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2190 _ 8B. 45, F4
        add     eax, edx                                ; 2193 _ 01. D0
        movzx   eax, byte [eax]                         ; 2195 _ 0F B6. 00
        movzx   edx, al                                 ; 2198 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 219B _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 219E _ 8B. 40, 14
        cmp     edx, eax                                ; 21A1 _ 39. C2
        jz near       ?_137                                   ; 21a3 _ 74, 1e
        mov     eax, dword [ebp+8H]                     ; 21A5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 21A8 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 21AB _ 0F AF. 45, F8
        mov     edx, eax                                ; 21AF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 21B1 _ 8B. 45, FC
        add     eax, edx                                ; 21B4 _ 01. D0
        mov     edx, eax                                ; 21B6 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 21B8 _ 8B. 45, EC
        add     edx, eax                                ; 21BB _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 21BD _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 21C1 _ 88. 02
?_137:  add     dword [ebp-2CH], 1                      ; 21C3 _ 83. 45, D4, 01
?_138:  mov     eax, dword [ebp-2CH]                    ; 21C7 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 21CA _ 3B. 45, E4
        jl      ?_136                                   ; 21CD _ 7C, A0
        add     dword [ebp-28H], 1                      ; 21CF _ 83. 45, D8, 01
?_139:  mov     eax, dword [ebp-28H]                    ; 21D3 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 21D6 _ 3B. 45, E8
        jl      ?_135                                   ; 21D9 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 21DF _ 83. 45, D0, 01
?_140:  mov     eax, dword [ebp+8H]                     ; 21E3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21E6 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 21E9 _ 3B. 45, D0
        jge near      ?_130                                   ; 21ec _ 0f 8d, fffffeb1
        nop                                             ; 21F2 _ 90
        leave                                           ; 21F3 _ C9
        ret                                             ; 21F4 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 21F5 _ 55
        mov     ebp, esp                                ; 21F6 _ 89. E5
        sub     esp, 8                                  ; 21F8 _ 83. EC, 08
        sub     esp, 8                                  ; 21FB _ 83. EC, 08
        push    52                                      ; 21FE _ 6A, 34
        push    67                                      ; 2200 _ 6A, 43
        call    io_out8                                 ; 2202 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2207 _ 83. C4, 10
        sub     esp, 8                                  ; 220A _ 83. EC, 08
        push    156                                     ; 220D _ 68, 0000009C
        push    64                                      ; 2212 _ 6A, 40
        call    io_out8                                 ; 2214 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2219 _ 83. C4, 10
        sub     esp, 8                                  ; 221C _ 83. EC, 08
        push    46                                      ; 221F _ 6A, 2E
        push    64                                      ; 2221 _ 6A, 40
        call    io_out8                                 ; 2223 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2228 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 222B _ C7. 05, 0000028C(d), 00000000
        mov     dword [?_164], 0                        ; 2235 _ C7. 05, 00000290(d), 00000000
        leave                                           ; 223F _ C9
        ret                                             ; 2240 _ C3
; init_pit End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2241 _ 55
        mov     ebp, esp                                ; 2242 _ 89. E5
        sub     esp, 8                                  ; 2244 _ 83. EC, 08
        sub     esp, 8                                  ; 2247 _ 83. EC, 08
        push    96                                      ; 224A _ 6A, 60
        push    32                                      ; 224C _ 6A, 20
        call    io_out8                                 ; 224E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2253 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2256 _ A1, 0000028C(d)
        add     eax, 1                                  ; 225B _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 225E _ A3, 0000028C(d)
        mov     eax, dword [?_164]                      ; 2263 _ A1, 00000290(d)
        test    eax, eax                                ; 2268 _ 85. C0
        jz near       ?_141                                   ; 226a _ 74, 32
        mov     eax, dword [?_164]                      ; 226C _ A1, 00000290(d)
        sub     eax, 1                                  ; 2271 _ 83. E8, 01
        mov     dword [?_164], eax                      ; 2274 _ A3, 00000290(d)
        mov     eax, dword [?_164]                      ; 2279 _ A1, 00000290(d)
        test    eax, eax                                ; 227E _ 85. C0
        jnz near      ?_141                                   ; 2280 _ 75, 1c
        movzx   eax, byte [?_166]                       ; 2282 _ 0F B6. 05, 00000298(d)
        movzx   edx, al                                 ; 2289 _ 0F B6. D0
        mov     eax, dword [?_165]                      ; 228C _ A1, 00000294(d)
        sub     esp, 8                                  ; 2291 _ 83. EC, 08
        push    edx                                     ; 2294 _ 52
        push    eax                                     ; 2295 _ 50
        call    fifo8_put                               ; 2296 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 229B _ 83. C4, 10
?_141:  nop                                             ; 229E _ 90
        leave                                           ; 229F _ C9
        ret                                             ; 22A0 _ C3
; intHandlerForTimer End of function

settimer:; Function begin
        push    ebp                                     ; 22A1 _ 55
        mov     ebp, esp                                ; 22A2 _ 89. E5
        sub     esp, 40                                 ; 22A4 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 22A7 _ 8B. 45, 10
        mov     byte [ebp-1CH], al                      ; 22AA _ 88. 45, E4
        call    io_load_eflags                          ; 22AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 22B2 _ 89. 45, F4
        call    io_cli                                  ; 22B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 22BA _ 8B. 45, 08
        mov     dword [?_164], eax                      ; 22BD _ A3, 00000290(d)
        mov     eax, dword [ebp+0CH]                    ; 22C2 _ 8B. 45, 0C
        mov     dword [?_165], eax                      ; 22C5 _ A3, 00000294(d)
        movzx   eax, byte [ebp-1CH]                     ; 22CA _ 0F B6. 45, E4
        mov     byte [?_166], al                        ; 22CE _ A2, 00000298(d)
        sub     esp, 12                                 ; 22D3 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 22D6 _ FF. 75, F4
        call    io_store_eflags                         ; 22D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22DE _ 83. C4, 10
        nop                                             ; 22E1 _ 90
        leave                                           ; 22E2 _ C9
        ret                                             ; 22E3 _ C3
; settimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 22E4 _ 55
        mov     ebp, esp                                ; 22E5 _ 89. E5
        mov     eax, timerctl                           ; 22E7 _ B8, 0000028C(d)
        pop     ebp                                     ; 22EC _ 5D
        ret                                             ; 22ED _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 22EE _ 55
        mov     ebp, esp                                ; 22EF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 22F1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 22F4 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 22F7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 22FA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22FD _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2300 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2302 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2305 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2308 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 230B _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 230E _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2315 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2318 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 231F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2322 _ C7. 40, 08, 00000000
        nop                                             ; 2329 _ 90
        pop     ebp                                     ; 232A _ 5D
        ret                                             ; 232B _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 232C _ 55
        mov     ebp, esp                                ; 232D _ 89. E5
        sub     esp, 4                                  ; 232F _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2332 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2335 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2338 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 233B _ 8B. 40, 10
        test    eax, eax                                ; 233E _ 85. C0
        jnz near      ?_142                                   ; 2340 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2342 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2345 _ 8B. 40, 14
        or      eax, 01H                                ; 2348 _ 83. C8, 01
        mov     edx, eax                                ; 234B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 234D _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2350 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2353 _ B8, FFFFFFFF
        jmp     ?_144                                   ; 2358 _ EB, 50

?_142:  mov     eax, dword [ebp+8H]                     ; 235A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 235D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 235F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2362 _ 8B. 40, 04
        add     edx, eax                                ; 2365 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 2367 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 236B _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 236D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2370 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2373 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2376 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2379 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 237C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 237F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2382 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2385 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2388 _ 39. C2
        jnz near      ?_143                                   ; 238a _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 238C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 238F _ C7. 40, 04, 00000000
?_143:  mov     eax, dword [ebp+8H]                     ; 2396 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2399 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 239C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 239F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 23A2 _ 89. 50, 10
        mov     eax, 0                                  ; 23A5 _ B8, 00000000
?_144:  leave                                           ; 23AA _ C9
        ret                                             ; 23AB _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 23AC _ 55
        mov     ebp, esp                                ; 23AD _ 89. E5
        sub     esp, 16                                 ; 23AF _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 23B2 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 23B5 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 23B8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23BB _ 8B. 40, 0C
        cmp     edx, eax                                ; 23BE _ 39. C2
        jnz near      ?_145                                   ; 23c0 _ 75, 07
        mov     eax, 4294967295                         ; 23C2 _ B8, FFFFFFFF
        jmp     ?_147                                   ; 23C7 _ EB, 51

?_145:  mov     eax, dword [ebp+8H]                     ; 23C9 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 23CC _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 23CE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23D1 _ 8B. 40, 08
        add     eax, edx                                ; 23D4 _ 01. D0
        movzx   eax, byte [eax]                         ; 23D6 _ 0F B6. 00
        movzx   eax, al                                 ; 23D9 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 23DC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 23DF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23E2 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 23E5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23E8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 23EB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23EE _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 23F1 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23F4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23F7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 23FA _ 39. C2
        jnz near      ?_146                                   ; 23fc _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 23FE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2401 _ C7. 40, 08, 00000000
?_146:  mov     eax, dword [ebp+8H]                     ; 2408 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 240B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 240E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2411 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2414 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2417 _ 8B. 45, FC
?_147:  leave                                           ; 241A _ C9
        ret                                             ; 241B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 241C _ 55
        mov     ebp, esp                                ; 241D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 241F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2422 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2425 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2428 _ 8B. 40, 10
        sub     edx, eax                                ; 242B _ 29. C2
        mov     eax, edx                                ; 242D _ 89. D0
        pop     ebp                                     ; 242F _ 5D
        ret                                             ; 2430 _ C3
; fifo8_status End of function



?_148:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_149:                                                  ; byte
        db 35H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0008 _ 5[sec].

?_150:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 000F _ page is:
        db 20H, 00H                                     ; 0017 _  .

?_151:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0019 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0021 _ L: .

?_152:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0025 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 002D _ H: .

?_153:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0031 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0039 _ w: .

?_154:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 003D _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0045 _ gh: .

?_155:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 004A _ type: .

?_156:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0051 _ Welcome 
        db 74H, 6FH, 00H                                ; 0059 _ to.

?_157:                                                  ; byte
        db 4DH, 79H, 4FH, 53H, 00H                      ; 005C _ MyOS.



memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_158:  db 00H                                          ; 0006 _ .

?_159:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1689:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

cursor.1736:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0080 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0088 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0098 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0100 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0110 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0128 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0138 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0148 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0158 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0168 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0178 _ .....***

closebtn.1848:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0180 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0188 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0190 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0198 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01A0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01B0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01B8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01C0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01E0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01F0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01F8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0200 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0210 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0218 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0220 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0228 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0230 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0238 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0240 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0248 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0250 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0258 _ @@@@@@@@



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_160:  resw    1                                       ; 0004

?_161:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

mouseinfo:                                              ; byte
        resb    32                                      ; 0020

keybuf:                                                 ; yword
        resb    64                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    16                                      ; 0100

timerinfo:                                              ; byte
        resb    24                                      ; 0110

timerbuf: resq  1                                       ; 0128

mx:     resd    1                                       ; 0130

my:     resd    1                                       ; 0134

xsize:  resd    1                                       ; 0138

ysize:  resd    1                                       ; 013C

buf_back: resd  16                                      ; 0140

buf_mouse:                                              ; byte
        resb    256                                     ; 0180

str.1784:                                               ; byte
        resb    1                                       ; 0280

?_162:  resb    9                                       ; 0281

?_163:  resb    2                                       ; 028A

timerctl:                                               ; oword
        resd    1                                       ; 028C

?_164:  resd    1                                       ; 0290

?_165:  resd    1                                       ; 0294

?_166:  resb    4                                       ; 0298


