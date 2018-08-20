
#include "include\my_samd21g18a.h"

			.section .text
			.syntax unified
			.global main

main:		ldr r0,=0x4100443A      /* Address of PINCFG10 */
			ldr r1,=0x00000000		/* Make sure PMUXEN=0 (disable peripheral functions)*/
			strb r1,[r0]            /* PINCFG is an 8-bit register*/

			ldr r0,=0x41004400      /* base address of PORT*/
			ldr r1,=0x08000400		/* mask for bit 10*/
			str r1,[r0,#0x08]		/* write to DIRSET register, bit 10 as output*/

			str r1,[r0,#0x14]		/* write to OUTCRL register, output a logic 0 at PA10 active low LED */
			str r1,[r0,#0x1C]		/* write to OUTTGL register, output toogle at PA10 active low LED */
			str r1,[r0,#0x1C]		/* write to OUTTGL register, output toogle at PA10 active low LED */
			str r1,[r0,#0x1C]		/* write to OUTTGL register, output toogle at PA10 active low LED */
			str r1,[r0,#0x1C]		/* write to OUTTGL register, output toogle at PA10 active low LED */

here:		b here

			ldr		r1, =foo	/* Use the dummy variable, or it won't reserve .bss memory */

			.section .bss
foo:		.word 0			/* Dummy variable for testing */


/* Valuable information for creating this section can be obtained from the startup files present in the
 * Device_Startup folder, especially the .c files that are created for a normal C project.
 * They were renamed to header files in this project, to disable them.
 */
			.section ".vectors"
			.global exceptiontable
exceptiontable:
			.extern _estack			/* the linker script creates this symbol, pointing to the top of the stack section */
			.word _estack		/* Initial Stack Pointer */
			.word main+1		/* Start address (+1 means "thumb mode") */
			.end
