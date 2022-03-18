CR	EQU	$0D
LF	EQU	$0A

    ORG    $1000
START:                  
    LEA         TEXT, A1
    MOVE.B      #14, D0
    TRAP        #15
    
    Move.B #5, $5000   ;game point
    Move.B #3, $2050     ;Health
    
Game_Loop:

    Move.B $5000,D2     ;
    Move.B $2050,D6     ;
    
    BSR M1
    BSR M2
    BSR M3
    BSR M4
    BSR M5
    
    CMP #0, D2
    BEQ Win_Game
    BNE Lose_Game
       
M1:
    LEA         Q, A1
    MOVE.B      #14, D0
    TRAP        #15

    LEA Q1, A1
    MOVE.B #14, D0
    TRAP #15
    
    MOVE #4, D0
    TRAP #15
  
    CMP #3, D1 COMPARE WITH 1
    BEQ Correct
    BNE Wrong
    RTS

M2:
    LEA         Q, A1
    MOVE.B      #14, D0
    TRAP        #15

    LEA Q2, A1
    MOVE.B #14, D0
    TRAP #15
    
    MOVE #4, D0
    TRAP #15
  
    CMP #3, D1 COMPARE WITH 1
    BEQ Correct
    BNE Wrong
    RTS
    
M3:
    LEA         Q, A1
    MOVE.B      #14, D0
    TRAP        #15

    LEA Q3, A1
    MOVE.B #14, D0
    TRAP #15
    
    MOVE #4, D0
    TRAP #15
  
    CMP #2, D1 COMPARE WITH 1
    BEQ Correct
    BNE Wrong
    RTS

M4:
    LEA         Q, A1
    MOVE.B      #14, D0
    TRAP        #15

    LEA Q4, A1
    MOVE.B #14, D0
    TRAP #15
    
    MOVE #4, D0
    TRAP #15
  
    CMP #1, D1 COMPARE WITH 1
    BEQ Correct
    BNE Wrong
    RTS


M5:
    LEA         Q, A1
    MOVE.B      #14, D0
    TRAP        #15

    LEA Q5, A1
    MOVE.B #14, D0
    TRAP #15
    
    MOVE #4, D0
    TRAP #15
  
    CMP #1, D1 COMPARE WITH 1
    BEQ Correct
    BNE Wrong
    RTS
    
Correct:    
    SUB #1 , D2
    
    LEA         Yes, A1
    MOVE.B      #14, D0
    TRAP        #15

    RTS

Wrong:
    *CMP #0,D6
    *BRA Lose_Game
    ADD #1,D2
  
    LEA         No, A1
    MOVE.B      #14, D0
    TRAP        #15
    RTS
Win_GAME:
    LEA         Win, A1
    MOVE.B      #14, D0
    TRAP        #15
    RTS
Lose_Game:
    LEA         LOSE, A1
    MOVE.B      #14, D0
    TRAP        #15
    RTS
    
    
        SIMHALT             ; halt simulator
TEXT    DC.B        '------The World Need Your Help!!------', CR,LF
        dc.b        '            *             .-.', CR,LF
        DC.b        '        .-""`""-.       |(@ @)', CR,LF
        dc.b        '     _/`oOoOoOoOo`\_    \ \-/', CR,LF
        dc.b        '    \.-=-=-=-=-=-=-./    \/ \', CR,LF
        dc.b        '      \-=.=-.-=.=-/       \ /\ ', CR,LF
        dc.b        '         ^  ^  ^          _H_ \', CR,LF
        DC.B        '                                   ', CR,LF      
        DC.B        'One Day,', CR,LF
        DC.B        'An Alien came they are trying to save the Earth,', CR,LF
        DC.B        'But they realised that the Earth was dying. ', CR,LF
        DC.B        'They captured the lead of Earth and told him ', CR,LF
        DC.B        'If you answer all five questions correctly, ', CR,LF
        DC.B        'then I will release you.  ', CR,LF,0
        
Q       DC.B        '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~', CR,LF
        DC.B        '----------What should you do?----------', CR,LF
        DC.B        'Please answer the question with number 1-4.', CR,LF
        DC.B        '', CR,LF,0
    
    
Q1      DC.B '~Q1: Which of the following materials cannot be recycled?', CR,LF
        Dc.b '~1. Breast implant silicone', CR,LF
        Dc.b '~2. Fake nails', CR,LF
        Dc.b '~3. Condoms', CR,LF
        Dc.b '~Input answer here', CR,LF
        Dc.b 'V V V V', CR,LF,0
        
Q2      DC.B '~Q2: Which country has the worst air polution?', CR,LF
        Dc.b '~1. South Korea', CR,LF
        Dc.b '~2. China', CR,LF
        Dc.b '~3. Bangladesh', CR,LF
        Dc.b '~Input answer here', CR,LF
        Dc.b 'V V V V', CR,LF,0
        
Q3      DC.B '~Q3: What is global warming?', CR,LF
        Dc.b '~1. Warming of the globe', CR,LF
        Dc.b '~2. Gradual increase in the overall temperature of the earth`s atmosphere', CR,LF
        Dc.b '~3. The globe having a bit of fever', CR,LF
        Dc.b '~Input answer here', CR,LF
        Dc.b 'V V V V', CR,LF,0

Q4      DC.B '~Q4: Which animal is becoming extinct due to climate change?', CR,LF
        Dc.b '~1. Koala', CR,LF
        Dc.b '~2. Dogs', CR,LF
        Dc.b '~3. Humans', CR,LF
        Dc.b '~Input answer here', CR,LF
        Dc.b 'V V V V', CR,LF,0

Q5      DC.B '~Q5: What impacts will global warming have in the future?', CR,LF
        Dc.b '~1. Increased heat, drought and insect outbreaks', CR,LF
        Dc.b '~2. Unable to find a wife', CR,LF
        Dc.b '~3. No more sesh', CR,LF
        Dc.b '~Input answer here', CR,LF
        Dc.b 'V V V V', CR,LF,0


Yes DC.B '~Correct!   \(^ w ^)/', CR,LF,0
No  DC.B '~Wrong!     ~(-__-)~ ', CR,LF,0

Win     DC.B        'You Win!! You save all the human!Please continue to protect the Earth', CR,LF
        DC.B        'THANKS FOR PLAYING, GG!', CR,LF,0

LOSE    DC.B        'Defeat. The aliens have eliminated all humans ', CR,LF
        DC.B        'The Earth have returned back to its original owners', CR,LF
        DC.B        'THANKS FOR PLAYING, GG!', CR,LF,0


    END    START        ; last line of sourc

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
