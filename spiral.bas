ex = 1200
ey = ex / ((1 + Sqr(5)) / 2)
Screen _NewImage(ex, ey, 32) ' Create a new graphics window with the specified resolution (1500x1000) and color depth (32-bit).
xp = ex / 2
yp = ey / 2
r = 1.5 ' Set the initial radius of the spiral.
pi = 3.14159265 ' Define the value of pi for later calculations.
fi = (1 + Sqr(5)) / 2 ' Golden ratio constant.
p = 8 ' Controls the number of steps per degree. Increase to get a smoother spiral.
j = 3 ' Controls the number of complete rotations of the spiral.
a = 0 ' Initialize the variable 'a' to count the number of iterations (steps).
l = fi ^ (1 / (90 * p)) ' Calculate the growth factor 'l' for 90 degrees with the given precision (p).
For k = 0 To 360 * j Step 1 / p ' Loop through 0 to 360 degrees with the given precision (p) and number of rotations (j).
    a = a + 1 ' Increment the iteration count.
    kn = k * (pi / 180) ' Convert the angle from degrees to radians.
    ' Calculate the coordinates for the current point on the spiral using the golden ratio.
    x1 = xp + r * Cos(kn)
    y1 = yp - r * Sin(kn)
    PSet (x1, y1) ' Draw a point at the calculated coordinates on the graphics window.
    r = r * l ' Update the radius for the next iteration based on the growth factor 'l'.
Next k
Print "Number of iterations: "; a ' Output the total number of iterations (steps) taken in the loop.
Sleep ' Pause the program to view the spiral.
End ' End the program.

