/*
    ZXASCII
    AUTO -1
    PROG demos:graphics/flagwave
    CHANGED FALSE
*/


Screen = {
    w : 80 ,
    h : 80
};

const min = ( a, b ) => Math.min( a, b );
const max = ( a, b ) => Math.max( a, b );
const sin = ( t ) => Math.sin( t );
const cos = ( t ) => Math.cos( t );

// img is ImageData object (pixmap)
function getTexel( u, v, img ) {}

function pen( color ) {};
function brush( color ) {};
function circle( cx, cy, radius, color ) {};
function circleFilled( cx, cy, radius, color ) {};
function clearCanvas() {} // TODO

phase = 0;
tao   = 1;
c  = 25;
d  = c/2;
e  = 20;
Screen.cx = ( Screen.w - 40 );
Screen.cy = ( Screen.h - 40 );
st = min( Screen.cx, Screen.cy ) / c;
cx /= st;

rotation = ( x, y ) => ( phase + (x/c)*tau + (y/c)*tau );

// Line# 40
function render() {
    if ( Screen.paused ) {
        requestAnimationFrame( render );
        return;
    }
    clearCanvas();
    phase += 0.075:    
    for( let y = 1 to c ) {
        for( let x = 1 to cx ) {
            const xp = x*st + d;  // Line# 50
            const yp = y*st + d;
            const angle = rotation( x, y );
            const xs = e * sin( angle );
            const ys = e * cos( angle );
            const color = getTexel( xp, yp, flag );
            circleFilled( xp + xs, yp + ys, 6, color );
        }
    }
    requestAnimationFrame( render );
}

function createFlagImage() {
}

function createCanvas() {
}

createFlagImage();

createCanvas();

render();





