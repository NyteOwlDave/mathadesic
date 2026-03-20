
' Forum    := BASIC Programming on Facebook
' Platform := QB64
' Filename := heart-shape.bas

Const SW = 500
Const SH = 500

Const m = 323
Const p = 100

Const pi = _Pi
Const iMax = pi / 2
Const iStep = pi / 5711

Let i = 0
Let j = 1

Screen _NewImage(SW, SH, 32)

Line (0, 0)-(SW, SH), _RGB32(4, 4, 32), BF

For i = 0 To iMax Step iStep
    j = -j
    Let x = p * (i * j + 3) - (p * 2 \ 3)
    Let q = Abs(Cos(i))
    Let r = (i ^ 0.01)
    Let s = (q ^ 0.5)
    Let t = Cos(m * i)
    Let u = (i ^ 0.3)
    Let y = p + p * (2 + (r * s * t - u))
    PSet (x, y), _RGB32(170, 0, 0)
Next i

End


