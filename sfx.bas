Do
    For i = 1 To 10000 Step 10
        f! = 555 + 40 * Sin(i / 10)
        Sound 20000 - i + f!, .05
        Sound 10000 - i + f!, .05
        If InKey$ <> "" Then End
    Next i
    For i = 10000 To 1 Step -10
        f! = 555 + 40 * Sin(i / 10)
        Sound 20000 - i + f!, .05
        Sound 10000 - i + f!, .05
        If InKey$ <> "" Then End
    Next i
Loop

