
function zoom( event ) {
    event.target.requestFullscreen();
}

function createCanvas( w, h ) {
    const D = document;
    const canvas = D.createElement( 'canvas' );
    canvas.id = "canvas";
    canvas.width  = w || 1024;
    canvas.height = h || 768;
    container.appendChild( canvas );
    canvas.style.cursor = "pointer";
    canvas.title = "Full Screen";
    canvas.addEventListener( 'click', zoom );
    return canvas;
}

function rgb( r, g, b ) {
    const fix = n => parseInt( n ) & 255;
    r = fix( r );
    g = fix( g );
    b = fix( b );
    return `rgb(${r}, ${g}, ${b})`;
}

