' https://www.facebook.com/photo/?fbid=1905598053549670&set=gm.4031460770498655&idorvanity=2057165187928233

On Error GoTo ErrorRoutine
Timer On
Randomize Timer
ColorCount = 1
FirstTime$ = "Y": ColorOn$ = "Y": XRay$ = "N"
CMD$ = Command$
If Left$(CMD$, 1) = "M" Or Left$(CMD$, 1) = "m" Then ColorOn$ = "N"
If Left$(CMD$, 1) = "X" Or Left$(CMD$, 1) = "x" Then XRay$ = "Y"
MainLoopStart:
If Left$(CMD$, 1) = "?" Then GoSub TalkIt: Cls: End
Screen 12
Color 15: Cls
Window (-20, -20)-(25, 20)
While Z$ <> Chr$(27)
    A = Rnd: Cls
    If FirstTime$ = "Y" Then Print "MIRA ? for Help": FirstTime$ = "N"
    GoSub Mira
Wend
Screen 0: Color 7, 0: Cls: End
Mira:
If A > .9999 Then A = .9999
If A < .0001 Then A = .0001
If A = .5 Then A = .4999
If XRay$ = "Y" Then Print A
B = .9998: P = 15000: C = 2 - 2 * A
X = 0: Y = 12.1
W = A * X + C * X * X / (1 + X * X)
For Counter = 0 To P
    If Counter Mod 1000 = 0 Then ColorCount = ColorCount + 1
    If ColorCount > 15 Then ColorCount = 1
    If ColorOn$ = "Y" Then Color ColorCount
    If Counter > 100 Then PSet (X, Y)
    Z = X: X = B * Y + W: U = X * X
    W = A * X + C * U / (1 + U): Y = W - Z
    Z$ = InKey$: If Z$ = Chr$(27) GoTo GetOutMira
    If Z$ = Chr$(13) GoTo GetOutMira
Next Counter
GetOutMira:
Sleep 2
Return
TalkIt:
Color 15, 0: Cls
Locate 2, 10
Print "          MIRA v1.1 (c)1992,1993 Wayne Lindimore"
Color 7, 0
Locate 4, 10
Print "Mira generates symmetrical fractal designs. An infinite"
Locate 5, 10
Print "variety of these patterns are created as each new pattern"
Locate 6, 10
Print "is seeded with a random number. It is named after the"
Locate 7, 10
Print "mathematictian who used similar models for analysis of"
Locate 8, 10
Print "elementary particles."
Locate 11, 10
Print "This copyrighted program may be freely used and distributed."
Locate 14, 10
Print "This program requires VGA."
Locate 16, 10
Print "<ESC> to Exit   <Enter> to Change Pattern"
Locate 17, 10
Print "'MIRA M' for Black & White     'MIRA X' for Print Random Seed"
Locate 19, 10
Print "Orbital Algorithms from 'Fractals' by Hans Lauwerier"
GoSub PKey
GoSub WaitX
Return
WaitX:
Z$ = InKey$
If Z$ = "" GoTo WaitX
Return
PKey:
Color 15
Locate 23, 55
Print "*";
Color 4
Print "Press a key to resume";
Color 15
Print "*";
Return
Rem   ********** Error Handling
ErrorRoutine:
ErrCode = Err: ErrLine = Erl
Print "***ERROR*** "; ErrCode;
If Err = 5 Then Print: Print "Unsupported Video - Enter MIRA ?": Print
End

