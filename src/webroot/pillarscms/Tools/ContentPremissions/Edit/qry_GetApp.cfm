<cfquery name="qApp" datasource="#my.db.dsn#">
	SELECT
		id appid,
		identifier,
		name,
		path,
		enabled,
		description
	FROM #my.db.tableprefix#_apps
	WHERE id = '#attributes.appid#'
</cfquery>