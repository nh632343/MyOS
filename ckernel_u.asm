; Disassembly of file: ckernel.o
; Thu Jan 12 10:01:16 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global task_b_main: function
global init_screen8: function
global computeMousePosition: function
global show_mouse_info: function
global initBootInfo: function
global showString: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showFont8: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global mouse_decode: function
global showMemoryInfo: function
global message_box: function
global make_window8: function
global make_textbox8: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refreshsub: function
global sheet_refreshmap: function
global init_pit: function
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerForTimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global set_segmdesc: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global memman

extern task_timer                                       ; dword
extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 96                                 ; 0005 _ 83. EC, 60
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0008 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 000E _ 89. 45, F4
        xor     eax, eax                                ; 0011 _ 31. C0
        sub     esp, 12                                 ; 0013 _ 83. EC, 0C
        push    bootInfo                                ; 0016 _ 68, 00000000(d)
        call    initBootInfo                            ; 001B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0020 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0023 _ A1, 00000000(d)
        mov     dword [ebp-4CH], eax                    ; 0028 _ 89. 45, B4
        movzx   eax, word [?_200]                       ; 002B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0032 _ 98
        mov     dword [xsize], eax                      ; 0033 _ A3, 0000013C(d)
        movzx   eax, word [?_201]                       ; 0038 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 003F _ 98
        mov     dword [ysize], eax                      ; 0040 _ A3, 00000140(d)
        call    init_pit                                ; 0045 _ E8, FFFFFFFC(rel)
        push    0                                       ; 004A _ 6A, 00
        push    timerbuf                                ; 004C _ 68, 0000012C(d)
        push    8                                       ; 0051 _ 6A, 08
        push    timerinfo                               ; 0053 _ 68, 00000110(d)
        call    fifo8_init                              ; 0058 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 005D _ 83. C4, 10
        call    timer_alloc                             ; 0060 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], eax                    ; 0065 _ 89. 45, B8
        sub     esp, 4                                  ; 0068 _ 83. EC, 04
        push    10                                      ; 006B _ 6A, 0A
        push    timerinfo                               ; 006D _ 68, 00000110(d)
        push    dword [ebp-48H]                         ; 0072 _ FF. 75, B8
        call    timer_init                              ; 0075 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007A _ 83. C4, 10
        sub     esp, 8                                  ; 007D _ 83. EC, 08
        push    100                                     ; 0080 _ 6A, 64
        push    dword [ebp-48H]                         ; 0082 _ FF. 75, B8
        call    timer_settime                           ; 0085 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 008A _ 83. C4, 10
        call    timer_alloc                             ; 008D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], eax                    ; 0092 _ 89. 45, BC
        sub     esp, 4                                  ; 0095 _ 83. EC, 04
        push    2                                       ; 0098 _ 6A, 02
        push    timerinfo                               ; 009A _ 68, 00000110(d)
        push    dword [ebp-44H]                         ; 009F _ FF. 75, BC
        call    timer_init                              ; 00A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A7 _ 83. C4, 10
        sub     esp, 8                                  ; 00AA _ 83. EC, 08
        push    300                                     ; 00AD _ 68, 0000012C
        push    dword [ebp-44H]                         ; 00B2 _ FF. 75, BC
        call    timer_settime                           ; 00B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BA _ 83. C4, 10
        call    timer_alloc                             ; 00BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], eax                    ; 00C2 _ 89. 45, C0
        sub     esp, 4                                  ; 00C5 _ 83. EC, 04
        push    1                                       ; 00C8 _ 6A, 01
        push    timerinfo                               ; 00CA _ 68, 00000110(d)
        push    dword [ebp-40H]                         ; 00CF _ FF. 75, C0
        call    timer_init                              ; 00D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D7 _ 83. C4, 10
        sub     esp, 8                                  ; 00DA _ 83. EC, 08
        push    50                                      ; 00DD _ 6A, 32
        push    dword [ebp-40H]                         ; 00DF _ FF. 75, C0
        call    timer_settime                           ; 00E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E7 _ 83. C4, 10
        push    0                                       ; 00EA _ 6A, 00
        push    keybuf                                  ; 00EC _ 68, 00000040(d)
        push    32                                      ; 00F1 _ 6A, 20
        push    keyinfo                                 ; 00F3 _ 68, 00000008(d)
        call    fifo8_init                              ; 00F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00FD _ 83. C4, 10
        push    0                                       ; 0100 _ 6A, 00
        push    mousebuf                                ; 0102 _ 68, 00000080(d)
        push    128                                     ; 0107 _ 68, 00000080
        push    mouseinfo                               ; 010C _ 68, 00000024(d)
        call    fifo8_init                              ; 0111 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0116 _ 83. C4, 10
        call    init_palette                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 011E _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0123 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0128 _ 89. 45, C4
        call    get_adr_buffer                          ; 012B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0130 _ 89. 45, C8
        mov     eax, dword [memman]                     ; 0133 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0138 _ 83. EC, 0C
        push    eax                                     ; 013B _ 50
        call    memman_init                             ; 013C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0141 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0144 _ A1, 00000000(d)
        sub     esp, 4                                  ; 0149 _ 83. EC, 04
        push    1072594944                              ; 014C _ 68, 3FEE8000
        push    16809984                                ; 0151 _ 68, 01008000
        push    eax                                     ; 0156 _ 50
        call    memman_free                             ; 0157 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 015C _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 015F _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0165 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 016B _ A1, 00000000(d)
        push    ecx                                     ; 0170 _ 51
        push    edx                                     ; 0171 _ 52
        push    dword [ebp-4CH]                         ; 0172 _ FF. 75, B4
        push    eax                                     ; 0175 _ 50
        call    shtctl_init                             ; 0176 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 017B _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 017E _ A3, 00000284(d)
        mov     eax, dword [shtctl]                     ; 0183 _ A1, 00000284(d)
        sub     esp, 12                                 ; 0188 _ 83. EC, 0C
        push    eax                                     ; 018B _ 50
        call    sheet_alloc                             ; 018C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0191 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0194 _ A3, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0199 _ A1, 00000284(d)
        sub     esp, 12                                 ; 019E _ 83. EC, 0C
        push    eax                                     ; 01A1 _ 50
        call    sheet_alloc                             ; 01A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01A7 _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 01AA _ A3, 0000028C(d)
        mov     edx, dword [xsize]                      ; 01AF _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01B5 _ A1, 00000140(d)
        imul    edx, eax                                ; 01BA _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01BD _ A1, 00000000(d)
        sub     esp, 8                                  ; 01C2 _ 83. EC, 08
        push    edx                                     ; 01C5 _ 52
        push    eax                                     ; 01C6 _ 50
        call    memman_alloc_4k                         ; 01C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01CC _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01CF _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 01D4 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 01DA _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 01E0 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 01E6 _ A1, 00000288(d)
        sub     esp, 12                                 ; 01EB _ 83. EC, 0C
        push    99                                      ; 01EE _ 6A, 63
        push    ebx                                     ; 01F0 _ 53
        push    ecx                                     ; 01F1 _ 51
        push    edx                                     ; 01F2 _ 52
        push    eax                                     ; 01F3 _ 50
        call    sheet_setbuf                            ; 01F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01F9 _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01FC _ A1, 0000028C(d)
        sub     esp, 12                                 ; 0201 _ 83. EC, 0C
        push    99                                      ; 0204 _ 6A, 63
        push    16                                      ; 0206 _ 6A, 10
        push    16                                      ; 0208 _ 6A, 10
        push    buf_mouse                               ; 020A _ 68, 00000180(d)
        push    eax                                     ; 020F _ 50
        call    sheet_setbuf                            ; 0210 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0215 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0218 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 021E _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0224 _ A1, 00000144(d)
        sub     esp, 4                                  ; 0229 _ 83. EC, 04
        push    ecx                                     ; 022C _ 51
        push    edx                                     ; 022D _ 52
        push    eax                                     ; 022E _ 50
        call    init_screen8                            ; 022F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0234 _ 83. C4, 10
        sub     esp, 8                                  ; 0237 _ 83. EC, 08
        push    99                                      ; 023A _ 6A, 63
        push    buf_mouse                               ; 023C _ 68, 00000180(d)
        call    init_mouse_cursor                       ; 0241 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0246 _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 0249 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 024F _ A1, 00000284(d)
        push    0                                       ; 0254 _ 6A, 00
        push    0                                       ; 0256 _ 6A, 00
        push    edx                                     ; 0258 _ 52
        push    eax                                     ; 0259 _ 50
        call    sheet_slide                             ; 025A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025F _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0262 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 0267 _ 83. E8, 10
        mov     edx, eax                                ; 026A _ 89. C2
        shr     edx, 31                                 ; 026C _ C1. EA, 1F
        add     eax, edx                                ; 026F _ 01. D0
        sar     eax, 1                                  ; 0271 _ D1. F8
        mov     dword [mx], eax                         ; 0273 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 0278 _ A1, 00000140(d)
        sub     eax, 44                                 ; 027D _ 83. E8, 2C
        mov     edx, eax                                ; 0280 _ 89. C2
        shr     edx, 31                                 ; 0282 _ C1. EA, 1F
        add     eax, edx                                ; 0285 _ 01. D0
        sar     eax, 1                                  ; 0287 _ D1. F8
        mov     dword [my], eax                         ; 0289 _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 028E _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 0294 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 029A _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 02A0 _ A1, 00000284(d)
        push    ebx                                     ; 02A5 _ 53
        push    ecx                                     ; 02A6 _ 51
        push    edx                                     ; 02A7 _ 52
        push    eax                                     ; 02A8 _ 50
        call    sheet_slide                             ; 02A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02AE _ 83. C4, 10
        mov     dword [ebp-64H], 8                      ; 02B1 _ C7. 45, 9C, 00000008
        mov     dword [ebp-60H], 7                      ; 02B8 _ C7. 45, A0, 00000007
        mov     eax, dword [shtctl]                     ; 02BF _ A1, 00000284(d)
        sub     esp, 8                                  ; 02C4 _ 83. EC, 08
        push    ?_189                                   ; 02C7 _ 68, 00000000(d)
        push    eax                                     ; 02CC _ 50
        call    message_box                             ; 02CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02D2 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02D5 _ A3, 00000280(d)
        mov     edx, dword [sht_back]                   ; 02DA _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 02E0 _ A1, 00000284(d)
        sub     esp, 4                                  ; 02E5 _ 83. EC, 04
        push    0                                       ; 02E8 _ 6A, 00
        push    edx                                     ; 02EA _ 52
        push    eax                                     ; 02EB _ 50
        call    sheet_updown                            ; 02EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F1 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02F4 _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 02FA _ A1, 00000284(d)
        sub     esp, 4                                  ; 02FF _ 83. EC, 04
        push    100                                     ; 0302 _ 6A, 64
        push    edx                                     ; 0304 _ 52
        push    eax                                     ; 0305 _ 50
        call    sheet_updown                            ; 0306 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030B _ 83. C4, 10
        call    io_sti                                  ; 030E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0313 _ 83. EC, 0C
        push    mdec                                    ; 0316 _ 68, 00000100(d)
        call    enable_mouse                            ; 031B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0320 _ 83. C4, 10
        call    get_code32_addr                         ; 0323 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0328 _ 89. 45, CC
        call    get_addr_gdt                            ; 032B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0330 _ 89. 45, D0
        mov     eax, dword [memman]                     ; 0333 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0338 _ 83. EC, 0C
        push    eax                                     ; 033B _ 50
        call    task_init                               ; 033C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0341 _ 83. C4, 10
        mov     dword [task_a.1739], eax                ; 0344 _ A3, 000002A4(d)
        mov     eax, dword [task_a.1739]                ; 0349 _ A1, 000002A4(d)
        mov     dword [?_202], eax                      ; 034E _ A3, 00000020(d)
        mov     byte [ebp-12H], 116                     ; 0353 _ C6. 45, EE, 74
        mov     byte [ebp-11H], 97                      ; 0357 _ C6. 45, EF, 61
        mov     byte [ebp-10H], 115                     ; 035B _ C6. 45, F0, 73
        mov     byte [ebp-0FH], 107                     ; 035F _ C6. 45, F1, 6B
        mov     byte [ebp-0EH], 0                       ; 0363 _ C6. 45, F2, 00
        mov     byte [ebp-0DH], 0                       ; 0367 _ C6. 45, F3, 00
        mov     dword [ebp-5CH], 0                      ; 036B _ C7. 45, A4, 00000000
        mov     dword [ebp-5CH], 0                      ; 0372 _ C7. 45, A4, 00000000
        jmp     ?_002                                   ; 0379 _ E9, 00000190

?_001:  mov     eax, dword [shtctl]                     ; 037E _ A1, 00000284(d)
        sub     esp, 12                                 ; 0383 _ 83. EC, 0C
        push    eax                                     ; 0386 _ 50
        call    sheet_alloc                             ; 0387 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 038C _ 83. C4, 10
        mov     edx, eax                                ; 038F _ 89. C2
        mov     eax, dword [ebp-5CH]                    ; 0391 _ 8B. 45, A4
        mov     dword [ebp+eax*4-20H], edx              ; 0394 _ 89. 54 85, E0
        mov     eax, dword [memman]                     ; 0398 _ A1, 00000000(d)
        sub     esp, 8                                  ; 039D _ 83. EC, 08
        push    7488                                    ; 03A0 _ 68, 00001D40
        push    eax                                     ; 03A5 _ 50
        call    memman_alloc_4k                         ; 03A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03AB _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 03AE _ 89. 45, D4
        mov     eax, dword [ebp-5CH]                    ; 03B1 _ 8B. 45, A4
        add     eax, 98                                 ; 03B4 _ 83. C0, 62
        mov     byte [ebp-65H], al                      ; 03B7 _ 88. 45, 9B
        movzx   eax, byte [ebp-65H]                     ; 03BA _ 0F B6. 45, 9B
        mov     byte [ebp-0EH], al                      ; 03BE _ 88. 45, F2
        mov     eax, dword [ebp-5CH]                    ; 03C1 _ 8B. 45, A4
        mov     eax, dword [ebp+eax*4-20H]              ; 03C4 _ 8B. 44 85, E0
        sub     esp, 12                                 ; 03C8 _ 83. EC, 0C
        push    -1                                      ; 03CB _ 6A, FF
        push    52                                      ; 03CD _ 6A, 34
        push    144                                     ; 03CF _ 68, 00000090
        push    dword [ebp-2CH]                         ; 03D4 _ FF. 75, D4
        push    eax                                     ; 03D7 _ 50
        call    sheet_setbuf                            ; 03D8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03DD _ 83. C4, 20
        mov     eax, dword [ebp-5CH]                    ; 03E0 _ 8B. 45, A4
        mov     edx, dword [ebp+eax*4-20H]              ; 03E3 _ 8B. 54 85, E0
        mov     eax, dword [shtctl]                     ; 03E7 _ A1, 00000284(d)
        sub     esp, 4                                  ; 03EC _ 83. EC, 04
        lea     ecx, [ebp-12H]                          ; 03EF _ 8D. 4D, EE
        push    ecx                                     ; 03F2 _ 51
        push    edx                                     ; 03F3 _ 52
        push    eax                                     ; 03F4 _ 50
        call    make_window8                            ; 03F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FA _ 83. C4, 10
        call    task_alloc                              ; 03FD _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 0402 _ 89. C2
        mov     eax, dword [ebp-5CH]                    ; 0404 _ 8B. 45, A4
        mov     dword [task_b.1723+eax*4], edx          ; 0407 _ 89. 14 85, 000002A8(d)
        mov     eax, dword [ebp-5CH]                    ; 040E _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 0411 _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+6CH], 0                      ; 0418 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-5CH]                    ; 041F _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 0422 _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+70H], 1073741824             ; 0429 _ C7. 40, 70, 40000000
        mov     eax, dword [ebp-5CH]                    ; 0430 _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 0433 _ 8B. 04 85, 000002A8(d)
        mov     edx, dword [ebp-34H]                    ; 043A _ 8B. 55, CC
        neg     edx                                     ; 043D _ F7. DA
        add     edx, task_b_main                        ; 043F _ 81. C2, 00000000(d)
        mov     dword [eax+2CH], edx                    ; 0445 _ 89. 50, 2C
        mov     eax, dword [ebp-5CH]                    ; 0448 _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 044B _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+54H], 0                      ; 0452 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-5CH]                    ; 0459 _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 045C _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+58H], 8                      ; 0463 _ C7. 40, 58, 00000008
        mov     eax, dword [ebp-5CH]                    ; 046A _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 046D _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+5CH], 32                     ; 0474 _ C7. 40, 5C, 00000020
        mov     eax, dword [ebp-5CH]                    ; 047B _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 047E _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+60H], 24                     ; 0485 _ C7. 40, 60, 00000018
        mov     eax, dword [ebp-5CH]                    ; 048C _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 048F _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+64H], 0                      ; 0496 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-5CH]                    ; 049D _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 04A0 _ 8B. 04 85, 000002A8(d)
        mov     dword [eax+68H], 16                     ; 04A7 _ C7. 40, 68, 00000010
        mov     eax, dword [ebp-5CH]                    ; 04AE _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 04B1 _ 8B. 04 85, 000002A8(d)
        mov     edx, dword [ebp-5CH]                    ; 04B8 _ 8B. 55, A4
        mov     edx, dword [task_b.1723+edx*4]          ; 04BB _ 8B. 14 95, 000002A8(d)
        mov     edx, dword [edx+44H]                    ; 04C2 _ 8B. 52, 44
        sub     edx, 8                                  ; 04C5 _ 83. EA, 08
        mov     dword [eax+44H], edx                    ; 04C8 _ 89. 50, 44
        mov     eax, dword [ebp-5CH]                    ; 04CB _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 04CE _ 8B. 04 85, 000002A8(d)
        mov     eax, dword [eax+44H]                    ; 04D5 _ 8B. 40, 44
        add     eax, 4                                  ; 04D8 _ 83. C0, 04
        mov     edx, eax                                ; 04DB _ 89. C2
        mov     eax, dword [ebp-5CH]                    ; 04DD _ 8B. 45, A4
        mov     eax, dword [ebp+eax*4-20H]              ; 04E0 _ 8B. 44 85, E0
        mov     dword [edx], eax                        ; 04E4 _ 89. 02
        mov     eax, dword [ebp-5CH]                    ; 04E6 _ 8B. 45, A4
        lea     edx, [eax+1H]                           ; 04E9 _ 8D. 50, 01
        mov     eax, edx                                ; 04EC _ 89. D0
        shl     eax, 2                                  ; 04EE _ C1. E0, 02
        add     edx, eax                                ; 04F1 _ 01. C2
        mov     eax, dword [ebp-5CH]                    ; 04F3 _ 8B. 45, A4
        mov     eax, dword [task_b.1723+eax*4]          ; 04F6 _ 8B. 04 85, 000002A8(d)
        sub     esp, 8                                  ; 04FD _ 83. EC, 08
        push    edx                                     ; 0500 _ 52
        push    eax                                     ; 0501 _ 50
        call    task_run                                ; 0502 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0507 _ 83. C4, 10
        add     dword [ebp-5CH], 1                      ; 050A _ 83. 45, A4, 01
?_002:  cmp     dword [ebp-5CH], 1                      ; 050E _ 83. 7D, A4, 01
        jle     ?_001                                   ; 0512 _ 0F 8E, FFFFFE66
        mov     edx, dword [ebp-20H]                    ; 0518 _ 8B. 55, E0
        mov     eax, dword [shtctl]                     ; 051B _ A1, 00000284(d)
        push    28                                      ; 0520 _ 6A, 1C
        push    16                                      ; 0522 _ 6A, 10
        push    edx                                     ; 0524 _ 52
        push    eax                                     ; 0525 _ 50
        call    sheet_slide                             ; 0526 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 052B _ 83. C4, 10
        mov     edx, dword [ebp-20H]                    ; 052E _ 8B. 55, E0
        mov     eax, dword [shtctl]                     ; 0531 _ A1, 00000284(d)
        sub     esp, 4                                  ; 0536 _ 83. EC, 04
        push    1                                       ; 0539 _ 6A, 01
        push    edx                                     ; 053B _ 52
        push    eax                                     ; 053C _ 50
        call    sheet_updown                            ; 053D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0542 _ 83. C4, 10
        mov     edx, dword [ebp-1CH]                    ; 0545 _ 8B. 55, E4
        mov     eax, dword [shtctl]                     ; 0548 _ A1, 00000284(d)
        push    28                                      ; 054D _ 6A, 1C
        push    160                                     ; 054F _ 68, 000000A0
        push    edx                                     ; 0554 _ 52
        push    eax                                     ; 0555 _ 50
        call    sheet_slide                             ; 0556 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 055B _ 83. C4, 10
        mov     edx, dword [ebp-1CH]                    ; 055E _ 8B. 55, E4
        mov     eax, dword [shtctl]                     ; 0561 _ A1, 00000284(d)
        sub     esp, 4                                  ; 0566 _ 83. EC, 04
        push    1                                       ; 0569 _ 6A, 01
        push    edx                                     ; 056B _ 52
        push    eax                                     ; 056C _ 50
        call    sheet_updown                            ; 056D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0572 _ 83. C4, 10
        mov     dword [ebp-28H], 0                      ; 0575 _ C7. 45, D8, 00000000
        mov     dword [ebp-58H], 0                      ; 057C _ C7. 45, A8, 00000000
        mov     dword [ebp-5CH], 0                      ; 0583 _ C7. 45, A4, 00000000
        mov     dword [ebp-54H], 0                      ; 058A _ C7. 45, AC, 00000000
        mov     dword [ebp-50H], 0                      ; 0591 _ C7. 45, B0, 00000000
?_003:  call    io_cli                                  ; 0598 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 059D _ 83. EC, 0C
        push    keyinfo                                 ; 05A0 _ 68, 00000008(d)
        call    fifo8_status                            ; 05A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05AA _ 83. C4, 10
        mov     ebx, eax                                ; 05AD _ 89. C3
        sub     esp, 12                                 ; 05AF _ 83. EC, 0C
        push    mouseinfo                               ; 05B2 _ 68, 00000024(d)
        call    fifo8_status                            ; 05B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05BC _ 83. C4, 10
        add     ebx, eax                                ; 05BF _ 01. C3
        sub     esp, 12                                 ; 05C1 _ 83. EC, 0C
        push    timerinfo                               ; 05C4 _ 68, 00000110(d)
        call    fifo8_status                            ; 05C9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05CE _ 83. C4, 10
        add     eax, ebx                                ; 05D1 _ 01. D8
        test    eax, eax                                ; 05D3 _ 85. C0
        jnz     ?_004                                   ; 05D5 _ 75, 0A
        call    io_sti                                  ; 05D7 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 05DC _ E9, 00000353

