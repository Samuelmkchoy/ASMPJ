*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
CR	EQU	$0D
LF	EQU	$0A

    ORG    $1000
START:                  
    LEA         TEXT, A1
    MOVE.B      #14, D0
    TRAP        #15
    
    Move.L #100,$5000   ;game point
    Move.L #5,$4000     ;
    Move.L #2,$3000     ;
    Move.L #4,$2000     ;
    Move.L #3,$2050     ;Health
    
Game_Loop:
    LEA         Q, A1
    MOVE.B      #14, D0
    TRAP        #15

    Move.L $5000,D2     ;
    Move.L $4000,D3     ;
    Move.L $3000,D4     ;
    Move.L $2000,D5     ;
    Move.L $2050,D6     ;
    
    *CMP #0,D6
    *BRA Lose_Game
    SUB #20,D2
    Move.L D2,$5000
    CMP #0,D2
    BNE Game_Loop
    BRA End_Game
    

    
Lose_Game:
    LEA         LOSE, A1
    MOVE.B      #14, D0
    TRAP        #15
    
END_GAME:
    LEA         MESSAGE, A1
    MOVE.B      #14, D0
    TRAP        #15
    
    
    SIMHALT             ; halt simulator
TEXT    DC.B      '------The World Need Your Help!!------', CR,LF
        DC.B      'Please answer the question with number 1-4.', CR,LF,0

Q      DC.B      '----------What should you do?----------', CR,LF,0
MESSAGE DC.B      'THANKS FOR PLAYING, GG!', CR,LF,0

LOSE    DC.B      'You Lose, Nice Try', CR,LF,0


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
