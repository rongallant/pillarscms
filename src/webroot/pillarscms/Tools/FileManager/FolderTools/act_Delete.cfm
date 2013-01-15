<cfset folderpath = attributes.folder>
<cfset folderpath = Replace(folderpath,"/","\","ALL")>
<cfset folderpath = my.folder.dir & folderpath>

<cftry>

	<!--- I delete the selected folder --->
	<cflock scope="APPLICATION" timeout="#my.site.filelocktimout#">
		<cfdirectory action="DELETE" directory="#folderpath#">
	</cflock>

	<cfcatch>
		<cfif cfcatch.detail contains "The directory is not empty">
			<cfthrow type="custom" errorcode="1">
		<cfelse>
			<cfset fusebox.rethrowError = 1>
		</cfif>
	</cfcatch>
</cftry>