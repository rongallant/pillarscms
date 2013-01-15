<cfscript>
// ListFunctions - Ron Gallant - 2004-09-24
// I output the styles used by the listFunction()
function ListScripts() {
	var outString = "<script language='javascript1.1' type='text/javascript'>";
	outString = outString & "function hover(CurId,NewClass) { if ( document.getElementById ) { var nodeObj = document.getElementById(CurId); nodeObj.className = NewClass; } }";
	outString = outString & "</script>";
	return outString;
}
function ListStyles() {
	var outString = "<style media='all' type='text/css'>";
	outString = outString & ".myRow1 { background: ##FFFFFF; cursor: pointer; }";
	outString = outString & ".myRow2 { background: ##FFDDBC; cursor: pointer; }";
	outString = outString & ".myRowHover { background: ##c0dbf8; cursor: pointer; }";
	outString = outString & "</style>";
	return outString;
}

// list Hover and row count
// RowCount, Row ID = thisID, Row Class = thisClass, hoverClass, in each TD = hoverCode
// USAGE: ListFunctions(qQuery.currentrow)
// START Row Highlighter
// I change the background color of the row the mouse is over
// ****** In Head ******
//  #ListScripts()#
//  #ListStyles()# - optional
// ****** In Loop ******
//  #ListFunctions(qName.currentrow)#
//  <tr #hoverCode#>
function ListFunctions(i) {
	RowCount = i;
	thisID = "ListRow" & i;
	hoverClass = "myRowHover";
	if ( not i mod 2 ) thisClass = "myRow2";
	else thisClass = "myRow1";
	hoverCode = "id=""#thisID#"" class=""#thisClass#"" onMouseover=""hover('#thisID#','#hoverClass#');"" onmouseout=""hover('#thisID#','#thisClass#');""";
	return "";
}
</cfscript>