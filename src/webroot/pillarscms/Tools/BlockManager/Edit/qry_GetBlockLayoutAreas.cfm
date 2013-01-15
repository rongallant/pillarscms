<cfquery name="qBlockLayoutAreas" datasource="#my.db.dsn#">
	SELECT name, displayname
	FROM #my.db.tableprefix#_LayoutAreas
	ORDER BY orderby
</cfquery>