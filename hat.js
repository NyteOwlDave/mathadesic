
const cls = () => console.clear();
const again = () => location.reload();

const LEFT_ARROW = 37;
const RIGHT_ARROW = 39;
const UP_ARROW = 38;
const DOWN_ARROW = 40;

const basic = `

_Title "C-128 Hat Demo"
Const pi = 3.1415926
Randomize Timer
Rem aspect = 4 / 3
Dim W As Integer, H As Integer
W = 1280: H = 960
Dim CW As Integer, CH As Integer
CW = W \ 2: CH = H \ 2
Dim SX As Double, SY As Double
SX = 5: SY = 5
pixel = _RGB32(242, 242, 142)
Screen _NewImage(W, H, 32)
XP = 90: YP = 45
XR = 3.14 * 1.5
XF = XR / XP
REM ZF = XR / YP
For ZI = -YP To YP
    ZT = ZI * XP / YP
    XL = Int(Sqr(Abs(XP * XP - ZT * ZT)) + 0.5)
    For XI = -XL To XL
        XT = Sqr(XI * XI + ZT * ZT) * XF
        YY = (Sin(XT) + Sin(XT * 3) * 0.4) * YP
        X1 = Int(SX * (XI + ZI) + CW)
        Y1 = Int(SY * (YY - ZI) + CH)
        Y2 = Y1 + 1;
        Line (X1, Y1)-(X1, Y2), pixel
    Next XI
Next ZI

`;

function main() {
    try {
        // addEventListener( 'resize', render );
        render();
    } catch ( e ) { 
        console.error( e );
        alert( e );
    }
}

addEventListener( 'load', main );

const px    = n => `${n}px`;
const byte  = n => int( n ) % 256;
const field = ( n, i ) => i ? ( byte( n ) << i ) : byte( n );

function cssColor( r, g, b ) {
    r = field( r, 16 );
    g = field( g,  8 );
    b = field( b,  0 );
    i = ( r | g | b );
    c = "#" + i.toString( 16 ).padStart( 6, '0' );
    // console.log( "Color", { r, g, b, i, c } );
    return c;
}

function getClientSize( o ) {
    const rc = o.getClientRects()[ 0 ];
    const width = rc.width;
    const height = rc.height;
    return { width, height };
}

let paused = false;
let tracking = false;
let echo = true;
let speed = 0.025;
let rotation = 0;
let zoom = 0.75;
let offset = {
    x : 0 ,
    y : 0
};

function showState( override=false ) {
    if ( tracking || override ) {
        let state = { 
            paused, tracking, 
            speed, rotation, 
            zoom, offset 
        };
        let table = Object.entries( state );
        console.group( "State" );
        console.table( table );
        console.groupEnd();
    }
}

function render() {

    const pi = Math.PI;
    const twopi = 2 * pi;

    const canvas = document.querySelector( "canvas" );
    const ctx = canvas.getContext( "2d" );

    const pixel = ctx.strokeStyle = cssColor( 242, 242, 182 );

    function line( x1, y1, x2, y2 ) {
        ctx.strokeStyle = pixel;
        ctx.lineWidth = 1; 
        ctx.beginPath();
        ctx.moveTo( x1, y1 );
        ctx.lineTo( x2, y2 );
        ctx.stroke();
    }

    const XP = 90, YP = 45;
    const XR = pi * 1.5;

    const size = getClientSize( document.body );
    const minSize = Math.min( size.width, size.height );
    const maxSize = 2 * XP * Math.max( size.width, size.height );
    const scale = minSize / maxSize;
    const W = size.width;
    const H = size.height;
    const CW = W / 2, CH = H / 2;
    const SX = W * scale, SY = SX;

    canvas.width = W;
    canvas.height = H;

    canvas.style.width  = px( W );
    canvas.style.height = px( H );

    const XF = XR / XP;
    // const ZF = XR / YP;

    const k1 = XP * XP;

    ctx.fillStyle = "black";
    ctx.fillRect( 0, 0, W, H );

    if ( paused ) {
        requestAnimationFrame( render );
        return;
    }

    ctx.resetTransform();
    ctx.translate( CW, CH );
    ctx.rotate( rotation );

    for ( let ZI = -YP; ZI < YP; ZI += 1 ) {
        let ZT = ZI * XP / YP;
        let k2 = ZT * ZT;
        let k3 = abs( k1 - k2 );
        let k4 = sqrt( k3 ) + 0.5;
        let XL = int( k4 );
        for ( XI = -XL; XI < XL; XI += 1 ) {
            let k5 = XI * XI;
            let k6 = abs( k5 + k2 );
            let XT = sqrt( k6 ) * XF;
            let k7 = sin( XT ) + sin( XT * 3 ) * 0.4;
            let YY = k7 * YP;
            let X1 =  int( SX * ( XI + ZI ) * zoom );
            let Y1 = -int( SY * ( YY - ZI ) * zoom );
            let Y2 = Y1 + 1;
            line( X1, Y1, X1, Y2 );
        }
    }
    rotation = (rotation + speed) % twopi;
    requestAnimationFrame( render );
}

