<cfquery name="qDeleteBlock" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tableprefix#_Blocks
	WHERE blockid = '#attributes.blockid#'
</cfquery>