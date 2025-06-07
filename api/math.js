
let int   = n => parseInt( n );
let float = n => parseFloat( n );

let ceil  = n => Math.ceil( n );
let floor = n => Math.floor( n );
let round = n => Math.round( n );
let trunc = n => Math.trunc( n );

let abs  = n => Math.abs( n );
let sgn  = n => Math.sign( n );
let sgnz = n => n ? sgn( n ) : 0;

let rnd  = n => n ? ( n * Math.random() ) : Math.random();

let irnd = function( n ) {
    n = n || 0x7FFFFFFF;
    return int( rnd( n ) );
}

let pow   = (n, p) => Math.pow( n, p );
let pow2  = n => pow( n,  2 );
let pow10 = n => pow( n, 10 );

let sqrt = n => Math.sqrt( n );
let cbrt = n => Math.cbrt( n );
let exp  = n => Math.exp( n );

let log   = n => Math.log( n );
let log2  = n => Math.log2( n );
let log10 = n => Math.log10( n );

let logn  = ( n, b ) => log( n ) / log( b );
let rootn = ( n, b ) => pow( n, 1 / b );

let square = n => ( n ** 2 );
let cube   = n => ( n ** 3 );

let cruxx = ( a, b ) => (square( a ) - square( b ));
let crux  = ( a, b ) => square( a - b );

let sin = n => Math.sin( n );
let cos = n => Math.cos( n );
let tan = n => Math.tan( n );

let asin = n => Math.asin( n );
let acos = n => Math.acos( n );
let atan = n => Math.atan( n );

let zeta  = ( x, y ) => ( x*x + y*y );
let zulu  = ( x, y ) => square( x*x - y*y );
let hypot = ( y, x ) => Math.hypot( y, x );
let atan2 = ( y, x ) => Math.atan2( y, x );

function polar( y, x ) {
    const r = hypot( y, x );
    const t = atan2( y, x );
    return { x, y, r, t };
}

function normal( x, y ) {
    let tiny = 1e-10;
    let w = 1;
    let z = hypot( y, x );
    if ( z > tiny ) {
        w /= z;
        x *= w;
        y *= w;
    } else {
        x = 1;
        y = y;
    }
    return { x, y, z, w, tiny };
}

console.log( 'Math Module Loaded' );

