

'Cards with

SUB init_decks

	RANDOMIZE TIMER	
	FOR i% = 1 TO 40
			rno = INT(RND * 40) + 1
				
				if rno < 11 then
					PlayerDeck(i%).CARDTYPE = 1 'Invoke'
					PlayerDeck(i%).SUBID = 0 'All invoke cards are the same'
					PlayerDeck(i%).POSITION = 1 'Decked'
					
				elseif rno > 10 and rno < 25 then
					PlayerDeck(i%).CARDTYPE = 2 'Booster'
					PlayerDeck(i%).SUBID = 0 'All boosters are the same'
					PlayerDeck(i%).POSITION = 1
					
				elseif rno > 24 and rno < 33 then
					PlayerDeck(i%).CARDTYPE = 3 'Effect card'
					PlayerDeck(i%).SUBID = rno - 24 '(1 to 8)
					PlayerDeck(i%).POSITION = 1
					 
				elseif rno > 32 and rno < 41 then
					PlayerDeck(i%).CARDTYPE = 4 'Equipable'
					PlayerDeck(i%).SUBID = rno - 32 '(1 to 8)
					PlayerDeck(i%).POSITION = 1
				endif

		NEXT i%
		
		
	FOR i% = 1 TO 40
		
			rno = INT(RND * 40) + 1

			IF rno < 11 THEN
				FoeDeck(i%).CARDTYPE = 1   ' Invoke
				FoeDeck(i%).SUBID = 0
				FoeDeck(i%).POSITION = 1

			ELSEIF rno < 25 THEN
				FoeDeck(i%).CARDTYPE = 2   ' Booster
				FoeDeck(i%).SUBID = 0
				FoeDeck(i%).POSITION = 1

			ELSEIF rno < 33 THEN
				FoeDeck(i%).CARDTYPE = 3   ' Effect
				FoeDeck(i%).SUBID = rno - 24   ' 1 to 8
				FoeDeck(i%).POSITION = 1

			ELSE
				FoeDeck(i%).CARDTYPE = 4   ' Equipable
				FoeDeck(i%).SUBID = rno - 32   ' 1 to 8
				FoeDeck(i%).POSITION = 1
			END IF
			
	NEXT i%

END SUB
