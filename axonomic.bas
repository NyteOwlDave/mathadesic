
wi = 800
he = 600

Screen _NewImage(wi, he, 32)

h = wi / 2
v = he / 4

xmax = 3.9
ymax = 3.9

r = xmax * xmax + ymax * ymax

colorHI = _RGB(242, 242, 142)
colorLO = _RGB(182, 182, 84)
colorBG = _RGB(2, 2, 22)

Main:

Cls , colorBG

Print
Print "Enter Demo Number (1 - 7)"
Input n

index = Int(n)
If (index < 1) Or (index > 3) Then End

For i = -h To h
    m = 0
    n = he
    xe = wi * (1 + i / h) / 2
    For j = -v To v
        x = -xmax * i / h - xmax * j / v
        y = ymax * i / h - ymax * j / v
        If x * x + y * y <= r Then
            z = he / 2 - j - f(x, y, index)
            If z < n Then
                c = colorHI
                n = z
            Else
                c = colorLO
            End If
            If z > m Then
                m = z
            End If
            If z >= 0 And z <= he Then
                PSet (xe, z), c
            End If
        End If
    Next j
Next i

Sleep
GoTo Main

Function gf (x, y)
    gf = 5 * x * Sin(5 * y)
End Function

Function f (x, y, mode)
    z = x * x + y * y
    Select Case mode
        Case 1
            f = 10 * Sin(4 * x) * y
        Case 2
            f = 190 * Cos(z) * Exp(-z / 6)
        Case 3
            f = (y * y) / (x * x + 0.0005)
        Case 4
            f = 10 * Sin(x * (y + 1)) * y
        Case 5
            f = 100 - 400 / Exp(z)
        Case 6
            f = 80 * Cos(2 * y) / (z + 0.001) - 100
        Case Else
            f = gf(x, y)
    End Select
End Function

