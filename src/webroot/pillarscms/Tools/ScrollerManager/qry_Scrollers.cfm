<cfquery name="qScrollers" datasource="#my.db.dsn#">
	SELECT
		a.scrollerid,
		a.name,
		a.notes
	FROM #my.db.tableprefix#_Scrollers AS a
	ORDER BY a.name
</cfquery>