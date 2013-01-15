<!--- Last Updated May 23, 2005 --->
<cfscript>
// Set Theme - Ron Gallant - 2005-07-27
// I set the theme and design
// USAGE: setTheme("DesignName","ThemeName");
function setTheme(DesignName,ThemeName) {
	if ( isDefined('application.my') ) {
		my.design = structCopy( application.my[DesignName].Design );
		my.theme = structCopy( application.my[DesignName][ThemeName] );
	}
}

// I great a valid GUID by modifying a UUID
// function already included in Railo.
//function CreateGUID() {
//	GUID = Insert("-",CreateUUID(),23);
//	return GUID;
//}

// I replace list elements with editor safe strings.
// use with list in text fields
function correctList(listVal,delVal) {
	var i = 1;
	var j = ListLen(listVal,delVal);
	var newList = "";
	while (i lte j) {
		tmp = ListGetAt(listVal,i,delVal);
		newList = ListAppend(newList, HTMLEditFormat(tmp), delVal);
		i=i+1;
	}
	return newList;
}

// I turn a comma delimited list into a query string with single quotes
function makeQueryList(lTest) {
	var qList = "";
	for (i = 1; i lte listlen(lTest); i = i + 1) {
		item = listGetAt(lTest, i);
		qList = ListAppend( qList, "'#item#'" );
	}
	return qList;
}
</cfscript>