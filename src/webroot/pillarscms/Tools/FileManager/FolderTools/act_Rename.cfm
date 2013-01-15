<!--- I validate the input --->
<cfset reg = "[^[:alnum:]]">
<cfif REFindNoCase(reg, attributes.newname)>

	<cfset request.regerror = 1>
	<p>You must use only alpha numeric characters. Use underscores instead of spaces.</p>
	<p><a href="javascript:history.back(-1);">Return</a></p>

<cfelse>

	<!--- I format the filename field --->
	<cfset folder = replace(attributes.folder, "/", "\" , "ALL")>
	<cfset folder = my.folder.dir & mid(folder, 1, len(folder)-1 )>

	<!--- I rename the folder --->
	<cflock scope="APPLICATION" timeout="5">
		<cfdirectory action="RENAME" directory="#folder#" newdirectory="#attributes.newname#">
	</cflock>

</cfif>