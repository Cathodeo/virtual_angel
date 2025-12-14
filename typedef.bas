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


