<cfquery name="qDeletePage" datasource="#my.db.dsn#">
	DELETE FROM #my.db.tablePrefix#_pgPages
	WHERE pg_id = '#attributes.pageid#'
</cfquery>