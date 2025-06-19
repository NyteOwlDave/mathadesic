
' Original Source Code for QB64
' bubbles.bas
' 2025-JUN-01

DIM SHARED pi, r, t, u, v, x 
DIM i AS INTEGER, j AS INTEGER
DIM px AS INTEGER, py AS INTEGER
DIM rr AS INTEGER, gg AS INTEGER, bb AS INTEGER
SCREEN 12
RANDOMIZE TIMER

pi= 4 * ATN(1)
r = 2 * pi / 235
t = 4 * RND
x = 0: u = 0: v = 0

CLS

FOR i = 0 TO 249
    FOR j = 0 TO 249
        u = SIN(i + v) + SIN(r * i + x)
        v = COS(i + v) + COS(r * i + x)
        x = u + t
        px = INT (320 + 108 * u)
        py = INT (240 + 108 * v)
        IF px >= 0  AND  
           px < 640 AND
           py >= 0  AND
           py < 480 THEN
            rr = (i * 3) MOD 256
            gg = (j * 3) MOD 256
            bb = (255 - (i + j) \ 2) MOD 256 
            LINE (px, py)-(px + 1, py+1), _RGB (rr, gg, bb), BF
        END IF
    NEXT j
NEXT i
