'an attempt to translate the Magnoquill Driftflare Quiverbloom  to QB64
'
' wasn't sure how to advance the t value and had to fiddle with dimensions
' for it to be visibly interesting
' I decided watching it grow was fun so I included that into the code
'press ESC to exit
Screen _NewImage(1000, 500, 32)
Window Screen(50, 1200)-(350, 1300)
_Title "Quiverbloom?"
Type moduletype
    x As Single
    y As Single
    k As Single
    e As Single
    d As Single
    q As Single
    c As Single
    xp As Single
    yp As Single
End Type
maxbloomsize = 99999
Dim Shared mm(0 To maxbloomsize) As moduletype
t = 0
bloomsize = 100
Do
    _Limit 60
    t = t + 0.01: If t > 65000 Then t = 0
    Cls
    For n = 0 To bloomsize
        mm(n).x = n
        mm(n).y = n / 235
        mm(n).k = (4 + Sin(mm(n).x / 11 + 8 * t)) * Cos(mm(n).x / 14)
        mm(n).e = mm(n).y / 8 - 19
        mm(n).d = Sqr(mm(n).k ^ 2 + mm(n).e ^ 2) + Sin(mm(n).y / 9 + 2 * t)
        mm(n).q = 2 * Sin(2 * mm(n).k) + Sin(mm(n).y / 17) * mm(n).k * (9 + 2 * Sin(mm(n).y - 3 * mm(n).d))
        mm(n).c = mm(n).d ^ 2 / 49 - t
        mm(n).xp = mm(n).q + 50 * Cos(mm(n).c) + 200
        mm(n).yp = mm(n).q * Sin(mm(n).c) + d * 39 - 440
    Next n
    For n = 0 To bloomsize
        PSet (mm(n).xp, 800 - mm(n).yp), _RGB32(255, 255, 255, 150)
    Next n
    If bloomsize < maxbloomsize Then bloomsize = bloomsize + 1
    kk$ = InKey$
    Locate 1, 1: Print "Time: "; t, "Bloomsize: "; bloomsize
    _Display
Loop Until kk$ = Chr$(27)

