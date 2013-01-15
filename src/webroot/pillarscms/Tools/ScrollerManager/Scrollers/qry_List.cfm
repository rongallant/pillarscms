<cfquery name="qScrollers" datasource="#my.db.dsn#">
	SELECT
		a.scrollerid,
		a.name,
		a.height,
		a.width,
		a.scrolltime,
		a.stoptime,
		a.bgcolor,
		a.notes
	FROM #my.db.tableprefix#_Scrollers AS a
	ORDER BY a.name
</cfquery>