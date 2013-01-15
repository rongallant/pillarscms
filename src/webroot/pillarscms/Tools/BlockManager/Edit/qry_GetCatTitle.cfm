<cfif isDefined('attributes.blockidlist') and Len(attributes.blockidlist)>
	<cfquery name="qCat" datasource="#my.db.dsn#">
		SELECT title
		FROM #my.db.tableprefix#_BlogCategories
		WHERE catid = '#attributes.blockidlist#'
	</cfquery>
</cfif>