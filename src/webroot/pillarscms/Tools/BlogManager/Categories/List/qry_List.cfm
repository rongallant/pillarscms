<cfquery name="qCat" datasource="#my.db.dsn#">
	SELECT
		catid AS id,
		title,
		description
	FROM #my.db.tableprefix#_BlogCategories
	ORDER BY title
</cfquery>