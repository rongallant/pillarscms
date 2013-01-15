<cfquery name="qGroups" datasource="#my.db.dsn#">
	SELECT
		a.id AS groupid,
		a.name AS groupname,
		a.description,
		a.enabled
	FROM #my.db.tableprefix#_apps AS a
	WHERE a.type = 'pagegroup'
	ORDER BY a.name
</cfquery>