?_004:  sub     esp, 12                                 ; 05E1 _ 83. EC, 0C
        push    keyinfo                                 ; 05E4 _ 68, 00000008(d)
        call    fifo8_status                            ; 05E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05EE _ 83. C4, 10
        test    eax, eax                                ; 05F1 _ 85. C0
        je      ?_006                                   ; 05F3 _ 0F 84, 00000189
        call    io_sti                                  ; 05F9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 05FE _ 83. EC, 0C
        push    keyinfo                                 ; 0601 _ 68, 00000008(d)
        call    fifo8_get                               ; 0606 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 060B _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 060E _ 89. 45, D8
        cmp     dword [ebp-28H], 28                     ; 0611 _ 83. 7D, D8, 1C
        jnz     ?_005                                   ; 0615 _ 75, 5D
        mov     ebx, dword [xsize]                      ; 0617 _ 8B. 1D, 0000013C(d)
        mov     ecx, dword [buf_back]                   ; 061D _ 8B. 0D, 00000144(d)
        mov     edx, dword [ebp-58H]                    ; 0623 _ 8B. 55, A8
        mov     eax, edx                                ; 0626 _ 89. D0
        shl     eax, 2                                  ; 0628 _ C1. E0, 02
        add     eax, edx                                ; 062B _ 01. D0
        shl     eax, 2                                  ; 062D _ C1. E0, 02
        mov     edx, eax                                ; 0630 _ 89. C2
        mov     eax, dword [ebp-38H]                    ; 0632 _ 8B. 45, C8
        lea     esi, [edx+eax]                          ; 0635 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0638 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 063E _ A1, 00000284(d)
        sub     esp, 4                                  ; 0643 _ 83. EC, 04
        push    7                                       ; 0646 _ 6A, 07
        push    ebx                                     ; 0648 _ 53
        push    dword [ebp-58H]                         ; 0649 _ FF. 75, A8
        push    ecx                                     ; 064C _ 51
        push    esi                                     ; 064D _ 56
        push    edx                                     ; 064E _ 52
        push    eax                                     ; 064F _ 50
        call    showMemoryInfo                          ; 0650 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0655 _ 83. C4, 20
        add     dword [ebp-58H], 1                      ; 0658 _ 83. 45, A8, 01
        mov     eax, dword [ebp-58H]                    ; 065C _ 8B. 45, A8
        cmp     eax, dword [ebp-3CH]                    ; 065F _ 3B. 45, C4
        jle     ?_012                                   ; 0662 _ 0F 8E, 000002CC
        mov     dword [ebp-58H], 0                      ; 0668 _ C7. 45, A8, 00000000
        jmp     ?_012                                   ; 066F _ E9, 000002C0

?_005:  mov     eax, dword [ebp-28H]                    ; 0674 _ 8B. 45, D8
        add     eax, keytable                           ; 0677 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 067C _ 0F B6. 00
        test    al, al                                  ; 067F _ 84. C0
        je      ?_012                                   ; 0681 _ 0F 84, 000002AD
        cmp     dword [ebp-64H], 143                    ; 0687 _ 81. 7D, 9C, 0000008F
        jg      ?_012                                   ; 068E _ 0F 8F, 000002A0
        mov     eax, dword [ebp-64H]                    ; 0694 _ 8B. 45, 9C
        lea     ecx, [eax+7H]                           ; 0697 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 069A _ A1, 00000280(d)
        mov     edx, dword [eax+4H]                     ; 069F _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 06A2 _ A1, 00000280(d)
        mov     eax, dword [eax]                        ; 06A7 _ 8B. 00
        sub     esp, 4                                  ; 06A9 _ 83. EC, 04
        push    43                                      ; 06AC _ 6A, 2B
        push    ecx                                     ; 06AE _ 51
        push    28                                      ; 06AF _ 6A, 1C
        push    dword [ebp-64H]                         ; 06B1 _ FF. 75, 9C
        push    7                                       ; 06B4 _ 6A, 07
        push    edx                                     ; 06B6 _ 52
        push    eax                                     ; 06B7 _ 50
        call    boxfill8                                ; 06B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06BD _ 83. C4, 20
        mov     eax, dword [ebp-64H]                    ; 06C0 _ 8B. 45, 9C
        lea     ecx, [eax+8H]                           ; 06C3 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 06C6 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06CC _ A1, 00000284(d)
        sub     esp, 8                                  ; 06D1 _ 83. EC, 08
        push    44                                      ; 06D4 _ 6A, 2C
        push    ecx                                     ; 06D6 _ 51
        push    28                                      ; 06D7 _ 6A, 1C
        push    dword [ebp-64H]                         ; 06D9 _ FF. 75, 9C
        push    edx                                     ; 06DC _ 52
        push    eax                                     ; 06DD _ 50
        call    sheet_refresh                           ; 06DE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06E3 _ 83. C4, 20
        mov     eax, dword [ebp-28H]                    ; 06E6 _ 8B. 45, D8
        add     eax, keytable                           ; 06E9 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 06EE _ 0F B6. 00
        mov     byte [ebp-14H], al                      ; 06F1 _ 88. 45, EC
        mov     byte [ebp-13H], 0                       ; 06F4 _ C6. 45, ED, 00
        mov     edx, dword [shtMsgBox]                  ; 06F8 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06FE _ A1, 00000284(d)
        sub     esp, 8                                  ; 0703 _ 83. EC, 08
        lea     ecx, [ebp-14H]                          ; 0706 _ 8D. 4D, EC
        push    ecx                                     ; 0709 _ 51
        push    0                                       ; 070A _ 6A, 00
        push    28                                      ; 070C _ 6A, 1C
        push    dword [ebp-64H]                         ; 070E _ FF. 75, 9C
        push    edx                                     ; 0711 _ 52
        push    eax                                     ; 0712 _ 50
        call    showString                              ; 0713 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0718 _ 83. C4, 20
        add     dword [ebp-64H], 8                      ; 071B _ 83. 45, 9C, 08
        mov     dword [ebp-50H], 1                      ; 071F _ C7. 45, B0, 00000001
        mov     eax, dword [ebp-64H]                    ; 0726 _ 8B. 45, 9C
        lea     ebx, [eax+7H]                           ; 0729 _ 8D. 58, 07
        mov     eax, dword [ebp-60H]                    ; 072C _ 8B. 45, A0
        movzx   ecx, al                                 ; 072F _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0732 _ A1, 00000280(d)
        mov     edx, dword [eax+4H]                     ; 0737 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 073A _ A1, 00000280(d)
        mov     eax, dword [eax]                        ; 073F _ 8B. 00
        sub     esp, 4                                  ; 0741 _ 83. EC, 04
        push    43                                      ; 0744 _ 6A, 2B
        push    ebx                                     ; 0746 _ 53
        push    28                                      ; 0747 _ 6A, 1C
        push    dword [ebp-64H]                         ; 0749 _ FF. 75, 9C
        push    ecx                                     ; 074C _ 51
        push    edx                                     ; 074D _ 52
        push    eax                                     ; 074E _ 50
        call    boxfill8                                ; 074F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0754 _ 83. C4, 20
        mov     eax, dword [ebp-64H]                    ; 0757 _ 8B. 45, 9C
        lea     ecx, [eax+8H]                           ; 075A _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 075D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0763 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0768 _ 83. EC, 08
        push    44                                      ; 076B _ 6A, 2C
        push    ecx                                     ; 076D _ 51
        push    28                                      ; 076E _ 6A, 1C
        push    dword [ebp-64H]                         ; 0770 _ FF. 75, 9C
        push    edx                                     ; 0773 _ 52
        push    eax                                     ; 0774 _ 50
        call    sheet_refresh                           ; 0775 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 077A _ 83. C4, 20
        jmp     ?_003                                   ; 077D _ E9, FFFFFE16

?_006:  sub     esp, 12                                 ; 0782 _ 83. EC, 0C
        push    mouseinfo                               ; 0785 _ 68, 00000024(d)
        call    fifo8_status                            ; 078A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 078F _ 83. C4, 10
        test    eax, eax                                ; 0792 _ 85. C0
        jz      ?_007                                   ; 0794 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 0796 _ 8B. 0D, 0000028C(d)
        mov     edx, dword [sht_back]                   ; 079C _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 07A2 _ A1, 00000284(d)
        sub     esp, 4                                  ; 07A7 _ 83. EC, 04
        push    ecx                                     ; 07AA _ 51
        push    edx                                     ; 07AB _ 52
        push    eax                                     ; 07AC _ 50
        call    show_mouse_info                         ; 07AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07B2 _ 83. C4, 10
        jmp     ?_012                                   ; 07B5 _ E9, 0000017A

?_007:  sub     esp, 12                                 ; 07BA _ 83. EC, 0C
        push    timerinfo                               ; 07BD _ 68, 00000110(d)
        call    fifo8_status                            ; 07C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07C7 _ 83. C4, 10
        test    eax, eax                                ; 07CA _ 85. C0
        je      ?_012                                   ; 07CC _ 0F 84, 00000162
        call    io_sti                                  ; 07D2 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 07D7 _ 83. EC, 0C
        push    timerinfo                               ; 07DA _ 68, 00000110(d)
        call    fifo8_get                               ; 07DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07E4 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 07E7 _ 89. 45, DC
        cmp     dword [ebp-24H], 10                     ; 07EA _ 83. 7D, DC, 0A
        jnz     ?_008                                   ; 07EE _ 75, 6F
        mov     edx, dword [sht_back]                   ; 07F0 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 07F6 _ A1, 00000284(d)
        sub     esp, 8                                  ; 07FB _ 83. EC, 08
        push    ?_190                                   ; 07FE _ 68, 00000008(d)
        push    7                                       ; 0803 _ 6A, 07
        push    144                                     ; 0805 _ 68, 00000090
        push    dword [ebp-54H]                         ; 080A _ FF. 75, AC
        push    edx                                     ; 080D _ 52
        push    eax                                     ; 080E _ 50
        call    showString                              ; 080F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0814 _ 83. C4, 20
        sub     esp, 8                                  ; 0817 _ 83. EC, 08
        push    100                                     ; 081A _ 6A, 64
        push    dword [ebp-48H]                         ; 081C _ FF. 75, B8
        call    timer_settime                           ; 081F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0824 _ 83. C4, 10
        add     dword [ebp-54H], 8                      ; 0827 _ 83. 45, AC, 08
        cmp     dword [ebp-54H], 40                     ; 082B _ 83. 7D, AC, 28
        jle     ?_012                                   ; 082F _ 0F 8E, 000000FF
        cmp     dword [ebp-50H], 0                      ; 0835 _ 83. 7D, B0, 00
        jne     ?_012                                   ; 0839 _ 0F 85, 000000F5
        call    io_cli                                  ; 083F _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1739]                ; 0844 _ A1, 000002A4(d)
        sub     esp, 12                                 ; 0849 _ 83. EC, 0C
        push    eax                                     ; 084C _ 50
        call    task_sleep                              ; 084D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0852 _ 83. C4, 10
        call    io_sti                                  ; 0855 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 085A _ E9, FFFFFD39

?_008:  cmp     dword [ebp-24H], 2                      ; 085F _ 83. 7D, DC, 02
        jnz     ?_009                                   ; 0863 _ 75, 28
        mov     edx, dword [sht_back]                   ; 0865 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 086B _ A1, 00000284(d)
        sub     esp, 8                                  ; 0870 _ 83. EC, 08
        push    ?_191                                   ; 0873 _ 68, 0000000A(d)
        push    7                                       ; 0878 _ 6A, 07
        push    32                                      ; 087A _ 6A, 20
        push    0                                       ; 087C _ 6A, 00
        push    edx                                     ; 087E _ 52
        push    eax                                     ; 087F _ 50
        call    showString                              ; 0880 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0885 _ 83. C4, 20
        jmp     ?_012                                   ; 0888 _ E9, 000000A7

?_009:  cmp     dword [ebp-24H], 0                      ; 088D _ 83. 7D, DC, 00
        jz      ?_010                                   ; 0891 _ 74, 1E
        sub     esp, 4                                  ; 0893 _ 83. EC, 04
        push    0                                       ; 0896 _ 6A, 00
        push    timerinfo                               ; 0898 _ 68, 00000110(d)
        push    dword [ebp-40H]                         ; 089D _ FF. 75, C0
        call    timer_init                              ; 08A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08A5 _ 83. C4, 10
        mov     dword [ebp-60H], 0                      ; 08A8 _ C7. 45, A0, 00000000
        jmp     ?_011                                   ; 08AF _ EB, 1C

?_010:  sub     esp, 4                                  ; 08B1 _ 83. EC, 04
        push    1                                       ; 08B4 _ 6A, 01
        push    timerinfo                               ; 08B6 _ 68, 00000110(d)
        push    dword [ebp-40H]                         ; 08BB _ FF. 75, C0
        call    timer_init                              ; 08BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08C3 _ 83. C4, 10
        mov     dword [ebp-60H], 7                      ; 08C6 _ C7. 45, A0, 00000007
?_011:  sub     esp, 8                                  ; 08CD _ 83. EC, 08
        push    50                                      ; 08D0 _ 6A, 32
        push    dword [ebp-40H]                         ; 08D2 _ FF. 75, C0
        call    timer_settime                           ; 08D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08DA _ 83. C4, 10
        mov     eax, dword [ebp-64H]                    ; 08DD _ 8B. 45, 9C
        lea     ebx, [eax+7H]                           ; 08E0 _ 8D. 58, 07
        mov     eax, dword [ebp-60H]                    ; 08E3 _ 8B. 45, A0
        movzx   ecx, al                                 ; 08E6 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 08E9 _ A1, 00000280(d)
        mov     edx, dword [eax+4H]                     ; 08EE _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 08F1 _ A1, 00000280(d)
        mov     eax, dword [eax]                        ; 08F6 _ 8B. 00
        sub     esp, 4                                  ; 08F8 _ 83. EC, 04
        push    43                                      ; 08FB _ 6A, 2B
        push    ebx                                     ; 08FD _ 53
        push    28                                      ; 08FE _ 6A, 1C
        push    dword [ebp-64H]                         ; 0900 _ FF. 75, 9C
        push    ecx                                     ; 0903 _ 51
        push    edx                                     ; 0904 _ 52
        push    eax                                     ; 0905 _ 50
        call    boxfill8                                ; 0906 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 090B _ 83. C4, 20
        mov     eax, dword [ebp-64H]                    ; 090E _ 8B. 45, 9C
        lea     ecx, [eax+8H]                           ; 0911 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0914 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 091A _ A1, 00000284(d)
        sub     esp, 8                                  ; 091F _ 83. EC, 08
        push    44                                      ; 0922 _ 6A, 2C
        push    ecx                                     ; 0924 _ 51
        push    28                                      ; 0925 _ 6A, 1C
        push    dword [ebp-64H]                         ; 0927 _ FF. 75, 9C
        push    edx                                     ; 092A _ 52
        push    eax                                     ; 092B _ 50
        call    sheet_refresh                           ; 092C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0931 _ 83. C4, 20
?_012:  jmp     ?_003                                   ; 0934 _ E9, FFFFFC5F
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0939 _ 55
        mov     ebp, esp                                ; 093A _ 89. E5
        sub     esp, 88                                 ; 093C _ 83. EC, 58
        mov     eax, dword [ebp+8H]                     ; 093F _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 0942 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0945 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 094B _ 89. 45, F4
        xor     eax, eax                                ; 094E _ 31. C0
        mov     edx, dword [sht_back]                   ; 0950 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0956 _ A1, 00000284(d)
        sub     esp, 8                                  ; 095B _ 83. EC, 08
        push    ?_192                                   ; 095E _ 68, 00000011(d)
        push    7                                       ; 0963 _ 6A, 07
        push    160                                     ; 0965 _ 68, 000000A0
        push    0                                       ; 096A _ 6A, 00
        push    edx                                     ; 096C _ 52
        push    eax                                     ; 096D _ 50
        call    showString                              ; 096E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0973 _ 83. C4, 20
        mov     dword [ebp-3CH], 0                      ; 0976 _ C7. 45, C4, 00000000
        mov     dword [ebp-38H], 0                      ; 097D _ C7. 45, C8, 00000000
        push    0                                       ; 0984 _ 6A, 00
        lea     eax, [ebp-14H]                          ; 0986 _ 8D. 45, EC
        push    eax                                     ; 0989 _ 50
        push    8                                       ; 098A _ 6A, 08
        lea     eax, [ebp-30H]                          ; 098C _ 8D. 45, D0
        push    eax                                     ; 098F _ 50
        call    fifo8_init                              ; 0990 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0995 _ 83. C4, 10
        call    timer_alloc                             ; 0998 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 099D _ 89. 45, C4
        sub     esp, 4                                  ; 09A0 _ 83. EC, 04
        push    123                                     ; 09A3 _ 6A, 7B
        lea     eax, [ebp-30H]                          ; 09A5 _ 8D. 45, D0
        push    eax                                     ; 09A8 _ 50
        push    dword [ebp-3CH]                         ; 09A9 _ FF. 75, C4
        call    timer_init                              ; 09AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09B1 _ 83. C4, 10
        sub     esp, 8                                  ; 09B4 _ 83. EC, 08
        push    100                                     ; 09B7 _ 6A, 64
        push    dword [ebp-3CH]                         ; 09B9 _ FF. 75, C4
        call    timer_settime                           ; 09BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C1 _ 83. C4, 10
        mov     dword [ebp-44H], 0                      ; 09C4 _ C7. 45, BC, 00000000
        mov     dword [ebp-40H], 0                      ; 09CB _ C7. 45, C0, 00000000
?_013:  add     dword [ebp-44H], 1                      ; 09D2 _ 83. 45, BC, 01
        call    io_cli                                  ; 09D6 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 09DB _ 83. EC, 0C
        lea     eax, [ebp-30H]                          ; 09DE _ 8D. 45, D0
        push    eax                                     ; 09E1 _ 50
        call    fifo8_status                            ; 09E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09E7 _ 83. C4, 10
        test    eax, eax                                ; 09EA _ 85. C0
        jnz     ?_014                                   ; 09EC _ 75, 0A
        call    io_sti                                  ; 09EE _ E8, FFFFFFFC(rel)
        jmp     ?_015                                   ; 09F3 _ E9, 000000C7

?_014:  sub     esp, 12                                 ; 09F8 _ 83. EC, 0C
        lea     eax, [ebp-30H]                          ; 09FB _ 8D. 45, D0
        push    eax                                     ; 09FE _ 50
        call    fifo8_get                               ; 09FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A04 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 0A07 _ 89. 45, C8
        call    io_sti                                  ; 0A0A _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-38H], 123                    ; 0A0F _ 83. 7D, C8, 7B
        jne     ?_015                                   ; 0A13 _ 0F 85, 000000A6
        mov     edx, dword [sht_back]                   ; 0A19 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0A1F _ A1, 00000284(d)
        sub     esp, 8                                  ; 0A24 _ 83. EC, 08
        push    ?_193                                   ; 0A27 _ 68, 0000001E(d)
        push    7                                       ; 0A2C _ 6A, 07
        push    192                                     ; 0A2E _ 68, 000000C0
        push    dword [ebp-40H]                         ; 0A33 _ FF. 75, C0
        push    edx                                     ; 0A36 _ 52
        push    eax                                     ; 0A37 _ 50
        call    showString                              ; 0A38 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A3D _ 83. C4, 20
        sub     esp, 8                                  ; 0A40 _ 83. EC, 08
        push    100                                     ; 0A43 _ 6A, 64
        push    dword [ebp-3CH]                         ; 0A45 _ FF. 75, C4
        call    timer_settime                           ; 0A48 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A4D _ 83. C4, 10
        add     dword [ebp-40H], 8                      ; 0A50 _ 83. 45, C0, 08
        mov     eax, dword [ebp-4CH]                    ; 0A54 _ 8B. 45, B4
        mov     eax, dword [eax]                        ; 0A57 _ 8B. 00
        sub     esp, 4                                  ; 0A59 _ 83. EC, 04
        push    44                                      ; 0A5C _ 6A, 2C
        push    104                                     ; 0A5E _ 6A, 68
        push    28                                      ; 0A60 _ 6A, 1C
        push    24                                      ; 0A62 _ 6A, 18
        push    8                                       ; 0A64 _ 6A, 08
        push    144                                     ; 0A66 _ 68, 00000090
        push    eax                                     ; 0A6B _ 50
        call    boxfill8                                ; 0A6C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A71 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0A74 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0A79 _ 83. EC, 08
        push    44                                      ; 0A7C _ 6A, 2C
        push    104                                     ; 0A7E _ 6A, 68
        push    28                                      ; 0A80 _ 6A, 1C
        push    24                                      ; 0A82 _ 6A, 18
        push    dword [ebp-4CH]                         ; 0A84 _ FF. 75, B4
        push    eax                                     ; 0A87 _ 50
        call    sheet_refresh                           ; 0A88 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A8D _ 83. C4, 20
        mov     eax, dword [ebp-44H]                    ; 0A90 _ 8B. 45, BC
        sub     esp, 12                                 ; 0A93 _ 83. EC, 0C
        push    eax                                     ; 0A96 _ 50
        call    intToHexStr                             ; 0A97 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A9C _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0A9F _ 89. 45, CC
        mov     eax, dword [shtctl]                     ; 0AA2 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0AA7 _ 83. EC, 08
        push    dword [ebp-34H]                         ; 0AAA _ FF. 75, CC
        push    7                                       ; 0AAD _ 6A, 07
        push    28                                      ; 0AAF _ 6A, 1C
        push    24                                      ; 0AB1 _ 6A, 18
        push    dword [ebp-4CH]                         ; 0AB3 _ FF. 75, B4
        push    eax                                     ; 0AB6 _ 50
        call    showString                              ; 0AB7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ABC _ 83. C4, 20
