<cfquery name="qBlockLayouts" datasource="#my.db.dsn#">
	SELECT name, displayname
	FROM #my.db.tableprefix#_Layouts
	WHERE type = 'block'
	ORDER BY orderby
</cfquery>