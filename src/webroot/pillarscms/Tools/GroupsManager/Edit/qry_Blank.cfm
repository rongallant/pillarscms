<cfquery name="qApp" datasource="#my.db.dsn#">
	SELECT
		a.id appid,
		a.identifier,
		a.name,
		a.path,
		a.description,
		a.enabled
	FROM #my.db.tableprefix#_apps AS a
	WHERE 1 = 2
</cfquery>