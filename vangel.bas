REM $INCLUDE: 'RelLib.BI'

'Define types first'

DEFINT A-Z


'''''''''''''''''
'''Dex/Static types'
''''''''''''''''''''

'Actual monster cards'
TYPE Familiar
    UNAME      AS STRING * 12
    HEARTS     AS INTEGER
    ELEMENT    AS INTEGER
    PASSIVE    AS INTEGER   ' passive ID
    COOLDOWN   AS INTEGER
END TYPE

'Effect cards'
TYPE Effect
    UNAME       AS STRING * 16
    DESCRIPTION AS STRING * 48
END TYPE

'Moves'

TYPE Move
    UNAME        AS STRING * 16
    DESCRIPTION  AS STRING * 48
    POWER        AS INTEGER
    STATUS       AS INTEGER
    CFCHECK      AS INTEGER
    CFSECONDARY  AS INTEGER
    BOOSTERSCALE AS INTEGER
END TYPE

'Equipable cards'

TYPE Equipable
    UNAME       AS STRING * 16
    ELEMENT     AS INTEGER
    ADDMOVE     AS INTEGER
END TYPE
'Turn to turn passive abilities'

TYPE PASSIVE
    UNAME AS STRING * 16
END TYPE


''''''''''''''''''''
'Game state types'
'''''''''''''''''''
'''''''''''''''''''''

TYPE Card
	CARDTYPE AS INTEGER
	SUBID AS INTEGER 'If equipable or effect, id determines which equipable and which effect card'
	POSITION AS INTEGER '1 in deck, 2 in hand, 3 discarded'
END TYPE


TYPE GameFam
    SPECIES     AS INTEGER
    'Name, primary and boosted moves are fetched from dex depending on SPECIES'
    HP AS INTEGER
    POSITION AS INTEGER '1 in game, 2 benched, 3 uninvoked, 4 discarded/defeated'  
END TYPE

'Arrays containing all the relevant dex / static info'

DIM Familiars(1 TO 16) AS Familiar
DIM Effects(1 TO 8) AS Effect
DIM Moves(1 TO 41) AS Move
DIM Equippables(1 TO 9) AS Equipable
DIM Passives(1 TO 5) AS PASSIVE


'Arrays containing the actual game state'

DIM SHARED PlayerDeck(1 to 40) AS Card
DIM SHARED PlayerMonsters(1 to 6) AS GameFam
DIM SHARED FoeDeck(1 to 40) AS Card
DIM SHARED FoeMonsters(1 to 6) AS GameFam 

'Ids for the current monster in game'
ActiveFam = 1
ActiveFoe = 1


 
'Zubrute. A muscular bison that can force out foes'

Familiars(1).UNAME = "ZUBRUTE"
Familiars(1).HEARTS = 10
Familiars(1).ELEMENT = 1
Familiars(1).PASSIVE = 0
Familiars(1).COOLDOWN = 2

'Bombr. A beaver that throws explosive loads that can backfire'

Familiars(2).UNAME = "BOMBR"
Familiars(2).HEARTS = 6
Familiars(2).ELEMENT = 1
Familiars(2).PASSIVE = 0
Familiars(2).COOLDOWN = 1

'Kalaskruk. A crow that can hit multiple times and scales with boosters'

Familiars(3).UNAME = "KALASKRUK"
Familiars(3).HEARTS = 5
Familiars(3).ELEMENT = 1
Familiars(3).PASSIVE = 0
Familiars(3).COOLDOWN = 0

'Jezmina. A hedhegog that can damage on contact'

Familiars(4).UNAME = "JEZMINA"
Familiars(4).HEARTS = 6
Familiars(4).ELEMENT = 1
Familiars(4).PASSIVE = 1 'The foe receives half the damage dealt to jezmina, rounded down'
Familiars(4).COOLDOWN = 3

'Robert - An outdated robot from a bygone era with bad accuracy'

Familiars(5).UNAME = "ROBERT"
Familiars(5).HEARTS = 6
Familiars(5).ELEMENT = 2
Familiars(5).PASSIVE = 0
Familiars(5).COOLDOWN = 1

'Biedrone - A flying ladybug that can scout and might avoid attacks'

Familiars(6).UNAME = "BIEDRONE"
Familiars(6).HEARTS = 3
Familiars(6).ELEMENT = 2
Familiars(6).PASSIVE = 2 'The enemy always has a coin accuracy check when attacking her'
Familiars(6).COOLDOWN = 0

'Stozernik = A colossal industrial shipyard robot that can pull cards or foes'

Familiars(7).UNAME = "STOZCNIK"
Familiars(7).HEARTS = 11
Familiars(7).ELEMENT = 2
Familiars(7).PASSIVE = 0
Familiars(7).COOLDOWN = 3

'Waveltron. A mechanical dragon that spits high octane fire'

Familiars(8).UNAME = "WAVELTRON"
Familiars(8).HEARTS = 8
Familiars(8).ELEMENT = 2
Familiars(8).PASSIVE = 0
Familiars(8).COOLDOWN = 2

'An scout skunk that comes, spreads poison and leaves'

Familiars(9).UNAME = "BIOSUK"
Familiars(9).HEARTS = 4
Familiars(9).ELEMENT = 3
Familiars(9).PASSIVE = 0
Familiars(9).COOLDOWN = 0

'A disgusting slimy creature. When attacked, the foe is trapped. Spits paralyzing goo'

Familiars(10).UNAME = "GOOSTAV"
Familiars(10).HEARTS = 12
Familiars(10).ELEMENT = 3
Familiars(10).PASSIVE = 3 'Prevents switchout for one turn when attacked'
Familiars(10).COOLDOWN = 4

'The biotechnologic automata clone of a crazy doctor. His syringe can deal multiple effects'

Familiars(11).UNAME = "DOC MESTOS"
Familiars(11).HEARTS = 7
Familiars(11).ELEMENT = 3
Familiars(11).PASSIVE = 3
Familiars(11).COOLDOWN = 1

'An fragile annoying rodent whose damage output snowballs every turn'

Familiars(12).UNAME = "RATDIO"
Familiars(12).HEARTS = 4
Familiars(12).ELEMENT = 4
Familiars(12).PASSIVE = 0
Familiars(12).COOLDOWN = 0

'A songbird that emits a very annoying high pitched sound. It can cause confusion'

Familiars(13).UNAME = "SONARTA"
Familiars(13).HEARTS = 6
Familiars(13).ELEMENT = 4
Familiars(13).PASSIVE = 0
Familiars(13).COOLDOWN = 0

'The iron maiden. A full metal lady that acts as a beacon and antenna. It can gather additional monsters
'or call his benched allies to battle, transferring her booster cards and healing them'

Familiars(14).UNAME = "STAYCJ"
Familiars(14).HEARTS = 11
Familiars(14).ELEMENT = 4
Familiars(14).PASSIVE = 4 'Invoking monsters does not consume actions. Every invoked ally heals STAYC 1 healthpoint'
Familiars(14).COOLDOWN = 3

'The winter's end puppet. It is permanently on fire, but the fire intensifies when her end is approaching'
'Can selfdestruct with her boosted attack'

Familiars(15).UNAME = "PALANNA"
Familiars(15).HEARTS = 8
Familiars(15).ELEMENT = 5
Familiars(15).PASSIVE = 5 'When Palanna's health is half or less, she is ignited, losing 1HP every turn, but her damage output is doubled'
Familiars(15).COOLDOWN = 1

'A mythical creature fueled by vodka. His boosted attack leaves him on a drunk state the next turn'
'this means he needs an accuracy check to attack during that turn, but has unlimited actions after the
'standard two actions, as long as a coin heads'


Familiars(16).UNAME = "TURON"
Familiars(16).HEARTS = 9
Familiars(16).ELEMENT = 5
Familiars(16).PASSIVE = 0
Familiars(16).COOLDOWN = 2




'Removes a booster from the foe'
Effects(1).UNAME = "UNBOOSTER"
Effects(1).DESCRIPTION = "REMOVES ONE BOOSTER FROM FOE"

'Allows to circumvent cooldown'

Effects(2).UNAME = "TELEPORT"
Effects(2).DESCRIPTION = "SWITCH FREELY IGNORING COOLDOWN"


'Reduces incoming damage by 1HP and prevents statuses'

Effects(3).UNAME = "GAMMA SHIELD"
Effects(3).DESCRIPTION = "SHIELDS FOR 1HP AND ANY STATUS"

Effects(4).UNAME = "BRAINSTORM"
Effects(4).DESCRIPTION = "DISCARD YOUR HAND AND DRAW 3 CARDS"

'Note: the purpose of deinvoking is to clear damage counters on benched
'monsters, but boosters and equiped items will also be lost'

Effects(5).UNAME = "DEINVOKE"
Effects(5).DESCRIPTION = "PUT BACK A BENCHED MONSTER IN HAND"

'Note, what this does ingame is reducing the action points to zero.
'Since attacking is excluded and one attack is granted per turn, this forces to attack'
Effects(6).UNAME = "TAUNT DANCE"
Effects(6).DESCRIPTION = "THE FOE CAN ONLY ATTACK THE NEXT TURN"

'This basically means there is a max of 3 boosters, the actual limit, that can be obtained'
'but this will also deal 3HP of damage to the user monster'
'this card is obviously useless with monsters that only require one booster to unlock secondary move'
'as a curiosity, despite the limit being 3 boosters, this card can potentially break the limit and grant six
'for a single turn. Devastating for damage scaling with boosters'
Effects(7).UNAME = "BLOOD BOOSTER"
Effects(7).DESCRIPTION = "3 COINS. EACH HEAD = A BOOSTER THAT COSTS 1 HP"


'Kind of the reverse of the previous card and the only equivalent of a potion ingame,'
'to avoid stall gameplay'
Effects(8).UNAME = "GATHER ENERGY"
Effects(8).DESCRIPTION = "DISCARD ALL BOOSTERS, HEAL 2HP PER BOOSTER"

 
 

Moves(1).UNAME = "SHAKEDOWN"
Moves(1).DESCRIPTION = "FLIPS A COIN. IF HEADS, REMOVES A FOE BOOSTER"
Moves(1).POWER = 2
Moves(1).STATUS = 0
Moves(1).CFCHECK = 0
Moves(1).CFSECONDARY = 1
Moves(1).BOOSTERSCALE = 0

Moves(2).UNAME = "SMACKDOWN"
Moves(2).DESCRIPTION = "IF HEADS, KICKS THE FOE TO THE BENCH"
Moves(2).POWER = 3
Moves(2).STATUS = 0
Moves(2).CFCHECK = 0
Moves(2).CFSECONDARY = 1
Moves(2).BOOSTERSCALE = 0

Moves(3).UNAME = "BEAVER BOMB"
Moves(3).DESCRIPTION = "IF TAILS, BOMBR RECEIVES 2HP OF RECOIL"
Moves(3).POWER = 4
Moves(3).STATUS = 0
Moves(3).CFCHECK = 0
Moves(3).CFSECONDARY = 1
Moves(3).BOOSTERSCALE = 0

Moves(4).UNAME = "BEAVER NUKE"
Moves(4).DESCRIPTION = "RECOIL REDUCED TO 1HP"
Moves(4).POWER = 5
Moves(4).STATUS = 0
Moves(4).CFCHECK = 0
Moves(4).CFSECONDARY = 1
Moves(4).BOOSTERSCALE = 0

Moves(5).UNAME = "ASSAULT CROW"
Moves(5).DESCRIPTION = "FLIPS 3 COINS, EACH TAILS DAMAGES"
Moves(5).POWER = 2
Moves(5).STATUS = 0
Moves(5).CFCHECK = 0
Moves(5).CFSECONDARY = 0
Moves(5).BOOSTERSCALE = 0

Moves(6).UNAME = "MINIGUN CROW"
Moves(6).DESCRIPTION = "EACH BOOSTER ADDS ONE MORE COIN"
Moves(6).POWER = 2
Moves(6).STATUS = 0
Moves(6).CFCHECK = 0
Moves(6).CFSECONDARY = 0
Moves(6).BOOSTERSCALE = 0

Moves(7).UNAME = "SPIKY SHIELD"
Moves(7).DESCRIPTION = "REDUCES INCOMING DAMAGE 1HP"
Moves(7).POWER = 0
Moves(7).STATUS = 5
Moves(7).CFCHECK = 0
Moves(7).CFSECONDARY = 0
Moves(7).BOOSTERSCALE = 0

Moves(8).UNAME = "MINE SHIELD"
Moves(8).DESCRIPTION = "EACH BOOSTER REDUCES DAMAGE ANOTHER 2HP"
Moves(8).POWER = 0
Moves(8).STATUS = 5
Moves(8).CFCHECK = 0
Moves(8).CFSECONDARY = 0
Moves(8).BOOSTERSCALE = 0

Moves(9).UNAME = "ZAPPER"
Moves(9).DESCRIPTION = "PARALYZES IF HEADS, FAILS IF TAILS"
Moves(9).POWER = 2
Moves(9).STATUS = 1
Moves(9).CFCHECK = 1
Moves(9).CFSECONDARY = 0
Moves(9).BOOSTERSCALE = 0

Moves(10).UNAME = "GAMMA ZAPPER"
Moves(10).DESCRIPTION = "EACH BOOSTER ADDS 2HP OF DAMAGE"
Moves(10).POWER = 2
Moves(10).STATUS = 1
Moves(10).CFCHECK = 1
Moves(10).CFSECONDARY = 0
Moves(10).BOOSTERSCALE = 2

Moves(11).UNAME = "INFILTRATE"
Moves(11).DESCRIPTION = "DAMAGES A RANDOM BENCHED FOE"
Moves(11).POWER = 3
Moves(11).STATUS = 0
Moves(11).CFCHECK = 0
Moves(11).CFSECONDARY = 0
Moves(11).BOOSTERSCALE = 0

Moves(12).UNAME = "ESPIONAGE"
Moves(12).DESCRIPTION = "PEEKS FOE BENCH AND DAMAGES CHOSEN FOE"
Moves(12).POWER = 4
Moves(12).STATUS = 0
Moves(12).CFCHECK = 0
Moves(12).CFSECONDARY = 0
Moves(12).BOOSTERSCALE = 0

Moves(13).UNAME = "CRANE PULL"
Moves(13).DESCRIPTION = "DRAWS TWO CARDS"
Moves(13).POWER = 0
Moves(13).STATUS = 0
Moves(13).CFCHECK = 0
Moves(13).CFSECONDARY = 0
Moves(13).BOOSTERSCALE = 0

Moves(14).UNAME = "CRANE GACHA"
Moves(14).DESCRIPTION = "DRAWS 2 CARDS AND A RANDOM FOE. DAMAGES HIM"
Moves(14).POWER = 3
Moves(14).STATUS = 0
Moves(14).CFCHECK = 0
Moves(14).CFSECONDARY = 0
Moves(14).BOOSTERSCALE = 0

Moves(15).UNAME = "SCORCHING FIRE"
Moves(15).DESCRIPTION = "IF HEADS, THE FOE IS BURNED"
Moves(15).POWER = 3
Moves(15).STATUS = 2
Moves(15).CFCHECK = 0
Moves(15).CFSECONDARY = 1
Moves(15).BOOSTERSCALE = 0

Moves(16).UNAME = "SCORCHING NAPALM"
Moves(16).DESCRIPTION = "THE BURN EFFECT IS GUARANTEED"
Moves(16).POWER = 4
Moves(16).STATUS = 2
Moves(16).CFCHECK = 0
Moves(16).CFSECONDARY = 0
Moves(16).BOOSTERSCALE = 0

Moves(17).UNAME = "GAS CLOUD"
Moves(17).DESCRIPTION = "THE FOE IS POISONED"
Moves(17).POWER = 2
Moves(17).STATUS = 3
Moves(17).CFCHECK = 0
Moves(17).CFSECONDARY = 0
Moves(17).BOOSTERSCALE = 0

Moves(18).UNAME = "GAS NOVA"
Moves(18).DESCRIPTION = "DOUBLE DAMAGE IF FOE IS POISONED"
Moves(18).POWER = 3
Moves(18).STATUS = 0
Moves(18).CFCHECK = 0
Moves(18).CFSECONDARY = 0
Moves(18).BOOSTERSCALE = 0

Moves(19).UNAME = "BLOB TRAP"
Moves(19).DESCRIPTION = "IF HEADS, THE FOE IS STUNNED A TURN"
Moves(19).POWER = 0
Moves(19).STATUS = 4
Moves(19).CFCHECK = 1
Moves(19).CFSECONDARY = 0
Moves(19).BOOSTERSCALE = 0

Moves(20).UNAME = "BLOB CANNON"
Moves(20).DESCRIPTION = "DEALS 1/3 OF GOOSTAV CURRENT HP"
Moves(20).POWER = 0
Moves(20).STATUS = 0
Moves(20).CFCHECK = 0
Moves(20).CFSECONDARY = 0
Moves(20).BOOSTERSCALE = 0

Moves(21).UNAME = "TRIPLE VIRAL"
Moves(21).DESCRIPTION = "MAY POISON, PARALYZE OR CONFUSE"
Moves(21).POWER = 2
Moves(21).STATUS = 0
Moves(21).CFCHECK = 0
Moves(21).CFSECONDARY = 0
Moves(21).BOOSTERSCALE = 0

Moves(22).UNAME = "TRIPLE TOXIN"
Moves(22).DESCRIPTION = "PROVOKES CONFUSION AND POISON SIMULTANEOUSLY"
Moves(22).POWER = 2
Moves(22).STATUS = 6
Moves(22).CFCHECK = 0
Moves(22).CFSECONDARY = 0
Moves(22).BOOSTERSCALE = 0

Moves(23).UNAME = "SINE WAVE"
Moves(23).DESCRIPTION = "EVERY TURN DEALS EXTRA 2HP"
Moves(23).POWER = 2
Moves(23).STATUS = 0
Moves(23).CFCHECK = 0
Moves(23).CFSECONDARY = 0
Moves(23).BOOSTERSCALE = 0

Moves(24).UNAME = "COSINE WAVE"
Moves(24).DESCRIPTION = "EVERY TURN DEALS 1HP LESS"
Moves(24).POWER = 6
Moves(24).STATUS = 0
Moves(24).CFCHECK = 0
Moves(24).CFSECONDARY = 0
Moves(24).BOOSTERSCALE = 0

Moves(25).UNAME = "SCREECH SONG"
Moves(25).DESCRIPTION = "IF HEADS, CONFUSES"
Moves(25).POWER = 2
Moves(25).STATUS = 7
Moves(25).CFCHECK = 0
Moves(25).CFSECONDARY = 1
Moves(25).BOOSTERSCALE = 0

Moves(26).UNAME = "SCREECH HYMN"
Moves(26).DESCRIPTION = "GUARANTEED CONFUSION"
Moves(26).POWER = 2
Moves(26).STATUS = 7
Moves(26).CFCHECK = 0
Moves(26).CFSECONDARY = 0
Moves(26).BOOSTERSCALE = 0

Moves(27).UNAME = "BEACON SIGNAL"
Moves(27).DESCRIPTION = "HEALS 1HP, IF HEADS, INVOKES A MONSTER"
Moves(27).POWER = 0
Moves(27).STATUS = 0
Moves(27).CFCHECK = 0
Moves(27).CFSECONDARY = 1
Moves(27).BOOSTERSCALE = 0

Moves(28).UNAME = "BEACON CALL"
Moves(28).DESCRIPTION = "SWITCHES WITH AN ALLY. HEALS 30HP PER BOOSTER"
Moves(28).POWER = 0
Moves(28).STATUS = 0
Moves(28).CFCHECK = 0
Moves(28).CFSECONDARY = 0
Moves(28).BOOSTERSCALE = 0

Moves(29).UNAME = "BLOOM"
Moves(29).DESCRIPTION = "HEALS BACK HALF OF THE DAMAGE DEALT"
Moves(29).POWER = 2
Moves(29).STATUS = 0
Moves(29).CFCHECK = 0
Moves(29).CFSECONDARY = 0
Moves(29).BOOSTERSCALE = 0

Moves(30).UNAME = "BLOSSOM"
Moves(30).DESCRIPTION = "HEALS AN ALLY ALL THE DAMAGE DEALT"
Moves(30).POWER = 2
Moves(30).STATUS = 0
Moves(30).CFCHECK = 0
Moves(30).CFSECONDARY = 0
Moves(30).BOOSTERSCALE = 0

Moves(31).UNAME = "VODKA GULP"
Moves(31).DESCRIPTION = "CAUSES SELF CONFUSION BUT HEALS 30HP"
Moves(31).POWER = 0
Moves(31).STATUS = 8
Moves(31).CFCHECK = 0
Moves(31).CFSECONDARY = 0
Moves(31).BOOSTERSCALE = 0

Moves(32).UNAME = "VODKA SPITE"
Moves(32).DESCRIPTION = "IF CONFUSED, HEALS IT AND CONFUSE FOE"
Moves(32).POWER = 4
Moves(32).STATUS = 7
Moves(32).CFCHECK = 0
Moves(32).CFSECONDARY = 0
Moves(32).BOOSTERSCALE = 0

'Moves that come with equipable objects'


Moves(33).UNAME = "PRIMAL RAGE"
Moves(33).DESCRIPTION = "IF HEADS, DEALS DOUBLE DAMAGE IF 1/2 HP"
Moves(33).POWER = 3
Moves(33).STATUS = 0
Moves(33).CFCHECK = 0
Moves(33).CFSECONDARY = 1
Moves(33).BOOSTERSCALE = 0

Moves(34).UNAME = "HIBERNATE"
Moves(34).DESCRIPTION = "HEALS 4HP, BUT SLEEPS THE NEXT TURN"
Moves(34).POWER = 0
Moves(34).STATUS = 0
Moves(34).CFCHECK = 0
Moves(34).CFSECONDARY = 0
Moves(34).BOOSTERSCALE = 0

Moves(35).UNAME = "DOWNLOAD"
Moves(35).DESCRIPTION = "GAIN ONE OR THREE BOOSTERS ON COINFLIP"
Moves(35).POWER = 0
Moves(35).STATUS = 0
Moves(35).CFCHECK = 1
Moves(35).CFSECONDARY = 0
Moves(35).BOOSTERSCALE = 0

Moves(36).UNAME = "ELECTROCUTE"
Moves(36).DESCRIPTION = "THE USER LOSES 1 OR 2HP ON COINFLIP"
Moves(36).POWER = 4
Moves(36).STATUS = 8
Moves(36).CFCHECK = 0
Moves(36).CFSECONDARY = 1
Moves(36).BOOSTERSCALE = 0

Moves(37).UNAME = "PARASYTE"
Moves(37).DESCRIPTION = "1HP IS DRAINED PER TURN FROM FOE"
Moves(37).POWER = 0
Moves(37).STATUS = 10
Moves(37).CFCHECK = 0
Moves(37).CFSECONDARY = 0
Moves(37).BOOSTERSCALE = 0

Moves(38).UNAME = "CORRODER"
Moves(38).DESCRIPTION = "ROBOT FOES RECEIVE DOUBLE DAMAGE"
Moves(38).POWER = 3
Moves(38).STATUS = 0
Moves(38).CFCHECK = 0
Moves(38).CFSECONDARY = 0
Moves(38).BOOSTERSCALE = 0

Moves(39).UNAME = "AMPLIFIED WAVE"
Moves(39).DESCRIPTION = "DEALS EXTRA HP PER BOOSTER BUT KEEPS THEM"
Moves(39).POWER = 2
Moves(39).STATUS = 0
Moves(39).CFCHECK = 0
Moves(39).CFSECONDARY = 0
Moves(39).BOOSTERSCALE = 1

Moves(40).UNAME = "MODULO"
Moves(40).DESCRIPTION = "DEALS A THIRD OF THE FOE HP"
Moves(40).POWER = 0
Moves(40).STATUS = 0
Moves(40).CFCHECK = 0
Moves(40).CFSECONDARY = 0
Moves(40).BOOSTERSCALE = 0


Moves(32).UNAME = "MYTHIC SWORD"
Moves(32).DESCRIPTION = "THREE COINS. EACH COINS REDUCES DAMAGE"
Moves(32).POWER = 5
Moves(32).STATUS = 0
Moves(32).CFCHECK = 0
Moves(32).CFSECONDARY = 0
Moves(32).BOOSTERSCALE = 0




 


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

'Start mode 13, 320x200'
RelInitVGA13 
init_decks
