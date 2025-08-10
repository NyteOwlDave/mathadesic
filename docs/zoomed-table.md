
<header>
    <h1 contenteditable id="docTitle">Untitled Table</h1>
</header>

<script>
document.title = document.getElementById( 'docTitle' );
</script>

|1|2|3|
|------------|-----------|------------|
|   int      |   float   |   ceil     |
|   floor    |   round   |   trunc    |
|   abs      |   sgn     |   sgnz     |
|   rnd      |   irnd    |   pow      |
|   pow2     |   pow10   |   sqrt     |
|   cbrt     |   exp     |   log      |
|   log2     |   log10   |   logn     |
|   rootn    |   square  |   cube     |
|   cruxx    |   crux    |   sin      |
|   cos      |   tan     |   asin     |
|   acos     |   atan    |   zeta     | 
|   zulu     |   hypot   |    atan2   |
|   polar    |   normal  |            | 

<style>
html, body {
    border : 0;
    margin : 0;
    padding : 0;
    background : rgb( 252, 252, 222 );
}
body {
    position : absolute;
    overflow : scroll;
    width    : 100%;
    height   : 100%;
    resize   : none;
}
table {
    position : absolute;
    margin-top : 90px;
    width    : 100%;
    height   : 100%;
    resize   : none;
}
header {
    z-index  : 1000;  
    position : fixed;
    width    : 100%;
    resize   : none;  
    text-align : center;
    background : rgba( 122, 172, 242, 1 );
}  
td {  
   padding : 1.447ch;
}
td:focus {
    color      : #0404F4;
    background : mintcream;
}
</style>

<script>  
D = document;
</script>

<script>  
function main() {
    try {
        const table = D.querySelector( 'table' );
        table.addEventListener( 'keydown', hoopla );
        const cells = Array.from( D.querySelectorAll( 'td' ) );
        cells.forEach( o => o.setAttribute( 'contenteditable', '' ) );
    } catch ( e ) { 
        alert( e );
    }
}
addEventListener( 'load', main );
</script>

<script>
function getTableSize( td ) {
    const tr = td.parentElement;
    const tb = tr.parentElement;
    const rows = Array.from( tb.rows );
    const rowCount = tb.rows.length;
    let colCount = 0;
    while ( rows.length ) {
        const tr = rows.pop();
        const n = tr.cells.length;
        colCount = Math.max( n, colCount );
    }
    return { rowCount, colCount };
}
</script>

<script>
let EMPTY_CELL = "❔";
function appendRow( tb, numCols ) {
    const tr = tb.insertRow();
    while ( tr.cells.length < numCols ) {
        const td = tr.insertCell();
        td.textContent = EMPTY_CELL;
        td.setAttribute( 'contenteditable', '' );
    }
    return tr;
}
</script>

<script>
function showFlash( td ) {
}
</script>

<script>
function scrollToBottom() {
    window.scrollTo( 0, screen.availHeight );
}
</script>

<!-- 
[ALT]+[ENTER]     | => Run Script
[ALT]+[G]         | => New GUID
[ALT]+[C]         | => Epoch Clock
[ALT]+[T]         | => Time
[ALT]+[CTRL]+[T]  | => Date and Time
[ALT]+[SHIFT]+[T] | => Date
[ALT]+[?] => ?
[ALT]+[?] => ?
[ALT]+[?] => ?
[ALT]+[?] => ?
-->

<script>
function harpo( event ) {
    if ( event instanceof Event ) {
        const code = event.keyCode;
        if ( [ 16, 17, 18 ].includes( code ) ) return;
        harpo.event = event;
        return harpo( code );
    }
    const code = event;
    event = harpo.event;
    harpo.event = null;
    if ( code === 145 ) {
        mine(); // Handle harpo event, if any
        harpo.keylock = (! harpo.keylock );
        return;
    }
    if ( harpo.keylock ) {
        mine(); // Handle harpo event, if any
        D.activeElement.textContent = code;
        return;
    }
    if ( event.altKey ) {
        if ( code === 13 ) {
            mine(); // Handle harpo event, if any
            const o = event.target;
            try { 
                harpo.output = window.eval( o.innerText );
            } catch ( e ) {
                alert( harpo.error = e );
                throw e;
            }
            return;
        }
        if ( code === alphaKeyCode( 'M' ) ) {
            mine(); // Handle harpo event, if any
            const o = event.target;
            appendModuleDetails();
            return;
        }
        if ( code === alphaKeyCode( 'C' ) ) {
            mine(); // Handle harpo event, if any
            const o = event.target;
            o.textContent = Date.now();
            return;
        }
        if ( code === alphaKeyCode( 'G' ) ) {
            mine(); // Handle harpo event, if any
            const o = event.target;
            o.textContent = tigger();
            return;
        }
        if ( code === alphaKeyCode( 'R' ) ) {
            mine(); // Handle harpo event, if any
            const o = event.target;
            let num = parseFloat( o.textContent );
            num = ( isFinite( num ) ? num : 1 );
            if ( event.ctrlKey ) {
                num *= 10;
            }
            o.textContent = Math.random() * num;
            return;
        }
        if ( code === alphaKeyCode( 'T' ) ) {
            mine(); // Handle harpo event, if any
            const o = event.target;
            const dt = new Date();
            if ( event.ctrlKey ) {
                o.textContent = dt.toLocaleString();
            } else if ( event.shiftKey ) {
                o.textContent = dt.toDateString();
            } else { 
                o.textContent = dt.toTimeString();
            }
            return;
        }
    }
    if ( event.ctrlKey || event.shiftKey ) {
        return;
    }
    if ( code === 38 ) { moveRowBy( -1, event ); }
    if ( code === 40 ) { moveRowBy(  1, event ); }
    function mine() {
        if ( event ) handled( event );
    }
}
</script>

<script>
function alphaKeyCode( s ) {
    return s.trim().toUpperCase().charCodeAt( 0 );
}
</script>

<script>
function moveRowBy( delta=0, event ) {
    if ( event ) handled( event );
    alert( `Row Delta ${delta}` );
}
</script>

<script>
function appendModuleDetails() {
    alert( "Incomplete: appendModuleDetails()" );
}
</script>

<script>
function tigger() {
    return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
        (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    );
}
</script>

<script>
function hoopla( event ) {
    const code = event.keyCode;
    if ( [ 16, 17, 18 ].includes( code ) ) return;
    if ( code !== 9 ) { 
        return harpo( event );
    };
    const td = D.activeElement;
    const tr = td.parentElement;
    const col = td.cellIndex;
    const row = tr.rowIndex;
    const size = getTableSize( td );
    const rowMax = size.rowCount - 1;
    const colMax = size.colCount - 1;
    if ( event.shiftKey ) {
        if ( row > 1 ) return;
        if ( col > 0 ) return;
        handled( event );
        showFlash( td );
    } else {
        if ( row < rowMax ) return;
        if ( col < colMax ) return;
        handled( event );
        const newRow = appendRow( tr.parentElement, size.colCount );
        newRow.cells[ 0 ].focus();
        scrollToBottom();
    }
}
function handled( event ) {
    event.preventDefault();
    event.stopPropagation();
}
</script>
