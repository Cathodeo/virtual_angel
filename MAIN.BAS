DECLARE SUB EndRoutines ()
DECLARE SUB InitRoutines ()
DECLARE SUB WaitForEnter ()
DECLARE SUB LoadTileMap (tileid AS INTEGER)

'Graphic subroutines simulating a tileset/tilemap system
'like the one present on 8 bit consoles'

REM $INCLUDE: 'future.bi'



InitRoutines


Future.PRINT 120, 120, "Probando", 0, 8

WaitForEnter

LoadTileMap 1

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
tilemap$ = "xmonka\asset\tlcity.bmp"
CALL Future.LoadBMP(tilemap$, 0, 0)
END IF

END SUB

SUB WaitForEnter
	Keyp = 0
	
	WHILE Keyp = 0
		Keyp = GetKey(28)
	WEND
	
END SUB

