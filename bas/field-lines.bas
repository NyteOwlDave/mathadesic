
Screen _NewImage(1280, 960, 32)
Const pi = 3.1415926
Dim screenX, screenY As Integer
Randomize Timer

np = 800
n = 180
m = 30
k = .02

For i = 0 To n

    x = Rnd
    y = Rnd

    For j = 0 To m

        x_pixel = Int(np * x)
        y_pixel = Int(np * y)

        screenX = x_pixel + (1280 - np) / 2
        screenY = y_pixel

        If j > 0 Then
            color2 = prevX * prevX + prevY * prevY
            rr = 4 * (color2 Mod 256)
            gg = color2 Mod 256
            bb = (255 - color2 \ 2) Mod 256
            Line (prevX, prevY)-(screenX, screenY), _RGB(rr, gg, bb)
        End If

        prevX = screenX
        prevY = screenY

        xx = 2 * x - 1:
        yy = 2 * y - 1

        If xx <> 0 Then an = Atn(yy / xx) Else an = pi / 2 * Sgn(yy)

        If xx < 0 Then an = an + pi * Sgn(yy)

        an = an + 4 * pi / 3 + Sin(6 * pi * Sqr(xx * xx + yy * yy)) / 4

        x = x + k * Cos(an):
        y = y + k * Sin(an)

        If x <= 0 Or x >= 1 Or y <= 0 Or y >= 1 Then Exit For

    Next j
Next i

Sleep
End


