/*
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
	<io>
		<in>
			<string name="" />
		</in>
		<out>
			<string name="" />
		</out>
	</io>
</fusedoc>
*/

// START Row Highlighter
// I change the background color of the row the mouse is over
// <tr class="row" id="ListRow1" onMouseover="tdOver('ListRow1');" onmouseout="tdOut('ListRow1');">
	function tdOver(i) {
		if (document.getElementById) {
			var nodeObj = document.getElementById(i);
			//nodeObj.style.color = '#B7E2FF';
			nodeObj.style.backgroundColor = '#FFD98D';
		}
	}

	function tdOut(i) {
		if (document.getElementById) {
			var nodeObj = document.getElementById(i);
			//nodeObj.style.color = '';
			nodeObj.style.backgroundColor = '';
		}
	}

// END Row Highlighter