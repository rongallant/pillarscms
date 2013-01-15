<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="formToList.cfm" language="ColdFusion">
	<responsibilities>
		I convert the form structure to a list.
	</responsibilities>
	<properties>
		<property name="Version" value="1a" />
		<history author="Ron Gallant" email="ron@rongallant.com" type="update" date="2002-08-21" comments="changed from hidden fields to list. added fusedocs" />
		<history author="Nathan Dintenfass" email="nathan@changemedia.com" type="create" date="March 11, 2002" />
	</properties>
	<io>
		<in>
			<string name="excludeList" comments="formToList(list1,list2)" />
		</in>
		<out>
			<string name="outVar" comments="html with list" />
		</out>
	</io>
</fusedoc>
--->

<cfscript>
function formToList() {
	// a variable for iterating
	var key = "";
	// should we exlude any?  by default, no
	var excludeList = "FIELDNAMES";
	// a variable to return stuff
	var outVar = "";
	// if there is an argument, it is a list to exclude
	if(arrayLen(arguments)) {
		excludeList = excludeList & "," & arguments[1];
	}
	// loop through the form scope and make hidden fields
	for(key in form) {
		if(NOT listFindNoCase(excludeList,key)) {
			// remove blank fields
			if (trim(htmlEditFormat(form[key])) neq "") {
				outVar = outVar & "<b>" & key & ":</b> " & htmlEditFormat(form[key]) & "<br>";
			}
		}
	}
	// output fields
	return outVar;
}
</cfscript>