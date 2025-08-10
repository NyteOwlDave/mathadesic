<meta charset="utf-8">
<script>  
AppState = {};
AppState.title = document.title = "Math Plus Notes";
</script>  

⋄ [Workspace](./)
⋄ [42](/home/dave/Mount/42/)
⋄ 

<style>
@import url("http://dave-legacy/42/style/cool-table.css");
html, body, table {
    text-align : center;
}
table {
    width : 80%;
    margin-left : 8%;
}
td {  
    border : 2px solid transparent;
}
td:focus {
    border     : 2px solid green;
    outline    : none;
    color      : #040442;
    background : #F2F2F2;
}
</style>

# Math Plus

<!--
|     A      |     B     |      C     |
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
-->

<style>
table {  
    border : 5px solid transparent;  
    width : 100%;
    margin-left : 0;
}
tbody, tr {  
    background : transparent;  
}  
tr {  
    text-align : left;  
}
td {
    display : inline-block;  
    text-align : center;  
    margin-left : 20px;
    border-radius : 42px;
    left : 0;
    width      : 14%;
    margin-top : 5px;
}
tbody {  
    background : transparent;
    border : 5px solid transparent;  
}  
.table-container {
    border-radius : 42px;
    background   : rgba( 111, 121, 252, 0.555 );  
    padding : 0;
}  
 
tr:first-child > td {  
    margin-top : 25px;
}
tr:last-child > td {  
    margin-bottom : 25px;
}
</style>

<style>
button:hover {    
    box-shadow : 0px 0px 13px #040442;  
    text-shadow : 0px 0px 9px gold;  
}  
button {  
    cursor   : pointer;
    position : fixed;
    display  : inline-block;
    border-radius : 50%;
    min-width  : 5ch;
    min-height : 5ch;
    border : none;
    right    : 3ch;
}
button[a] {
    bottom   : 3ch;
}
.remove-button {
    --w : 3.4ch;  
    --h : 3.4ch;  
    display : inline-block;
    border-radius : 50%;
/*
    min-width  : var( --w );
    min-height : var( --h );
    max-width  : var( --w );
    max-height : var( --h );
    width  : var( --w );
    height : var( --h );
*/
    padding : 0.4ch;
    transform : scale( 0.9 );
}
</style>

<button a onclick="addRow()">
    <b>➕</b>
</button>  

<div class="table-container">
<table>
<tbody>
<tr>
<td>int</td>
<td>float</td>
<td>ceil</td>
<td>floor</td>
</tr>
<tr>
<td>round</td>
<td>trunc</td>
<td>abs</td>
<td>sgn</td>
</tr>
<tr>
<td>sgnz</td>
<td>rnd</td>
<td>irnd</td>
<td>pow</td>
</tr>
<tr>
<td>pow2</td>
<td>pow10</td>
<td>sqrt</td>
<td>cbrt</td>
</tr>
<tr>
<td>exp</td>
<td>log</td>
<td>log2</td>
<td>log10</td>
</tr>
<tr>
<td>logn</td>
<td>rootn</td>
<td>square</td>
<td>cube</td>
</tr>
<tr>
<td>cruxx</td>
<td>crux</td>
<td>sin</td>
<td>cos</td>
</tr>
<tr>
<td>tan</td>
<td>asin</td>
<td>acos</td>
<td>atan</td>
</tr>
<tr>
<td>zeta</td>
<td>zulu</td>
<td>hypot</td>
<td>atan2</td>
</tr>
<tr>
<td>polar</td>
<td>normal</td>
<td>❔</td>
<td>❔</td>
</tr>
</tbody>
</table>
</div>

<script src="http://dave-legacy/42/api/editables.js"></script>

<script>
function allCellsEditable() {
    editables( 'td' );
}
</script>

<script>
function removeRow( event ) {
    const tr = event.target.parentElement;  
    tr.remove();
    event.preventDefault();
    event.stopPropagation();
    window.scrollTo( 0, screen.availHeight )
}  
</script>

<script>
function makeRemoveButton( tr ) {  
    let td = tr.cells.item( 4 );  
    td.addEventListener( 'click', removeRow );
    td.classList.add( 'remove-button' );  
    td.textContent = "➖";
}
</script>

<script>
function addRow() {
    const tr = document.createElement( 'tr' );
    let n;
    while ( ( n = tr.cells.length ) < 5 ) {
        const td = tr.insertCell();
        if ( n < 4 ) {
            td.innerText= "❔";  
            editable( td  );
        } else {   
            makeRemoveButton( tr );
        } 
    }
    const table = document.querySelector( 'table' );  
    const tbody = table.tBodies[ 0 ];
    tbody.appendChild( tr );  
    window.scrollTo( 0, screen.availHeight )
}
allCellsEditable();
</script>

