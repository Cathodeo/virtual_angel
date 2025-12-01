DECLARE SUB EndRoutines ()
DECLARE SUB InitRoutines ()
DECLARE SUB WaitForEnter ()
DECLARE SUB LoadTileMap (tileid AS INTEGER)

'Graphic subroutines simulating a tileset/tilemap system
'like the one present on 8 bit consoles'

REM $INCLUDE: 'future.bi'



InitRoutines

Future.PRINT 120, 120, "Probando", 0, 8


LoadTileMap 1



WaitForEnter



WaitForEnter

EndRoutines

			    

SUB EndRoutines
	KBHoff
	ReSetScreen
	DeallocateXMS tileset1%
	
END SUB



SUB InitRoutines
	Set320x240 8
	KBHon
	IF IsXMSInstalled = 0 THEN
		Future.PRINT 120, 120, "No XMS detected!", 0, 8
		KBHoff
		ReSetScreen
		END
	END IF
	tileset1% = AllocateXMS(90600) 'Allocate enough XMS to store the tileset
END SUB

SUB LoadTileMap (tileid)

IF tileid = 1 THEN
tilemap$ = "virtual\asset\orkyda.bmp"
CALL Future.LoadBMP(tilemap$, -100, -100)

Changepal 3, 45, 60, 30
Changepal 2, 34, 43, 13
Changepal 1, 12, 24, 13
Changepal 0, 3, 14, 13

END IF

END SUB

SUB WaitForEnter
    ' Wait for the key to be released
    WHILE GetKey(28) <> 0: WEND

    ' Now wait for a fresh press
    WHILE GetKey(28) = 0: WEND
END SUB