render.oldSpeed = speed;

function handled( evt ) {
    evt.preventDefault();
    evt.stopPropagation();
}

function keisha( evt ) {

    const code = evt.keyCode;
    console.log( { code } );

    if ( code === 13 ) {
        paused = false;
        return handled( evt );
    }

    if ( code === 27 ) {
        paused = !paused;
        return handled( evt );
    }

    if ( paused ) return;

    if ( code === 19 ) {
        if ( speed ) {
            render.oldSpeed = speed;
            speed = 0;
        } else {
            speed = render.oldSpeed;
        }
        return handled( evt );
    }

    switch( code ) {
        case LEFT_ARROW :
            speed = -Math.abs( speed );
            return handled( evt );
        case RIGHT_ARROW :
            speed = Math.abs( speed );
            return handled( evt );
        case UP_ARROW :
            scaleSpeed( 1.02 );
            return handled( evt );
        case DOWN_ARROW :
            scaleSpeed( 0.98 );
            return handled( evt );
    }
}

addEventListener( 'keydown', keisha );

function scaleSpeed( k=1 / 1.01 ) {
    speed *= k;
    const n = abs( speed );
    if ( n < 0.01 ) {
        speed = -0.03 * sgn( speed );
        return showState();
    }
    if ( n > 0.2 ) {
        speed = 0.2 * sgn( speed );
        return showState();
    }
}

function bumpZoom( k ) {
    zoom += k;
    if ( zoom < 0.05 ) {
        zoom = 0.05;
        return showState();
    }
    if ( zoom > 2 ) {
        zoom = 2;
        return showState();
    }
}

let zoomScale = 0.00042;

function wilbert( evt ) {
    handled( evt );
    let k = evt.deltaY * zoomScale;
    bumpZoom( k );
}

document.querySelector( 'canvas' )
.addEventListener( 'wheel', wilbert );


const hotKeyDoc = `
Left Arrow   |  37 | Rotate Left 
Right Arrow  |  39 | Rotate Right
Up Arrow     |  38 | Increase Rotation Speed
Down Arrow   |  40 | Decrease Rotation Speed
Escape       |  27 | Toggle Visibility
Enter        |  13 | Start Animation
Pause        |  19 | Toggle Animation
Home         |  36 | Pan Up
End          |  35 | Pan Down
Insert       |  45 | Unassigned
Delete       |  46 | Pan Left
Pageup       |  33 | Unassigned
PageDown     |  34 | Pan Right
Print Screen |  44 | System Use
Scroll Lock  | 145 | Unassigned
Caps Lock    |  20 | System Use
Num Lock     | 133 | System Use
Web Home     | 172 | System Use
Calculator   | 183 | System Use
Tab          |   9 | System Use
Backspace    |   8 | Unassigned
NumPad /     | 111 | Unassigned
NumPad *     | 106 | Unassigned
NumPad -     | 109 | Unassigned
NumPad +     | 107 | Unassigned
NumPad 0     |  48 | Unassigned
NumPad 1     |  49 | Unassigned
NumPad 2     |  50 | Unassigned
NumPad 3     |  51 | Unassigned
NumPad 4     |  52 | Unassigned
NumPad 5     |  53 | Unassigned
NumPad 6     |  54 | Unassigned
NumPad 7     |  55 | Unassigned
NumPad 8     |  56 | Unassigned
NumPad 9     |  57 | Unassigned
NumPad .     |  58 | Unassigned
`;
