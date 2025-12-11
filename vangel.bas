REM $INCLUDE: 'RelLib.BI'

'Define types first'

DEFINT A-Z


'''''''''''''''''
'''Dex/Static types'
''''''''''''''''''''

'Actual monster cards'
TYPE Familiar
    UNAME       AS STRING * 12
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

TYPE GameFam
    SPECIES     AS INTEGER
    'Name, primary and boosted moves are fetched from dex depending on SPECIES'

END TYPE

'Arrays containing all the relevant dex / static info'

DIM Familiars(1 TO 16) AS Familiar
DIM Effects(1 TO 8) AS Effect
DIM Moves(1 TO 40) AS Move
DIM Equippables(1 TO 8) AS Equipable
DIM Passives(1 TO 5) AS PASSIVE


'Arrays containing the actual game state'


 
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

Familiars(7).UNAME = "STOZERNIK"
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

 
 

Moves(1).UNAME = "RAMPAGE"
Moves(1).DESCRIPTION = "FLIPS A COIN. IF HEADS, REMOVES A FOE BOOSTER"
Moves(1).POWER = 2
Moves(1).STATUS = 0
Moves(1).CFCHECK = 0
Moves(1).CFSECONDARY = 1
Moves(1).BOOSTERSCALE = 0

Moves(2).UNAME = "RAMPAGE"
Moves(2).DESCRIPTION = "IF HEADS, KICKS THE FOE TO THE BENCH"
Moves(2).POWER = 3
Moves(2).STATUS = 0
Moves(2).CFCHECK = 0
Moves(2).CFSECONDARY = 1
Moves(2).BOOSTERSCALE = 0

Moves(3).UNAME = "BEAVER NUKE"
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

Moves(6).UNAME = "ASSAULT CROW"
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

Moves(8).UNAME = "SPIKY SHIELD"
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

Moves(10).UNAME = "ZAPPER"
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

Moves(12).UNAME = "INFILTRATE"
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

Moves(14).UNAME = "CRANE PULL"
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

Moves(16).UNAME = "SCORCHING FIRE"
Moves(16).DESCRIPTION = "THE BURN EFFECT IS GUARANTEED"
Moves(16).POWER = 4
Moves(16).STATUS = 2
Moves(16).CFCHECK = 0
Moves(16).CFSECONDARY = 0
Moves(16).BOOSTERSCALE = 0

 
 

'Start mode 13, 320x200'
RelInitVGA13 
