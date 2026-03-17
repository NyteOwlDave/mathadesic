
Const XMAX = 500 ' image dimensions
Const YMAX = XMAX

Const XCTR = XMAX / 2
Const YCTR = YMAX / 2

Const Rho = 0.45 * XMAX
Const Pi = 3.141592653589793
Const Phi = 2 * Pi
Const R2D = 180 / Pi

DefInt A
DefInt B

_Title "Ralph's Radials"

100

Cls
Input "A ( 1 - 5 ) ", A
Input "B ( 1 - 5 ) ", B

A = Clamp(A, 1, 5)
B = Clamp(B, 1, 5)

Screen _NewImage(XMAX, YMAX, 32)

Let delta = (Pi / Rho)
Let limit = Phi * Max(A, B)

For theta = 0 To limit Step delta
    Let R = Rho * Ralph(theta)
    Let x = XCTR + R * CosR(theta)
    Let y = YCTR - R * SinR(theta)
    Circle (x, y), 3, _RGB(116, 116, 222)
Next theta

Input "Another? (y/N) ", A$
If A$ = "y" Or A$ = "Y" Then GoTo 100

End

Function Clamp (n, lo, hi)
    If n < lo Then
        Clamp = lo
        Exit Function
    End If
    If n > hi Then
        Clamp = hi
        Exit Function
    End If
    Clamp = n
End Function

Function Max (i, j)
    If i < j Then
        Max = j
    Else
        Max = i
    End If
End Function

Function Ralph (theta!)
    Shared A
    Shared B
    Ralph = SinR(B * theta! / A)
End Function

Function CosR (n)
    CosR = Cos(R2D * n)
End Function

Function SinR (n)
    SinR = Sin(R2D * n)
End Function




