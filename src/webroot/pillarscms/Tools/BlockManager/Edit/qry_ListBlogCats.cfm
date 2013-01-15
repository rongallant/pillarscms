<cfquery name="qCat" datasource="#my.db.dsn#">
	SELECT
		catid,
		title,
		description
	FROM #my.db.tableprefix#_BlogCategories
	ORDER BY title
</cfquery>