<cfquery name="qNewsScrollers" datasource="#my.db.dsn#">
	SELECT scrollerid, name
	FROM #my.db.tableprefix#_Scrollers
	ORDER BY name
</cfquery>