?_015:  jmp     ?_013                                   ; 0ABF _ E9, FFFFFF0E
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0AC4 _ 55
        mov     ebp, esp                                ; 0AC5 _ 89. E5
        push    ebx                                     ; 0AC7 _ 53
        sub     esp, 4                                  ; 0AC8 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0ACB _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0ACE _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0AD1 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0AD4 _ 83. E8, 01
        sub     esp, 4                                  ; 0AD7 _ 83. EC, 04
        push    edx                                     ; 0ADA _ 52
        push    eax                                     ; 0ADB _ 50
        push    0                                       ; 0ADC _ 6A, 00
        push    0                                       ; 0ADE _ 6A, 00
        push    14                                      ; 0AE0 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0AE2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0AE5 _ FF. 75, 08
        call    boxfill8                                ; 0AE8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AED _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AF0 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0AF3 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0AF6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AF9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AFC _ 8B. 45, 10
        sub     eax, 28                                 ; 0AFF _ 83. E8, 1C
        sub     esp, 4                                  ; 0B02 _ 83. EC, 04
        push    ecx                                     ; 0B05 _ 51
        push    edx                                     ; 0B06 _ 52
        push    eax                                     ; 0B07 _ 50
        push    0                                       ; 0B08 _ 6A, 00
        push    8                                       ; 0B0A _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B0C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B0F _ FF. 75, 08
        call    boxfill8                                ; 0B12 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B17 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B1A _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0B1D _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0B20 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B23 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B26 _ 8B. 45, 10
        sub     eax, 27                                 ; 0B29 _ 83. E8, 1B
        sub     esp, 4                                  ; 0B2C _ 83. EC, 04
        push    ecx                                     ; 0B2F _ 51
        push    edx                                     ; 0B30 _ 52
        push    eax                                     ; 0B31 _ 50
        push    0                                       ; 0B32 _ 6A, 00
        push    7                                       ; 0B34 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B36 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B39 _ FF. 75, 08
        call    boxfill8                                ; 0B3C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B41 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B44 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B47 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B4A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B4D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B50 _ 8B. 45, 10
        sub     eax, 26                                 ; 0B53 _ 83. E8, 1A
        sub     esp, 4                                  ; 0B56 _ 83. EC, 04
        push    ecx                                     ; 0B59 _ 51
        push    edx                                     ; 0B5A _ 52
        push    eax                                     ; 0B5B _ 50
        push    0                                       ; 0B5C _ 6A, 00
        push    8                                       ; 0B5E _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B60 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B63 _ FF. 75, 08
        call    boxfill8                                ; 0B66 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B6B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B6E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B71 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B74 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B77 _ 83. E8, 18
        sub     esp, 4                                  ; 0B7A _ 83. EC, 04
        push    edx                                     ; 0B7D _ 52
        push    59                                      ; 0B7E _ 6A, 3B
        push    eax                                     ; 0B80 _ 50
        push    3                                       ; 0B81 _ 6A, 03
        push    7                                       ; 0B83 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B85 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B88 _ FF. 75, 08
        call    boxfill8                                ; 0B8B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B90 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B93 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B96 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B99 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B9C _ 83. E8, 18
        sub     esp, 4                                  ; 0B9F _ 83. EC, 04
        push    edx                                     ; 0BA2 _ 52
        push    2                                       ; 0BA3 _ 6A, 02
        push    eax                                     ; 0BA5 _ 50
        push    2                                       ; 0BA6 _ 6A, 02
        push    7                                       ; 0BA8 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0BAA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BAD _ FF. 75, 08
        call    boxfill8                                ; 0BB0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BB5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BB8 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BBB _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BBE _ 8B. 45, 10
        sub     eax, 4                                  ; 0BC1 _ 83. E8, 04
        sub     esp, 4                                  ; 0BC4 _ 83. EC, 04
        push    edx                                     ; 0BC7 _ 52
        push    59                                      ; 0BC8 _ 6A, 3B
        push    eax                                     ; 0BCA _ 50
        push    3                                       ; 0BCB _ 6A, 03
        push    15                                      ; 0BCD _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BCF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BD2 _ FF. 75, 08
        call    boxfill8                                ; 0BD5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BDA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BDD _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0BE0 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0BE3 _ 8B. 45, 10
        sub     eax, 23                                 ; 0BE6 _ 83. E8, 17
        sub     esp, 4                                  ; 0BE9 _ 83. EC, 04
        push    edx                                     ; 0BEC _ 52
        push    59                                      ; 0BED _ 6A, 3B
        push    eax                                     ; 0BEF _ 50
        push    59                                      ; 0BF0 _ 6A, 3B
        push    15                                      ; 0BF2 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BF4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BF7 _ FF. 75, 08
        call    boxfill8                                ; 0BFA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BFF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C02 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C05 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C08 _ 8B. 45, 10
        sub     eax, 3                                  ; 0C0B _ 83. E8, 03
        sub     esp, 4                                  ; 0C0E _ 83. EC, 04
        push    edx                                     ; 0C11 _ 52
        push    59                                      ; 0C12 _ 6A, 3B
        push    eax                                     ; 0C14 _ 50
        push    2                                       ; 0C15 _ 6A, 02
        push    0                                       ; 0C17 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0C19 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C1C _ FF. 75, 08
        call    boxfill8                                ; 0C1F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C24 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C27 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C2A _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C2D _ 8B. 45, 10
        sub     eax, 24                                 ; 0C30 _ 83. E8, 18
        sub     esp, 4                                  ; 0C33 _ 83. EC, 04
        push    edx                                     ; 0C36 _ 52
        push    60                                      ; 0C37 _ 6A, 3C
        push    eax                                     ; 0C39 _ 50
        push    60                                      ; 0C3A _ 6A, 3C
        push    0                                       ; 0C3C _ 6A, 00
        push    dword [ebp+0CH]                         ; 0C3E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C41 _ FF. 75, 08
        call    boxfill8                                ; 0C44 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C49 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C4C _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0C4F _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0C52 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C55 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C58 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C5B _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0C5E _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C61 _ 83. E8, 2F
        sub     esp, 4                                  ; 0C64 _ 83. EC, 04
        push    ebx                                     ; 0C67 _ 53
        push    ecx                                     ; 0C68 _ 51
        push    edx                                     ; 0C69 _ 52
        push    eax                                     ; 0C6A _ 50
        push    15                                      ; 0C6B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C6D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C70 _ FF. 75, 08
        call    boxfill8                                ; 0C73 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C78 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C7B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0C7E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0C81 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0C84 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0C87 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0C8A _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0C8D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C90 _ 83. E8, 2F
        sub     esp, 4                                  ; 0C93 _ 83. EC, 04
        push    ebx                                     ; 0C96 _ 53
        push    ecx                                     ; 0C97 _ 51
        push    edx                                     ; 0C98 _ 52
        push    eax                                     ; 0C99 _ 50
        push    15                                      ; 0C9A _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C9C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C9F _ FF. 75, 08
        call    boxfill8                                ; 0CA2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CA7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CAA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0CAD _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0CB0 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0CB3 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0CB6 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0CB9 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0CBC _ 8B. 45, 0C
        sub     eax, 47                                 ; 0CBF _ 83. E8, 2F
        sub     esp, 4                                  ; 0CC2 _ 83. EC, 04
        push    ebx                                     ; 0CC5 _ 53
        push    ecx                                     ; 0CC6 _ 51
        push    edx                                     ; 0CC7 _ 52
        push    eax                                     ; 0CC8 _ 50
        push    7                                       ; 0CC9 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CCB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CCE _ FF. 75, 08
        call    boxfill8                                ; 0CD1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CD6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CD9 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0CDC _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0CDF _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0CE2 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0CE5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CE8 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0CEB _ 8B. 45, 0C
        sub     eax, 3                                  ; 0CEE _ 83. E8, 03
        sub     esp, 4                                  ; 0CF1 _ 83. EC, 04
        push    ebx                                     ; 0CF4 _ 53
        push    ecx                                     ; 0CF5 _ 51
        push    edx                                     ; 0CF6 _ 52
        push    eax                                     ; 0CF7 _ 50
        push    7                                       ; 0CF8 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CFA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CFD _ FF. 75, 08
        call    boxfill8                                ; 0D00 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D05 _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 0D08 _ 8B. 5D, FC
        leave                                           ; 0D0B _ C9
        ret                                             ; 0D0C _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0D0D _ 55
        mov     ebp, esp                                ; 0D0E _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0D10 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0D13 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D16 _ A1, 00000134(d)
        add     eax, edx                                ; 0D1B _ 01. D0
        mov     dword [mx], eax                         ; 0D1D _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 0D22 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0D25 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D28 _ A1, 00000138(d)
        add     eax, edx                                ; 0D2D _ 01. D0
        mov     dword [my], eax                         ; 0D2F _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 0D34 _ A1, 00000134(d)
        test    eax, eax                                ; 0D39 _ 85. C0
        jns     ?_016                                   ; 0D3B _ 79, 0A
        mov     dword [mx], 0                           ; 0D3D _ C7. 05, 00000134(d), 00000000
?_016:  mov     eax, dword [my]                         ; 0D47 _ A1, 00000138(d)
        test    eax, eax                                ; 0D4C _ 85. C0
        jns     ?_017                                   ; 0D4E _ 79, 0A
        mov     dword [my], 0                           ; 0D50 _ C7. 05, 00000138(d), 00000000
?_017:  mov     eax, dword [xsize]                      ; 0D5A _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 0D5F _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 0D62 _ A1, 00000134(d)
        cmp     edx, eax                                ; 0D67 _ 39. C2
        jge     ?_018                                   ; 0D69 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 0D6B _ A1, 0000013C(d)
        sub     eax, 1                                  ; 0D70 _ 83. E8, 01
        mov     dword [mx], eax                         ; 0D73 _ A3, 00000134(d)
?_018:  mov     eax, dword [ysize]                      ; 0D78 _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 0D7D _ 8D. 50, FF
        mov     eax, dword [my]                         ; 0D80 _ A1, 00000138(d)
        cmp     edx, eax                                ; 0D85 _ 39. C2
        jge     ?_019                                   ; 0D87 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 0D89 _ A1, 00000140(d)
        sub     eax, 1                                  ; 0D8E _ 83. E8, 01
        mov     dword [my], eax                         ; 0D91 _ A3, 00000138(d)
?_019:  pop     ebp                                     ; 0D96 _ 5D
        ret                                             ; 0D97 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D98 _ 55
        mov     ebp, esp                                ; 0D99 _ 89. E5
        sub     esp, 24                                 ; 0D9B _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D9E _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 0DA3 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0DA6 _ C6. 45, F3, 00
        call    io_sti                                  ; 0DAA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0DAF _ 83. EC, 0C
        push    mouseinfo                               ; 0DB2 _ 68, 00000024(d)
        call    fifo8_get                               ; 0DB7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DBC _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0DBF _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0DC2 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0DC6 _ 83. EC, 08
        push    eax                                     ; 0DC9 _ 50
        push    mdec                                    ; 0DCA _ 68, 00000100(d)
        call    mouse_decode                            ; 0DCF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DD4 _ 83. C4, 10
        test    eax, eax                                ; 0DD7 _ 85. C0
        jz      ?_020                                   ; 0DD9 _ 74, 60
        sub     esp, 4                                  ; 0DDB _ 83. EC, 04
        push    mdec                                    ; 0DDE _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 0DE3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DE6 _ FF. 75, 08
        call    computeMousePosition                    ; 0DE9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DEE _ 83. C4, 10
        mov     edx, dword [my]                         ; 0DF1 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 0DF7 _ A1, 00000134(d)
        push    edx                                     ; 0DFC _ 52
        push    eax                                     ; 0DFD _ 50
        push    dword [ebp+10H]                         ; 0DFE _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0E01 _ FF. 75, 08
        call    sheet_slide                             ; 0E04 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E09 _ 83. C4, 10
        mov     eax, dword [?_203]                      ; 0E0C _ A1, 0000010C(d)
        and     eax, 01H                                ; 0E11 _ 83. E0, 01
        test    eax, eax                                ; 0E14 _ 85. C0
        jz      ?_020                                   ; 0E16 _ 74, 23
        mov     eax, dword [my]                         ; 0E18 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 0E1D _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0E20 _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 0E25 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0E28 _ A1, 00000280(d)
        push    ecx                                     ; 0E2D _ 51
        push    edx                                     ; 0E2E _ 52
        push    eax                                     ; 0E2F _ 50
        push    dword [ebp+8H]                          ; 0E30 _ FF. 75, 08
        call    sheet_slide                             ; 0E33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E38 _ 83. C4, 10
?_020:  leave                                           ; 0E3B _ C9
        ret                                             ; 0E3C _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0E3D _ 55
        mov     ebp, esp                                ; 0E3E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E40 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0E43 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0E49 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0E4C _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0E52 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0E55 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0E5B _ 5D
        ret                                             ; 0E5C _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0E5D _ 55
        mov     ebp, esp                                ; 0E5E _ 89. E5
        push    ebx                                     ; 0E60 _ 53
        sub     esp, 36                                 ; 0E61 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0E64 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0E67 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0E6A _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0E6D _ 89. 45, F4
        jmp     ?_022                                   ; 0E70 _ EB, 3E

?_021:  mov     eax, dword [ebp+1CH]                    ; 0E72 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0E75 _ 0F B6. 00
        movzx   eax, al                                 ; 0E78 _ 0F B6. C0
        shl     eax, 4                                  ; 0E7B _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0E7E _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0E84 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0E88 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0E8B _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0E8E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E91 _ 8B. 00
        sub     esp, 8                                  ; 0E93 _ 83. EC, 08
        push    ebx                                     ; 0E96 _ 53
        push    ecx                                     ; 0E97 _ 51
        push    dword [ebp+14H]                         ; 0E98 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0E9B _ FF. 75, 10
        push    edx                                     ; 0E9E _ 52
        push    eax                                     ; 0E9F _ 50
        call    showFont8                               ; 0EA0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EA5 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0EA8 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 0EAC _ 83. 45, 1C, 01
?_022:  mov     eax, dword [ebp+1CH]                    ; 0EB0 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0EB3 _ 0F B6. 00
        test    al, al                                  ; 0EB6 _ 84. C0
        jnz     ?_021                                   ; 0EB8 _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 0EBA _ 8B. 45, 14
        add     eax, 16                                 ; 0EBD _ 83. C0, 10
        sub     esp, 8                                  ; 0EC0 _ 83. EC, 08
        push    eax                                     ; 0EC3 _ 50
        push    dword [ebp+10H]                         ; 0EC4 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0EC7 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0ECA _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0ECD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0ED0 _ FF. 75, 08
        call    sheet_refresh                           ; 0ED3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ED8 _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 0EDB _ 8B. 5D, FC
        leave                                           ; 0EDE _ C9
        ret                                             ; 0EDF _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0EE0 _ 55
        mov     ebp, esp                                ; 0EE1 _ 89. E5
        sub     esp, 8                                  ; 0EE3 _ 83. EC, 08
        sub     esp, 4                                  ; 0EE6 _ 83. EC, 04
        push    table_rgb.1806                          ; 0EE9 _ 68, 000000A0(d)
        push    15                                      ; 0EEE _ 6A, 0F
        push    0                                       ; 0EF0 _ 6A, 00
        call    set_palette                             ; 0EF2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EF7 _ 83. C4, 10
        nop                                             ; 0EFA _ 90
        leave                                           ; 0EFB _ C9
        ret                                             ; 0EFC _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0EFD _ 55
        mov     ebp, esp                                ; 0EFE _ 89. E5
        sub     esp, 24                                 ; 0F00 _ 83. EC, 18
        call    io_load_eflags                          ; 0F03 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0F08 _ 89. 45, F4
        call    io_cli                                  ; 0F0B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F10 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0F13 _ FF. 75, 08
        push    968                                     ; 0F16 _ 68, 000003C8
        call    io_out8                                 ; 0F1B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F20 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0F23 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0F26 _ 89. 45, F0
        jmp     ?_024                                   ; 0F29 _ EB, 65

?_023:  mov     eax, dword [ebp+10H]                    ; 0F2B _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0F2E _ 0F B6. 00
        shr     al, 2                                   ; 0F31 _ C0. E8, 02
        movzx   eax, al                                 ; 0F34 _ 0F B6. C0
        sub     esp, 8                                  ; 0F37 _ 83. EC, 08
        push    eax                                     ; 0F3A _ 50
        push    969                                     ; 0F3B _ 68, 000003C9
        call    io_out8                                 ; 0F40 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F45 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F48 _ 8B. 45, 10
        add     eax, 1                                  ; 0F4B _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0F4E _ 0F B6. 00
        shr     al, 2                                   ; 0F51 _ C0. E8, 02
        movzx   eax, al                                 ; 0F54 _ 0F B6. C0
        sub     esp, 8                                  ; 0F57 _ 83. EC, 08
        push    eax                                     ; 0F5A _ 50
        push    969                                     ; 0F5B _ 68, 000003C9
        call    io_out8                                 ; 0F60 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F65 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F68 _ 8B. 45, 10
        add     eax, 2                                  ; 0F6B _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0F6E _ 0F B6. 00
        shr     al, 2                                   ; 0F71 _ C0. E8, 02
        movzx   eax, al                                 ; 0F74 _ 0F B6. C0
        sub     esp, 8                                  ; 0F77 _ 83. EC, 08
        push    eax                                     ; 0F7A _ 50
        push    969                                     ; 0F7B _ 68, 000003C9
        call    io_out8                                 ; 0F80 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F85 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0F88 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0F8C _ 83. 45, F0, 01
?_024:  mov     eax, dword [ebp-10H]                    ; 0F90 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0F93 _ 3B. 45, 0C
        jle     ?_023                                   ; 0F96 _ 7E, 93
        sub     esp, 12                                 ; 0F98 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0F9B _ FF. 75, F4
        call    io_store_eflags                         ; 0F9E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FA3 _ 83. C4, 10
        nop                                             ; 0FA6 _ 90
        leave                                           ; 0FA7 _ C9
        ret                                             ; 0FA8 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0FA9 _ 55
        mov     ebp, esp                                ; 0FAA _ 89. E5
        sub     esp, 20                                 ; 0FAC _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0FAF _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0FB2 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0FB5 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0FB8 _ 89. 45, FC
        jmp     ?_028                                   ; 0FBB _ EB, 33

?_025:  mov     eax, dword [ebp+14H]                    ; 0FBD _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0FC0 _ 89. 45, F8
        jmp     ?_027                                   ; 0FC3 _ EB, 1F

?_026:  mov     eax, dword [ebp-4H]                     ; 0FC5 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0FC8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FCC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0FCE _ 8B. 45, F8
        add     eax, edx                                ; 0FD1 _ 01. D0
        mov     edx, eax                                ; 0FD3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FD5 _ 8B. 45, 08
        add     edx, eax                                ; 0FD8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FDA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FDE _ 88. 02
        add     dword [ebp-8H], 1                       ; 0FE0 _ 83. 45, F8, 01
?_027:  mov     eax, dword [ebp-8H]                     ; 0FE4 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0FE7 _ 3B. 45, 1C
        jle     ?_026                                   ; 0FEA _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0FEC _ 83. 45, FC, 01
?_028:  mov     eax, dword [ebp-4H]                     ; 0FF0 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0FF3 _ 3B. 45, 20
        jle     ?_025                                   ; 0FF6 _ 7E, C5
        leave                                           ; 0FF8 _ C9
        ret                                             ; 0FF9 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0FFA _ 55
        mov     ebp, esp                                ; 0FFB _ 89. E5
        sub     esp, 20                                 ; 0FFD _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 1000 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 1003 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1006 _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 100D _ E9, 0000016C

?_029:  mov     edx, dword [ebp-4H]                     ; 1012 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 1015 _ 8B. 45, 1C
        add     eax, edx                                ; 1018 _ 01. D0
        movzx   eax, byte [eax]                         ; 101A _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 101D _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 1020 _ 80. 7D, FB, 00
        jns     ?_030                                   ; 1024 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 1026 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1029 _ 8B. 45, FC
        add     eax, edx                                ; 102C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 102E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1032 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1034 _ 8B. 45, 10
        add     eax, edx                                ; 1037 _ 01. D0
        mov     edx, eax                                ; 1039 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 103B _ 8B. 45, 08
        add     edx, eax                                ; 103E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1040 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1044 _ 88. 02
?_030:  movsx   eax, byte [ebp-5H]                      ; 1046 _ 0F BE. 45, FB
        and     eax, 40H                                ; 104A _ 83. E0, 40
        test    eax, eax                                ; 104D _ 85. C0
        jz      ?_031                                   ; 104F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 1051 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1054 _ 8B. 45, FC
        add     eax, edx                                ; 1057 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1059 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 105D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 105F _ 8B. 45, 10
        add     eax, edx                                ; 1062 _ 01. D0
        lea     edx, [eax+1H]                           ; 1064 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1067 _ 8B. 45, 08
        add     edx, eax                                ; 106A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 106C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1070 _ 88. 02
?_031:  movsx   eax, byte [ebp-5H]                      ; 1072 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1076 _ 83. E0, 20
        test    eax, eax                                ; 1079 _ 85. C0
        jz      ?_032                                   ; 107B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 107D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1080 _ 8B. 45, FC
        add     eax, edx                                ; 1083 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1085 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1089 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 108B _ 8B. 45, 10
        add     eax, edx                                ; 108E _ 01. D0
        lea     edx, [eax+2H]                           ; 1090 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1093 _ 8B. 45, 08
        add     edx, eax                                ; 1096 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1098 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 109C _ 88. 02
?_032:  movsx   eax, byte [ebp-5H]                      ; 109E _ 0F BE. 45, FB
        and     eax, 10H                                ; 10A2 _ 83. E0, 10
        test    eax, eax                                ; 10A5 _ 85. C0
        jz      ?_033                                   ; 10A7 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 10A9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10AC _ 8B. 45, FC
        add     eax, edx                                ; 10AF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10B1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10B5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10B7 _ 8B. 45, 10
        add     eax, edx                                ; 10BA _ 01. D0
        lea     edx, [eax+3H]                           ; 10BC _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 10BF _ 8B. 45, 08
        add     edx, eax                                ; 10C2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10C4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10C8 _ 88. 02
?_033:  movsx   eax, byte [ebp-5H]                      ; 10CA _ 0F BE. 45, FB
        and     eax, 08H                                ; 10CE _ 83. E0, 08
        test    eax, eax                                ; 10D1 _ 85. C0
        jz      ?_034                                   ; 10D3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 10D5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10D8 _ 8B. 45, FC
        add     eax, edx                                ; 10DB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10DD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10E3 _ 8B. 45, 10
        add     eax, edx                                ; 10E6 _ 01. D0
        lea     edx, [eax+4H]                           ; 10E8 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 10EB _ 8B. 45, 08
        add     edx, eax                                ; 10EE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10F0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10F4 _ 88. 02
?_034:  movsx   eax, byte [ebp-5H]                      ; 10F6 _ 0F BE. 45, FB
        and     eax, 04H                                ; 10FA _ 83. E0, 04
        test    eax, eax                                ; 10FD _ 85. C0
        jz      ?_035                                   ; 10FF _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 1101 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1104 _ 8B. 45, FC
        add     eax, edx                                ; 1107 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1109 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 110D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 110F _ 8B. 45, 10
        add     eax, edx                                ; 1112 _ 01. D0
        lea     edx, [eax+5H]                           ; 1114 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1117 _ 8B. 45, 08
        add     edx, eax                                ; 111A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 111C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1120 _ 88. 02
?_035:  movsx   eax, byte [ebp-5H]                      ; 1122 _ 0F BE. 45, FB
        and     eax, 02H                                ; 1126 _ 83. E0, 02
        test    eax, eax                                ; 1129 _ 85. C0
        jz      ?_036                                   ; 112B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 112D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1130 _ 8B. 45, FC
        add     eax, edx                                ; 1133 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1135 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1139 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 113B _ 8B. 45, 10
        add     eax, edx                                ; 113E _ 01. D0
        lea     edx, [eax+6H]                           ; 1140 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1143 _ 8B. 45, 08
        add     edx, eax                                ; 1146 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1148 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 114C _ 88. 02
