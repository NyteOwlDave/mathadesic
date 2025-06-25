
# spirograph.bas

```
Rem Compiles on QB64
Screen _NewImage(1024, 768, 32)
Dim a(36), b(36)
i = 360: j = 360
For h = 1 To 6
    For n = 1 To 36
        k = n / 18 * 3.1415927#
        a(n) = 508 + i * Cos(k)
        b(n) = 388 + j * Sin(k)
        PSet (a(n), b(n)), _RGB32(200, 200, 200)
    Next n
    For n = 1 To 36
        m = n + 12
        If m > 36 Then m = m - 36
        r = (j * 4) Mod 256
        g = (i * 2) Mod 256
        b = (m * 6) Mod 256
        col = _RGB(r, g, b)
        Line (a(n), b(n))-(a(m), b(m)), col
    Next n
    i = i / 2
    j = j / 2
Next h
End
```

# spirograph.js

<pre id="jsCode">
</pre>

<script id="jsSource">
    jsCode.innerText = jsSource.innerText;
</script>
