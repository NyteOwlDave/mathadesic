<style>
:root {
    --sample-font-family : monospace;
    --sample-font-size   : 11pt;
}
pre, code {
   font-family : var( --sample-font-family );
   font-size   : var( --sample-font-size   );
}
</style>

# Pike's Peak Demo

## Original for PC-Basic

```
100 X2=8:Y2=8: REM starting point
110 CLS:SCREEN 9
120 FOR X=0 TO 20
130 FOR Y=0 TO 20
140 D=SQR((X-X2)^2+(Y-Y2)^2)
150 XNEW=300+14*Y-X*10
160 YNEW=150+X*4+Y*5-150*COS(D/3)/(D+1)
170 IF Y=0 GOTO 250
180 YD=(YNEW-YOLD)/(XNEW-XOLD) :REM delta y
190 Y4=YOLD
200 FOR N=XOLD TO XNEW
210 LINE (N,380)-(N,Y4),0 :REM blank line
220 Y4=Y4+YD
230 NEXT N
240 LINE (XOLD,YOLD)-(XNEW,YNEW),10
250 XOLD=XNEW:YOLD=YNEW
260 NEXT Y
270 NEXT X
300 END
```

## Modified for QB64

```
X2=8 : Y2=8 : REM starting point
CLS
SCREEN 9
FOR X=0 TO 20
    FOR Y=0 TO 20
        D=SQR((X-X2)^2+(Y-Y2)^2)
        XNEW=300+14*Y-X*10
        YNEW=150+X*4+Y*5-150*COS(D/3)/(D+1)
        IF Y <> 0 THEN
            YD=(YNEW-YOLD)/(XNEW-XOLD) : REM delta y
            Y4=YOLD
            FOR N=XOLD TO XNEW
                LINE (N,380)-(N,Y4),0 : REM blank line
                Y4=Y4+YD
            NEXT N
            LINE (XOLD,YOLD)-(XNEW,YNEW),10
        ENDIF
        XOLD=XNEW
        YOLD=YNEW
    NEXT Y
NEXT X
```

## Modified for JavaScipt Canvas

> HTML

```html
<canvas></canvas>
```

> JavaScript

```javascript

const square = n => n * n;
const sqrt = n => Math.sqrt( n );
const cos  = n => Math.cos( t );

const cgaColors = [
    "black"    , "darkblue", "darkgreen", "darkred",
    "darkgray" , "blue", "green", "red",
];

const canvas  = document.querySelector( 'canvas' );
const context = canvas.getContext( "2d" );

function setLineWidth( n ) {
    context.lineWidth = n; 
}

function setLineStyle( style ) {
    context.strokeStyle = style;
}

function setFillStyle( style ) {
    context.fillStyle = style;
}

function cls( style ) {
    setFillStyle( style );
    context.fillRect( 0, 0, w, h );
}

function setLineWidth( n ) {
    context.lineWidth = n; 
}

function cls( color ) {}

function render() {
    let X2 = 8; // REM starting point
    let Y2 = 8;
    let XOLD = 0;
    let YOLD = 0;
    cls( "black" );
    for( let X=0; X <= 20; X += 1 ) {
        for ( let Y=0; Y <= 20; Y += 1 ) {
            let D = sqrt( square(X-X2) + square(Y-Y2) );
            let XNEW = 300 + 14*Y - X*10;
            let YNEW = 150 + X*4 + Y*5 - 150 * cos( D/3 ) / (D+1);
            if ( Y ) {
                let YD = (YNEW - YOLD) / (XNEW - XOLD); // REM delta y
                let Y4 = YOLD;
                for ( let N = XOLD; N <= XNEW; N += 1 ) {
                    line ( N, 380,  N, Y4, "black" );  // blank line
                    Y4 = Y4 + YD;
                }
                line( XOLD, YOLD, XNEW YNEW, "green" );
            }
            XOLD = XNEW;
            YOLD = YNEW;
        }
    }
}

```

---

<footer>
<nav>
<a href="https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D">Canvas</a>
</nav>
</footer>