?_036:  movsx   eax, byte [ebp-5H]                      ; 114E _ 0F BE. 45, FB
        and     eax, 01H                                ; 1152 _ 83. E0, 01
        test    eax, eax                                ; 1155 _ 85. C0
        jz      ?_037                                   ; 1157 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 1159 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 115C _ 8B. 45, FC
        add     eax, edx                                ; 115F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1161 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1165 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1167 _ 8B. 45, 10
        add     eax, edx                                ; 116A _ 01. D0
        lea     edx, [eax+7H]                           ; 116C _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 116F _ 8B. 45, 08
        add     edx, eax                                ; 1172 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1174 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1178 _ 88. 02
?_037:  add     dword [ebp-4H], 1                       ; 117A _ 83. 45, FC, 01
?_038:  cmp     dword [ebp-4H], 15                      ; 117E _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 1182 _ 0F 8E, FFFFFE8A
        leave                                           ; 1188 _ C9
        ret                                             ; 1189 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 118A _ 55
        mov     ebp, esp                                ; 118B _ 89. E5
        sub     esp, 20                                 ; 118D _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1190 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1193 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1196 _ C7. 45, FC, 00000000
        jmp     ?_045                                   ; 119D _ E9, 000000B1

?_039:  mov     dword [ebp-8H], 0                       ; 11A2 _ C7. 45, F8, 00000000
        jmp     ?_044                                   ; 11A9 _ E9, 00000097

?_040:  mov     eax, dword [ebp-4H]                     ; 11AE _ 8B. 45, FC
        shl     eax, 4                                  ; 11B1 _ C1. E0, 04
        mov     edx, eax                                ; 11B4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11B6 _ 8B. 45, F8
        add     eax, edx                                ; 11B9 _ 01. D0
        add     eax, cursor.1853                        ; 11BB _ 05, 00000100(d)
        movzx   eax, byte [eax]                         ; 11C0 _ 0F B6. 00
        cmp     al, 42                                  ; 11C3 _ 3C, 2A
        jnz     ?_041                                   ; 11C5 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 11C7 _ 8B. 45, FC
        shl     eax, 4                                  ; 11CA _ C1. E0, 04
        mov     edx, eax                                ; 11CD _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11CF _ 8B. 45, F8
        add     eax, edx                                ; 11D2 _ 01. D0
        mov     edx, eax                                ; 11D4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11D6 _ 8B. 45, 08
        add     eax, edx                                ; 11D9 _ 01. D0
        mov     byte [eax], 0                           ; 11DB _ C6. 00, 00
?_041:  mov     eax, dword [ebp-4H]                     ; 11DE _ 8B. 45, FC
        shl     eax, 4                                  ; 11E1 _ C1. E0, 04
        mov     edx, eax                                ; 11E4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11E6 _ 8B. 45, F8
        add     eax, edx                                ; 11E9 _ 01. D0
        add     eax, cursor.1853                        ; 11EB _ 05, 00000100(d)
        movzx   eax, byte [eax]                         ; 11F0 _ 0F B6. 00
        cmp     al, 79                                  ; 11F3 _ 3C, 4F
        jnz     ?_042                                   ; 11F5 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 11F7 _ 8B. 45, FC
        shl     eax, 4                                  ; 11FA _ C1. E0, 04
        mov     edx, eax                                ; 11FD _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11FF _ 8B. 45, F8
        add     eax, edx                                ; 1202 _ 01. D0
        mov     edx, eax                                ; 1204 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1206 _ 8B. 45, 08
        add     eax, edx                                ; 1209 _ 01. D0
        mov     byte [eax], 7                           ; 120B _ C6. 00, 07
?_042:  mov     eax, dword [ebp-4H]                     ; 120E _ 8B. 45, FC
        shl     eax, 4                                  ; 1211 _ C1. E0, 04
        mov     edx, eax                                ; 1214 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1216 _ 8B. 45, F8
        add     eax, edx                                ; 1219 _ 01. D0
        add     eax, cursor.1853                        ; 121B _ 05, 00000100(d)
        movzx   eax, byte [eax]                         ; 1220 _ 0F B6. 00
        cmp     al, 46                                  ; 1223 _ 3C, 2E
        jnz     ?_043                                   ; 1225 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 1227 _ 8B. 45, FC
        shl     eax, 4                                  ; 122A _ C1. E0, 04
        mov     edx, eax                                ; 122D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 122F _ 8B. 45, F8
        add     eax, edx                                ; 1232 _ 01. D0
        mov     edx, eax                                ; 1234 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1236 _ 8B. 45, 08
        add     edx, eax                                ; 1239 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 123B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 123F _ 88. 02
?_043:  add     dword [ebp-8H], 1                       ; 1241 _ 83. 45, F8, 01
?_044:  cmp     dword [ebp-8H], 15                      ; 1245 _ 83. 7D, F8, 0F
        jle     ?_040                                   ; 1249 _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 124F _ 83. 45, FC, 01
?_045:  cmp     dword [ebp-4H], 15                      ; 1253 _ 83. 7D, FC, 0F
        jle     ?_039                                   ; 1257 _ 0F 8E, FFFFFF45
        leave                                           ; 125D _ C9
        ret                                             ; 125E _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 125F _ 55
        mov     ebp, esp                                ; 1260 _ 89. E5
        sub     esp, 16                                 ; 1262 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1265 _ C7. 45, FC, 00000000
        jmp     ?_049                                   ; 126C _ EB, 50

?_046:  mov     dword [ebp-8H], 0                       ; 126E _ C7. 45, F8, 00000000
        jmp     ?_048                                   ; 1275 _ EB, 3B

?_047:  mov     edx, dword [ebp+1CH]                    ; 1277 _ 8B. 55, 1C
        mov     eax, dword [ebp-4H]                     ; 127A _ 8B. 45, FC
        add     eax, edx                                ; 127D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 127F _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 1283 _ 8B. 4D, 18
        mov     edx, dword [ebp-8H]                     ; 1286 _ 8B. 55, F8
        add     edx, ecx                                ; 1289 _ 01. CA
        add     eax, edx                                ; 128B _ 01. D0
        mov     edx, eax                                ; 128D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 128F _ 8B. 45, 08
        add     edx, eax                                ; 1292 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 1294 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 1297 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 129B _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 129D _ 8B. 45, F8
        add     eax, ecx                                ; 12A0 _ 01. C8
        mov     ecx, eax                                ; 12A2 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12A4 _ 8B. 45, 20
        add     eax, ecx                                ; 12A7 _ 01. C8
        movzx   eax, byte [eax]                         ; 12A9 _ 0F B6. 00
        mov     byte [edx], al                          ; 12AC _ 88. 02
        add     dword [ebp-8H], 1                       ; 12AE _ 83. 45, F8, 01
?_048:  mov     eax, dword [ebp-8H]                     ; 12B2 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 12B5 _ 3B. 45, 10
        jl      ?_047                                   ; 12B8 _ 7C, BD
        add     dword [ebp-4H], 1                       ; 12BA _ 83. 45, FC, 01
?_049:  mov     eax, dword [ebp-4H]                     ; 12BE _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 12C1 _ 3B. 45, 14
        jl      ?_046                                   ; 12C4 _ 7C, A8
        leave                                           ; 12C6 _ C9
        ret                                             ; 12C7 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 12C8 _ 55
        mov     ebp, esp                                ; 12C9 _ 89. E5
        sub     esp, 24                                 ; 12CB _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 12CE _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 12D3 _ 89. 45, EC
        movzx   eax, word [?_200]                       ; 12D6 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 12DD _ 98
        mov     dword [ebp-10H], eax                    ; 12DE _ 89. 45, F0
        movzx   eax, word [?_201]                       ; 12E1 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 12E8 _ 98
        mov     dword [ebp-0CH], eax                    ; 12E9 _ 89. 45, F4
        sub     esp, 8                                  ; 12EC _ 83. EC, 08
        push    32                                      ; 12EF _ 6A, 20
        push    32                                      ; 12F1 _ 6A, 20
        call    io_out8                                 ; 12F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12F8 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 12FB _ C6. 45, EB, 00
        sub     esp, 12                                 ; 12FF _ 83. EC, 0C
        push    96                                      ; 1302 _ 6A, 60
        call    io_in8                                  ; 1304 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1309 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 130C _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 130F _ 0F B6. 45, EB
        sub     esp, 8                                  ; 1313 _ 83. EC, 08
        push    eax                                     ; 1316 _ 50
        push    keyinfo                                 ; 1317 _ 68, 00000008(d)
        call    fifo8_put                               ; 131C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1321 _ 83. C4, 10
        nop                                             ; 1324 _ 90
        leave                                           ; 1325 _ C9
        ret                                             ; 1326 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1327 _ 55
        mov     ebp, esp                                ; 1328 _ 89. E5
        sub     esp, 4                                  ; 132A _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 132D _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1330 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1333 _ 80. 7D, FC, 09
        jle     ?_050                                   ; 1337 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1339 _ 0F B6. 45, FC
        add     eax, 55                                 ; 133D _ 83. C0, 37
        jmp     ?_051                                   ; 1340 _ EB, 07

?_050:  movzx   eax, byte [ebp-4H]                      ; 1342 _ 0F B6. 45, FC
        add     eax, 48                                 ; 1346 _ 83. C0, 30
?_051:  leave                                           ; 1349 _ C9
        ret                                             ; 134A _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 134B _ 55
        mov     ebp, esp                                ; 134C _ 89. E5
        sub     esp, 20                                 ; 134E _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 1351 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1354 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1357 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 135E _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1362 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1365 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1368 _ 0F BE. 45, FB
        push    eax                                     ; 136C _ 50
        call    charToHexVal                            ; 136D _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1372 _ 83. C4, 04
        mov     byte [?_199], al                        ; 1375 _ A2, 00000097(d)
        movzx   eax, byte [ebp-14H]                     ; 137A _ 0F B6. 45, EC
        shr     al, 4                                   ; 137E _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1381 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1384 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1388 _ 0F BE. C0
        push    eax                                     ; 138B _ 50
        call    charToHexVal                            ; 138C _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1391 _ 83. C4, 04
        mov     byte [?_198], al                        ; 1394 _ A2, 00000096(d)
        mov     eax, keyval                             ; 1399 _ B8, 00000094(d)
        leave                                           ; 139E _ C9
        ret                                             ; 139F _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 13A0 _ 55
        mov     ebp, esp                                ; 13A1 _ 89. E5
        sub     esp, 16                                 ; 13A3 _ 83. EC, 10
        mov     byte [str.1901], 48                     ; 13A6 _ C6. 05, 000003A8(d), 30
        mov     byte [?_204], 88                        ; 13AD _ C6. 05, 000003A9(d), 58
        mov     byte [?_205], 0                         ; 13B4 _ C6. 05, 000003B2(d), 00
        mov     dword [ebp-0CH], 2                      ; 13BB _ C7. 45, F4, 00000002
        jmp     ?_053                                   ; 13C2 _ EB, 0F

?_052:  mov     eax, dword [ebp-0CH]                    ; 13C4 _ 8B. 45, F4
        add     eax, str.1901                           ; 13C7 _ 05, 000003A8(d)
        mov     byte [eax], 48                          ; 13CC _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 13CF _ 83. 45, F4, 01
?_053:  cmp     dword [ebp-0CH], 9                      ; 13D3 _ 83. 7D, F4, 09
        jle     ?_052                                   ; 13D7 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 13D9 _ C7. 45, F8, 00000009
        jmp     ?_057                                   ; 13E0 _ EB, 42

?_054:  mov     eax, dword [ebp+8H]                     ; 13E2 _ 8B. 45, 08
        and     eax, 0FH                                ; 13E5 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 13E8 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 13EB _ 8B. 45, 08
        shr     eax, 4                                  ; 13EE _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 13F1 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 13F4 _ 83. 7D, FC, 09
        jle     ?_055                                   ; 13F8 _ 7E, 14
        mov     eax, dword [ebp-4H]                     ; 13FA _ 8B. 45, FC
        add     eax, 55                                 ; 13FD _ 83. C0, 37
        mov     edx, eax                                ; 1400 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1402 _ 8B. 45, F8
        add     eax, str.1901                           ; 1405 _ 05, 000003A8(d)
        mov     byte [eax], dl                          ; 140A _ 88. 10
        jmp     ?_056                                   ; 140C _ EB, 12

?_055:  mov     eax, dword [ebp-4H]                     ; 140E _ 8B. 45, FC
        add     eax, 48                                 ; 1411 _ 83. C0, 30
        mov     edx, eax                                ; 1414 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1416 _ 8B. 45, F8
        add     eax, str.1901                           ; 1419 _ 05, 000003A8(d)
        mov     byte [eax], dl                          ; 141E _ 88. 10
?_056:  sub     dword [ebp-8H], 1                       ; 1420 _ 83. 6D, F8, 01
?_057:  cmp     dword [ebp-8H], 1                       ; 1424 _ 83. 7D, F8, 01
        jle     ?_058                                   ; 1428 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 142A _ 83. 7D, 08, 00
        jnz     ?_054                                   ; 142E _ 75, B2
?_058:  mov     eax, str.1901                           ; 1430 _ B8, 000003A8(d)
        leave                                           ; 1435 _ C9
        ret                                             ; 1436 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1437 _ 55
        mov     ebp, esp                                ; 1438 _ 89. E5
        sub     esp, 8                                  ; 143A _ 83. EC, 08
?_059:  sub     esp, 12                                 ; 143D _ 83. EC, 0C
        push    100                                     ; 1440 _ 6A, 64
        call    io_in8                                  ; 1442 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1447 _ 83. C4, 10
        and     eax, 02H                                ; 144A _ 83. E0, 02
        test    eax, eax                                ; 144D _ 85. C0
        jnz     ?_060                                   ; 144F _ 75, 02
        jmp     ?_061                                   ; 1451 _ EB, 02

?_060:  jmp     ?_059                                   ; 1453 _ EB, E8

?_061:  leave                                           ; 1455 _ C9
        ret                                             ; 1456 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1457 _ 55
        mov     ebp, esp                                ; 1458 _ 89. E5
        sub     esp, 8                                  ; 145A _ 83. EC, 08
        call    wait_KBC_sendready                      ; 145D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1462 _ 83. EC, 08
        push    96                                      ; 1465 _ 6A, 60
        push    100                                     ; 1467 _ 6A, 64
        call    io_out8                                 ; 1469 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 146E _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1471 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1476 _ 83. EC, 08
        push    71                                      ; 1479 _ 6A, 47
        push    96                                      ; 147B _ 6A, 60
        call    io_out8                                 ; 147D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1482 _ 83. C4, 10
        nop                                             ; 1485 _ 90
        leave                                           ; 1486 _ C9
        ret                                             ; 1487 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1488 _ 55
        mov     ebp, esp                                ; 1489 _ 89. E5
        sub     esp, 8                                  ; 148B _ 83. EC, 08
        call    wait_KBC_sendready                      ; 148E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1493 _ 83. EC, 08
        push    212                                     ; 1496 _ 68, 000000D4
        push    100                                     ; 149B _ 6A, 64
        call    io_out8                                 ; 149D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14A2 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 14A5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 14AA _ 83. EC, 08
        push    244                                     ; 14AD _ 68, 000000F4
        push    96                                      ; 14B2 _ 6A, 60
        call    io_out8                                 ; 14B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14B9 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 14BC _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 14BF _ C6. 40, 03, 00
        nop                                             ; 14C3 _ 90
        leave                                           ; 14C4 _ C9
        ret                                             ; 14C5 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 14C6 _ 55
        mov     ebp, esp                                ; 14C7 _ 89. E5
        sub     esp, 24                                 ; 14C9 _ 83. EC, 18
        sub     esp, 8                                  ; 14CC _ 83. EC, 08
        push    32                                      ; 14CF _ 6A, 20
        push    160                                     ; 14D1 _ 68, 000000A0
        call    io_out8                                 ; 14D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14DB _ 83. C4, 10
        sub     esp, 8                                  ; 14DE _ 83. EC, 08
        push    32                                      ; 14E1 _ 6A, 20
        push    32                                      ; 14E3 _ 6A, 20
        call    io_out8                                 ; 14E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14EA _ 83. C4, 10
        sub     esp, 12                                 ; 14ED _ 83. EC, 0C
        push    96                                      ; 14F0 _ 6A, 60
        call    io_in8                                  ; 14F2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14F7 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 14FA _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 14FD _ 0F B6. 45, F7
        sub     esp, 8                                  ; 1501 _ 83. EC, 08
        push    eax                                     ; 1504 _ 50
        push    mouseinfo                               ; 1505 _ 68, 00000024(d)
        call    fifo8_put                               ; 150A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 150F _ 83. C4, 10
        leave                                           ; 1512 _ C9
        ret                                             ; 1513 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1514 _ 55
        mov     ebp, esp                                ; 1515 _ 89. E5
        sub     esp, 4                                  ; 1517 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 151A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 151D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1520 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1523 _ 0F B6. 40, 03
        test    al, al                                  ; 1527 _ 84. C0
        jnz     ?_063                                   ; 1529 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 152B _ 80. 7D, FC, FA
        jnz     ?_062                                   ; 152F _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1531 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1534 _ C6. 40, 03, 01
?_062:  mov     eax, 0                                  ; 1538 _ B8, 00000000
        jmp     ?_070                                   ; 153D _ E9, 0000010F

?_063:  mov     eax, dword [ebp+8H]                     ; 1542 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1545 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1549 _ 3C, 01
        jnz     ?_065                                   ; 154B _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 154D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1551 _ 25, 000000C8
        cmp     eax, 8                                  ; 1556 _ 83. F8, 08
        jnz     ?_064                                   ; 1559 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 155B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 155E _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1562 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1564 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1567 _ C6. 40, 03, 02
?_064:  mov     eax, 0                                  ; 156B _ B8, 00000000
        jmp     ?_070                                   ; 1570 _ E9, 000000DC

?_065:  mov     eax, dword [ebp+8H]                     ; 1575 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1578 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 157C _ 3C, 02
        jnz     ?_066                                   ; 157E _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1580 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1583 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1587 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 158A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 158D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1591 _ B8, 00000000
        jmp     ?_070                                   ; 1596 _ E9, 000000B6

?_066:  mov     eax, dword [ebp+8H]                     ; 159B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 159E _ 0F B6. 40, 03
        cmp     al, 3                                   ; 15A2 _ 3C, 03
        jne     ?_069                                   ; 15A4 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 15AA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 15AD _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 15B1 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 15B4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 15B7 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 15BB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 15BE _ 0F B6. 00
        movzx   eax, al                                 ; 15C1 _ 0F B6. C0
        and     eax, 07H                                ; 15C4 _ 83. E0, 07
        mov     edx, eax                                ; 15C7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15C9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 15CC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 15CF _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 15D2 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 15D6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15D9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15DC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15DF _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 15E2 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 15E6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15E9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15EC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 15EF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 15F2 _ 0F B6. 00
        movzx   eax, al                                 ; 15F5 _ 0F B6. C0
        and     eax, 10H                                ; 15F8 _ 83. E0, 10
        test    eax, eax                                ; 15FB _ 85. C0
        jz      ?_067                                   ; 15FD _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 15FF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1602 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1605 _ 0D, FFFFFF00
        mov     edx, eax                                ; 160A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 160C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 160F _ 89. 50, 04
?_067:  mov     eax, dword [ebp+8H]                     ; 1612 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1615 _ 0F B6. 00
        movzx   eax, al                                 ; 1618 _ 0F B6. C0
        and     eax, 20H                                ; 161B _ 83. E0, 20
        test    eax, eax                                ; 161E _ 85. C0
        jz      ?_068                                   ; 1620 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1622 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1625 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1628 _ 0D, FFFFFF00
        mov     edx, eax                                ; 162D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 162F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1632 _ 89. 50, 08
?_068:  mov     eax, dword [ebp+8H]                     ; 1635 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1638 _ 8B. 40, 08
        neg     eax                                     ; 163B _ F7. D8
        mov     edx, eax                                ; 163D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 163F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1642 _ 89. 50, 08
        mov     eax, 1                                  ; 1645 _ B8, 00000001
        jmp     ?_070                                   ; 164A _ EB, 05

