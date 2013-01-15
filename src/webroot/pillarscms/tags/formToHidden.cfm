<cfscript>
function formToHidden() {
	//a variable for iterating
	var key = "";
	//should we exlude any?  by default, no
	var excludeList = "FIELDNAMES";
	//a variable to return stuff
	var outVar = "";
	//if there is an argument, it is a list to exclude
	if(arrayLen(arguments)) {
		excludeList = excludeList & "," & arguments[1];
	}
	//now loop through the form scope and make hidden fields
	for(key in form) {
		if(NOT listFindNoCase(excludeList,key)) {
			outVar = outVar & '<input type="hidden" name="' & key & '" id="' & key & '" value="' & htmlEditFormat(form[key]) & '" />';
		}
	}
	// return hidden fields to html
	return outVar;
}
</cfscript>