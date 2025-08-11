' "Screen-saver" that gives the illusion of 3D movement.
' Hold a dark filter (e.g., the lens of a pair of sunglasses) over
' just one eye to enhance the 3D effect (doens't work for all people).
' Change NPNTS to change the number of dots.
Const NPNTS = 200
' Increase DOTSIZE for larger dots.
Const DOTSIZE = 0
' Change DTIME to change speed (0 is fastest).
Const DTIME = .05
Const Pi = 3.141593
Const TwoPi = 2! * Pi
Dim COSTh(1000), Ph%(NPNTS), py(NPNTS), PC%(NPNTS), Px(NPNTS)
Dim Sth(1000), Cth(1000)
Rx = 250 ' Helix radius in pixels.
Cx = 320 ' Center x-coordinate in pixels.
Cy = 240 ' Center y-coordinate in pixels.
RMAX = 30
For i% = 0 To 1000
    COSTh(i%) = Rx * Cos(i% / 1000! * TwoPi)
    Cth(i%) = Cos(i% / 1000! * TwoPi)
    Sth(i%) = Sin(i% / 1000! * TwoPi)
Next i%
For i% = 1 To NPNTS
    Ph%(i%) = i% * 10
    py(i%) = i% / NPNTS * 480 - 240
    PC%(i%) = Int(Rnd * RMAX + 1)
    Px(i%) = .5 + .5 * Cos(i%)
Next i%
Screen 12
Do
    For Th% = 0 To 999
        CosA = Cth(Th%)
        SinA = Sth(Th%)
        CosA1 = Cth((Th% + 999) Mod 1000)
        SinA1 = Sth((Th% + 999) Mod 1000)
        For i% = 1 To NPNTS
            Ang% = (Th% + Ph%(i%)) Mod 1000
            Px = Px(i%) * COSTh((Ang% + 999) Mod 1000)
            Px1 = Px * CosA1 + py(i%) * SinA1
            Py1 = -Px * SinA1 + py(i%) * CosA1
            ' Erase the previous dot.
            Line (Px1 + Cx, Py1 + Cy)-Step(DOTSIZE, DOTSIZE), 0, BF
            Px = Px(i%) * COSTh(Ang%)
            Px1 = Px * CosA + py(i%) * SinA
            Py1 = -Px * SinA + py(i%) * CosA
            C% = PC%(i%)
            If Ang% > 500 Then C% = C% + 8
            ' Draw the new dot.
            Line (Px1 + Cx, Py1 + Cy)-Step(DOTSIZE, DOTSIZE), C%, BF
        Next i%
        t = Timer + DTIME
        While t > Timer
        Wend
        If InKey$ <> "" Then End
    Next Th%
Loop

