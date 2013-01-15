<cfquery name="qThemes" datasource="#my.db.dsn#">
	SELECT
		layoutid,
		displayname
	FROM #my.db.tableprefix#_Layouts
	WHERE type = 'toplevel'
	ORDER BY orderby
</cfquery>