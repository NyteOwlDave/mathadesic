Screen _NewImage(640, 400, 32)
t& = _NewImage(640, 400, 32)
_FullScreen
_PrintMode _KeepBackground
Dim A$(1 To 2)
A$(1) = "\"
A$(2) = "/"
Randomize Timer
RR = 128: GG = 128: BB = 128
Color _RGB32(RR, GG, BB), _RGB32(0, 0, 0)
X = 0: y = 0
kbi = 1
trim = _Height - 8 'Need this because of curious display quirk in facebook posts
Do
    _Limit _Width 'have to limit output so it's easy to watch and free up system resources for other programs
    _PrintString (X, y), A$(1 + Int(Rnd * 2))
    X = X + 7
    If X > _Width Then 'advance a line and do color change
        y = y + 8
        X = 0
        KB = kbi * Int(1 + Rnd * 7)
        RR = RR + KB: GG = GG + KB: BB = BB + KB
        If RR > 255 Or RR < 21 Then
            kbi = kbi * -1
        End If
        Color _RGB32(RR, GG, BB), _RGB32(0, 0, 0) 'changing the print color
    End If
    If y > (_Height - 16) Then 'simulate scrolling
        _PutImage (0, 0)-(_Width, _Height), 0, t&, (0, 0)-(_Width, _Height)
        Cls
        _PutImage (-1, -9)-(_Width, trim), t&, 0
        y = _Height - 16
    End If
    _Display 'to eliminate flicker
Loop Until InKey$ <> ""

