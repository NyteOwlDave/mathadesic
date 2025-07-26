X2 = 8: Y2 = 8: Rem starting point
Cls
Screen 9
For X = 0 To 20
    For Y = 0 To 20
        D = Sqr((X - X2) ^ 2 + (Y - Y2) ^ 2)
        XNEW = 300 + 14 * Y - X * 10
        YNEW = 150 + X * 4 + Y * 5 - 150 * Cos(D / 3) / (D + 1)
        If Y <> 0 Then
            YD = (YNEW - YOLD) / (XNEW - XOLD): Rem delta y
            Y4 = YOLD
            For N = XOLD To XNEW
                Line (N, 380)-(N, Y4), 4: Rem blank line
                Y4 = Y4 + YD
            Next N
            Line (XOLD, YOLD)-(XNEW, YNEW), 10
        End If
        XOLD = XNEW
        YOLD = YNEW
    Next Y
Next X

