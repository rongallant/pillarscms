<!--- I set the main page for a block --->
<cfif not isDefined("request.page_full")>
	<cfset request.page_full = qPage.pageid />
</cfif>

<!--- I insert the preview data into the query results --->
<cfif (request.previewmode eq 1) and (isDefined('form.blockid') and form.blockid eq qPage.pageid)>
	<cfif StructKeyExists(form,"preview_title") and StructKeyExists(form,"preview_content")>
		<cfset QuerySetCell(qPage,"title",form.preview_title) />
		<cfset QuerySetCell(qPage,"content",form.preview_content) />
	</cfif>
</cfif>