Screen _NewImage(1920, 1080, 256)
centerX = 1920 / 2
horizonY = 520
Const roadWidth = 1920
Const maxZ = 50
Type LinePoint
    z As Single
    y As Single
End Type
Dim lines(maxZ) As LinePoint
For i = 0 To maxZ: lines(i).z = i + .1: Next
Do
    Cls
    For i = 0 To maxZ: z = lines(i).z: scale = 1024 / z: y = horizonY + scale
        Line (centerX - roadWidth * scale / 2, y + 1)-(centerX + roadWidth * scale / 2, y + 1), 11
        Line (centerX - roadWidth * scale / 2, y)-(centerX + roadWidth * scale / 2, y), 3
        Line (centerX - roadWidth * scale / 2, horizonY - (y - horizonY) + 40)-(centerX + roadWidth * scale / 2, horizonY - (y - horizonY) + 40), 5
        lines(i).z = lines(i).z - 0.1
        If lines(i).z < 1 Then lines(i).z = maxZ
    Next
    For x = -90 + r To 90 + r: px = x / 10! * roadWidth / 640
        x1 = centerX + px * (1080 / 1)
        y1 = horizonY + (1080 / 1)
        x2 = centerX + px * (1080 / maxZ)
        y2 = horizonY + (1080 / maxZ)
        Line (x1, y1 + 1)-(x2, y2 + 1), 15
        Line (x1, y1)-(x2, y2), 11
        Line (0, 1)-(1919, 1079), 11, B
    Next
    _Display: _Delay 0.016
Loop


