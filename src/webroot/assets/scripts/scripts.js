// START Row Highlighter
// I change the background color of the row the mouse is over
// <tr class="row" id="ListRow1" onMouseover="tdOver('ListRow1');" onmouseout="tdOut('ListRow1');">
function tdOver(i) {
	if (document.getElementById) {
		var nodeObj = document.getElementById(i);
		nodeObj.style.backgroundColor = '#8ACB8A';
	}
}

function tdOut(i) {
	if (document.getElementById) {
		var nodeObj = document.getElementById(i);
		nodeObj.style.backgroundColor = 'transparent';
	}
}

// Hightlight Area
function hOn(i,hcolor) {
	if (document.getElementById) {
		var nodeObj = document.getElementById(i);
		nodeObj.style.backgroundColor = hcolor;
	}
}

function hOff(i) {
	if (document.getElementById) {
		var nodeObj = document.getElementById(i);
		nodeObj.style.backgroundColor = 'transparent';
	}
}

// I toggle the display mode of an id block
function expandIt(whichEl) {
	if (navigator.appName == 'Microsoft Internet Explorer')	{
		whichEl.style.display = (whichEl.style.display == "block" ) ? "none" : "block";
	}
	else return;
}
