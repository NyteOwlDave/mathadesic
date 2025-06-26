
# Lightening Demo

### Platform: AppleSoft BASIC

> lightening.bas

```
10 HOME : HGR
20 K = 16
30 DIM X(K)
40 DEF FN R(Z) = INT(RND(1)*2)
50 M = 32 : REM M = 2 ^ N
60 N=1
70 X(N) = FN R(40) + 120

80 F = FN R(M)-1 : IF F < 0 THEN GOSUB 160
90 FOR T = 1 TO N
100 DX = FN R(3)-1 : Y = Y + 1 : IF Y > 191 THEN END
110 X(T)=X(T)+DX : X=X(T)
120 IF X < 1 OR X > 279 THEN 140
130 HCOLOR = 3 : HPLOT X,Y
140 NEXT
150 GOTO 80

160 M=M/2 : X = X(N) : N1 = 2 * N : R = N
170 FOR Z = N1 TO 2 STEP - 2
180 Z2 = Z - 1 : X(Z) = X(R) : X(Z2) = X(R)
190 K0 = FN R(18) - 2
200 IF K0 < 0  THEN X(Z) = 0
210 IF K0 > 13 THEN X(Z2) = 0
220 R = R - 1 : NEXT
230 N = N1 : IF N = K THEN POP : END
240 RETURN
```

---

