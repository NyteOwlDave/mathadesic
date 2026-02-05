' Spirograph
' x = (R - tau) * cos(alpha + offset) + rho * cos( (R - tau) / tau * alpha )
' y = (R - tau) * sin(alpha + offset) - rho * sin( (R - tau) / tau * alpha )
' alpha: independant variable, is angle of larger wheel
' offset: inner wheel starts at offset angle for each set of turns
' R: radius outer wheel is also related to number of teeth
' tau: radius smaller inner wheel is also related to number of teeth
' rho: distance position drawing pen from center of smaller wheel

Option _Explicit

' R: radius outer wheel is also related to number of teeth
Const R = 144
' TAU: radius smaller inner wheel is also related to number of teeth
' interesting values: 54, 60, 64, 84, 90, 102, 112, 126
Const TAU = 84
' N: number of points calculated per turn
Const N = 150
' number of different positions used on smaller wheel
Const NRHO = 18
' ratio of lowest en highest rho value and TAU
Const RHO_TAU_L = 0.1, RHO_TAU_H = 0.9
' half of image dimensions, always square
Const SIZEHALF = 500
' margin between drawing and image edge
Const MARGIN = 20
' maximum offset angle
Const MAXOFFSET = _Pi / 3

Dim As Integer nturns, maxt, npointstotal, k, j, xscr, yscr, red, green, blue
Dim As Single rho, alpha, x, y, max, offset
Dim As Long handle, co

' generate window
handle = _NewImage(SIZEHALF * 2, SIZEHALF * 2, 32)
Screen handle
_Title "Spirograph, big wheel: " + Str$(R) + ", small wheel: " + Str$(TAU)
Cls
' determine number of turns around outer big wheel
nturns = lcm(R, TAU) \ R
' maximum value parameter angle alpha
maxt = nturns * 2 * _Pi
' total number of points calculated
npointstotal = N * nturns
' maximum coordinate value R-TAU+rho
' rho reaches RHO_TAU_H * TAU
max = R + (RHO_TAU_H - 1) * TAU
' outer loop for different rho, offset and color
For k = 1 To NRHO
    ' rho: distance position drawing pen from center of smaller wheel
    rho = (RHO_TAU_L + (RHO_TAU_H - RHO_TAU_L) * k / NRHO) * TAU
    ' generate color for this run
    red = (k / NRHO) * 255
    green = (red Mod 128) * 2
    blue = (red Mod 65) * 4
    co = _RGB32(red, green, blue)
    ' update offset angle
    offset = k / NRHO * MAXOFFSET
    ' inner loop draws one spirograph cycle
    For j = 0 To npointstotal - 1
        ' alpha: independant variable, is angle of larger wheel
        alpha = j / (npointstotal - 1) * maxt
        ' physical coordinates
        x = (R - TAU) * Cos(alpha + offset) + rho * Cos((R - TAU) / TAU * alpha)
        y = (R - TAU) * Sin(alpha + offset) - rho * Sin((R - TAU) / TAU * alpha)
        ' screen coordinates
        xscr = SIZEHALF + x / max * (SIZEHALF - MARGIN)
        yscr = SIZEHALF + y / max * (SIZEHALF - MARGIN)
        'drawing
        If j = 0 Then
            PReset (xscr, yscr)
        Else
            Line -(xscr, yscr), co
        End If
    Next j
Next k
Sleep
End

' greatest common divider, used in function lcm
Function gcd (a As Integer, b As Integer)
    Dim temp As Integer
    While b <> 0
        temp = b
        b = a Mod b
        a = temp
    Wend
    gcd = a
End Function

' least common multiple, used to determine number of turns around outer big wheel
Function lcm (a As Integer, b As Integer)
    lcm = Abs(a * b) / gcd(a, b)
End Function


