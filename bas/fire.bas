
' For := BASIC Programming @ Faceook
' Platform := QB64
' Web Version := https://codepen.io/NyteOwlDave/full/XWZQmJm
' Paste Bin := https://pastebin.com/yHBc0CCe

_Title "Fire"
Randomize Timer

' Screen Dimensions
Const sw = 500
Const sh = 500

' Heat Map Dimensions
Const mw = 100
Const mh = 50

' Heat Level
Const heat = 0.375

Dim heat_map(mh, mw) As Integer

Dim mtx(5) As Single

Dim rgbpal(256) ' RGB32 elements

InitMtx
FirePalette
InitHeatMap

Screen _NewImage(sw, sh, 32)

While 1
    _Limit 60
    RenderHeatMap
    AddSparks
    UpdateHeatMap
    Let k$ = UCase$(InKey$)
    If k$ = "X" Then Exit While
    If k$ = Chr$(27) Then Exit While
Wend

End

Function Round (n)
    Round = Int(n + 0.5)
End Function

Function RandInt (lo, hi)
    RandInt = Round(lo + Rnd * (hi - lo))
End Function

Function Min (a, b)
    If (a < b) Then
        Min = a
    Else
        Min = b
    End If
End Function

Function Max (a, b)
    If (a < b) Then
        Max = b
    Else
        Max = a
    End If
End Function

Function Clamp (n, lo, hi)
    Clamp = Min(Max(n, lo), hi)
End Function

Function GammaCorrect (n, gamma)
    Let k = 1 / Clamp(gamma, 1, 4.0)
    Let x = n / 255
    GammaCorrect = Round(255 * (x ^ k))
End Function

Function Lerp (a, b, t)
    t = Clamp(t, 0, 1)
    Lerp = a * (1 - t) + b * t
End Function

Sub MakeColor (cout() As Integer, r, g, b)
    cout(1) = Clamp(Round(r), 0, 255)
    cout(2) = Clamp(Round(g), 0, 255)
    cout(3) = Clamp(Round(b), 0, 255)
End Sub

Sub BlendColors (cout() As Integer, c1() As Integer, c2() As Integer, alpha)
    Let r1 = c1(1)
    Let g1 = c1(2)
    Let b1 = c1(3)
    Let r2 = c2(1)
    Let g2 = c2(2)
    Let b3 = c2(3)
    cout(1) = Round(Lerp(r2, r1, alpha))
    cout(2) = Round(Lerp(g2, g1, alpha))
    cout(3) = Round(Lerp(b2, b1, alpha))
End Sub

Sub GammaColor (cout() As Integer, r, g, b, gamma)
    cout(1) = GammaCorrect(r, gamma)
    cout(2) = GammaCorrect(g, gamma)
    cout(3) = GammaCorrect(b, gamma)
End Sub

Sub Ramp (colors() As Integer, start_color() As Integer, end_color() As Integer, start_index, end_index, gamma)
    Let scale = 1 / (end_index - start_index)
    Let r = start_color(1)
    Let g = start_color(2)
    Let b = start_color(3)
    Let r_delta = (end_color(1) - r) * scale
    Let g_delta = (end_color(2) - g) * scale
    Let b_delta = (end_color(3) - b) * scale
    For i = start_index To end_index
        colors(i, 1) = GammaCorrect(r, gamma)
        colors(i, 2) = GammaCorrect(g, gamma)
        colors(i, 3) = GammaCorrect(b, gamma)
        r = r + r_delta
        g = g + g_delta
        b = b + b_delta
    Next i
End Sub

Sub FirePalette
    Shared rgbpal()
    Dim black(3) As Integer: MakeColor black(), 0, 0, 0
    Dim red(3) As Integer: MakeColor red(), 255, 0, 0
    Dim yellow(3) As Integer: MakeColor yellow(), 255, 255, 0
    Dim white(3) As Integer: MakeColor white(), 255, 255, 255
    Dim colors(256, 3) As Integer
    Ramp colors(), black(), red(), 1, 91, 0.6
    Ramp colors(), red(), yellow(), 92, 111, 0.75
    Ramp colors(), yellow(), white(), 112, 256, 0.9
    For i = 1 To 256
        Let r = colors(i, 1)
        Let g = colors(i, 2)
        Let b = colors(i, 3)
        rgbpal(i) = _RGB32(r, g, b)
    Next i
End Sub

Sub InitMtx
    Shared mtx() As Single
    mtx(1) = 0.05
    mtx(2) = 0.40
    mtx(3) = 0.05
    mtx(4) = 0.65
    mtx(5) = mtx(1) + mtx(2) + mtx(3) + mtx(4)
End Sub

Sub InitHeatMap
    Shared heat_map() As Integer
    For y = 1 To mh
        For x = 1 To mw
            heat_map(y, x) = 0
        Next x
    Next y
End Sub

Sub AddSparks
    Shared heat_map() As Integer
    For i = 1 To mw
        If Rnd < heat Then
            heat_map(mh, i) = 256
        Else
            heat_map(mh, i) = 0
        End If
    Next i
End Sub

Sub UpdateHeatMap
    Shared heat_map() As Integer
    Shared mtx() As Single
    Let scale = 0.975 / mtx(5)
    Dim new_sparks(mw) As Integer
    For row = 1 To mh - 1
        For col = 1 To mw
            Let left = col - 1
            Let right = col + 1
            Let sum = heat_map(row, col) * mtx(2)
            sum = sum + heat_map(row + 1, col) * mtx(4)
            If (left > 0) Then sum = sum + heat_map(row, left) * mtx(1)
            If (right <= mw) Then sum = sum + heat_map(row, right) * mtx(3)
            Let new_index = Round(sum * scale)
            If (new_index < 5) Then new_index = 1
            new_sparks(col) = Clamp(new_index, 1, 256)
        Next col
        For col = 1 To mw
            heat_map(row, col) = new_sparks(col)
        Next col
    Next row
End Sub

Sub RenderHeatMap
    Shared heat_map() As Integer
    Shared rgbpal()
    Let dx = sw / mw
    Let dy = sh / (mh - 4)
    Let y1 = 0
    For y = 1 To mh - 4
        Let y2 = y1 + dy
        Let x1 = 0
        For x = 1 To mw
            Let x2 = x1 + dx
            Let i = Clamp(heat_map(y, x), 1, 256)
            Let c = rgbpal(i)
            Line (x1, y1)-(x2, y2), c, BF
            x1 = x1 + dx
        Next x
        y1 = y1 + dy
    Next y
End Sub


