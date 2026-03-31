' hsb-color-space.bas
' SOURCE := https://qb64phoenix.com/qb64wiki/index.php/HSB32
Screen _NewImage(640, 480, 32)

For hei# = 0 To 195 Step 5
    For ang# = 5 To 285 Step 0.5
        For rad# = 0 To 200 Step 1
            x% = rad# * Cos(_D2R(ang#))
            y% = rad# * Sin(_D2R(ang#))
            z% = hei#
            XYfrom3D x%, y%, z%
            Let clr = _HSB32(ang#, rad# / 2, hei# / 2)
            PSet (330 + x%, -z% + 340), clr
            If rad# = 0 And (hei# = 0 Or hei# = 195) Then
                If (hei# = 0) Then
                    If ang# = 5 Then bmpx% = 330 + x%: bmpy% = -z% + 340
                Else
                    If ang# = 5 Then tmpx% = 330 + x%: tmpy% = -z% + 340
                End If
            ElseIf (rad# = 200) And (hei# = 0 Or hei# = 195) Then
                PSet (330 + x%, -z% + 340), &HFFFFFFFF
                If hei# = 0 Then
                    If ang# = 5 Then bspx% = 330 + x%: bspy% = -z% + 340
                    If ang# = 285 Then bepx% = 330 + x%: bepy% = -z% + 340
                Else
                    If ang# = 5 Then tspx% = 330 + x%: tspy% = -z% + 340
                    If ang# = 285 Then tepx% = 330 + x%: tepy% = -z% + 340
                End If
            End If
        Next rad#
    Next ang#
Next hei#
Line (bspx%, bspy%)-(bmpx%, bmpy%), &HFFFFFFFF
Line (bmpx%, bmpy%)-(bepx%, bepy%), &HFFFFFFFF
Line (tspx%, tspy%)-(tmpx%, tmpy%), &HFFFFFFFF
Line (tmpx%, tmpy%)-(tepx%, tepy%), &HFFFFFFFF
Line (bspx%, bspy%)-(tspx%, tspy%), &HFFFFFFFF
Line (bmpx%, bmpy%)-(tmpx%, tmpy%), &HFFFFFFFF
Line (bepx%, bepy%)-(tepx%, tepy%), &HFFFFFFFF
End

Function Fmod (a As Double, b As Integer)
    Fmod = (a - b * Int(a / b))
End Function

Sub XYfrom3D (x%, y%, z%)
    x% = (x% + (y% * .5))
    z% = (z% + (y% * .5))
End Sub

Function Round (x)
    Round = Int(x + 0.5)
End Function

' _HSB43 hack (for non-Phoenix)
' https://copilot.microsoft.com/chats/CKZBL8ZPf2NjfmZkgNE4G
' NOTE : Chat contains JavaScript Implementation
Function HSB32 (h As Double, s As Double, b As Double)

    Dim r1 As Double
    Dim g1 As Double
    Dim b1 As Double
    Dim c As Double
    Dim x As Double
    Dim m As Double
    Dim u As Double

    s = s * 0.01
    b = b * 0.01

    If s > 1 Then s = 1
    If b > 1 Then b = 1
    If s < 0 Then s = 0
    If b < 0 Then b = 0

    u = Fmod((h / 60), 2)

    c = b * s ' Chroma
    x = c * (1 - Abs(u - 1))
    m = b - c

    If (h < 60) Then
        r1 = c: g1 = x: b1 = 0
    ElseIf (h < 120) Then
        r1 = x: g1 = c: b1 = 0
    ElseIf (h < 180) Then
        r1 = 0: g1 = c: b1 = x
    ElseIf (h < 240) Then
        r1 = 0: g1 = x: b1 = c
    ElseIf (h < 300) Then
        r1 = x: g1 = 0: b1 = c
    Else
        r1 = c: g1 = 0: b1 = x
    End If

    r1 = Round((r1 + m) * 255)
    g1 = Round((g1 + m) * 255)
    b1 = Round((b1 + m) * 255)

    HSB32 = _RGB32(r1, g1, b1)

End Function

' SOURCE := https://stackoverflow.com/questions/51203917/math-behind-hsv-to-rgb-conversion-of-colors
' 0 <= h <= 360
' 0 <= s <= 1
' 0 <= v <= 1
Function HsvToRgb (h As Double, s As Double, v As Double)
    Dim r As Double
    Dim g As Double
    Dim b As Double
    Dim f As Double
    Dim p As Double
    Dim q As Double
    Dim t As Double
    Let i = Int(h * 6)
    f = h * 6 - i
    p = v * (1 - s)
    q = v * (1 - f * s)
    t = v * (1 - (1 - f) * s)
    Select Case (i Mod 6)
        Case 0: r = v: g = t: b = p: Exit Case
        Case 1: r = q: g = v: b = p: Exit Case
        Case 2: r = p: g = v: b = t: Exit Case
        Case 3: r = p: g = q: b = v: Exit Case
        Case 4: r = t: g = p: b = v: Exit Case
        Case 5: r = v: g = p: b = q: Exit Case
    End Select
    r = Round(r * 255)
    g = Round(g * 255)
    b = Round(b * 255)
    HsvToRgb = _RGB32(r, g, b)
End Function

' SOURCE := https://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion
' 0 <= h <= 360
' 0 <= s <= 1
' 0 <= l <= 1
Function HslToRgb (h, s, l)
    Dim r As Double
    Dim g As Double
    Dim b As Double
    Dim p As Double
    Dim q As Double
    If (s = 0) Then
        r = l ' achromatic
        g = l
        b = l
    Else
        If l < 0.5 Then
            q = l * (1 + s)
        Else
            q = l + s - l * s
        End If
        p = 2 * l - q
        r = HueToRgb(p, q, h + 1 / 3)
        g = HueToRgb(p, q, h)
        b = HueToRgb(p, q, h - 1 / 3)
    End If
    HslToRgb = _RGB32(r, g, b)
End Function

Function HueToRgb (p, q, t)
    Dim n As Double
    If (t < 0) Then t = t + 1
    If (t > 1) Then t = t - 1
    If (t < 1 / 6) Then
        n = p + (q - p) * 6 * t
    ElseIf (t < 1 / 2) Then
        n = q
    ElseIf (t < 2 / 3) Then
        n = p + (q - p) * (2 / 3 - t) * 6
    Else
        n = p
    End If
    HueToRgb = Round(n * 255)
End Function