?_069:  mov     eax, 4294967295                         ; 164C _ B8, FFFFFFFF
?_070:  leave                                           ; 1651 _ C9
        ret                                             ; 1652 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1653 _ 55
        mov     ebp, esp                                ; 1654 _ 89. E5
        sub     esp, 40                                 ; 1656 _ 83. EC, 28
        mov     dword [ebp-28H], 0                      ; 1659 _ C7. 45, D8, 00000000
        mov     dword [ebp-24H], 0                      ; 1660 _ C7. 45, DC, 00000000
        mov     dword [ebp-20H], 104                    ; 1667 _ C7. 45, E0, 00000068
        mov     dword [ebp-1CH], 80                     ; 166E _ C7. 45, E4, 00000050
        mov     edx, dword [ysize]                      ; 1675 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 167B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 167E _ 8B. 00
        sub     esp, 4                                  ; 1680 _ 83. EC, 04
        push    edx                                     ; 1683 _ 52
        push    dword [ebp+1CH]                         ; 1684 _ FF. 75, 1C
        push    eax                                     ; 1687 _ 50
        call    init_screen8                            ; 1688 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 168D _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1690 _ 8B. 45, 20
        movsx   eax, al                                 ; 1693 _ 0F BE. C0
        sub     esp, 8                                  ; 1696 _ 83. EC, 08
        push    ?_194                                   ; 1699 _ 68, 00000020(d)
        push    eax                                     ; 169E _ 50
        push    dword [ebp-24H]                         ; 169F _ FF. 75, DC
        push    dword [ebp-28H]                         ; 16A2 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 16A5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16A8 _ FF. 75, 08
        call    showString                              ; 16AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16B0 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 16B3 _ 8B. 45, 18
        sub     esp, 12                                 ; 16B6 _ 83. EC, 0C
        push    eax                                     ; 16B9 _ 50
        call    intToHexStr                             ; 16BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16BF _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 16C2 _ 89. 45, E8
        mov     eax, dword [ebp+20H]                    ; 16C5 _ 8B. 45, 20
        movsx   eax, al                                 ; 16C8 _ 0F BE. C0
        sub     esp, 8                                  ; 16CB _ 83. EC, 08
        push    dword [ebp-18H]                         ; 16CE _ FF. 75, E8
        push    eax                                     ; 16D1 _ 50
        push    dword [ebp-24H]                         ; 16D2 _ FF. 75, DC
        push    dword [ebp-20H]                         ; 16D5 _ FF. 75, E0
        push    dword [ebp+0CH]                         ; 16D8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16DB _ FF. 75, 08
        call    showString                              ; 16DE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16E3 _ 83. C4, 20
        add     dword [ebp-24H], 16                     ; 16E6 _ 83. 45, DC, 10
        mov     eax, dword [ebp+20H]                    ; 16EA _ 8B. 45, 20
        movsx   eax, al                                 ; 16ED _ 0F BE. C0
        sub     esp, 8                                  ; 16F0 _ 83. EC, 08
        push    ?_195                                   ; 16F3 _ 68, 0000002A(d)
        push    eax                                     ; 16F8 _ 50
        push    dword [ebp-24H]                         ; 16F9 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 16FC _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 16FF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1702 _ FF. 75, 08
        call    showString                              ; 1705 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 170A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 170D _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1710 _ 8B. 00
        sub     esp, 12                                 ; 1712 _ 83. EC, 0C
        push    eax                                     ; 1715 _ 50
        call    intToHexStr                             ; 1716 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 171B _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 171E _ 89. 45, EC
        mov     eax, dword [ebp+20H]                    ; 1721 _ 8B. 45, 20
        movsx   eax, al                                 ; 1724 _ 0F BE. C0
        sub     esp, 8                                  ; 1727 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 172A _ FF. 75, EC
        push    eax                                     ; 172D _ 50
        push    dword [ebp-24H]                         ; 172E _ FF. 75, DC
        push    dword [ebp-20H]                         ; 1731 _ FF. 75, E0
        push    dword [ebp+0CH]                         ; 1734 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1737 _ FF. 75, 08
        call    showString                              ; 173A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 173F _ 83. C4, 20
        add     dword [ebp-24H], 16                     ; 1742 _ 83. 45, DC, 10
        mov     eax, dword [ebp+20H]                    ; 1746 _ 8B. 45, 20
        movsx   eax, al                                 ; 1749 _ 0F BE. C0
        sub     esp, 8                                  ; 174C _ 83. EC, 08
        push    ?_196                                   ; 174F _ 68, 00000036(d)
        push    eax                                     ; 1754 _ 50
        push    dword [ebp-24H]                         ; 1755 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 1758 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 175B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 175E _ FF. 75, 08
        call    showString                              ; 1761 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1766 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1769 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 176C _ 8B. 40, 04
        sub     esp, 12                                 ; 176F _ 83. EC, 0C
        push    eax                                     ; 1772 _ 50
        call    intToHexStr                             ; 1773 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1778 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 177B _ 89. 45, F0
        mov     eax, dword [ebp+20H]                    ; 177E _ 8B. 45, 20
        movsx   eax, al                                 ; 1781 _ 0F BE. C0
        sub     esp, 8                                  ; 1784 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1787 _ FF. 75, F0
        push    eax                                     ; 178A _ 50
        push    dword [ebp-24H]                         ; 178B _ FF. 75, DC
        push    dword [ebp-20H]                         ; 178E _ FF. 75, E0
        push    dword [ebp+0CH]                         ; 1791 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1794 _ FF. 75, 08
        call    showString                              ; 1797 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 179C _ 83. C4, 20
        add     dword [ebp-24H], 16                     ; 179F _ 83. 45, DC, 10
        mov     eax, dword [ebp+20H]                    ; 17A3 _ 8B. 45, 20
        movsx   eax, al                                 ; 17A6 _ 0F BE. C0
        sub     esp, 8                                  ; 17A9 _ 83. EC, 08
        push    ?_197                                   ; 17AC _ 68, 00000042(d)
        push    eax                                     ; 17B1 _ 50
        push    dword [ebp-24H]                         ; 17B2 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 17B5 _ FF. 75, D8
        push    dword [ebp+0CH]                         ; 17B8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17BB _ FF. 75, 08
        call    showString                              ; 17BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17C3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 17C6 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 17C9 _ 8B. 40, 08
        sub     esp, 12                                 ; 17CC _ 83. EC, 0C
        push    eax                                     ; 17CF _ 50
        call    intToHexStr                             ; 17D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17D5 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 17D8 _ 89. 45, F4
        mov     eax, dword [ebp+20H]                    ; 17DB _ 8B. 45, 20
        movsx   eax, al                                 ; 17DE _ 0F BE. C0
        sub     esp, 8                                  ; 17E1 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 17E4 _ FF. 75, F4
        push    eax                                     ; 17E7 _ 50
        push    dword [ebp-24H]                         ; 17E8 _ FF. 75, DC
        push    dword [ebp-20H]                         ; 17EB _ FF. 75, E0
        push    dword [ebp+0CH]                         ; 17EE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17F1 _ FF. 75, 08
        call    showString                              ; 17F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17F9 _ 83. C4, 20
        leave                                           ; 17FC _ C9
        ret                                             ; 17FD _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 17FE _ 55
        mov     ebp, esp                                ; 17FF _ 89. E5
        sub     esp, 24                                 ; 1801 _ 83. EC, 18
        sub     esp, 12                                 ; 1804 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1807 _ FF. 75, 08
        call    sheet_alloc                             ; 180A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 180F _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1812 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1815 _ A1, 00000000(d)
        sub     esp, 8                                  ; 181A _ 83. EC, 08
        push    10880                                   ; 181D _ 68, 00002A80
        push    eax                                     ; 1822 _ 50
        call    memman_alloc_4k                         ; 1823 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1828 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 182B _ 89. 45, F4
        sub     esp, 12                                 ; 182E _ 83. EC, 0C
        push    -1                                      ; 1831 _ 6A, FF
        push    68                                      ; 1833 _ 6A, 44
        push    160                                     ; 1835 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 183A _ FF. 75, F4
        push    dword [ebp-10H]                         ; 183D _ FF. 75, F0
        call    sheet_setbuf                            ; 1840 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1845 _ 83. C4, 20
        sub     esp, 4                                  ; 1848 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 184B _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 184E _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1851 _ FF. 75, 08
        call    make_window8                            ; 1854 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1859 _ 83. C4, 10
        sub     esp, 8                                  ; 185C _ 83. EC, 08
        push    7                                       ; 185F _ 6A, 07
        push    16                                      ; 1861 _ 6A, 10
        push    144                                     ; 1863 _ 68, 00000090
        push    28                                      ; 1868 _ 6A, 1C
        push    8                                       ; 186A _ 6A, 08
        push    dword [ebp-10H]                         ; 186C _ FF. 75, F0
        call    make_textbox8                           ; 186F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1874 _ 83. C4, 20
        push    172                                     ; 1877 _ 68, 000000AC
        push    260                                     ; 187C _ 68, 00000104
        push    dword [ebp-10H]                         ; 1881 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1884 _ FF. 75, 08
        call    sheet_slide                             ; 1887 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 188C _ 83. C4, 10
        sub     esp, 4                                  ; 188F _ 83. EC, 04
        push    2                                       ; 1892 _ 6A, 02
        push    dword [ebp-10H]                         ; 1894 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 1897 _ FF. 75, 08
        call    sheet_updown                            ; 189A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 189F _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 18A2 _ 8B. 45, F0
        leave                                           ; 18A5 _ C9
        ret                                             ; 18A6 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 18A7 _ 55
        mov     ebp, esp                                ; 18A8 _ 89. E5
        push    ebx                                     ; 18AA _ 53
        sub     esp, 36                                 ; 18AB _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 18AE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 18B1 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 18B4 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 18B7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 18BA _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 18BD _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 18C0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 18C3 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 18C6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18C9 _ 8B. 00
        push    0                                       ; 18CB _ 6A, 00
        push    edx                                     ; 18CD _ 52
        push    0                                       ; 18CE _ 6A, 00
        push    0                                       ; 18D0 _ 6A, 00
        push    8                                       ; 18D2 _ 6A, 08
        push    dword [ebp-10H]                         ; 18D4 _ FF. 75, F0
        push    eax                                     ; 18D7 _ 50
        call    boxfill8                                ; 18D8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18DD _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 18E0 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 18E3 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 18E6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18E9 _ 8B. 00
        push    1                                       ; 18EB _ 6A, 01
        push    edx                                     ; 18ED _ 52
        push    1                                       ; 18EE _ 6A, 01
        push    1                                       ; 18F0 _ 6A, 01
        push    7                                       ; 18F2 _ 6A, 07
        push    dword [ebp-10H]                         ; 18F4 _ FF. 75, F0
        push    eax                                     ; 18F7 _ 50
        call    boxfill8                                ; 18F8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18FD _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1900 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1903 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1906 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1909 _ 8B. 00
        push    edx                                     ; 190B _ 52
        push    0                                       ; 190C _ 6A, 00
        push    0                                       ; 190E _ 6A, 00
        push    0                                       ; 1910 _ 6A, 00
        push    8                                       ; 1912 _ 6A, 08
        push    dword [ebp-10H]                         ; 1914 _ FF. 75, F0
        push    eax                                     ; 1917 _ 50
        call    boxfill8                                ; 1918 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 191D _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1920 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1923 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1926 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1929 _ 8B. 00
        push    edx                                     ; 192B _ 52
        push    1                                       ; 192C _ 6A, 01
        push    1                                       ; 192E _ 6A, 01
        push    1                                       ; 1930 _ 6A, 01
        push    7                                       ; 1932 _ 6A, 07
        push    dword [ebp-10H]                         ; 1934 _ FF. 75, F0
        push    eax                                     ; 1937 _ 50
        call    boxfill8                                ; 1938 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 193D _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1940 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1943 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1946 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1949 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 194C _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 194F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1952 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1955 _ 8B. 00
        push    ebx                                     ; 1957 _ 53
        push    ecx                                     ; 1958 _ 51
        push    1                                       ; 1959 _ 6A, 01
        push    edx                                     ; 195B _ 52
        push    15                                      ; 195C _ 6A, 0F
        push    dword [ebp-10H]                         ; 195E _ FF. 75, F0
        push    eax                                     ; 1961 _ 50
        call    boxfill8                                ; 1962 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1967 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 196A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 196D _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1970 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1973 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1976 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1979 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 197C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 197F _ 8B. 00
        push    ebx                                     ; 1981 _ 53
        push    ecx                                     ; 1982 _ 51
        push    0                                       ; 1983 _ 6A, 00
        push    edx                                     ; 1985 _ 52
        push    0                                       ; 1986 _ 6A, 00
        push    dword [ebp-10H]                         ; 1988 _ FF. 75, F0
        push    eax                                     ; 198B _ 50
        call    boxfill8                                ; 198C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1991 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1994 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1997 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 199A _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 199D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 19A0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19A3 _ 8B. 00
        push    ecx                                     ; 19A5 _ 51
        push    edx                                     ; 19A6 _ 52
        push    2                                       ; 19A7 _ 6A, 02
        push    2                                       ; 19A9 _ 6A, 02
        push    8                                       ; 19AB _ 6A, 08
        push    dword [ebp-10H]                         ; 19AD _ FF. 75, F0
        push    eax                                     ; 19B0 _ 50
        call    boxfill8                                ; 19B1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19B6 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 19B9 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 19BC _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 19BF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19C2 _ 8B. 00
        push    20                                      ; 19C4 _ 6A, 14
        push    edx                                     ; 19C6 _ 52
        push    3                                       ; 19C7 _ 6A, 03
        push    3                                       ; 19C9 _ 6A, 03
        push    12                                      ; 19CB _ 6A, 0C
        push    dword [ebp-10H]                         ; 19CD _ FF. 75, F0
        push    eax                                     ; 19D0 _ 50
        call    boxfill8                                ; 19D1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19D6 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 19D9 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 19DC _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 19DF _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 19E2 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 19E5 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 19E8 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 19EB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19EE _ 8B. 00
        push    ebx                                     ; 19F0 _ 53
        push    ecx                                     ; 19F1 _ 51
        push    edx                                     ; 19F2 _ 52
        push    1                                       ; 19F3 _ 6A, 01
        push    15                                      ; 19F5 _ 6A, 0F
        push    dword [ebp-10H]                         ; 19F7 _ FF. 75, F0
        push    eax                                     ; 19FA _ 50
        call    boxfill8                                ; 19FB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A00 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1A03 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1A06 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1A09 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1A0C _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1A0F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A12 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A15 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A18 _ 8B. 00
        push    ebx                                     ; 1A1A _ 53
        push    ecx                                     ; 1A1B _ 51
        push    edx                                     ; 1A1C _ 52
        push    0                                       ; 1A1D _ 6A, 00
        push    0                                       ; 1A1F _ 6A, 00
        push    dword [ebp-10H]                         ; 1A21 _ FF. 75, F0
        push    eax                                     ; 1A24 _ 50
        call    boxfill8                                ; 1A25 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A2A _ 83. C4, 1C
        sub     esp, 8                                  ; 1A2D _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1A30 _ FF. 75, 10
        push    7                                       ; 1A33 _ 6A, 07
        push    4                                       ; 1A35 _ 6A, 04
        push    24                                      ; 1A37 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1A39 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A3C _ FF. 75, 08
        call    showString                              ; 1A3F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A44 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 1A47 _ C7. 45, EC, 00000000
        jmp     ?_078                                   ; 1A4E _ E9, 00000083

?_071:  mov     dword [ebp-18H], 0                      ; 1A53 _ C7. 45, E8, 00000000
        jmp     ?_077                                   ; 1A5A _ EB, 70

?_072:  mov     eax, dword [ebp-14H]                    ; 1A5C _ 8B. 45, EC
        shl     eax, 4                                  ; 1A5F _ C1. E0, 04
        mov     edx, eax                                ; 1A62 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1A64 _ 8B. 45, E8
        add     eax, edx                                ; 1A67 _ 01. D0
        add     eax, closebtn.1963                      ; 1A69 _ 05, 00000200(d)
        movzx   eax, byte [eax]                         ; 1A6E _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1A71 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1A74 _ 80. 7D, E7, 40
        jnz     ?_073                                   ; 1A78 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1A7A _ C6. 45, E7, 00
        jmp     ?_076                                   ; 1A7E _ EB, 1C

?_073:  cmp     byte [ebp-19H], 36                      ; 1A80 _ 80. 7D, E7, 24
        jnz     ?_074                                   ; 1A84 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1A86 _ C6. 45, E7, 0F
        jmp     ?_076                                   ; 1A8A _ EB, 10

?_074:  cmp     byte [ebp-19H], 81                      ; 1A8C _ 80. 7D, E7, 51
        jnz     ?_075                                   ; 1A90 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1A92 _ C6. 45, E7, 08
        jmp     ?_076                                   ; 1A96 _ EB, 04

?_075:  mov     byte [ebp-19H], 7                       ; 1A98 _ C6. 45, E7, 07
?_076:  mov     eax, dword [ebp+0CH]                    ; 1A9C _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1A9F _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1AA1 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1AA4 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1AA7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AAA _ 8B. 40, 04
        imul    ecx, eax                                ; 1AAD _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1AB0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AB3 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1AB6 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1AB9 _ 8B. 45, E8
        add     eax, ebx                                ; 1ABC _ 01. D8
        add     eax, ecx                                ; 1ABE _ 01. C8
        add     edx, eax                                ; 1AC0 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1AC2 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1AC6 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1AC8 _ 83. 45, E8, 01
?_077:  cmp     dword [ebp-18H], 15                     ; 1ACC _ 83. 7D, E8, 0F
        jle     ?_072                                   ; 1AD0 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1AD2 _ 83. 45, EC, 01
?_078:  cmp     dword [ebp-14H], 13                     ; 1AD6 _ 83. 7D, EC, 0D
        jle     ?_071                                   ; 1ADA _ 0F 8E, FFFFFF73
        nop                                             ; 1AE0 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1AE1 _ 8B. 5D, FC
        leave                                           ; 1AE4 _ C9
        ret                                             ; 1AE5 _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1AE6 _ 55
        mov     ebp, esp                                ; 1AE7 _ 89. E5
        push    edi                                     ; 1AE9 _ 57
        push    esi                                     ; 1AEA _ 56
        push    ebx                                     ; 1AEB _ 53
        sub     esp, 16                                 ; 1AEC _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1AEF _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1AF2 _ 8B. 45, 14
        add     eax, edx                                ; 1AF5 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1AF7 _ 89. 45, EC
        mov     edx, dword [ebp+10H]                    ; 1AFA _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1AFD _ 8B. 45, 18
        add     eax, edx                                ; 1B00 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1B02 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1B05 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1B08 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1B0B _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1B0E _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1B11 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B14 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1B17 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1B1A _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1B1D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B20 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B23 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B26 _ 8B. 00
        push    edi                                     ; 1B28 _ 57
        push    esi                                     ; 1B29 _ 56
        push    ebx                                     ; 1B2A _ 53
        push    ecx                                     ; 1B2B _ 51
        push    15                                      ; 1B2C _ 6A, 0F
        push    edx                                     ; 1B2E _ 52
        push    eax                                     ; 1B2F _ 50
        call    boxfill8                                ; 1B30 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B35 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1B38 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1B3B _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1B3E _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1B41 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1B44 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B47 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1B4A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B4D _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B50 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B53 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B56 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B59 _ 8B. 00
        push    edi                                     ; 1B5B _ 57
        push    esi                                     ; 1B5C _ 56
        push    ebx                                     ; 1B5D _ 53
        push    ecx                                     ; 1B5E _ 51
        push    15                                      ; 1B5F _ 6A, 0F
        push    edx                                     ; 1B61 _ 52
        push    eax                                     ; 1B62 _ 50
        call    boxfill8                                ; 1B63 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B68 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1B6B _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1B6E _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1B71 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1B74 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1B77 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1B7A _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1B7D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B80 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B83 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B86 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B89 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B8C _ 8B. 00
        push    edi                                     ; 1B8E _ 57
        push    esi                                     ; 1B8F _ 56
        push    ebx                                     ; 1B90 _ 53
        push    ecx                                     ; 1B91 _ 51
        push    7                                       ; 1B92 _ 6A, 07
        push    edx                                     ; 1B94 _ 52
        push    eax                                     ; 1B95 _ 50
        call    boxfill8                                ; 1B96 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B9B _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1B9E _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1BA1 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1BA4 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1BA7 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1BAA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1BAD _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1BB0 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1BB3 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1BB6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BB9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BBC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BBF _ 8B. 00
        push    edi                                     ; 1BC1 _ 57
        push    esi                                     ; 1BC2 _ 56
        push    ebx                                     ; 1BC3 _ 53
        push    ecx                                     ; 1BC4 _ 51
        push    7                                       ; 1BC5 _ 6A, 07
        push    edx                                     ; 1BC7 _ 52
        push    eax                                     ; 1BC8 _ 50
        call    boxfill8                                ; 1BC9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BCE _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1BD1 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1BD4 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1BD7 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1BDA _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1BDD _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1BE0 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1BE3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BE6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BE9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BEC _ 8B. 00
        push    esi                                     ; 1BEE _ 56
        push    dword [ebp-14H]                         ; 1BEF _ FF. 75, EC
        push    ebx                                     ; 1BF2 _ 53
        push    ecx                                     ; 1BF3 _ 51
        push    0                                       ; 1BF4 _ 6A, 00
        push    edx                                     ; 1BF6 _ 52
        push    eax                                     ; 1BF7 _ 50
        call    boxfill8                                ; 1BF8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BFD _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1C00 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1C03 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1C06 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1C09 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1C0C _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1C0F _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1C12 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C15 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C18 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C1B _ 8B. 00
        push    dword [ebp-10H]                         ; 1C1D _ FF. 75, F0
        push    esi                                     ; 1C20 _ 56
        push    ebx                                     ; 1C21 _ 53
        push    ecx                                     ; 1C22 _ 51
        push    0                                       ; 1C23 _ 6A, 00
        push    edx                                     ; 1C25 _ 52
        push    eax                                     ; 1C26 _ 50
        call    boxfill8                                ; 1C27 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C2C _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C2F _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1C32 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1C35 _ 8B. 45, F0
        lea     ebx, [eax+1H]                           ; 1C38 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1C3B _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1C3E _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1C41 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C44 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C47 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C4A _ 8B. 00
        push    esi                                     ; 1C4C _ 56
        push    dword [ebp-14H]                         ; 1C4D _ FF. 75, EC
        push    ebx                                     ; 1C50 _ 53
        push    ecx                                     ; 1C51 _ 51
        push    8                                       ; 1C52 _ 6A, 08
        push    edx                                     ; 1C54 _ 52
        push    eax                                     ; 1C55 _ 50
        call    boxfill8                                ; 1C56 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C5B _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C5E _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1C61 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1C64 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1C67 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1C6A _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1C6D _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1C70 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1C73 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C76 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C79 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C7C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C7F _ 8B. 00
        push    edi                                     ; 1C81 _ 57
        push    esi                                     ; 1C82 _ 56
        push    ebx                                     ; 1C83 _ 53
        push    ecx                                     ; 1C84 _ 51
        push    8                                       ; 1C85 _ 6A, 08
        push    edx                                     ; 1C87 _ 52
        push    eax                                     ; 1C88 _ 50
        call    boxfill8                                ; 1C89 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C8E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1C91 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1C94 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1C97 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1C9A _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1C9D _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1CA0 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1CA3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1CA6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CA9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CAC _ 8B. 00
        push    dword [ebp-10H]                         ; 1CAE _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1CB1 _ FF. 75, EC
        push    esi                                     ; 1CB4 _ 56
        push    ebx                                     ; 1CB5 _ 53
        push    ecx                                     ; 1CB6 _ 51
        push    edx                                     ; 1CB7 _ 52
        push    eax                                     ; 1CB8 _ 50
        call    boxfill8                                ; 1CB9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CBE _ 83. C4, 1C
        lea     esp, [ebp-0CH]                          ; 1CC1 _ 8D. 65, F4
        pop     ebx                                     ; 1CC4 _ 5B
        pop     esi                                     ; 1CC5 _ 5E
        pop     edi                                     ; 1CC6 _ 5F
        pop     ebp                                     ; 1CC7 _ 5D
        ret                                             ; 1CC8 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1CC9 _ 55
        mov     ebp, esp                                ; 1CCA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1CCC _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1CCF _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CD5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1CD8 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CDF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1CE2 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CE9 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1CEC _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 1CF3 _ 5D
        ret                                             ; 1CF4 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1CF5 _ 55
        mov     ebp, esp                                ; 1CF6 _ 89. E5
        sub     esp, 16                                 ; 1CF8 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1CFB _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1D02 _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 1D09 _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 1D0B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D0E _ 8B. 55, F8
        add     edx, 2                                  ; 1D11 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D14 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1D18 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1D1B _ 83. 45, F8, 01
?_080:  mov     eax, dword [ebp+8H]                     ; 1D1F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D22 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1D24 _ 3B. 45, F8
        ja      ?_079                                   ; 1D27 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1D29 _ 8B. 45, FC
        leave                                           ; 1D2C _ C9
        ret                                             ; 1D2D _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1D2E _ 55
        mov     ebp, esp                                ; 1D2F _ 89. E5
        sub     esp, 16                                 ; 1D31 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1D34 _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 1D3B _ E9, 00000085

