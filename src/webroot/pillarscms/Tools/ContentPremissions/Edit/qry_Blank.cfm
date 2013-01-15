<cfquery name="qApp" datasource="#my.db.dsn#">
	SELECT
		id appid,
		identifier,
		name,
		path,
		description,
		enabled
	FROM #my.db.tableprefix#_apps
	WHERE 1 = 2
</cfquery>