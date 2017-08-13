ckernel : ckernel_u.asm 
	cp ckernel_u.asm win_sheet.h win_sheet.c mem_util.h mem_util.c write_vga_desktop.c timer.c timer.h global_define.h global_define.c multi_task.c multi_task.h makefile '/media/psf/Home/Documents/操作系统/文档/19/OS-kernel-win-sheet/'
ckernel_u.asm : ckernel.o
	./objconv -fnasm ckernel.o ckernel_u.asm
ckernel.o : write_vga_desktop.o win_sheet.o mem_util.o timer.o global_define.o multi_task.o
	ld -m elf_i386 -r write_vga_desktop.o mem_util.o win_sheet.o timer.o global_define.o multi_task.o -o ckernel.o
write_vga_desktop.o : write_vga_desktop.c win_sheet.c win_sheet.h mem_util.c mem_util.h timer.c timer.h global_define.c global_define.h multi_task.c multi_task.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c
win_sheet.o : win_sheet.c win_sheet.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o win_sheet.o win_sheet.c
mem_util.o : mem_util.h mem_util.c
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o mem_util.o mem_util.c
timer.o : timer.c timer.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o timer.o timer.c
global_define.o: global_define.c global_define.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o global_define.o global_define.c
multi_task.o : multi_task.c multi_task.h
	gcc -m32 -fno-asynchronous-unwind-tables -s -c -o multi_task.o multi_task.c
