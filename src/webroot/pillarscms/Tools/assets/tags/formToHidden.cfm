<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="formToHidden.cfm" language="ColdFusion">
	<responsibilities>
		I convert the Form structure to hidden form fields.
	</responsibilities>
	<properties>
		<property name="Version" value="1" />
		<history author="Nathan Dintenfass" email="nathan@changemedia.com" type="create" date="March 11, 2002" />
	</properties>
	<io>
		<in>
			<string name="excludeList" comments="formToHidden(list1,list2)" />
		</in>
		<out>
			<string name="outVar" comments="html with Hidden fields" />
		</out>
	</io>
</fusedoc>
--->

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
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(form[key]) & """>";
		}
	}
	// return hidden fields to html
	return outVar;
}
</cfscript>