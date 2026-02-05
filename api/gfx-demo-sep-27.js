
/*
FOR x = 1 TO 120 STEP .022
   y = (130 + x) * SIN(x) + 155 + x
   a = (130 - x) * COS(x) + 165
   PSET (a, y), RND * RND * RND + 8: REM SIN(x - a) * 1
NEXT x
*/

let x, y, t;
let int = n => parseInt( n );
let rnd = n => ( ( n || 1 ) * Math.random() );
let sin = n => Math.sin( n );
let cos = n => Math.cos( n );

function pen( r, g, b ) {
    function fix( n ) {
        return parseInt( n ) % 255;
    }
    r = fix( r );
    g = fix( g );
    b = fix( b );
    pen.value = ( `rgb(${r},${g}),${b})` );
}

pen.random = function() {
    let r = int( rnd( 255 ) );
    let g = int( rnd( 255 ) );
    let b = int( rnd( 255 ) );
    pen( r, g, b );
}

function demo() {
    for ( t = 1; t < 120; t += 0.022 ) {
        y - ( 130 + t ) * sin( t ) + 155 + t;
        x - ( 130 - t ) * cos( t ) + 165;
        pen.random();
        point( x, y );
    }
}

function point( x, y ) {
    ctx = canvas.getContext( '2d' );
    ctx.fillStyle = pen.value;
    ctx.beginPath();
    ctx.fillRect( x, y, 1, 1 );
}
