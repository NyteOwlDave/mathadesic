
Screen _NewImage(500, 500, 32)

fgc = _RGB(42, 42, 4)
bgc = _RGB(4, 4, 42)

For x = 0 To 499
    For y = 0 To 499
        If x * y And 7 Then
            PSet (x, y), bgc
        Else
            PSet (x, y), fgc
        End If
    Next
Next

Sleep

