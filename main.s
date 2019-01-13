;Author: Heather Minke
; Homework 2
; main.s
; Runs on any Cortex M processor
; A very simple first project implementing a random number generator
; Daniel Valvano
; May 4, 2012

;  This example accompanies the book
;  "Embedded Systems: Introduction to Arm Cortex M Microcontrollers",
;  ISBN: 978-1469998749, Jonathan Valvano, copyright (c) 2014
;  Section 3.3.10, Program 3.12
;
;Copyright 2014 by Jonathan W. Valvano, valvano@mail.utexas.edu
;   You may use, edit, run or distribute this file
;   as long as the above copyright notice remains
;THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
;OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
;MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
;VALVANO SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL,
;OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
;For more information about my classes, my research, and my books, see
;http://users.ece.utexas.edu/~valvano/


; we align 32 bit variables to 32-bits
; we align op codes to 16 bits
      THUMB
	                    
      AREA    |.text|, CODE, READONLY, ALIGN=2
      EXPORT  Start		;export start for Startup.s
	  IMPORT  Random	;import Random from Hw2.c
		   
Start  
	BL add64	
	BL sub64
	BL endian
		   
add64	
    MOV R1, LR			;store the return address in R1.
	BL Random			;call Random from C program.
	MOV R2, R0			;store the random value in R2.
	BL Random			;call Random from C program.
	ADD R3, R2, R0		
	BL Random
	MOV R2, R0
	BL Random
	ADD R4, R2, R0
	ADDS R4, R4, R3
	BX R1
	
sub64
	MOV R6, LR
	BL Random
	MOV R4, R0
	BL Random
	ADD R5, R4, R0
	BL Random
	MOV R4, R0
	BL Random
	ADD R6, R4, R0
	SUBS R5, R5, R6
	BX R1
	
endian
	MOV R7, LR
	BL Random
	REV R1, R0
	BL Random
	REV R2, R0
	BL Random
	REV R3, R0
	BL Random
	REV R4, R0
	BL Random
	REV R5, R0
	BL Random
	REV R6, R0
	BL Random
	REV R7, R0
	BL Random
	REV R8, R0
	BL Random
	REV R9, R0
	BL Random
	REV R10, R0
	PUSH {R1 - R10}
	BX R7
	
	ALIGN
	END