<cfquery name="qApps" datasource="#my.db.dsn#">
	SELECT
		a.id AS appid,
		a.name
	FROM #my.db.tableprefix#_apps AS a
	ORDER BY a.name
</cfquery>