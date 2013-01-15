<cfquery name="entry" datasource="#my.db.dsn#">
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
	WHERE 1 = 2
</cfquery>