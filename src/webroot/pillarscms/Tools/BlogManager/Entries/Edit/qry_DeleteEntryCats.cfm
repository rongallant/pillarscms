<cfquery name="qDeleteEntryCats" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_BlogCategoriesEntries
	WHERE fk_be_entryid = '#attributes.entryid#'
</cfquery>