_Title "C-128 Hat Demo"
Const pi = 3.1415926
Randomize Timer
Rem aspect = 4 / 3
Dim W As Integer, H As Integer
W = 1280: H = 960
Dim CW As Integer, CH As Integer
CW = W \ 2: CH = H \ 2
Dim SX As Double, SY As Double
SX = 5: SY = 5
pixel = _RGB32(242, 242, 142)
Screen _NewImage(W, H, 32)
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
        X1 = Int(SX * (XI + ZI) + CW)
        Y1 = Int(SY * (YY - ZI) + CH)
        Line (X1, H - Y1)-(X1, H - Y1 + 1), pixel
    Next XI
Next ZI


