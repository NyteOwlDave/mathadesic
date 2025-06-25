
function createCanvas( w, h ) {
    const D = document;
    const canvas = D.createElement( 'canvas' );
    canvas.id = "canvas";
    canvas.width  = w || 1024;
    canvas.height = h || 768;
    container.appendChild( canvas );
    return canvas;
}

