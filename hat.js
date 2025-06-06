
const basic = `

Const pi = 3.1415926

Randomize Timer

Screen _NewImage(160, 120, 32)
Dim screenW As Integer, screenH As Integer

screenW = 160
screenH = 120

REM Color 0, 1: Rem SFOMDO HERO
REM Color 4, 7: Rem BORDO BLU
REM Color 1, 15: Rem PRIMO PIANO 1 GRIGIO
REM Color 2, 1: Rem PRIMO PIANO 2 HERO

Pixel = _RGB32(242, 242, 142)

XP = 90: YP = 45
XR = 3.14 * 1.5
XF = XR / XP
ZF = XR / YP
For ZI = -YP To YP
    ZT = ZI * XP / YP
    XL = Int(Sqr(Abs(XP * XP - ZT * ZT)) + 0.5)
    For XI = -XL To XL
        XT = Sqr(XI * XI + ZT * ZT) * XF
        YY = (Sin(XT) + Sin(XT * 3) * 0.4) * YP
        X1 = Int((XI + ZI + 140) / 2)
        Y1 = Int(YY - ZI + 90)
        '180 DRAW 1,X1,170-Y1 : REM POINT
        '190 DRAW 2 X1,171-Y1 TO X1,190 : REM LINE
        Line (X1, 171 - Y1)-(X1, 190), Pixel
    Next XI
Next ZI

`;

function main() {
    try { 
        sip.value = basic;
    } catch ( e ) { 
        console.error( e );
        alert( e );
    }
}

addEventListener( 'load', main );

