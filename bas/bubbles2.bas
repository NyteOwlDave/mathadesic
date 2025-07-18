
' Modified Source Code for QB64
' bubbles2.bas
' 2025-JUN-02

Dim Shared pi, r, t, u, v, x
Dim i As Integer, j As Integer
Dim px As Integer, py As Integer
Dim rr As Integer, gg As Integer, bb As Integer
Screen 12
Randomize Timer

pi = 4 * Atn(1)
r = 2 * pi / 235
t = 4 * Rnd
x = 0: u = 0: v = 0

Cls
For i = 0 To 249
    For j = 0 To 249
        u = Sin(i + v) + Sin(r * i + x)
        v = Cos(i + v) + Cos(r * i + x)
        x = u + t
        px = Int(320 + 108 * u)
        py = Int(240 + 108 * v)
        If px >= 0 And px < 640 And py >= 0 And py < 480 Then
            rr = (i * 3) Mod 256
            gg = (j * 3) Mod 256
            bb = (255 - (i + j) \ 2) Mod 256
            Line (px, py)-(px + 1, py + 1), _RGB(rr, gg, bb), BF
        End If
    Next j
Next i

