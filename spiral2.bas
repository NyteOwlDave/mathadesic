Screen 12
PI = 3.14
DEG = PI / 180:
A = 0
While A < 1400
    Color Rnd(1) * 15
    W = (A / 240) * Cos(A * 5.5 * DEG) * 3
    R = 30 + 6 * A / 45
    SINA = Sin(A * DEG): COSA = Cos(A * DEG)
    PSet (300 + (R + W) * COSA, 250 + (R + W) * SINA)
    PSet (300 + (R - W) * COSA, 250 + (R - W) * SINA)
    A = A + 1
WEND

