<!--- I change the slashes --->
<cfset filename = replace(attributes.filename, "/", "\" , "ALL")>

<!--- I add the root dir --->
<cfset filename = my.folder.dir & filename>

<!--- I format the newfilepath field --->
<cfset newfilepath = my.folder.dir & attributes.move>

<!--- I move the file --->
<cflock scope="APPLICATION" timeout="#my.site.filelocktimout#">
	<cffile action="MOVE" source="#filename#" destination="#newfilepath#">
</cflock>