?_081:  mov     eax, dword [ebp+8H]                     ; 1D40 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D43 _ 8B. 55, F8
        add     edx, 2                                  ; 1D46 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D49 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1D4D _ 3B. 45, 0C
        jc      ?_083                                   ; 1D50 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 1D52 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D55 _ 8B. 55, F8
        add     edx, 2                                  ; 1D58 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D5B _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1D5E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1D61 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D64 _ 8B. 55, F8
        add     edx, 2                                  ; 1D67 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1D6A _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1D6D _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1D70 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D73 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D76 _ 8B. 55, F8
        add     edx, 2                                  ; 1D79 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1D7C _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1D7F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D82 _ 8B. 55, F8
        add     edx, 2                                  ; 1D85 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D88 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1D8C _ 2B. 45, 0C
        mov     edx, eax                                ; 1D8F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D91 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1D94 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1D97 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1D9A _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1D9E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1DA1 _ 8B. 55, F8
        add     edx, 2                                  ; 1DA4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1DA7 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1DAB _ 85. C0
        jnz     ?_082                                   ; 1DAD _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1DAF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DB2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1DB4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DB7 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1DBA _ 89. 10
?_082:  mov     eax, dword [ebp-4H]                     ; 1DBC _ 8B. 45, FC
        jmp     ?_085                                   ; 1DBF _ EB, 17

?_083:  add     dword [ebp-8H], 1                       ; 1DC1 _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 1DC5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DC8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1DCA _ 3B. 45, F8
        ja      ?_081                                   ; 1DCD _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 1DD3 _ B8, 00000000
?_085:  leave                                           ; 1DD8 _ C9
        ret                                             ; 1DD9 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1DDA _ 55
        mov     ebp, esp                                ; 1DDB _ 89. E5
        push    ebx                                     ; 1DDD _ 53
        sub     esp, 16                                 ; 1DDE _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1DE1 _ C7. 45, F4, 00000000
        jmp     ?_088                                   ; 1DE8 _ EB, 17

?_086:  mov     eax, dword [ebp+8H]                     ; 1DEA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DED _ 8B. 55, F4
        add     edx, 2                                  ; 1DF0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1DF3 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1DF6 _ 3B. 45, 0C
        jbe     ?_087                                   ; 1DF9 _ 76, 02
        jmp     ?_089                                   ; 1DFB _ EB, 0E

?_087:  add     dword [ebp-0CH], 1                      ; 1DFD _ 83. 45, F4, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 1E01 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E04 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1E06 _ 3B. 45, F4
        jg      ?_086                                   ; 1E09 _ 7F, DF
?_089:  cmp     dword [ebp-0CH], 0                      ; 1E0B _ 83. 7D, F4, 00
        jle     ?_091                                   ; 1E0F _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1E15 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1E18 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E1B _ 8B. 45, 08
        add     edx, 2                                  ; 1E1E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1E21 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1E24 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1E27 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1E2A _ 8B. 45, 08
        add     ecx, 2                                  ; 1E2D _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E30 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1E34 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1E36 _ 3B. 45, 0C
        jne     ?_091                                   ; 1E39 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1E3F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E42 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1E45 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1E48 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E4B _ 8B. 45, 08
        add     edx, 2                                  ; 1E4E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E51 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1E55 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E58 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E5B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E5E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E61 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E65 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E68 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1E6A _ 3B. 45, F4
        jle     ?_090                                   ; 1E6D _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1E6F _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1E72 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E75 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E78 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E7B _ 8B. 55, F4
        add     edx, 2                                  ; 1E7E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E81 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E84 _ 39. C1
        jnz     ?_090                                   ; 1E86 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1E88 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E8B _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1E8E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1E91 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E94 _ 8B. 45, 08
        add     edx, 2                                  ; 1E97 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E9A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E9E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1EA1 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1EA4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1EA7 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1EAB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EAE _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1EB1 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1EB4 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1EB8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EBB _ 8B. 00
        lea     edx, [eax-1H]                           ; 1EBD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1EC0 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1EC3 _ 89. 10
?_090:  mov     eax, 0                                  ; 1EC5 _ B8, 00000000
        jmp     ?_097                                   ; 1ECA _ E9, 0000011C

?_091:  mov     eax, dword [ebp+8H]                     ; 1ECF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ED2 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1ED4 _ 3B. 45, F4
        jle     ?_092                                   ; 1ED7 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 1ED9 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1EDC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1EDF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EE2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EE5 _ 8B. 55, F4
        add     edx, 2                                  ; 1EE8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1EEB _ 8B. 04 D0
        cmp     ecx, eax                                ; 1EEE _ 39. C1
        jnz     ?_092                                   ; 1EF0 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1EF2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EF5 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1EF8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1EFB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1EFE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1F01 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F04 _ 8B. 55, F4
        add     edx, 2                                  ; 1F07 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1F0A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1F0E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1F11 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F14 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F17 _ 8B. 55, F4
        add     edx, 2                                  ; 1F1A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1F1D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1F21 _ B8, 00000000
        jmp     ?_097                                   ; 1F26 _ E9, 000000C0

?_092:  mov     eax, dword [ebp+8H]                     ; 1F2B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F2E _ 8B. 00
        cmp     eax, 4095                               ; 1F30 _ 3D, 00000FFF
        jg      ?_096                                   ; 1F35 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1F3B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F3E _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1F40 _ 89. 45, F8
        jmp     ?_094                                   ; 1F43 _ EB, 28

?_093:  mov     eax, dword [ebp-8H]                     ; 1F45 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F48 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1F4B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1F4E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1F51 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1F54 _ 8B. 45, 08
        add     edx, 2                                  ; 1F57 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1F5A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1F5D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1F5F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1F62 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1F65 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1F69 _ 83. 6D, F8, 01
?_094:  mov     eax, dword [ebp-8H]                     ; 1F6D _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1F70 _ 3B. 45, F4
        jg      ?_093                                   ; 1F73 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1F75 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F78 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1F7A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F7D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F80 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F82 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F85 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F88 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F8B _ 8B. 00
        cmp     edx, eax                                ; 1F8D _ 39. C2
        jge     ?_095                                   ; 1F8F _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1F91 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F94 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1F96 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F99 _ 89. 50, 04
?_095:  mov     eax, dword [ebp+8H]                     ; 1F9C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F9F _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1FA2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1FA5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1FA8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1FAB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1FAE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1FB1 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1FB4 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1FB7 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1FBB _ B8, 00000000
        jmp     ?_097                                   ; 1FC0 _ EB, 29

?_096:  mov     eax, dword [ebp+8H]                     ; 1FC2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1FC5 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1FC8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FCB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1FCE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1FD1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1FD4 _ 8B. 40, 08
        mov     edx, eax                                ; 1FD7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1FD9 _ 8B. 45, 10
        add     eax, edx                                ; 1FDC _ 01. D0
        mov     edx, eax                                ; 1FDE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1FE0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1FE3 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1FE6 _ B8, FFFFFFFF
?_097:  add     esp, 16                                 ; 1FEB _ 83. C4, 10
        pop     ebx                                     ; 1FEE _ 5B
        pop     ebp                                     ; 1FEF _ 5D
        ret                                             ; 1FF0 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1FF1 _ 55
        mov     ebp, esp                                ; 1FF2 _ 89. E5
        sub     esp, 16                                 ; 1FF4 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1FF7 _ 8B. 45, 0C
        add     eax, 4095                               ; 1FFA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FFF _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2004 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 2007 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 200A _ FF. 75, 08
        call    memman_alloc                            ; 200D _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 2012 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 2015 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2018 _ 8B. 45, FC
        leave                                           ; 201B _ C9
        ret                                             ; 201C _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 201D _ 55
        mov     ebp, esp                                ; 201E _ 89. E5
        sub     esp, 16                                 ; 2020 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 2023 _ 8B. 45, 10
        add     eax, 4095                               ; 2026 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 202B _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2030 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 2033 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 2036 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2039 _ FF. 75, 08
        call    memman_free                             ; 203C _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 2041 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 2044 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2047 _ 8B. 45, FC
        leave                                           ; 204A _ C9
        ret                                             ; 204B _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 204C _ 55
        mov     ebp, esp                                ; 204D _ 89. E5
        sub     esp, 24                                 ; 204F _ 83. EC, 18
        sub     esp, 8                                  ; 2052 _ 83. EC, 08
        push    9232                                    ; 2055 _ 68, 00002410
        push    dword [ebp+8H]                          ; 205A _ FF. 75, 08
        call    memman_alloc_4k                         ; 205D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2062 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 2065 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2068 _ 83. 7D, F4, 00
        jnz     ?_098                                   ; 206C _ 75, 0A
        mov     eax, 0                                  ; 206E _ B8, 00000000
        jmp     ?_102                                   ; 2073 _ E9, 00000098

?_098:  mov     eax, dword [ebp+10H]                    ; 2078 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 207B _ 0F AF. 45, 14
        sub     esp, 8                                  ; 207F _ 83. EC, 08
        push    eax                                     ; 2082 _ 50
        push    dword [ebp+8H]                          ; 2083 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2086 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 208B _ 83. C4, 10
        mov     edx, eax                                ; 208E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2090 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 2093 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2096 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 2099 _ 8B. 40, 04
        test    eax, eax                                ; 209C _ 85. C0
        jnz     ?_099                                   ; 209E _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 20A0 _ 8B. 45, F4
        sub     esp, 4                                  ; 20A3 _ 83. EC, 04
        push    9232                                    ; 20A6 _ 68, 00002410
        push    eax                                     ; 20AB _ 50
        push    dword [ebp+8H]                          ; 20AC _ FF. 75, 08
        call    memman_free_4k                          ; 20AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20B4 _ 83. C4, 10
        mov     eax, 0                                  ; 20B7 _ B8, 00000000
        jmp     ?_102                                   ; 20BC _ EB, 52

?_099:  mov     eax, dword [ebp-0CH]                    ; 20BE _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 20C1 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 20C4 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 20C6 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 20C9 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 20CC _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 20CF _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 20D2 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 20D5 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 20D8 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 20DB _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 20E2 _ C7. 45, F0, 00000000
        jmp     ?_101                                   ; 20E9 _ EB, 19

?_100:  mov     eax, dword [ebp-0CH]                    ; 20EB _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 20EE _ 8B. 55, F0
        add     edx, 33                                 ; 20F1 _ 83. C2, 21
        shl     edx, 5                                  ; 20F4 _ C1. E2, 05
        add     eax, edx                                ; 20F7 _ 01. D0
        mov     dword [eax+10H], 0                      ; 20F9 _ C7. 40, 10, 00000000
        add     dword [ebp-10H], 1                      ; 2100 _ 83. 45, F0, 01
?_101:  cmp     dword [ebp-10H], 255                    ; 2104 _ 81. 7D, F0, 000000FF
        jle     ?_100                                   ; 210B _ 7E, DE
        mov     eax, dword [ebp-0CH]                    ; 210D _ 8B. 45, F4
?_102:  leave                                           ; 2110 _ C9
        ret                                             ; 2111 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2112 _ 55
        mov     ebp, esp                                ; 2113 _ 89. E5
        sub     esp, 16                                 ; 2115 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2118 _ C7. 45, F8, 00000000
        jmp     ?_105                                   ; 211F _ EB, 59

?_103:  mov     eax, dword [ebp+8H]                     ; 2121 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2124 _ 8B. 55, F8
        add     edx, 33                                 ; 2127 _ 83. C2, 21
        shl     edx, 5                                  ; 212A _ C1. E2, 05
        add     eax, edx                                ; 212D _ 01. D0
        mov     eax, dword [eax+10H]                    ; 212F _ 8B. 40, 10
        test    eax, eax                                ; 2132 _ 85. C0
        jnz     ?_104                                   ; 2134 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2136 _ 8B. 45, F8
        shl     eax, 5                                  ; 2139 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 213C _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2142 _ 8B. 45, 08
        add     eax, edx                                ; 2145 _ 01. D0
        add     eax, 4                                  ; 2147 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 214A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 214D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2150 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2153 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2156 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2159 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 215D _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2160 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2167 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 216A _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2171 _ 8B. 45, FC
        jmp     ?_106                                   ; 2174 _ EB, 12

?_104:  add     dword [ebp-8H], 1                       ; 2176 _ 83. 45, F8, 01
?_105:  cmp     dword [ebp-8H], 255                     ; 217A _ 81. 7D, F8, 000000FF
        jle     ?_103                                   ; 2181 _ 7E, 9E
        mov     eax, 0                                  ; 2183 _ B8, 00000000
?_106:  leave                                           ; 2188 _ C9
        ret                                             ; 2189 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 218A _ 55
        mov     ebp, esp                                ; 218B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 218D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2190 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2193 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2195 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2198 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 219B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 219E _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 21A1 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 21A4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 21A7 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 21AA _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 21AD _ 89. 50, 14
        nop                                             ; 21B0 _ 90
        pop     ebp                                     ; 21B1 _ 5D
        ret                                             ; 21B2 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 21B3 _ 55
        mov     ebp, esp                                ; 21B4 _ 89. E5
        push    esi                                     ; 21B6 _ 56
        push    ebx                                     ; 21B7 _ 53
        sub     esp, 16                                 ; 21B8 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 21BB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 21BE _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 21C1 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 21C4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21C7 _ 8B. 40, 10
        add     eax, 1                                  ; 21CA _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 21CD _ 3B. 45, 10
        jge     ?_107                                   ; 21D0 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 21D2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21D5 _ 8B. 40, 10
        add     eax, 1                                  ; 21D8 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 21DB _ 89. 45, 10
?_107:  cmp     dword [ebp+10H], -1                     ; 21DE _ 83. 7D, 10, FF
        jge     ?_108                                   ; 21E2 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 21E4 _ C7. 45, 10, FFFFFFFF
?_108:  mov     eax, dword [ebp+0CH]                    ; 21EB _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 21EE _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 21F1 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 21F4 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 21F7 _ 3B. 45, 10
        jle     ?_115                                   ; 21FA _ 0F 8E, 000001D5
        cmp     dword [ebp+10H], 0                      ; 2200 _ 83. 7D, 10, 00
        js      ?_111                                   ; 2204 _ 0F 88, 000000E2
        mov     eax, dword [ebp-0CH]                    ; 220A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 220D _ 89. 45, F0
        jmp     ?_110                                   ; 2210 _ EB, 34

?_109:  mov     eax, dword [ebp-10H]                    ; 2212 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2215 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2218 _ 8B. 45, 08
        add     edx, 4                                  ; 221B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 221E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2222 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2225 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2228 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 222B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 222F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2232 _ 8B. 55, F0
        add     edx, 4                                  ; 2235 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2238 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 223C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 223F _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2242 _ 83. 6D, F0, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 2246 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2249 _ 3B. 45, 10
        jg      ?_109                                   ; 224C _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 224E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2251 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2254 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2257 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 225A _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 225E _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2261 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2264 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2267 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 226A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 226D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2270 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2273 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2276 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2279 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 227C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 227F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2282 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2285 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2288 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 228B _ 8B. 40, 0C
        sub     esp, 8                                  ; 228E _ 83. EC, 08
        push    esi                                     ; 2291 _ 56
        push    ebx                                     ; 2292 _ 53
        push    ecx                                     ; 2293 _ 51
        push    edx                                     ; 2294 _ 52
        push    eax                                     ; 2295 _ 50
        push    dword [ebp+8H]                          ; 2296 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2299 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 229E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 22A1 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 22A4 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 22A7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22AA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22AD _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 22B0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 22B3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 22B6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 22B9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22BC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 22BF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 22C2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 22C5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22C8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22CB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22CE _ 8B. 40, 0C
        sub     esp, 4                                  ; 22D1 _ 83. EC, 04
        push    dword [ebp-0CH]                         ; 22D4 _ FF. 75, F4
        push    esi                                     ; 22D7 _ 56
        push    ebx                                     ; 22D8 _ 53
        push    ecx                                     ; 22D9 _ 51
        push    edx                                     ; 22DA _ 52
        push    eax                                     ; 22DB _ 50
        push    dword [ebp+8H]                          ; 22DC _ FF. 75, 08
        call    sheet_refreshsub                        ; 22DF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22E4 _ 83. C4, 20
        jmp     ?_122                                   ; 22E7 _ E9, 0000023E

?_111:  mov     eax, dword [ebp+8H]                     ; 22EC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22EF _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 22F2 _ 3B. 45, F4
        jle     ?_114                                   ; 22F5 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 22F7 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 22FA _ 89. 45, F0
        jmp     ?_113                                   ; 22FD _ EB, 34

?_112:  mov     eax, dword [ebp-10H]                    ; 22FF _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2302 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2305 _ 8B. 45, 08
        add     edx, 4                                  ; 2308 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 230B _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 230F _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2312 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2315 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2318 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 231C _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 231F _ 8B. 55, F0
        add     edx, 4                                  ; 2322 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2325 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2329 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 232C _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 232F _ 83. 45, F0, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 2333 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2336 _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 2339 _ 3B. 45, F0
        jg      ?_112                                   ; 233C _ 7F, C1
?_114:  mov     eax, dword [ebp+8H]                     ; 233E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2341 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2344 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2347 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 234A _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 234D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2350 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2353 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2356 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2359 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 235C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 235F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2362 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2365 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2368 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 236B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 236E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2371 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2374 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2377 _ 83. EC, 08
        push    0                                       ; 237A _ 6A, 00
        push    ebx                                     ; 237C _ 53
        push    ecx                                     ; 237D _ 51
        push    edx                                     ; 237E _ 52
        push    eax                                     ; 237F _ 50
        push    dword [ebp+8H]                          ; 2380 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2383 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2388 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 238B _ 8B. 45, F4
        lea     esi, [eax-1H]                           ; 238E _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 2391 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2394 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2397 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 239A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 239D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 23A0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 23A3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 23A6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 23A9 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 23AC _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 23AF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23B2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23B5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23B8 _ 8B. 40, 0C
        sub     esp, 4                                  ; 23BB _ 83. EC, 04
        push    esi                                     ; 23BE _ 56
        push    0                                       ; 23BF _ 6A, 00
        push    ebx                                     ; 23C1 _ 53
        push    ecx                                     ; 23C2 _ 51
        push    edx                                     ; 23C3 _ 52
        push    eax                                     ; 23C4 _ 50
        push    dword [ebp+8H]                          ; 23C5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 23C8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23CD _ 83. C4, 20
        jmp     ?_122                                   ; 23D0 _ E9, 00000155

?_115:  mov     eax, dword [ebp-0CH]                    ; 23D5 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 23D8 _ 3B. 45, 10
        jge     ?_122                                   ; 23DB _ 0F 8D, 00000149
        cmp     dword [ebp-0CH], 0                      ; 23E1 _ 83. 7D, F4, 00
        js      ?_118                                   ; 23E5 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 23E7 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 23EA _ 89. 45, F0
        jmp     ?_117                                   ; 23ED _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 23EF _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 23F2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23F5 _ 8B. 45, 08
        add     edx, 4                                  ; 23F8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23FB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23FF _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2402 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2405 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2408 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 240C _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 240F _ 8B. 55, F0
        add     edx, 4                                  ; 2412 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2415 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2419 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 241C _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 241F _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 2423 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2426 _ 3B. 45, 10
        jl      ?_116                                   ; 2429 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 242B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 242E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2431 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2434 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2437 _ 89. 54 88, 04
        jmp     ?_121                                   ; 243B _ EB, 6C

?_118:  mov     eax, dword [ebp+8H]                     ; 243D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2440 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2443 _ 89. 45, F0
        jmp     ?_120                                   ; 2446 _ EB, 3A

?_119:  mov     eax, dword [ebp-10H]                    ; 2448 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 244B _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 244E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2451 _ 8B. 55, F0
        add     edx, 4                                  ; 2454 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2457 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 245B _ 8B. 45, 08
        add     ecx, 4                                  ; 245E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2461 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2465 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2468 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 246B _ 8B. 45, 08
        add     edx, 4                                  ; 246E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2471 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2475 _ 8B. 55, F0
        add     edx, 1                                  ; 2478 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 247B _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 247E _ 83. 6D, F0, 01
?_120:  mov     eax, dword [ebp-10H]                    ; 2482 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2485 _ 3B. 45, 10
        jge     ?_119                                   ; 2488 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 248A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 248D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2490 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2493 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2496 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 249A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 249D _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 24A0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 24A3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 24A6 _ 89. 50, 10
?_121:  mov     eax, dword [ebp+0CH]                    ; 24A9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24AC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24AF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24B2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 24B5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 24B8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24BB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 24BE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24C1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 24C4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 24C7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24CA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24CD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 24D0 _ 8B. 40, 0C
        sub     esp, 8                                  ; 24D3 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 24D6 _ FF. 75, 10
        push    ebx                                     ; 24D9 _ 53
        push    ecx                                     ; 24DA _ 51
        push    edx                                     ; 24DB _ 52
        push    eax                                     ; 24DC _ 50
        push    dword [ebp+8H]                          ; 24DD _ FF. 75, 08
        call    sheet_refreshmap                        ; 24E0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24E5 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 24E8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24EB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24EE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24F1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 24F4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 24F7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24FA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 24FD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2500 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2503 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2506 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2509 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 250C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 250F _ 8B. 40, 0C
        sub     esp, 4                                  ; 2512 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 2515 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 2518 _ FF. 75, 10
        push    ebx                                     ; 251B _ 53
        push    ecx                                     ; 251C _ 51
        push    edx                                     ; 251D _ 52
        push    eax                                     ; 251E _ 50
        push    dword [ebp+8H]                          ; 251F _ FF. 75, 08
        call    sheet_refreshsub                        ; 2522 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2527 _ 83. C4, 20
?_122:  lea     esp, [ebp-8H]                           ; 252A _ 8D. 65, F8
        pop     ebx                                     ; 252D _ 5B
        pop     esi                                     ; 252E _ 5E
        pop     ebp                                     ; 252F _ 5D
        ret                                             ; 2530 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2531 _ 55
        mov     ebp, esp                                ; 2532 _ 89. E5
        push    edi                                     ; 2534 _ 57
        push    esi                                     ; 2535 _ 56
        push    ebx                                     ; 2536 _ 53
        sub     esp, 28                                 ; 2537 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 253A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 253D _ 8B. 40, 18
        test    eax, eax                                ; 2540 _ 85. C0
        js      ?_123                                   ; 2542 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 2544 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 2547 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 254A _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 254D _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 2550 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2553 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 2556 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 2559 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 255C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 255F _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 2562 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 2565 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2568 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 256B _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 256E _ 8B. 45, 14
        add     edx, eax                                ; 2571 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2573 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2576 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 2579 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 257C _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 257F _ 03. 45, E4
        sub     esp, 4                                  ; 2582 _ 83. EC, 04
        push    ebx                                     ; 2585 _ 53
        push    ecx                                     ; 2586 _ 51
        push    edi                                     ; 2587 _ 57
        push    esi                                     ; 2588 _ 56
        push    edx                                     ; 2589 _ 52
        push    eax                                     ; 258A _ 50
        push    dword [ebp+8H]                          ; 258B _ FF. 75, 08
        call    sheet_refreshsub                        ; 258E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2593 _ 83. C4, 20
