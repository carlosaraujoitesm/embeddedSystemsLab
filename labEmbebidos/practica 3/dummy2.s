
#include "include\my_samd21g18a.h"

        .equ P_BASEADDR, 0x41004400
        .equ PA_DIRCLR, 0x04
        .equ PA_DIRSET, 0x08
        .equ PA_OUTSET, 0x18
        .equ PA_OUTCLR, 0x14
        .equ PA_OUTTGL, 0x1C
        .equ PA_WRCONFIG, 0x28
        .equ PA_PINCFG27, 0x4B
        /* Register configuration */
        .equ LCD_PINMASK, 0x00000FC8
        .equ LCD_PINCFG, 0x50000FC8
        .equ LCD_RW, 0x00000008
        .equ LCD_RS, 0x00000040
        .equ LCD_EN, 0x00000080
        .section .text
        .syntax unified
        .global main
main:   ldr r0,=P_BASEADDR/* Base address of PORT*/
        ldr r1,=LCD_PINCFG
        str r1,[r0,#PA_WRCONFIG]
        ldr r1,=LCD_PINMASK
        str r1,[r0,#PA_DIRSET]
        ldr r1,=LCD_RW
        str r1,[r0,#PA_OUTCLR]/* RW = 0 Always writing */
        ldr r1,=LCD_RS
        str r1,[r0,#PA_OUTCLR]/* RW = 0 Sending commands from here */
        //First 4 Data to set as 4-bits ******************************************************************/
        //One sends 0x03
        ldr r1,=LCD_EN // 0x03 - - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x03 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        //Two sends 0x03
        ldr r1,=LCD_EN // 0x03 - - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x03 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        //Three sends 0x03
        ldr r1,=LCD_EN // 0x03 - - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x03 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        //Four sends 0x02
        ldr r1,=LCD_EN // 0x02 - - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x02 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        //First Data to configure
        ldr r1,=LCD_EN // 2 of the 0x28 command - 4-bit mode
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x02 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // 8 of the 0x28 command - 4-bit mode
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x08 << 8)
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        // Second Data to configure **********************************************************************/
        ldr r1,=LCD_EN // 0 of the 0x08 - Cursor ON - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x00 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // 8 of the 0x08 - Cursor ON - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        // Third Data to configure ***********************************************************************/
        ldr r1,=LCD_EN // 0 of the 0x02 - Cursor HOME - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x00 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // 2 of the 0x02 - Cursor HOME - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x02 << 8)
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        // Fourth Data to configure **********************************************************************/
        ldr r1,=LCD_EN // 0 of the 0x01 - Clear Screen - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x00 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // 1 of the 0x01 - Clear Screen - Initialization sequence
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x01 << 8)
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        // Sending Info *********************************************************************************/
        ldr r1,=LCD_RS
        str r1,[r0,#PA_OUTSET]
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x04 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // 1 of the 0x41 (letter 'A')
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x01 << 8)
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // 5 of the 0x5A (letter 'Z')
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x05 << 8)
        str r1,[r0,#PA_OUTSET]/* Send high significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
        ldr r1,=LCD_EN // A of the 0x5A (letter 'Z')
        str r1,[r0,#PA_OUTSET]/* EN = 1 */
        ldr r1,=(0x0F << 8)
        str r1,[r0,#PA_OUTCLR]/* Clear nibble */
        ldr r1,=(0x0A << 8)
        str r1,[r0,#PA_OUTSET]/* Send low significant nibble */
        ldr r1,=LCD_EN
        str r1,[r0,#PA_OUTCLR]/* EN = 0 */
here:   b here
        ldr r1, =foo/* Use the dummy variable, or it won't reserve .bss memory */
        .section .bss
foo:    .word 0/* Dummy variable for testing */
        .section ".vectors"
        .global exceptiontable
exceptiontable:
        .extern _estack
        /* the linker script creates this symbol, pointing to the top of the stack section */
        .word _estack/* Initial Stack Pointer */
        .word main+1/* Start address (+1 means "thumb mode") */
        .end
