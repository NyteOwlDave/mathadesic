
' 1 paper 7 : ink 0 : cls : dim g(3, 3)
' 2 For j = 1 To 3: For i = 1 To 3: Read g(i, j): Next i: Next j
' 3 For i = 0 To 175: For x = 0 To 255
' 4 Let i = 2 * (2 / 255):Let j = 2 * (y / 175) - 1:Let r = Sqr(i * i + j * j):
' Let v = Abs(0.5 * (Sin(9 * i * r) + Cos(6 * j * r))):
' Let c = Int(9.9999 * v)
' 5 plot inverse g(1 + x - 3*int(x/3), 1 + y - 3*int(y/3)) <=c; x,y
' 6 next y : next x : pause 0
' 9 Data 4,9,6,5,1,2,8,3,7


Cls


' Probability Matrix ( 3 x 3 )
Dim Shared sz As Integer: sz = 3
Dim Shared g(sz, sz): init

sk = 2.2 ' Screen Dimensions Scaling Constant
sw = 256 * sk ' Screen Width
sh = 176 * sk ' Screen Depth

' Zero-based Coordinate Limits
xMax = sw - 1 ' For x in [ 0 ... sw - 1 ]
yMax = sh - 1 ' For y in [ 0 ... sh - 1 ]

' Normalized Scaling Constants
' in X and Y directions
nx = 1 / xMax ' 1 screen width per xMax Pixels
ny = 1 / yMax ' 1 screen height per yMax Pixels

Screen _NewImage(sw, sh, 32)

For y = 0 To yMax
    ' Calculate once per row (for efficiency)
    j = 2 * (y * ny) - 1
    jj = j * j
    For x = 0 To xMax
        i = 2 * (x * nx)
        plot x, y, prob(i * i, jj)
    Next x
Next y

Sleep 0

Sub init
    Print "Probability Matrix"
    Print
    For j = 1 To sz
        For i = 1 To sz
            Read g(i, j)
            Print i, j, g(i, j)
        Next i
    Next j
    Sleep
End Sub

Function prob (ii, jj)
    xk = 9 ' Width Scaling Constant
    yk = 6 ' Height Scaling Constant
    r = Sqr(ii + jj) ' See how handy those squares are?
    cyj = 0.5 * Cos(yk * j * r) ' I like cosines to go first
    sxi = 0.5 * Sin(xk * i * r) ' Then sines (x then y, right?)
    v = Abs(sxi + cyj)
    prob = Int(9.9999 * v)
End Function


Sub plot (x, y, c)
    ' Shared sz
    ' Shared g()
    ' Exit Sub
    ' sz = 3 ' Probability Matrix Order ( 3 x 3 )
    fgc = _RGB(4, 4, 42)
    bgc = _RGB(242, 242, 182)
    px = x + 1 - sz * Int(x / sz)
    py = y + 1 - sz * Int(y / sz)
    pr = g(px, py)
    ' pr = g(1, 1)
    ' pr = Rnd: c = 0.3
    If pr <= c Then
        PSet (x, y), bgc
    Else
        PSet (x, y), fgc
    End If
End Sub

Data 4,9,6,5,1,2,8,3,7