?_123:  mov     eax, 0                                  ; 2596 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 259B _ 8D. 65, F4
        pop     ebx                                     ; 259E _ 5B
        pop     esi                                     ; 259F _ 5E
        pop     edi                                     ; 25A0 _ 5F
        pop     ebp                                     ; 25A1 _ 5D
        ret                                             ; 25A2 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 25A3 _ 55
        mov     ebp, esp                                ; 25A4 _ 89. E5
        push    esi                                     ; 25A6 _ 56
        push    ebx                                     ; 25A7 _ 53
        sub     esp, 16                                 ; 25A8 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 25AB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 25AE _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 25B1 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 25B4 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 25B7 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 25BA _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 25BD _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 25C0 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 25C3 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 25C6 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 25C9 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 25CC _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25CF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25D2 _ 8B. 40, 18
        test    eax, eax                                ; 25D5 _ 85. C0
        js      ?_124                                   ; 25D7 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 25DD _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25E0 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 25E3 _ 8B. 45, F4
        add     edx, eax                                ; 25E6 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25E8 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 25EB _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 25EE _ 8B. 45, F0
        add     eax, ecx                                ; 25F1 _ 01. C8
        sub     esp, 8                                  ; 25F3 _ 83. EC, 08
        push    0                                       ; 25F6 _ 6A, 00
        push    edx                                     ; 25F8 _ 52
        push    eax                                     ; 25F9 _ 50
        push    dword [ebp-0CH]                         ; 25FA _ FF. 75, F4
        push    dword [ebp-10H]                         ; 25FD _ FF. 75, F0
        push    dword [ebp+8H]                          ; 2600 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2603 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2608 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 260B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 260E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2611 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2614 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2617 _ 8B. 55, 14
        add     ecx, edx                                ; 261A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 261C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 261F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2622 _ 8B. 55, 10
        add     edx, ebx                                ; 2625 _ 01. DA
        sub     esp, 8                                  ; 2627 _ 83. EC, 08
        push    eax                                     ; 262A _ 50
        push    ecx                                     ; 262B _ 51
        push    edx                                     ; 262C _ 52
        push    dword [ebp+14H]                         ; 262D _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2630 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2633 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2636 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 263B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 263E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2641 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 2644 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2647 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 264A _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 264D _ 8B. 45, F4
        add     edx, eax                                ; 2650 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2652 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 2655 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 2658 _ 8B. 45, F0
        add     eax, ebx                                ; 265B _ 01. D8
        sub     esp, 4                                  ; 265D _ 83. EC, 04
        push    ecx                                     ; 2660 _ 51
        push    0                                       ; 2661 _ 6A, 00
        push    edx                                     ; 2663 _ 52
        push    eax                                     ; 2664 _ 50
        push    dword [ebp-0CH]                         ; 2665 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 2668 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 266B _ FF. 75, 08
        call    sheet_refreshsub                        ; 266E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2673 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2676 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2679 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 267C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 267F _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2682 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2685 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2688 _ 8B. 4D, 14
        add     ebx, ecx                                ; 268B _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 268D _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2690 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2693 _ 8B. 4D, 10
        add     ecx, esi                                ; 2696 _ 01. F1
        sub     esp, 4                                  ; 2698 _ 83. EC, 04
        push    edx                                     ; 269B _ 52
        push    eax                                     ; 269C _ 50
        push    ebx                                     ; 269D _ 53
        push    ecx                                     ; 269E _ 51
        push    dword [ebp+14H]                         ; 269F _ FF. 75, 14
        push    dword [ebp+10H]                         ; 26A2 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 26A5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 26A8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26AD _ 83. C4, 20
?_124:  lea     esp, [ebp-8H]                           ; 26B0 _ 8D. 65, F8
        pop     ebx                                     ; 26B3 _ 5B
        pop     esi                                     ; 26B4 _ 5E
        pop     ebp                                     ; 26B5 _ 5D
        ret                                             ; 26B6 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 26B7 _ 55
        mov     ebp, esp                                ; 26B8 _ 89. E5
        sub     esp, 48                                 ; 26BA _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 26BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26C0 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 26C2 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 26C5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 26C8 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 26CB _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 26CE _ 83. 7D, 0C, 00
        jns     ?_125                                   ; 26D2 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 26D4 _ C7. 45, 0C, 00000000
?_125:  cmp     dword [ebp+10H], 8                      ; 26DB _ 83. 7D, 10, 08
        jg      ?_126                                   ; 26DF _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 26E1 _ C7. 45, 10, 00000000
?_126:  mov     eax, dword [ebp+8H]                     ; 26E8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26EB _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 26EE _ 3B. 45, 14
        jge     ?_127                                   ; 26F1 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 26F3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26F6 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 26F9 _ 89. 45, 14
?_127:  mov     eax, dword [ebp+8H]                     ; 26FC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 26FF _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 2702 _ 3B. 45, 18
        jge     ?_128                                   ; 2705 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2707 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 270A _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 270D _ 89. 45, 18
?_128:  mov     eax, dword [ebp+1CH]                    ; 2710 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2713 _ 89. 45, DC
        jmp     ?_135                                   ; 2716 _ E9, 00000118

?_129:  mov     eax, dword [ebp+8H]                     ; 271B _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 271E _ 8B. 55, DC
        add     edx, 4                                  ; 2721 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2724 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2728 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 272B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 272E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2730 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2733 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 2736 _ 8B. 55, 08
        add     edx, 1044                               ; 2739 _ 81. C2, 00000414
        sub     eax, edx                                ; 273F _ 29. D0
        sar     eax, 5                                  ; 2741 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2744 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2747 _ C7. 45, E4, 00000000
        jmp     ?_134                                   ; 274E _ E9, 000000CD

?_130:  mov     eax, dword [ebp-10H]                    ; 2753 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2756 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2759 _ 8B. 45, E4
        add     eax, edx                                ; 275C _ 01. D0
        mov     dword [ebp-8H], eax                     ; 275E _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2761 _ C7. 45, E0, 00000000
        jmp     ?_133                                   ; 2768 _ E9, 000000A0

?_131:  mov     eax, dword [ebp-10H]                    ; 276D _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2770 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2773 _ 8B. 45, E0
        add     eax, edx                                ; 2776 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2778 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 277B _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 277E _ 3B. 45, FC
        jg      ?_132                                   ; 2781 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2787 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 278A _ 3B. 45, 14
        jge     ?_132                                   ; 278D _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 278F _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2792 _ 3B. 45, F8
        jg      ?_132                                   ; 2795 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2797 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 279A _ 3B. 45, 18
        jge     ?_132                                   ; 279D _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 279F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 27A2 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 27A5 _ 0F AF. 45, E4
        mov     edx, eax                                ; 27A9 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 27AB _ 8B. 45, E0
        add     eax, edx                                ; 27AE _ 01. D0
        mov     edx, eax                                ; 27B0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 27B2 _ 8B. 45, F4
        add     eax, edx                                ; 27B5 _ 01. D0
        movzx   eax, byte [eax]                         ; 27B7 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 27BA _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 27BD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27C0 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 27C3 _ 0F AF. 45, F8
        mov     edx, eax                                ; 27C7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 27C9 _ 8B. 45, FC
        add     eax, edx                                ; 27CC _ 01. D0
        mov     edx, eax                                ; 27CE _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 27D0 _ 8B. 45, EC
        add     eax, edx                                ; 27D3 _ 01. D0
        movzx   eax, byte [eax]                         ; 27D5 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 27D8 _ 3A. 45, DA
        jnz     ?_132                                   ; 27DB _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 27DD _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 27E1 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 27E4 _ 8B. 40, 14
        cmp     edx, eax                                ; 27E7 _ 39. C2
        jz      ?_132                                   ; 27E9 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 27EB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27EE _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 27F1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 27F5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 27F7 _ 8B. 45, FC
        add     eax, edx                                ; 27FA _ 01. D0
        mov     edx, eax                                ; 27FC _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 27FE _ 8B. 45, E8
        add     edx, eax                                ; 2801 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2803 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2807 _ 88. 02
?_132:  add     dword [ebp-20H], 1                      ; 2809 _ 83. 45, E0, 01
?_133:  mov     eax, dword [ebp-10H]                    ; 280D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2810 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2813 _ 3B. 45, E0
        jg      ?_131                                   ; 2816 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 281C _ 83. 45, E4, 01
?_134:  mov     eax, dword [ebp-10H]                    ; 2820 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2823 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2826 _ 3B. 45, E4
        jg      ?_130                                   ; 2829 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 282F _ 83. 45, DC, 01
?_135:  mov     eax, dword [ebp-24H]                    ; 2833 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 2836 _ 3B. 45, 20
        jle     ?_129                                   ; 2839 _ 0F 8E, FFFFFEDC
        leave                                           ; 283F _ C9
        ret                                             ; 2840 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2841 _ 55
        mov     ebp, esp                                ; 2842 _ 89. E5
        sub     esp, 64                                 ; 2844 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2847 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 284A _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 284D _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2850 _ 83. 7D, 0C, 00
        jns     ?_136                                   ; 2854 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2856 _ C7. 45, 0C, 00000000
?_136:  cmp     dword [ebp+10H], 0                      ; 285D _ 83. 7D, 10, 00
        jns     ?_137                                   ; 2861 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2863 _ C7. 45, 10, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 286A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 286D _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 2870 _ 3B. 45, 14
        jge     ?_138                                   ; 2873 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2875 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2878 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 287B _ 89. 45, 14
?_138:  mov     eax, dword [ebp+8H]                     ; 287E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2881 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 2884 _ 3B. 45, 18
        jge     ?_139                                   ; 2887 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2889 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 288C _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 288F _ 89. 45, 18
?_139:  mov     eax, dword [ebp+1CH]                    ; 2892 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 2895 _ 89. 45, D0
        jmp     ?_150                                   ; 2898 _ E9, 00000140

?_140:  mov     eax, dword [ebp+8H]                     ; 289D _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 28A0 _ 8B. 55, D0
        add     edx, 4                                  ; 28A3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 28A6 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 28AA _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 28AD _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 28B0 _ 8B. 55, 08
        add     edx, 1044                               ; 28B3 _ 81. C2, 00000414
        sub     eax, edx                                ; 28B9 _ 29. D0
        sar     eax, 5                                  ; 28BB _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 28BE _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 28C1 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 28C4 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 28C6 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 28C9 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 28CC _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 28CF _ 8B. 55, 0C
        sub     edx, eax                                ; 28D2 _ 29. C2
        mov     eax, edx                                ; 28D4 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 28D6 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 28D9 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 28DC _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 28DF _ 8B. 55, 10
        sub     edx, eax                                ; 28E2 _ 29. C2
        mov     eax, edx                                ; 28E4 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 28E6 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 28E9 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 28EC _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 28EF _ 8B. 55, 14
        sub     edx, eax                                ; 28F2 _ 29. C2
        mov     eax, edx                                ; 28F4 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 28F6 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 28F9 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 28FC _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 28FF _ 8B. 55, 18
        sub     edx, eax                                ; 2902 _ 29. C2
        mov     eax, edx                                ; 2904 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2906 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 2909 _ 83. 7D, DC, 00
        jns     ?_141                                   ; 290D _ 79, 07
        mov     dword [ebp-24H], 0                      ; 290F _ C7. 45, DC, 00000000
?_141:  cmp     dword [ebp-20H], 0                      ; 2916 _ 83. 7D, E0, 00
        jns     ?_142                                   ; 291A _ 79, 07
        mov     dword [ebp-20H], 0                      ; 291C _ C7. 45, E0, 00000000
?_142:  mov     eax, dword [ebp-10H]                    ; 2923 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2926 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2929 _ 3B. 45, E4
        jge     ?_143                                   ; 292C _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 292E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2931 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 2934 _ 89. 45, E4
?_143:  mov     eax, dword [ebp-10H]                    ; 2937 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 293A _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 293D _ 3B. 45, E8
        jge     ?_144                                   ; 2940 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2942 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2945 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 2948 _ 89. 45, E8
?_144:  mov     eax, dword [ebp-20H]                    ; 294B _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 294E _ 89. 45, D8
        jmp     ?_149                                   ; 2951 _ EB, 7A

?_145:  mov     eax, dword [ebp-10H]                    ; 2953 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2956 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 2959 _ 8B. 45, D8
        add     eax, edx                                ; 295C _ 01. D0
        mov     dword [ebp-8H], eax                     ; 295E _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 2961 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 2964 _ 89. 45, D4
        jmp     ?_148                                   ; 2967 _ EB, 58

?_146:  mov     eax, dword [ebp-10H]                    ; 2969 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 296C _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 296F _ 8B. 45, D4
        add     eax, edx                                ; 2972 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2974 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2977 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 297A _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 297D _ 0F AF. 45, D8
        mov     edx, eax                                ; 2981 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2983 _ 8B. 45, D4
        add     eax, edx                                ; 2986 _ 01. D0
        mov     edx, eax                                ; 2988 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 298A _ 8B. 45, F4
        add     eax, edx                                ; 298D _ 01. D0
        movzx   eax, byte [eax]                         ; 298F _ 0F B6. 00
        movzx   edx, al                                 ; 2992 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2995 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2998 _ 8B. 40, 14
        cmp     edx, eax                                ; 299B _ 39. C2
        jz      ?_147                                   ; 299D _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 299F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 29A2 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 29A5 _ 0F AF. 45, F8
        mov     edx, eax                                ; 29A9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 29AB _ 8B. 45, FC
        add     eax, edx                                ; 29AE _ 01. D0
        mov     edx, eax                                ; 29B0 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 29B2 _ 8B. 45, EC
        add     edx, eax                                ; 29B5 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 29B7 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 29BB _ 88. 02
?_147:  add     dword [ebp-2CH], 1                      ; 29BD _ 83. 45, D4, 01
?_148:  mov     eax, dword [ebp-2CH]                    ; 29C1 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 29C4 _ 3B. 45, E4
        jl      ?_146                                   ; 29C7 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 29C9 _ 83. 45, D8, 01
?_149:  mov     eax, dword [ebp-28H]                    ; 29CD _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 29D0 _ 3B. 45, E8
        jl      ?_145                                   ; 29D3 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 29D9 _ 83. 45, D0, 01
?_150:  mov     eax, dword [ebp+8H]                     ; 29DD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 29E0 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 29E3 _ 3B. 45, D0
        jge     ?_140                                   ; 29E6 _ 0F 8D, FFFFFEB1
        nop                                             ; 29EC _ 90
        leave                                           ; 29ED _ C9
        ret                                             ; 29EE _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 29EF _ 55
        mov     ebp, esp                                ; 29F0 _ 89. E5
        sub     esp, 24                                 ; 29F2 _ 83. EC, 18
        sub     esp, 8                                  ; 29F5 _ 83. EC, 08
        push    52                                      ; 29F8 _ 6A, 34
        push    67                                      ; 29FA _ 6A, 43
        call    io_out8                                 ; 29FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A01 _ 83. C4, 10
        sub     esp, 8                                  ; 2A04 _ 83. EC, 08
        push    156                                     ; 2A07 _ 68, 0000009C
        push    64                                      ; 2A0C _ 6A, 40
        call    io_out8                                 ; 2A0E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A13 _ 83. C4, 10
        sub     esp, 8                                  ; 2A16 _ 83. EC, 08
        push    46                                      ; 2A19 _ 6A, 2E
        push    64                                      ; 2A1B _ 6A, 40
        call    io_out8                                 ; 2A1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A22 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2A25 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2A2F _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 2A36 _ EB, 28

?_151:  mov     eax, dword [ebp-0CH]                    ; 2A38 _ 8B. 45, F4
        shl     eax, 4                                  ; 2A3B _ C1. E0, 04
        add     eax, timerctl                           ; 2A3E _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 2A43 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2A4A _ 8B. 45, F4
        shl     eax, 4                                  ; 2A4D _ C1. E0, 04
        add     eax, timerctl                           ; 2A50 _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 2A55 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 2A5C _ 83. 45, F4, 01
?_152:  cmp     dword [ebp-0CH], 499                    ; 2A60 _ 81. 7D, F4, 000001F3
        jle     ?_151                                   ; 2A67 _ 7E, CF
        leave                                           ; 2A69 _ C9
        ret                                             ; 2A6A _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2A6B _ 55
        mov     ebp, esp                                ; 2A6C _ 89. E5
        sub     esp, 16                                 ; 2A6E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2A71 _ C7. 45, FC, 00000000
        jmp     ?_155                                   ; 2A78 _ EB, 38

?_153:  mov     eax, dword [ebp-4H]                     ; 2A7A _ 8B. 45, FC
        shl     eax, 4                                  ; 2A7D _ C1. E0, 04
        add     eax, timerctl                           ; 2A80 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 2A85 _ 8B. 40, 08
        test    eax, eax                                ; 2A88 _ 85. C0
        jnz     ?_154                                   ; 2A8A _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 2A8C _ 8B. 45, FC
        shl     eax, 4                                  ; 2A8F _ C1. E0, 04
        add     eax, timerctl                           ; 2A92 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 2A97 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A9E _ 8B. 45, FC
        shl     eax, 4                                  ; 2AA1 _ C1. E0, 04
        add     eax, timerctl                           ; 2AA4 _ 05, 000003C0(d)
        add     eax, 4                                  ; 2AA9 _ 83. C0, 04
        jmp     ?_156                                   ; 2AAC _ EB, 12

?_154:  add     dword [ebp-4H], 1                       ; 2AAE _ 83. 45, FC, 01
?_155:  cmp     dword [ebp-4H], 499                     ; 2AB2 _ 81. 7D, FC, 000001F3
        jle     ?_153                                   ; 2AB9 _ 7E, BF
        mov     eax, 0                                  ; 2ABB _ B8, 00000000
?_156:  leave                                           ; 2AC0 _ C9
        ret                                             ; 2AC1 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2AC2 _ 55
        mov     ebp, esp                                ; 2AC3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AC5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2AC8 _ C7. 40, 04, 00000000
        nop                                             ; 2ACF _ 90
        pop     ebp                                     ; 2AD0 _ 5D
        ret                                             ; 2AD1 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2AD2 _ 55
        mov     ebp, esp                                ; 2AD3 _ 89. E5
        sub     esp, 4                                  ; 2AD5 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2AD8 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2ADB _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2ADE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AE1 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2AE4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2AE7 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2AEA _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2AEE _ 88. 50, 0C
        nop                                             ; 2AF1 _ 90
        leave                                           ; 2AF2 _ C9
        ret                                             ; 2AF3 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2AF4 _ 55
        mov     ebp, esp                                ; 2AF5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AF7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AFA _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2AFD _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2AFF _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2B02 _ C7. 40, 04, 00000002
        nop                                             ; 2B09 _ 90
        pop     ebp                                     ; 2B0A _ 5D
        ret                                             ; 2B0B _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2B0C _ 55
        mov     ebp, esp                                ; 2B0D _ 89. E5
        sub     esp, 24                                 ; 2B0F _ 83. EC, 18
        sub     esp, 8                                  ; 2B12 _ 83. EC, 08
        push    32                                      ; 2B15 _ 6A, 20
        push    32                                      ; 2B17 _ 6A, 20
        call    io_out8                                 ; 2B19 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B1E _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2B21 _ A1, 000003C0(d)
        add     eax, 1                                  ; 2B26 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 2B29 _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 2B2E _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2B32 _ C7. 45, F4, 00000000
        jmp     ?_160                                   ; 2B39 _ E9, 000000B1

?_157:  mov     eax, dword [ebp-0CH]                    ; 2B3E _ 8B. 45, F4
        shl     eax, 4                                  ; 2B41 _ C1. E0, 04
        add     eax, timerctl                           ; 2B44 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 2B49 _ 8B. 40, 08
        cmp     eax, 2                                  ; 2B4C _ 83. F8, 02
        jne     ?_158                                   ; 2B4F _ 0F 85, 0000008B
        mov     eax, dword [ebp-0CH]                    ; 2B55 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B58 _ C1. E0, 04
        add     eax, timerctl                           ; 2B5B _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 2B60 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 2B63 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2B66 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B69 _ C1. E0, 04
        add     eax, timerctl                           ; 2B6C _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 2B71 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2B74 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B77 _ C1. E0, 04
        add     eax, timerctl                           ; 2B7A _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 2B7F _ 8B. 40, 04
        test    eax, eax                                ; 2B82 _ 85. C0
        jnz     ?_158                                   ; 2B84 _ 75, 5A
        mov     eax, dword [ebp-0CH]                    ; 2B86 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B89 _ C1. E0, 04
        add     eax, timerctl                           ; 2B8C _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 2B91 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2B98 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B9B _ C1. E0, 04
        add     eax, timerctl                           ; 2B9E _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 2BA3 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 2BA7 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2BAA _ 8B. 45, F4
        shl     eax, 4                                  ; 2BAD _ C1. E0, 04
        add     eax, timerctl                           ; 2BB0 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 2BB5 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2BB8 _ 83. EC, 08
        push    edx                                     ; 2BBB _ 52
        push    eax                                     ; 2BBC _ 50
        call    fifo8_put                               ; 2BBD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2BC2 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2BC5 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BC8 _ C1. E0, 04
        add     eax, timerctl                           ; 2BCB _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 2BD0 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2BD3 _ A1, 00000000(d)
        cmp     edx, eax                                ; 2BD8 _ 39. C2
        jnz     ?_158                                   ; 2BDA _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2BDC _ C6. 45, F3, 01
?_158:  cmp     byte [ebp-0DH], 0                       ; 2BE0 _ 80. 7D, F3, 00
        jz      ?_159                                   ; 2BE4 _ 74, 05
        call    task_switch                             ; 2BE6 _ E8, FFFFFFFC(rel)
?_159:  add     dword [ebp-0CH], 1                      ; 2BEB _ 83. 45, F4, 01
?_160:  cmp     dword [ebp-0CH], 499                    ; 2BEF _ 81. 7D, F4, 000001F3
        jle     ?_157                                   ; 2BF6 _ 0F 8E, FFFFFF42
        nop                                             ; 2BFC _ 90
        leave                                           ; 2BFD _ C9
        ret                                             ; 2BFE _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2BFF _ 55
        mov     ebp, esp                                ; 2C00 _ 89. E5
        mov     eax, timerctl                           ; 2C02 _ B8, 000003C0(d)
        pop     ebp                                     ; 2C07 _ 5D
        ret                                             ; 2C08 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2C09 _ 55
        mov     ebp, esp                                ; 2C0A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2C0C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2C0F _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2C12 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2C15 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2C18 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2C1B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2C1D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2C20 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2C23 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C26 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2C29 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C30 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C33 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C3A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2C3D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C44 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2C47 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2C4A _ 89. 50, 18
        nop                                             ; 2C4D _ 90
        pop     ebp                                     ; 2C4E _ 5D
        ret                                             ; 2C4F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2C50 _ 55
        mov     ebp, esp                                ; 2C51 _ 89. E5
        sub     esp, 24                                 ; 2C53 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2C56 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2C59 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2C5C _ 83. 7D, 08, 00
        jnz     ?_161                                   ; 2C60 _ 75, 0A
        mov     eax, 4294967295                         ; 2C62 _ B8, FFFFFFFF
        jmp     ?_165                                   ; 2C67 _ E9, 0000009E

