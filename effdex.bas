

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

 
