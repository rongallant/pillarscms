<cfparam name="attributes.catid"/>

<cfquery name="qDeleteCategory" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_BlogCategories
	WHERE catid = '#attributes.catid#'
</cfquery>