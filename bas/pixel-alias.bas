
' https://pastebin.com/7y92qBvW
' Demonstrates Pixel Aliasing

Const XMAX = 500 ' image dimensions
Const YMAX = XMAX

_Title "Pixel Aliasing"

Cls

Dim cga(1 To 16) As Long
GoSub 100

Dim x As Integer
Dim y As Integer
Dim i As Integer
Dim c As Long

Screen _NewImage(XMAX, YMAX, 32)

i = 9

For y = 0 To YMAX Step 3
    c = cga(i)
    Line (0, 0)-(XMAX - 1, y), c
    Line (XMAX - 1, 0)-(0, y), c
    i = i + 1
    If (i > 16) Then i = 9
Next y

i = 2

For x = 0 To XMAX Step 3
    c = cga(i)
    Line (0, 0)-(x, YMAX - 1), c
    Line (XMAX - 1, 0)-(x, YMAX - 1), c
    i = i + 1
    If (i > 8) Then i = 2
Next x

While InKey$ = ""
Wend

End

100

cga(1) = _RGB32(0, 0, 0)
cga(2) = _RGB32(0, 0, 170)
cga(3) = _RGB32(0, 170, 0)
cga(4) = _RGB32(0, 170, 170)
cga(5) = _RGB32(170, 0, 0)
cga(6) = _RGB32(170, 0, 170)
cga(7) = _RGB32(170, 85, 0)
cga(8) = _RGB32(170, 85, 170)
cga(9) = _RGB32(85, 85, 85)
cga(10) = _RGB32(85, 85, 255)
cga(11) = _RGB32(85, 255, 85)
cga(12) = _RGB32(85, 255, 255)
cga(12) = _RGB32(255, 85, 85)
cga(14) = _RGB32(255, 85, 255)
cga(15) = _RGB32(255, 255, 85)
cga(16) = _RGB32(255, 255, 255)

Return