?_161:  mov     eax, dword [ebp+8H]                     ; 2C6C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C6F _ 8B. 40, 10
        test    eax, eax                                ; 2C72 _ 85. C0
        jnz     ?_162                                   ; 2C74 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2C76 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2C79 _ 8B. 40, 14
        or      eax, 01H                                ; 2C7C _ 83. C8, 01
        mov     edx, eax                                ; 2C7F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2C81 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2C84 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2C87 _ B8, FFFFFFFF
        jmp     ?_165                                   ; 2C8C _ EB, 7C

?_162:  mov     eax, dword [ebp+8H]                     ; 2C8E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2C91 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2C93 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C96 _ 8B. 40, 04
        add     edx, eax                                ; 2C99 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 2C9B _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 2C9F _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2CA1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2CA4 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2CA7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CAA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2CAD _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2CB0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2CB3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2CB6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CB9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2CBC _ 39. C2
        jnz     ?_163                                   ; 2CBE _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2CC0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2CC3 _ C7. 40, 04, 00000000
?_163:  mov     eax, dword [ebp+8H]                     ; 2CCA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CCD _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2CD0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2CD3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2CD6 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2CD9 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2CDC _ 8B. 40, 18
        test    eax, eax                                ; 2CDF _ 85. C0
        jz      ?_164                                   ; 2CE1 _ 74, 22
        mov     eax, dword [ebp+8H]                     ; 2CE3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2CE6 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2CE9 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2CEC _ 83. F8, 02
        jz      ?_164                                   ; 2CEF _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 2CF1 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2CF4 _ 8B. 40, 18
        sub     esp, 8                                  ; 2CF7 _ 83. EC, 08
        push    0                                       ; 2CFA _ 6A, 00
        push    eax                                     ; 2CFC _ 50
        call    task_run                                ; 2CFD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D02 _ 83. C4, 10
?_164:  mov     eax, 0                                  ; 2D05 _ B8, 00000000
?_165:  leave                                           ; 2D0A _ C9
        ret                                             ; 2D0B _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2D0C _ 55
        mov     ebp, esp                                ; 2D0D _ 89. E5
        sub     esp, 16                                 ; 2D0F _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2D12 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2D15 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2D18 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D1B _ 8B. 40, 0C
        cmp     edx, eax                                ; 2D1E _ 39. C2
        jnz     ?_166                                   ; 2D20 _ 75, 07
        mov     eax, 4294967295                         ; 2D22 _ B8, FFFFFFFF
        jmp     ?_168                                   ; 2D27 _ EB, 51

?_166:  mov     eax, dword [ebp+8H]                     ; 2D29 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2D2C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2D2E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D31 _ 8B. 40, 08
        add     eax, edx                                ; 2D34 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D36 _ 0F B6. 00
        movzx   eax, al                                 ; 2D39 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2D3C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2D3F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D42 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2D45 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D48 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D4B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2D4E _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2D51 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2D54 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D57 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2D5A _ 39. C2
        jnz     ?_167                                   ; 2D5C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2D5E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2D61 _ C7. 40, 08, 00000000
?_167:  mov     eax, dword [ebp+8H]                     ; 2D68 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D6B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2D6E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D71 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2D74 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2D77 _ 8B. 45, FC
?_168:  leave                                           ; 2D7A _ C9
        ret                                             ; 2D7B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2D7C _ 55
        mov     ebp, esp                                ; 2D7D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2D7F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2D82 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2D85 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D88 _ 8B. 40, 10
        sub     edx, eax                                ; 2D8B _ 29. C2
        mov     eax, edx                                ; 2D8D _ 89. D0
        pop     ebp                                     ; 2D8F _ 5D
        ret                                             ; 2D90 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2D91 _ 55
        mov     ebp, esp                                ; 2D92 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2D94 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_169                                   ; 2D9B _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2D9D _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2DA4 _ 8B. 45, 0C
        shr     eax, 12                                 ; 2DA7 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2DAA _ 89. 45, 0C
?_169:  mov     eax, dword [ebp+0CH]                    ; 2DAD _ 8B. 45, 0C
        mov     edx, eax                                ; 2DB0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DB2 _ 8B. 45, 08
        mov     word [eax], dx                          ; 2DB5 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 2DB8 _ 8B. 45, 10
        mov     edx, eax                                ; 2DBB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DBD _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 2DC0 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 2DC4 _ 8B. 45, 10
        sar     eax, 16                                 ; 2DC7 _ C1. F8, 10
        mov     edx, eax                                ; 2DCA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DCC _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2DCF _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2DD2 _ 8B. 45, 14
        mov     edx, eax                                ; 2DD5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DD7 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2DDA _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2DDD _ 8B. 45, 0C
        shr     eax, 16                                 ; 2DE0 _ C1. E8, 10
        and     eax, 0FH                                ; 2DE3 _ 83. E0, 0F
        mov     edx, eax                                ; 2DE6 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 2DE8 _ 8B. 45, 14
        sar     eax, 8                                  ; 2DEB _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2DEE _ 83. E0, F0
        or      eax, edx                                ; 2DF1 _ 09. D0
        mov     edx, eax                                ; 2DF3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DF5 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2DF8 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2DFB _ 8B. 45, 10
        shr     eax, 24                                 ; 2DFE _ C1. E8, 18
        mov     edx, eax                                ; 2E01 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2E03 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2E06 _ 88. 50, 07
        nop                                             ; 2E09 _ 90
        pop     ebp                                     ; 2E0A _ 5D
        ret                                             ; 2E0B _ C3
; set_segmdesc End of function

task_init:; Function begin
        push    ebp                                     ; 2E0C _ 55
        mov     ebp, esp                                ; 2E0D _ 89. E5
        sub     esp, 24                                 ; 2E0F _ 83. EC, 18
        call    get_addr_gdt                            ; 2E12 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2E17 _ 89. 45, F0
        sub     esp, 8                                  ; 2E1A _ 83. EC, 08
        push    608                                     ; 2E1D _ 68, 00000260
        push    dword [ebp+8H]                          ; 2E22 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2E25 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E2A _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 2E2D _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 2E32 _ C7. 45, EC, 00000000
        jmp     ?_171                                   ; 2E39 _ EB, 75

?_170:  mov     edx, dword [taskctl]                    ; 2E3B _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 2E41 _ 8B. 45, EC
        imul    eax, eax, 116                           ; 2E44 _ 6B. C0, 74
        add     eax, edx                                ; 2E47 _ 01. D0
        add     eax, 16                                 ; 2E49 _ 83. C0, 10
        mov     dword [eax+10H], 0                      ; 2E4C _ C7. 40, 10, 00000000
        mov     ecx, dword [taskctl]                    ; 2E53 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 2E59 _ 8B. 45, EC
        add     eax, 7                                  ; 2E5C _ 83. C0, 07
        lea     edx, [eax*8]                            ; 2E5F _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 2E66 _ 8B. 45, EC
        imul    eax, eax, 116                           ; 2E69 _ 6B. C0, 74
        add     eax, ecx                                ; 2E6C _ 01. C8
        add     eax, 16                                 ; 2E6E _ 83. C0, 10
        mov     dword [eax+0CH], edx                    ; 2E71 _ 89. 50, 0C
        mov     eax, dword [taskctl]                    ; 2E74 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 2E79 _ 8B. 55, EC
        imul    edx, edx, 116                           ; 2E7C _ 6B. D2, 74
        add     edx, 16                                 ; 2E7F _ 83. C2, 10
        add     eax, edx                                ; 2E82 _ 01. D0
        add     eax, 24                                 ; 2E84 _ 83. C0, 18
        mov     ecx, eax                                ; 2E87 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 2E89 _ 8B. 45, EC
        add     eax, 7                                  ; 2E8C _ 83. C0, 07
        lea     edx, [eax*8]                            ; 2E8F _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 2E96 _ 8B. 45, F0
        add     eax, edx                                ; 2E99 _ 01. D0
        push    137                                     ; 2E9B _ 68, 00000089
        push    ecx                                     ; 2EA0 _ 51
        push    103                                     ; 2EA1 _ 6A, 67
        push    eax                                     ; 2EA3 _ 50
        call    set_segmdesc                            ; 2EA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EA9 _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 2EAC _ 83. 45, EC, 01
?_171:  cmp     dword [ebp-14H], 4                      ; 2EB0 _ 83. 7D, EC, 04
        jle     ?_170                                   ; 2EB4 _ 7E, 85
        call    task_alloc                              ; 2EB6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2EBB _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2EBE _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 2EC1 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 2EC8 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 2ECB _ C7. 40, 08, 00000064
        mov     eax, dword [taskctl]                    ; 2ED2 _ A1, 00002308(d)
        mov     dword [eax], 1                          ; 2ED7 _ C7. 00, 00000001
        mov     eax, dword [taskctl]                    ; 2EDD _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 2EE2 _ C7. 40, 04, 00000000
        mov     eax, dword [taskctl]                    ; 2EE9 _ A1, 00002308(d)
        mov     edx, dword [ebp-0CH]                    ; 2EEE _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 2EF1 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2EF4 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 2EF7 _ 8B. 00
        sub     esp, 12                                 ; 2EF9 _ 83. EC, 0C
        push    eax                                     ; 2EFC _ 50
        call    load_tr                                 ; 2EFD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F02 _ 83. C4, 10
        call    timer_alloc                             ; 2F05 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 2F0A _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 2F0F _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 2F12 _ 8B. 40, 08
        mov     edx, eax                                ; 2F15 _ 89. C2
        mov     eax, dword [task_timer]                 ; 2F17 _ A1, 00002304(d)
        sub     esp, 8                                  ; 2F1C _ 83. EC, 08
        push    edx                                     ; 2F1F _ 52
        push    eax                                     ; 2F20 _ 50
        call    timer_settime                           ; 2F21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F26 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2F29 _ 8B. 45, F4
        leave                                           ; 2F2C _ C9
        ret                                             ; 2F2D _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 2F2E _ 55
        mov     ebp, esp                                ; 2F2F _ 89. E5
        sub     esp, 16                                 ; 2F31 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2F34 _ C7. 45, F8, 00000000
        jmp     ?_174                                   ; 2F3B _ E9, 000000E2

?_172:  mov     edx, dword [taskctl]                    ; 2F40 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 2F46 _ 8B. 45, F8
        imul    eax, eax, 116                           ; 2F49 _ 6B. C0, 74
        add     eax, edx                                ; 2F4C _ 01. D0
        add     eax, 16                                 ; 2F4E _ 83. C0, 10
        mov     eax, dword [eax+10H]                    ; 2F51 _ 8B. 40, 10
        test    eax, eax                                ; 2F54 _ 85. C0
        jne     ?_173                                   ; 2F56 _ 0F 85, 000000C2
        mov     eax, dword [taskctl]                    ; 2F5C _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 2F61 _ 8B. 55, F8
        imul    edx, edx, 116                           ; 2F64 _ 6B. D2, 74
        add     edx, 16                                 ; 2F67 _ 83. C2, 10
        add     eax, edx                                ; 2F6A _ 01. D0
        add     eax, 12                                 ; 2F6C _ 83. C0, 0C
        mov     dword [ebp-4H], eax                     ; 2F6F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2F72 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 2F75 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 2F7C _ 8B. 45, FC
        mov     dword [eax+30H], 514                    ; 2F7F _ C7. 40, 30, 00000202
        mov     eax, dword [ebp-4H]                     ; 2F86 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 2F89 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 2F90 _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 2F93 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 2F9A _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 2F9D _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FA4 _ 8B. 45, FC
        mov     dword [eax+40H], 0                      ; 2FA7 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FAE _ 8B. 45, FC
        mov     dword [eax+48H], 0                      ; 2FB1 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 2FB8 _ 8B. 45, F8
        add     eax, 1                                  ; 2FBB _ 83. C0, 01
        shl     eax, 9                                  ; 2FBE _ C1. E0, 09
        mov     edx, eax                                ; 2FC1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2FC3 _ 8B. 45, FC
        mov     dword [eax+44H], edx                    ; 2FC6 _ 89. 50, 44
        mov     eax, dword [ebp-4H]                     ; 2FC9 _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 2FCC _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FD3 _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 2FD6 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FDD _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 2FE0 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FE7 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 2FEA _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FF1 _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 2FF4 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 2FFB _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 2FFE _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3005 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 3008 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 300F _ 8B. 45, FC
        mov     dword [eax+70H], 1073741824             ; 3012 _ C7. 40, 70, 40000000
        mov     eax, dword [ebp-4H]                     ; 3019 _ 8B. 45, FC
        jmp     ?_175                                   ; 301C _ EB, 13

?_173:  add     dword [ebp-8H], 1                       ; 301E _ 83. 45, F8, 01
?_174:  cmp     dword [ebp-8H], 4                       ; 3022 _ 83. 7D, F8, 04
        jle     ?_172                                   ; 3026 _ 0F 8E, FFFFFF14
        mov     eax, 0                                  ; 302C _ B8, 00000000
?_175:  leave                                           ; 3031 _ C9
        ret                                             ; 3032 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3033 _ 55
        mov     ebp, esp                                ; 3034 _ 89. E5
        cmp     dword [ebp+0CH], 0                      ; 3036 _ 83. 7D, 0C, 00
        jle     ?_176                                   ; 303A _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 303C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 303F _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3042 _ 89. 50, 08
?_176:  mov     eax, dword [ebp+8H]                     ; 3045 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3048 _ C7. 40, 04, 00000002
        mov     eax, dword [taskctl]                    ; 304F _ A1, 00002308(d)
        mov     edx, dword [taskctl]                    ; 3054 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx]                        ; 305A _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 305C _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 305F _ 89. 4C 90, 08
        mov     eax, dword [taskctl]                    ; 3063 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3068 _ 8B. 10
        add     edx, 1                                  ; 306A _ 83. C2, 01
        mov     dword [eax], edx                        ; 306D _ 89. 10
        nop                                             ; 306F _ 90
        pop     ebp                                     ; 3070 _ 5D
        ret                                             ; 3071 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3072 _ 55
        mov     ebp, esp                                ; 3073 _ 89. E5
        sub     esp, 24                                 ; 3075 _ 83. EC, 18
        mov     eax, dword [taskctl]                    ; 3078 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 307D _ 8B. 00
        cmp     eax, 1                                  ; 307F _ 83. F8, 01
        jle     ?_178                                   ; 3082 _ 7E, 7E
        mov     eax, dword [taskctl]                    ; 3084 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 3089 _ 8B. 50, 04
        add     edx, 1                                  ; 308C _ 83. C2, 01
        mov     dword [eax+4H], edx                     ; 308F _ 89. 50, 04
        mov     eax, dword [taskctl]                    ; 3092 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 3097 _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 309A _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 309F _ 8B. 00
        cmp     edx, eax                                ; 30A1 _ 39. C2
        jnz     ?_177                                   ; 30A3 _ 75, 0C
        mov     eax, dword [taskctl]                    ; 30A5 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 30AA _ C7. 40, 04, 00000000
?_177:  mov     eax, dword [taskctl]                    ; 30B1 _ A1, 00002308(d)
        mov     edx, dword [taskctl]                    ; 30B6 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 30BC _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 30BF _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 30C3 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 30C6 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 30C9 _ 8B. 40, 08
        mov     edx, eax                                ; 30CC _ 89. C2
        mov     eax, dword [task_timer]                 ; 30CE _ A1, 00002304(d)
        sub     esp, 8                                  ; 30D3 _ 83. EC, 08
        push    edx                                     ; 30D6 _ 52
        push    eax                                     ; 30D7 _ 50
        call    timer_settime                           ; 30D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30DD _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 30E0 _ A1, 00002308(d)
        mov     edx, dword [taskctl]                    ; 30E5 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 30EB _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 30EE _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 30F2 _ 8B. 00
        sub     esp, 8                                  ; 30F4 _ 83. EC, 08
        push    eax                                     ; 30F7 _ 50
        push    0                                       ; 30F8 _ 6A, 00
        call    farjmp                                  ; 30FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30FF _ 83. C4, 10
?_178:  nop                                             ; 3102 _ 90
        leave                                           ; 3103 _ C9
        ret                                             ; 3104 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3105 _ 55
        mov     ebp, esp                                ; 3106 _ 89. E5
        sub     esp, 24                                 ; 3108 _ 83. EC, 18
        mov     byte [ebp-0DH], 0                       ; 310B _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 310F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3112 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3115 _ 83. F8, 02
        jne     ?_188                                   ; 3118 _ 0F 85, 000000ED
        mov     eax, dword [taskctl]                    ; 311E _ A1, 00002308(d)
        mov     edx, dword [taskctl]                    ; 3123 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 3129 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 312C _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3130 _ 3B. 45, 08
        jnz     ?_179                                   ; 3133 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3135 _ C6. 45, F3, 01
?_179:  mov     dword [ebp-0CH], 0                      ; 3139 _ C7. 45, F4, 00000000
        jmp     ?_182                                   ; 3140 _ EB, 17

?_180:  mov     eax, dword [taskctl]                    ; 3142 _ A1, 00002308(d)
        mov     edx, dword [ebp-0CH]                    ; 3147 _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 314A _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 314E _ 3B. 45, 08
        jnz     ?_181                                   ; 3151 _ 75, 02
        jmp     ?_183                                   ; 3153 _ EB, 10

?_181:  add     dword [ebp-0CH], 1                      ; 3155 _ 83. 45, F4, 01
?_182:  mov     eax, dword [taskctl]                    ; 3159 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 315E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3160 _ 3B. 45, F4
        jg      ?_180                                   ; 3163 _ 7F, DD
?_183:  mov     eax, dword [taskctl]                    ; 3165 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 316A _ 8B. 10
        sub     edx, 1                                  ; 316C _ 83. EA, 01
        mov     dword [eax], edx                        ; 316F _ 89. 10
        mov     eax, dword [taskctl]                    ; 3171 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 3176 _ 8B. 40, 04
        cmp     eax, dword [ebp-0CH]                    ; 3179 _ 3B. 45, F4
        jle     ?_184                                   ; 317C _ 7E, 0E
        mov     eax, dword [taskctl]                    ; 317E _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 3183 _ 8B. 50, 04
        sub     edx, 1                                  ; 3186 _ 83. EA, 01
        mov     dword [eax+4H], edx                     ; 3189 _ 89. 50, 04
?_184:  jmp     ?_186                                   ; 318C _ EB, 20

?_185:  mov     eax, dword [taskctl]                    ; 318E _ A1, 00002308(d)
        mov     edx, dword [taskctl]                    ; 3193 _ 8B. 15, 00002308(d)
        mov     ecx, dword [ebp-0CH]                    ; 3199 _ 8B. 4D, F4
        add     ecx, 1                                  ; 319C _ 83. C1, 01
        mov     ecx, dword [edx+ecx*4+8H]               ; 319F _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 31A3 _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 31A6 _ 89. 4C 90, 08
        add     dword [ebp-0CH], 1                      ; 31AA _ 83. 45, F4, 01
?_186:  mov     eax, dword [taskctl]                    ; 31AE _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 31B3 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 31B5 _ 3B. 45, F4
        jg      ?_185                                   ; 31B8 _ 7F, D4
        mov     eax, dword [ebp+8H]                     ; 31BA _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 31BD _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 31C4 _ 80. 7D, F3, 00
        jz      ?_188                                   ; 31C8 _ 74, 41
        mov     eax, dword [taskctl]                    ; 31CA _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 31CF _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 31D2 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 31D7 _ 8B. 00
        cmp     edx, eax                                ; 31D9 _ 39. C2
        jl      ?_187                                   ; 31DB _ 7C, 0C
        mov     eax, dword [taskctl]                    ; 31DD _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 31E2 _ C7. 40, 04, 00000000
?_187:  mov     eax, dword [taskctl]                    ; 31E9 _ A1, 00002308(d)
        mov     edx, dword [taskctl]                    ; 31EE _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 31F4 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 31F7 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 31FB _ 8B. 00
        sub     esp, 8                                  ; 31FD _ 83. EC, 08
        push    eax                                     ; 3200 _ 50
        push    0                                       ; 3201 _ 6A, 00
        call    farjmp                                  ; 3203 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3208 _ 83. C4, 10
?_188:  nop                                             ; 320B _ 90
        leave                                           ; 320C _ C9
        ret                                             ; 320D _ C3
; task_sleep End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_189:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_190:                                                  ; byte
        db 41H, 00H                                     ; 0008 _ A.

?_191:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 000A _ 3[sec].

?_192:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0011 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0019 _ sk b.

?_193:                                                  ; byte
        db 42H, 00H                                     ; 001E _ B.

?_194:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0020 _ page is:
        db 20H, 00H                                     ; 0028 _  .

?_195:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0032 _ L: .

?_196:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0036 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003E _ H: .

?_197:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0042 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 004A _ w: .


SECTION .data   align=64 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 
        dd 00000000H, 00000000H                         ; 0020 _ 0 0 
        dd 00000000H, 00000000H                         ; 0028 _ 0 0 
        dd 00000000H, 00000000H                         ; 0030 _ 0 0 
        dd 00000000H, 00000000H                         ; 0038 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0040 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0048 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0050 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0058 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0060 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0068 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0070 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0080 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0088 _ 89-456+1
        db 32H, 33H, 30H, 2EH                           ; 0090 _ 230.

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0094 _ 0X

?_198:  db 00H                                          ; 0096 _ .

?_199:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0097 _ ........
        db 00H                                          ; 009F _ .

table_rgb.1806:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 00A0 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 00A8 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 00B0 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 00B8 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00C0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........

cursor.1853:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0100 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0108 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0110 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0118 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0120 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0130 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0140 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0150 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0168 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0170 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0178 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0180 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0190 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01A8 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01B8 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C0 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01C8 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D0 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 01D8 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 01E8 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 01F8 _ .....***

closebtn.1963:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0200 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0208 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0220 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0228 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0230 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0238 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0240 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0248 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0250 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0258 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0260 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0268 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0270 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0280 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0288 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0290 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0298 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02A0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02B0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02B8 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 02C0 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 02C8 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 02D0 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 02D8 _ @@@@@@@@


SECTION .bss    align=64 noexecute                      ; section number 4, bss

bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_200:  resw    1                                       ; 0004

?_201:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_202:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    64                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_203:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  15                                      ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0180

shtMsgBox:                                              ; dword
        resd    1                                       ; 0280

shtctl: resd    1                                       ; 0284

sht_back: resd  1                                       ; 0288

sht_mouse:                                              ; dword
        resd    1                                       ; 028C

task_b: resd    1                                       ; 0290

g_timer_b:                                              ; oword
        resb    16                                      ; 0294

task_a.1739:                                            ; dword
        resd    1                                       ; 02A4

task_b.1723:                                            ; byte
        resd    6                                       ; 02A8

tss_a.1738:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1737:                                             ; byte
        resb    104                                     ; 0340

str.1901:                                               ; byte
        resb    1                                       ; 03A8

?_204:  resb    9                                       ; 03A9

?_205:  resb    14                                      ; 03B2

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


