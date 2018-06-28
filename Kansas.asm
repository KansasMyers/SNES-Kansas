 ; Este código está no domínio público. -> https://en.wikibooks.org/wiki/Super_NES_Programming
 .include "Header.inc"
 .include "Snes_Init.asm"
 
 VBlank:
   RTI
   
 ;========================
 ; Começando a CODAR
 ;========================
 .bank 0
 .section "MainCode"
 
 Start:
     ; Chamando o método de para 'Startar' o SNES.
     Snes_Init
 
     ; O Código abaixo seta a cor do fundo para Azul
     sep     #$20        ; Setando o Registrador A como 8-Bit
     lda     #%10000000  ; Forçando o VBlank a desligar a tela.
     sta     $2100
     ;Formato RGB em binário: 0bbbbbgg gggrrrrr - 00000000 11100000 = Verde - 01111100 00000000 - Azul
     lda     #%00000000  ; Carregando o byte 'Baixo' da cor azul.
     sta     $2122
     lda     #%01111100  ; Carregando o byte 'Alto' da cor azul.
     sta     $2122
     lda     #%00001111  ; Encerrando o VBlank e setando o brilho para 15 (100%). Bin: 00001111 = Dec: 15
     sta     $2100
 
     ; Loop forever :D.
 Forever:
     jmp Forever
 
 .ends
