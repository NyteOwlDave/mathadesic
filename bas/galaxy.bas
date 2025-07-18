SCREEN 12 ' 640x480
RANDOMIZE TIMER
COLOR 0, 0
COLOR 1, &H3F
COLOR 2, &H3F3F
COLOR 3, &H3F3F3F
CLS
FOR n = 1 TO 50000
    s = LOG(RND)
    t = 300 * RND
    u = 60 * s * SIN(t)
    v = 50 * s * COS(t)
    p = 3 * s
    c = COS(p)
    s2 = SIN(p)
    x = u * c + v * s2
    y = -u * s2 + v * c
    r = x * x + y * y
    z = 80 * EXP(-r / 10)
    z = z * (RND - .5)
    y = y + z + INT(RND * 40) + 1
    x = x + (-z * .3 * INT(RND * 20 + 1))
    xx = 2 * INT(160 + x * .7 + y * .3)
    yy = 2 * INT(120 + x * .1 + y * .4)
    IF xx >= 0 AND xx < 640 AND yy >= 0 AND yy < 480 THEN
        col = POINT(xx, yy)
        IF col < 3 THEN col = col + 1
        LINE (xx, yy)-(xx + 1, yy + 1), col, BF
    END IF
NEXT
SLEEP
